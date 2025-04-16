package companieModel

// User represents the user model for our CRUD operations
type Companie struct {
	Id           int    `json:"id"`
	Cname        string `json:"name"`
	Cdescription string `json:"description"`
	Caddress     string `json:"Address"`
	Chotline     string `json:"Hotline"`
	Cemail       string `json:"email"`
	Created_at   string `json:"created_at"`
}
