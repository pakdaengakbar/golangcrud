package branchs

import (
	"golangcrud/models/branchModel"
)

type BranchRepository interface {
	GetAllBranches() (*[]branchModel.Branch, error)
	GetBranchesFiltered(keyword string) (*[]branchModel.Branch, error)
}
