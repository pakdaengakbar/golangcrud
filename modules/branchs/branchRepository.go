package branchs

import (
	"golangcrud/models/branchModel"
)

type BranchRepository interface {
	GetAllBranches() (*[]branchModel.Branch, error)
	GetBranchesFiltered(keyword string, page int, pageSize int) (*[]branchModel.Branch, error)
	CreateBranch(branch *branchModel.Branch) (*int64, error)
}
