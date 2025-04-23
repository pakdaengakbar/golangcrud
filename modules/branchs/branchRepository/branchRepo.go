package branchRepository

import (
	"fmt"
	"golangcrud/models/branchModel"
	"golangcrud/modules/branchs"

	"gorm.io/gorm"
)

type sqlRepository struct {
	Conn *gorm.DB
}

func NewBranchRepository(Conn *gorm.DB) branchs.BranchRepository {
	return &sqlRepository{Conn}
}

func (db *sqlRepository) GetAllBranches() (*[]branchModel.Branch, error) {
	var branches []branchModel.Branch
	err := db.Conn.Table("mbranchs b").
		Select("b.id, c.cname as compname, b.cname, b.cdescription, b.caddress, b.created_at").
		Joins("join mcompanies c on b.ncompanyid = c.id").
		Scan(&branches).Error

	if err != nil {
		return nil, err
	}
	return &branches, nil
}

func (db *sqlRepository) GetBranchesFiltered(keyword string, page int, pageSize int) (*[]branchModel.Branch, error) {
	var branches []branchModel.Branch

	if pageSize <= 0 {
		pageSize = 10
	}
	if page < 1 {
		page = 1
	}
	offset := (page - 1) * pageSize
	search := "%" + keyword + "%"

	err := db.Conn.Table("mbranchs b").
		Select("b.id, c.cname as compname, b.cname, b.cdescription, b.caddress, b.created_at").
		Joins("join mcompanies c on b.ncompanyid = c.id").
		Where("b.cname LIKE ? OR c.cname LIKE ? OR b.cdescription LIKE ?", search, search, search).
		Order("b.created_at desc").
		Limit(pageSize).
		Offset(offset).
		Scan(&branches).Error

	if err != nil {
		return nil, err
	}

	if len(branches) == 0 {
		return nil, fmt.Errorf("no data found for name %s", search)
	}
	return &branches, nil
}
func (db *sqlRepository) GetBranchByid(id int) (*branchModel.Branch, error) {
	var branch branchModel.Branch
	err := db.Conn.Table("mbranchs b").
		Select("b.id, c.cname as compname, b.cname, b.cdescription, b.caddress, b.created_at").
		Joins("join mcompanies c on b.ncompanyid = c.id").
		Where("b.id = ?", id).
		Scan(&branch).Error
	if err != nil {
		return nil, err
	}
	if branch.Id == 0 {
		return nil, fmt.Errorf("no data found for id %d", id)
	}
	return &branch, nil
}

func (db *sqlRepository) CreateBranch(branch *branchModel.Branch) (*int64, error) {
	if err := db.Conn.Create(branch).Error; err != nil {
		return nil, err
	}
	id := int64(branch.Id)
	return &id, nil
}
