import pandas as pd
import numpy as np
from sklearn.model_selection import train_test_split, RandomizedSearchCV
from sklearn.feature_extraction.text import TfidfVectorizer
from xgboost import XGBClassifier
from sklearn.metrics import classification_report, confusion_matrix, accuracy_score
from sklearn.preprocessing import FunctionTransformer
from sklearn.compose import ColumnTransformer
from sklearn.feature_extraction import DictVectorizer
from imblearn.pipeline import Pipeline
from imblearn.over_sampling import SMOTE
from joblib import Memory
import tempfile
import re
import joblib
import nltk
from nltk.stem import WordNetLemmatizer
from nltk.corpus import stopwords
import warnings
from joblib import parallel_backend

# Suppress warnings
warnings.filterwarnings("ignore")

# Temporary cache directory
cachedir = tempfile.mkdtemp()
memory = Memory(cachedir, verbose=0)

nltk.download('wordnet', quiet=True)
nltk.download('stopwords', quiet=True)

print("Loading dataset...")
df = pd.read_csv('sql_injection_dataset.csv', header=None)
df.columns = ['query', 'is_malicious']

print(f"Dataset shape: {df.shape}")
print(f"Distribution of classes:\n{df['is_malicious'].value_counts()}")

# SQL-specific preprocessing
def preprocess_sql(query):
    query = query.lower()
    query = re.sub(r'\d+', 'NUM', query)
    query = re.sub(r'(table|from|select|where)\s+\w+', r'\1 TBLNAME', query)
    query = re.sub(r'([(),;=<>])', r' \1 ', query)
    query = re.sub(r"[\'\"`]", 'QUOTE', query)
    query = re.sub(r'\s+', ' ', query).strip()
    return query

df['processed_query'] = df['query'].apply(preprocess_sql)

X_train, X_test, y_train, y_test = train_test_split(
    df['processed_query'], 
    df['is_malicious'], 
    test_size=0.2, 
    random_state=42, 
    stratify=df['is_malicious']
)

print(f"Training data size: {X_train.shape[0]}")
print(f"Testing data size: {X_test.shape[0]}")

sql_keywords = [
    'select', 'insert', 'update', 'delete', 'drop', 'union', 'where',
    'or', 'exec', 'information_schema', 'sleep'
]

vectorizer = TfidfVectorizer(analyzer='char_wb', ngram_range=(2, 4), max_features=5000)
word_vectorizer = TfidfVectorizer(analyzer='word', ngram_range=(1, 2), max_features=3000,
                                   vocabulary=sql_keywords + ['NUM', 'TBLNAME', 'QUOTE', '=', '<', '>', ';', '--'])

def extract_sql_patterns(queries):
    patterns = []
    for query in queries:
        features = {
            'semicolons': query.count(';'),
            'quotes': query.count('QUOTE'),
            'comments': query.count('--') + query.count('/*'),
            'equals': query.count('='),
            'union_select': int('union' in query and 'select' in query),
            'or_true': int('or' in query and ('1=1' in query or 'true' in query))
        }
        patterns.append(features)
    return patterns

pipeline = Pipeline([
    ('features', ColumnTransformer([
        ('char_tfidf', vectorizer, 'processed_query'),
        ('word_tfidf', word_vectorizer, 'processed_query'),
        ('sql_patterns', Pipeline([
            ('extract', FunctionTransformer(extract_sql_patterns, validate=False)),
            ('vectorize', DictVectorizer())
        ], memory=memory), 'processed_query')
    ])),
    ('smote', SMOTE(random_state=42)),
    ('xgb', XGBClassifier(
        objective='binary:logistic', 
        eval_metric='logloss',
        use_label_encoder=False,
        random_state=42
    ))
], memory=memory)

X_train_df = pd.DataFrame({'processed_query': X_train})
X_test_df = pd.DataFrame({'processed_query': X_test})

print("Training initial model...")
with parallel_backend('threading', n_jobs=-1):
    pipeline.fit(X_train_df, y_train)

print("Evaluating initial model...")
y_pred = pipeline.predict(X_test_df)
accuracy = accuracy_score(y_test, y_pred)
print(f"Initial model accuracy: {accuracy:.4f}")
print(classification_report(y_test, y_pred))

print("Saving best model...")
joblib.dump(pipeline, 'sql_injection_detection_model.pkl')

def predict_sql_injection(query, model):
    processed = preprocess_sql(query)
    query_df = pd.DataFrame({'processed_query': [processed]})
    prob = model.predict_proba(query_df)[0]
    is_malicious = model.predict(query_df)[0]
    confidence = prob[1] if is_malicious == 1 else prob[0]
    return bool(is_malicious), float(confidence)

print("\nExample predictions:")
safe_query = "SELECT * FROM users WHERE id = 123"
malicious_query = "SELECT * FROM users WHERE username = 'admin' OR 1=1; --'"

safe_result, safe_conf = predict_sql_injection(safe_query, pipeline)
mal_result, mal_conf = predict_sql_injection(malicious_query, pipeline)

print(f"Safe query: '{safe_query}'")
print(f"Result: {' Malicious' if safe_result else 'Safe'} (Confidence: {safe_conf:.4f})")

print(f"Malicious query: '{malicious_query}'")
print(f"Result: {' Malicious' if mal_result else 'Safe'} (Confidence: {mal_conf:.4f})")

print("\nDetailed model evaluation report:")
cm = confusion_matrix(y_test, pipeline.predict(X_test_df))
report = classification_report(y_test, pipeline.predict(X_test_df))
print(report)

memory.clear(warn=False)
print("Model training and evaluation complete!")