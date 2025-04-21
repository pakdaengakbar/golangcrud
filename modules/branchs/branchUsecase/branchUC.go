package branchUsecase

import (
	"golangcrud/models/branchModel"
	"golangcrud/modules/branchs"
)

type BranchUsecase struct {
	BranchRepository branchs.BranchRepository
}

func NewBranchUsecase(branchRepository branchs.BranchRepository) *BranchUsecase {
	return &BranchUsecase{BranchRepository: branchRepository}
}

func (bc BranchUsecase) GetAllBranches() (*[]branchModel.Branch, error) {
	branches, err := bc.BranchRepository.GetAllBranches()
	if err != nil {
		return nil, err
	}
	return branches, nil
}

func (bc BranchUsecase) GetBranchesFiltered(keyword string) (*[]branchModel.Branch, error) {
	branches, err := bc.BranchRepository.GetBranchesFiltered(keyword)
	if err != nil {
		return nil, err
	}
	return branches, nil
}
