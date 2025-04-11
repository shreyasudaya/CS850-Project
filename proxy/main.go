package main

import (
	"bytes"
	"database/sql"
	"encoding/json"
	"fmt"
	"log"
	"net/http"

	"fyne.io/fyne/v2"
	"fyne.io/fyne/v2/app"
	"fyne.io/fyne/v2/container"
	"fyne.io/fyne/v2/widget"
	_ "github.com/go-sql-driver/mysql"
)

func main() {
	a := app.New()
	w := a.NewWindow("MySQL Login")
	w.Resize(fyne.NewSize(400, 300))

	usernameEntry := widget.NewEntry()
	usernameEntry.SetPlaceHolder("Username")
	passwordEntry := widget.NewPasswordEntry()
	passwordEntry.SetPlaceHolder("Password")
	hostEntry := widget.NewEntry()
	hostEntry.SetText("127.0.0.1:3306")
	dbNameEntry := widget.NewEntry()
	dbNameEntry.SetPlaceHolder("BankDB")

	statusLabel := widget.NewLabel("")

	loginButton := widget.NewButton("Login", func() {
		username := usernameEntry.Text
		password := passwordEntry.Text
		host := hostEntry.Text
		dbName := dbNameEntry.Text

		dsn := fmt.Sprintf("%s:%s@tcp(%s)/%s", username, password, host, dbName)
		db, err := sql.Open("mysql", dsn)
		if err != nil {
			statusLabel.SetText("Connection failed: " + err.Error())
			return
		}
		if err := db.Ping(); err != nil {
			statusLabel.SetText("Ping failed: " + err.Error())
			return
		}
		statusLabel.SetText("Connected successfully!")
		w.Hide()
		showQueryWindow(a, db)
	})

	w.SetContent(container.NewVBox(
		usernameEntry,
		passwordEntry,
		hostEntry,
		dbNameEntry,
		loginButton,
		statusLabel,
	))

	w.ShowAndRun()
}

func showQueryWindow(a fyne.App, db *sql.DB) {
	w := a.NewWindow("SQL Query Runner")
	w.Resize(fyne.NewSize(500, 400))

	queryInput := widget.NewMultiLineEntry()
	queryInput.SetPlaceHolder("Write your SQL query here...")

	resultOutput := widget.NewLabel("Results will appear here...")

	runButton := widget.NewButton("Run Query", func() {
		query := queryInput.Text

		// 🔒 Check with Python microservice
		if isMalicious(query) {
			resultOutput.SetText("🚨 Query blocked: Detected as SQL Injection!")
			return
		}

		rows, err := db.Query(query)
		if err != nil {
			resultOutput.SetText("Query error: " + err.Error())
			return
		}
		defer rows.Close()

		columns, err := rows.Columns()
		if err != nil {
			resultOutput.SetText("Error fetching columns: " + err.Error())
			return
		}

		var results string
		values := make([]interface{}, len(columns))
		scans := make([]interface{}, len(columns))
		for i := range values {
			scans[i] = &values[i]
		}

		for rows.Next() {
			if err := rows.Scan(scans...); err != nil {
				log.Fatal(err)
			}
			for i, v := range values {
				var val string
				switch v := v.(type) {
				case []byte:
					val = string(v)
				default:
					val = fmt.Sprintf("%v", v)
				}
				results += fmt.Sprintf("%s: %s\n", columns[i], val)
			}
			results += "\n"
		}
		if results == "" {
			results = "No results found."
		}
		resultOutput.SetText(results)
	})

	w.SetContent(container.NewVBox(
		queryInput,
		runButton,
		resultOutput,
	))

	w.Show()
}

func isMalicious(query string) bool {
	payload := map[string]string{"query": query}
	jsonData, err := json.Marshal(payload)
	if err != nil {
		log.Println("Failed to serialize query:", err)
		return false // fail-open fallback
	}

	resp, err := http.Post("http://localhost:5000/predict", "application/json", bytes.NewBuffer(jsonData))
	if err != nil {
		log.Println("Could not reach detection service:", err)
		return false // fail-open fallback
	}
	defer resp.Body.Close()

	var result struct {
		Malicious bool `json:"malicious"`
	}
	if err := json.NewDecoder(resp.Body).Decode(&result); err != nil {
		log.Println("Failed to decode response:", err)
		return false
	}
	return result.Malicious
}
