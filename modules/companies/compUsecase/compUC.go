package compUsecase

import (
	"golangcrud/models/companieModel"
	"golangcrud/modules/companies"
)

type CompUsecase struct {
	CompRepository companies.CompRepository
}

func NewCompUsecase(compRepository companies.CompRepository) *CompUsecase {
	return &CompUsecase{CompRepository: compRepository}
}

func (cc CompUsecase) GetAllCompanies() (*[]companieModel.Companie, error) {
	companies, err := cc.CompRepository.GetAllCompanies()
	if err != nil {
		return nil, err
	}
	return companies, nil
}

func (cc *CompUsecase) CreateCompanie(comp *companieModel.Companie) (*int64, error) {

	id, err := cc.CompRepository.CreateCompanie(comp)
	if err != nil {
		return nil, err
	}
	return id, nil
}

func (cc *CompUsecase) DeleteCompanie(id int) error {
	err := cc.CompRepository.DeleteCompanie(id)
	return err
}

func (cc *CompUsecase) GetCompanie(id int) (*companieModel.Companie, error) {
	companie, err := cc.CompRepository.GetCompanie(id)
	if err != nil {
		return nil, err
	}
	if companie == nil {
		return nil, nil // No rows found
	}
	return companie, nil
}
