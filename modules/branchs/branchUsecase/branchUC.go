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

func (bc BranchUsecase) GetAllBranches() (*[]branchModel.Mbranch, error) {
	branches, err := bc.BranchRepository.GetAllBranches()
	if err != nil {
		return nil, err
	}
	return branches, nil
}

// GetBranchesFiltered retrieves branches filtered by a keyword from the repository.
func (bc BranchUsecase) GetBranchesFiltered(keyword string, page int, pageSize int) (*[]branchModel.Mbranch, error) {
	branches, err := bc.BranchRepository.GetBranchesFiltered(keyword, page, pageSize)
	if err != nil {
		return nil, err
	}
	return branches, nil
}

// CreateBranch creates a new branch in the repository.
func (cc *BranchUsecase) CreateBranch(branch *branchModel.BranchUpdateInput) (*int64, error) {
	id, err := cc.BranchRepository.CreateBranch(branch)
	if err != nil {
		return nil, err
	}
	return id, nil
}

// GetBranchByID retrieves a branch by its ID from the repository.
func (bc BranchUsecase) GetBranchByID(id int) (*branchModel.Mbranch, error) {
	branch, err := bc.BranchRepository.GetBranchByID(id)
	if err != nil {
		return nil, err
	}
	return branch, nil

}

func (bc *BranchUsecase) UpdateBranch(id int, input branchModel.BranchUpdateInput) error {
	return bc.BranchRepository.UpdateBranch(id, input)
}

// DeleteBranch deletes a branch by its ID from the repository.
func (bc BranchUsecase) DeleteBranch(id int) error {
	err := bc.BranchRepository.DeleteBranch(id)
	return err
}
