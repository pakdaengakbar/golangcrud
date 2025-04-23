package companieModel

// User represents the user model for our CRUD operations
type Companie struct {
	Id           int    `json:"id"`
	Cname        string `json:"name"`
	Cdescription string `json:"description"`
	Caddress     string `json:"address"`
	Chotline     string `json:"hotline"`
	Cemail       string `json:"email"`
	CreatedAt    string `json:"created_at"`
}
