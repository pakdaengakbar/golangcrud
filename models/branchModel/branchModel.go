package branchModel

type Branch struct {
	Id           int    `json:"id"`
	Compname     string `json:"companiename"` // Added Compname field
	Cname        string `json:"branchname"`
	Ccode        string `json:"code"`
	Cdescription string `json:"description"`
	Cphone       string `json:"phone"`
	Cemail       string `json:"email"`
	Caddress     string `json:"address"`
	Clocation    string `json:"location"`
	Created_at   string `json:"created_at"`
}
