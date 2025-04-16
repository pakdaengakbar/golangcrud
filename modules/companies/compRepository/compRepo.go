package compRepository

import (
	"database/sql"
	"golangcrud/models/companieModel"
	"golangcrud/modules/companies"
)

type sqlRepository struct {
	Conn *sql.DB
}

func NewCompRepository(Conn *sql.DB) companies.CompRepository {
	return &sqlRepository{Conn}
}

func (db *sqlRepository) GetAllCompanies() (*[]companieModel.Companie, error) {
	var companies []companieModel.Companie
	rows, err := db.Conn.Query("SELECT Id, Cname, Cdescription, Caddress, Chotline, Cemail, Created_at FROM mcompanies")
	if err != nil {
		// log.Println("Query error:", err)
		return nil, err
	}
	defer rows.Close()
	for rows.Next() {
		var company companieModel.Companie
		if err := rows.Scan(&company.Id, &company.Cname, &company.Cdescription, &company.Caddress, &company.Chotline, &company.Cemail, &company.Created_at); err != nil {
			return nil, err
		}
		companies = append(companies, company)
	}
	return &companies, nil
}

func (db *sqlRepository) CreateCompanie(company *companieModel.Companie) (*int64, error) {
	query := "INSERT INTO mcompanies (Cname, Cdescription, Caddress, Chotline, Cemail) VALUES (?, ?, ?, ?, ?)"
	result, err := db.Conn.Exec(query, company.Cname, company.Cdescription, company.Caddress, company.Chotline, company.Cemail)
	if err != nil {
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
