package compRepository

import (
	"database/sql"
	"fmt"
	"golangcrud/models/branchModel"
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
		return nil, err
	}
	defer rows.Close()

	for rows.Next() {
		var company companieModel.Companie
		if err := rows.Scan(&company.Id, &company.Cname, &company.Cdescription, &company.Caddress, &company.CreatedAt); err != nil {
			return nil, err
		}

		// Fetch branches for each company
		branches, err := db.GetBranchesByCompanyID(company.Id)
		if err != nil {
			return nil, err
		}
		company.Branches = *branches

		companies = append(companies, company)
	}

	return &companies, nil
}

func (db *sqlRepository) GetBranchesByCompanyID(companyID int) (*[]branchModel.Mbranch, error) {
	var branches []branchModel.Mbranch

	query := `SELECT Id, Ncompanyid, Cname, Ccode, Cdescription, Cphone, Cemail, Caddress, Clocation, Created_at
			  FROM mbranchs WHERE Ncompanyid = ?`

	rows, err := db.Conn.Query(query, companyID)
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	for rows.Next() {
		var branch branchModel.Mbranch
		if err := rows.Scan(
			&branch.Id,
			&branch.Ncompanyid,
			&branch.Cname,
			&branch.Ccode,
			&branch.Cdescription,
			&branch.Cphone,
			&branch.Cemail,
			&branch.Caddress,
			&branch.Clocation,
			&branch.CreatedAt,
		); err != nil {
			return nil, err
		}
		branches = append(branches, branch)
	}

	return &branches, nil
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

func (db *sqlRepository) GetCompanieByid(id int) (*companieModel.Companie, error) {
	query := "SELECT Id, Cname, Cdescription, Caddress FROM mcompanies WHERE Id = ?"
	row := db.Conn.QueryRow(query, id)

	var company companieModel.Companie
	err := row.Scan(&company.Id, &company.Cname, &company.Cdescription, &company.Caddress)
	if err != nil {
		if err == sql.ErrNoRows {
			return nil, fmt.Errorf("no data found for id %d", id) // No rows found
		}
		return nil, err // Other error
	}
	return &company, nil
}

func (db *sqlRepository) GetCompanieByname(name string) (*[]companieModel.Companie, error) {
	var companies []companieModel.Companie

	namePattern := "%" + name + "%" // or "%"+name if you want it to match suffix only
	rows, err := db.Conn.Query("SELECT Id, Cname, Cdescription, Caddress, Created_at FROM mcompanies WHERE Cname LIKE ? OR Cdescription LIKE ?", namePattern, namePattern)
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	for rows.Next() {
		var company companieModel.Companie
		if err := rows.Scan(&company.Id, &company.Cname, &company.Cdescription, &company.Caddress, &company.CreatedAt); err != nil {
			return nil, err
		}
		companies = append(companies, company)
	}

	if len(companies) == 0 {
		return nil, fmt.Errorf("no data found for name %s", name) // No rows found
	}
	return &companies, nil
}
