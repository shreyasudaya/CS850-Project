from flask import Flask, request, jsonify
import joblib
import pandas as pd
import re
import os
from train_model import *

app = Flask(__name__)

# Load the trained model
MODEL_PATH = os.path.join("model", "sql_injection_detection_model.pkl")
model = joblib.load(MODEL_PATH)

# Match the preprocessing logic from train_model.py
def preprocess_sql(query):
    query = query.lower()
    query = re.sub(r'\d+', 'NUM', query)
    query = re.sub(r'(table|from|select|where)\s+\w+', r'\1 TBLNAME', query)
    query = re.sub(r'([(),;=<>])', r' \1 ', query)
    query = re.sub(r"[\'\"`]", 'QUOTE', query)
    query = re.sub(r'\s+', ' ', query).strip()
    return query

@app.route('/predict', methods=['POST'])
def predict():
    try:
        data = request.get_json()
        query = data.get('query', '')

        # Preprocess
        processed = preprocess_sql(query)
        query_df = pd.DataFrame({'processed_query': [processed]})

        # Predict
        prediction = model.predict(query_df)[0]
        return jsonify({'malicious': bool(prediction)})

    except Exception as e:
        return jsonify({'error': str(e), 'malicious': False}), 500

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
