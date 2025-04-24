package branchModel

import "time"

type Mbranch struct {
	Id           int       `json:"id"`
	Ncompanyid   int       `json:"ncompanyid"` // Added Ncompanyid field
	Cname        string    `json:"branchname"`
	Ccode        string    `json:"code"`
	Cdescription string    `json:"description"`
	Cphone       string    `json:"phone"`
	Cemail       string    `json:"email"`
	Caddress     string    `json:"address"`
	Clocation    string    `json:"location"`
	CreatedAt    time.Time `json:"created_at"`
}
