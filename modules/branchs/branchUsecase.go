package branchs

import (
	"golangcrud/models/branchModel"
)

type BranchUsecase interface {
	GetAllBranches() (*[]branchModel.Mbranch, error)
	GetBranchesFiltered(keyword string, page int, pageSize int) (*[]branchModel.Mbranch, error)
	CreateBranch(branch *branchModel.Mbranch) (*int64, error)
}
