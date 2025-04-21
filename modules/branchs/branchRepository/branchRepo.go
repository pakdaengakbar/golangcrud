package branchRepository

import (
	"database/sql"
	"fmt"
	"golangcrud/models/branchModel"
	"golangcrud/modules/branchs"
)

type sqlRepository struct {
	Conn *sql.DB
}

func NewBranchRepository(Conn *sql.DB) branchs.BranchRepository {
	return &sqlRepository{Conn}
}

func (db *sqlRepository) GetAllBranches() (*[]branchModel.Branch, error) {
	var branches []branchModel.Branch
	rows, err := db.Conn.Query("SELECT b.Id, c.Cname as Compname, b.Cname, b.Cdescription, b.Caddress, b.Created_at FROM mbranchs b " +
		"join mcompanies c on b.Ncompanyid = c.Id")
	if err != nil {
		// log.Println("Query error:", err)
		return nil, err
	}
	defer rows.Close()
	for rows.Next() {
		var branch branchModel.Branch
		if err := rows.Scan(&branch.Id, &branch.Compname, &branch.Cname, &branch.Cdescription, &branch.Caddress, &branch.Created_at); err != nil {
			return nil, err
		}
		branches = append(branches, branch)
	}
	if err := rows.Err(); err != nil {
		return nil, err
	}
	return &branches, nil
}

func (db *sqlRepository) GetBranchesFiltered(keyword string) (*[]branchModel.Branch, error) {
	var branches []branchModel.Branch

	var page = 1      // Default page number
	var pageSize = 10 // Default page size
	if pageSize <= 0 {
		pageSize = 10 // Set to default if invalid
	}

	// Basic query
	// page, err := strconv.Atoi(strconv.Itoa(pages))
	// pageSize, err := strconv.Atoi(strconv.Itoa(pagesSize))

	query := `SELECT 
			b.Id, 
			c.Cname AS Compname, 
			b.Cname, 
			b.Cdescription, 
			b.Caddress, 
			b.Created_at 
		FROM mbranchs b
		JOIN mcompanies c ON b.Ncompanyid = c.Id
		WHERE (b.Cname LIKE ? OR c.Cname LIKE ? OR b.Cdescription LIKE ?)
		ORDER BY b.Created_at DESC
		LIMIT ? OFFSET ?
	`

	// Prepare search pattern and pagination values
	search := "%" + keyword + "%"
	offset := (page - 1) * pageSize

	rows, err := db.Conn.Query(query, search, search, search, pageSize, offset)
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	for rows.Next() {
		var branch branchModel.Branch
		if err := rows.Scan(
			&branch.Id,
			&branch.Compname,
			&branch.Cname,
			&branch.Cdescription,
			&branch.Caddress,
			&branch.Created_at,
		); err != nil {
			return nil, err
		}
		branches = append(branches, branch)
	}

	if len(branches) == 0 {
		return nil, fmt.Errorf("no data found for name %s", search) // No rows found
	}
	return &branches, nil
}
