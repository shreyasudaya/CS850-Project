package main

import (
	"database/sql"
	"fmt"
	"log"
	"net"
	"regexp"
	"strings"

)

// Configuration for the proxy
const (
	listenAddr  = "127.0.0.1:3307"     // Address for the proxy
	mysqlDSN    = "user:password@tcp(127.0.0.1:3306)/dbname" // Update with your MySQL credentials
)

// SQL injection detection regex
var sqlInjectionPatterns = regexp.MustCompile(`(?i)(--|;|/\*|\*/|drop\s|insert\s|delete\s|update\s|union\s|sleep\()|['"]\s*or\s+['"]`)

func main() {
	// Start listening for client connections
	listener, err := net.Listen("tcp", listenAddr)
	if err != nil {
		log.Fatalf("Failed to start proxy: %v", err)
	}
	defer listener.Close()
	log.Printf("Proxy is running on %s\n", listenAddr)

	for {
		clientConn, err := listener.Accept()
		if err != nil {
			log.Printf("Failed to accept client connection: %v\n", err)
			continue
		}
		go handleClient(clientConn)
	}
}

func handleClient(clientConn net.Conn) {
	defer clientConn.Close()

	// Connect to the MySQL database
	db, err := sql.Open("mysql", mysqlDSN)
	if err != nil {
		log.Printf("Failed to connect to database: %v\n", err)
		return
	}
	defer db.Close()

	buf := make([]byte, 4096)
	for {
		// Read query from the client
		n, err := clientConn.Read(buf)
		if err != nil {
			log.Printf("Error reading from client: %v\n", err)
			return
		}
		query := strings.TrimSpace(string(buf[:n]))
		log.Printf("Received query: %s\n", query)

		// Check for SQL injection patterns
		if sqlInjectionPatterns.MatchString(query) {
			log.Printf("Blocked query due to potential SQL injection: %s\n", query)
			clientConn.Write([]byte("Error: Query blocked due to potential SQL injection.\n"))
			continue
		}

		// Forward query to the database
		rows, err := db.Query(query)
		if err != nil {
			log.Printf("Query error: %v\n", err)
			clientConn.Write([]byte(fmt.Sprintf("Error: %v\n", err)))
			continue
		}

		// Format and send results back to the client
		cols, err := rows.Columns()
		if err != nil {
			log.Printf("Failed to get columns: %v\n", err)
			rows.Close()
			clientConn.Write([]byte(fmt.Sprintf("Error: %v\n", err)))
			continue
		}
		results := []string{}
		for rows.Next() {
			columns := make([]interface{}, len(cols))
			columnPointers := make([]interface{}, len(cols))
			for i := range columns {
				columnPointers[i] = &columns[i]
			}
			if err := rows.Scan(columnPointers...); err != nil {
				log.Printf("Failed to scan row: %v\n", err)
				continue
			}
			rowData := []string{}
			for _, col := range columns {
				rowData = append(rowData, fmt.Sprintf("%v", col))
			}
			results = append(results, strings.Join(rowData, "\t"))
		}
		rows.Close()

		clientConn.Write([]byte(strings.Join(results, "\n") + "\n"))
	}
}
