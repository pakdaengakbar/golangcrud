package companieModel

import (
	"golangcrud/models/branchModel"
	"time"
)

// User represents the user model for our CRUD operations
type Companie struct {
	Id           int                   `json:"id"`
	Cname        string                `json:"name"`
	Cdescription string                `json:"description"`
	Caddress     string                `json:"address"`
	Chotline     string                `json:"hotline"`
	Cemail       string                `json:"email"`
	CreatedAt    time.Time             `json:"created_at"`
	Branches     []branchModel.Mbranch `json:"branches"` // Add this
}
