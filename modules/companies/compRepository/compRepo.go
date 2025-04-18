package compRepository

import (
	"database/sql"
	"fmt"
	"golangcrud/models/companieModel"
	"golangcrud/modules/companies"
	"log"
)

type sqlRepository struct {
	Conn *sql.DB
}

func NewCompRepository(Conn *sql.DB) companies.CompRepository {
	return &sqlRepository{Conn}
}

func (db *sqlRepository) GetAllCompanies() (*[]companieModel.Companie, error) {
	var companies []companieModel.Companie
	rows, err := db.Conn.Query("SELECT Id, Cname, Cdescription, Caddress, Created_at FROM mcompanies")
	if err != nil {
		// log.Println("Query error:", err)
		return nil, err
	}
	defer rows.Close()
	for rows.Next() {
		var company companieModel.Companie
		if err := rows.Scan(&company.Id, &company.Cname, &company.Cdescription, &company.Caddress, &company.Created_at); err != nil {
			return nil, err
		}
		companies = append(companies, company)
	}
	return &companies, nil
}

func (db *sqlRepository) CreateCompanie(company *companieModel.Companie) (*int64, error) {
	//field := "INSERT INTO mcompanies (Cname, Cdescription, Caddress, Chotline, Cemail) VALUES (?, ?, ?, ?, ?)"
	result, err := db.Conn.Exec("INSERT INTO mcompanies (Cname, Cdescription, Caddress) VALUES (?, ?, ?)", company.Cname, company.Cdescription, company.Caddress)
	if err != nil {
		log.Println("Query error:", err)
		return nil, err
	}

	id, err := result.LastInsertId()
	if err != nil {
		return nil, err
	}
	return &id, nil
}

func (db *sqlRepository) DeleteCompanie(id int) error {
	query := "DELETE FROM mcompanies WHERE Id = ?"
	_, err := db.Conn.Exec(query, id)

	if err != nil {
		return err
	}
	return err
}

func (db *sqlRepository) GetCompanie(id int) (*companieModel.Companie, error) {
	query := "SELECT Id, Cname, Cdescription, Caddress FROM mcompanies WHERE Id = ?"
	row := db.Conn.QueryRow(query, id)

	var company companieModel.Companie
	err := row.Scan(&company.Id, &company.Cname, &company.Cdescription, &company.Caddress)
	if err != nil {
		if err == sql.ErrNoRows {
			return nil, fmt.Errorf("no data found") // No rows found
		}
		return nil, err // Other error
	}
	return &company, nil
}
