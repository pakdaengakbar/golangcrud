package companies

import (
	"golangcrud/models/companieModel"
)

type CompRepository interface {
	GetAllCompanies() (*[]companieModel.Companie, error)
	CreateCompanie(company *companieModel.Companie) (*int64, error)
	DeleteCompanie(id int) error
	GetCompanieByid(id int) (*companieModel.Companie, error)
	GetCompanieByname(name string) (*[]companieModel.Companie, error)
}
