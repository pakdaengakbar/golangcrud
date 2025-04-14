package connection

import (
	"database/sql"
	"log"
)

func Conn() (*sql.DB, error) {
	var err error
	var db *sql.DB
	db, err = sql.Open("mysql", "golang:password@tcp(localhost:3306)/go_crud_api")
	if err != nil {
		log.Fatal(err)
	}

	return db, err
}
