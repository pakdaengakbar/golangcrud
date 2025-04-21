package branchs

import (
	"golangcrud/models/branchModel"
)

type BranchUsecase interface {
	GetAllBranches() (*[]branchModel.Branch, error)
	GetBranchesFiltered(keyword string) (*[]branchModel.Branch, error)
}
