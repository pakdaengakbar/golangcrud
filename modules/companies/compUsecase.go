package companies

import (
	"golangcrud/models/companieModel"
)

type CompUsecase interface {
	GetAllCompanies() (*[]companieModel.Companie, error)
	CreateCompanie(comp *companieModel.Companie) (*int64, error)
	DeleteCompanie(id int) error
	GetCompanieByid(id int) (*companieModel.Companie, error)
	GetCompanieByname(name string) (*[]companieModel.Companie, error)
}
