package branchModel

import "time"

type Mbranch struct {
	Id           int       `json:"id"`
	Ncompanyid   int       `json:"ncompanyid"` // Added Ncompanyid field
	Compname     string    `json:"compname"`
	Cname        string    `json:"branchname"`
	Ccode        string    `json:"code"`
	Cdescription string    `json:"description"`
	Cphone       string    `json:"phone"`
	Cemail       string    `json:"email"`
	Caddress     string    `json:"address"`
	Clocation    string    `json:"location"`
	CreatedAt    time.Time `json:"created_at"`
}

type BranchUpdateInput struct {
	Id           int    `json:"id"`
	Ncompanyid   int    `json:"ncompanyid"`
	Cname        string `json:"branchname"`
	Ccode        string `json:"code"`
	Cdescription string `json:"description"`
	Cphone       string `json:"phone"`
	Cemail       string `json:"email"`
	Caddress     string `json:"address"`
	Clocation    string `json:"location"`
}
