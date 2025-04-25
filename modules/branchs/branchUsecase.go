package branchs

import (
	"golangcrud/models/branchModel"
)

type BranchUsecase interface {
	GetAllBranches() (*[]branchModel.Mbranch, error)
	GetBranchesFiltered(keyword string, page int, pageSize int) (*[]branchModel.Mbranch, error)
	CreateBranch(branch *branchModel.BranchUpdateInput) (*int64, error)
	GetBranchByID(id int) (*branchModel.Mbranch, error)
	UpdateBranch(id int, input branchModel.BranchUpdateInput) error
	DeleteBranch(id int) error
}
