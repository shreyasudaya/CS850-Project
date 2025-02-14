package main

import (
	"database/sql"
	"fmt"
	"log"

	_ "github.com/go-sql-driver/mysql"
	"fyne.io/fyne/v2"
	"fyne.io/fyne/v2/app"
	"fyne.io/fyne/v2/container"
	"fyne.io/fyne/v2/widget"
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
				results += fmt.Sprintf("%s: %v\n", columns[i], v)
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
