package main

import (
	"crypto/aes"
	"crypto/cipher"
	"crypto/rand"
	"database/sql"
	"encoding/base64"
	"errors"
	"fmt"
	"io"
	"log"
	"net"
	"strings"
	"mysql"

)

var encryptionKey = []byte("your-32-byte-long-secret-key!") // Must be 32 bytes

// RBAC roles and permissions
var rolePermissions = map[string][]string{
	"admin":   {"SELECT", "INSERT", "UPDATE", "DELETE"},
	"user":    {"SELECT", "INSERT"},
	"readonly": {"SELECT"},
}

type Client struct {
	Role string
}

func encryptData(plainText string) (string, error) {
	block, err := aes.NewCipher(encryptionKey)
	if err != nil {
		return "", err
	}

	cipherText := make([]byte, aes.BlockSize+len(plainText))
	iv := cipherText[:aes.BlockSize]
	if _, err := io.ReadFull(rand.Reader, iv); err != nil {
		return "", err
	}

	stream := cipher.NewCFBEncrypter(block, iv)
	stream.XORKeyStream(cipherText[aes.BlockSize:], []byte(plainText))

	return base64.URLEncoding.EncodeToString(cipherText), nil
}

func decryptData(encryptedText string) (string, error) {
	cipherText, err := base64.URLEncoding.DecodeString(encryptedText)
	if err != nil {
		return "", err
	}

	block, err := aes.NewCipher(encryptionKey)
	if err != nil {
		return "", err
	}

	iv := cipherText[:aes.BlockSize]
	cipherText = cipherText[aes.BlockSize:]

	stream := cipher.NewCFBDecrypter(block, iv)
	stream.XORKeyStream(cipherText, cipherText)

	return string(cipherText), nil
}

func isSQLInjection(query string) bool {
	suspectPatterns := []string{"--", "/*", "*/", ";", "DROP", "DELETE", "INSERT INTO", "UPDATE", "UNION", "SELECT *"}
	for _, pattern := range suspectPatterns {
		if strings.Contains(strings.ToUpper(query), pattern) {
			return true
		}
	}
	return false
}

func isAuthorized(role, query string) bool {
	queryType := strings.Fields(strings.ToUpper(query))[0]
	allowedOps, exists := rolePermissions[role]
	if !exists {
		return false
	}
	for _, op := range allowedOps {
		if op == queryType {
			return true
		}
	}
	return false
}

func handleConnection(conn net.Conn, db *sql.DB, client Client) {
	defer conn.Close()
	buffer := make([]byte, 1024)
	for {
		n, err := conn.Read(buffer)
		if err != nil {
			log.Println("Connection closed.")
			return
		}
		query := strings.TrimSpace(string(buffer[:n]))
		log.Println("Received query:", query)

		if isSQLInjection(query) {
			conn.Write([]byte("SQL Injection detected! Request blocked."))
			continue
		}
		if !isAuthorized(client.Role, query) {
			conn.Write([]byte("Unauthorized action."))
			continue
		}

		if strings.HasPrefix(strings.ToUpper(query), "INSERT") {
			queryParts := strings.Split(query, "'")
			if len(queryParts) >= 3 {
				encryptedValue, _ := encryptData(queryParts[1])
				query = strings.Replace(query, queryParts[1], encryptedValue, 1)
			}
		}

		rows, err := db.Query(query)
		if err != nil {
			conn.Write([]byte(fmt.Sprintf("Query error: %s", err.Error())))
			continue
		}
		rows.Close()
		conn.Write([]byte("Query executed successfully."))
	}
}

func main() {
	listener, err := net.Listen("tcp", ":3307") // Proxy listens on port 3307
	if err != nil {
		log.Fatal("Error starting proxy server:", err)
	}
	defer listener.Close()
	log.Println("Proxy server listening on port 3307")

	db, err := sql.Open("mysql", "user:password@tcp(mysql-service:3306)/dbname")
	if err != nil {
		log.Fatal("Database connection error:", err)
	}
	defer db.Close()

	for {
		conn, err := listener.Accept()
		if err != nil {
			log.Println("Connection error:", err)
			continue
		}
		client := Client{Role: "user"} // Example, should be fetched dynamically
		go handleConnection(conn, db, client)
	}
}
