package main

import (
	"database/sql"
	"fmt"
	"log"
	"net/http"
	"regexp"

	_ "github.com/go-sql-driver/mysql"
)

var db *sql.DB

// Basic function to open a connection to the MySQL database
func initDB() {
	var err error
	dsn := "user:password@tcp(mysql-db-service:3306)/dbname" // MySQL connection string (adjust as needed)
	db, err = sql.Open("mysql", dsn)
	if err != nil {
		log.Fatalf("Failed to connect to the database: %v\n", err)
	}
}

// SQL injection detection using regular expressions
func isSQLInjection(query string) bool {
	// A very basic example of detecting malicious patterns, add more sophisticated patterns as needed
	maliciousPatterns := []string{
		"(?i)(union|select|drop|insert|update|delete|--|;|#)", // SQL keywords and comments
		"(?i)benchmark", // used in timing attacks
		"(?i)into outfile", // used in file-based attacks
	}

	for _, pattern := range maliciousPatterns {
		re := regexp.MustCompile(pattern)
		if re.MatchString(query) {
			return true
		}
	}
	return false
}

// Proxy function to handle incoming requests
func proxyHandler(w http.ResponseWriter, r *http.Request) {
	// Extract the SQL query from the request (assuming the query is passed as a POST body)
	query := r.FormValue("query")
	if query == "" {
		http.Error(w, "Query is missing", http.StatusBadRequest)
		return
	}

	// Sanitize and check the query for SQL injection
	if isSQLInjection(query) {
		http.Error(w, "SQL Injection detected in query", http.StatusForbidden)
		return
	}

	// Forward the sanitized query to MySQL
	rows, err := db.Query(query)
	if err != nil {
		http.Error(w, fmt.Sprintf("Database error: %v", err), http.StatusInternalServerError)
		return
	}
	defer rows.Close()

	// Sending back results as a simple response (just for demonstration)
	var result string
	for rows.Next() {
		var data string
		if err := rows.Scan(&data); err != nil {
			http.Error(w, fmt.Sprintf("Error scanning result: %v", err), http.StatusInternalServerError)
			return
		}
		result += data + "\n"
	}

	// Send the query result back to the client
	w.Header().Set("Content-Type", "text/plain")
	w.Write([]byte(result))
}

func main() {
	// Initialize the database connection
	initDB()
	defer db.Close()

	// Start the proxy server
	http.HandleFunc("/query", proxyHandler)
	log.Println("Proxy server running on port 8080...")
	if err := http.ListenAndServe(":8080", nil); err != nil {
		log.Fatalf("Failed to start server: %v", err)
	}
}
