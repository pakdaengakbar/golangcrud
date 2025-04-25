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

func (db *sqlRepository) GetAllBranches() (*[]branchModel.Mbranch, error) {
	var branches []branchModel.Mbranch
	err := db.Conn.Table("mbranchs b").
		Select("b.id, b.ncompanyid, c.cname as compname, b.cname, b.cdescription, b.cphone, b.cemail, b.caddress, b.clocation, b.created_at").
		Joins("join mcompanies c on b.ncompanyid = c.id").
		Scan(&branches).Error

	if err != nil {
		return nil, err
	}
	return &branches, nil
}

func (db *sqlRepository) GetBranchesFiltered(keyword string, page int, pageSize int) (*[]branchModel.Mbranch, error) {
	var branches []branchModel.Mbranch

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

func (db *sqlRepository) CreateBranch(branch *branchModel.BranchUpdateInput) (*int64, error) {
	if err := db.Conn.Table("mbranchs").Create(branch).Error; err != nil {
		return nil, err
	}
	id := int64(branch.Id)
	return &id, nil
}

func (db *sqlRepository) GetBranchByID(id int) (*branchModel.Mbranch, error) {
	var branch branchModel.Mbranch
	err := db.Conn.Table("mbranchs b").
		Select("b.id, c.cname as compname, b.cname, b.cdescription, b.caddress, b.created_at").
		Joins("join mcompanies c on b.ncompanyid = c.id").
		Where("b.id = ?", id).
		Scan(&branch).Error

	if err != nil {
		return nil, err
	}
	if branch.Id == 0 {
		return nil, fmt.Errorf("branch with ID %d not found", id)
	}
	return &branch, nil
}

func (db *sqlRepository) UpdateBranch(id int, input branchModel.BranchUpdateInput) error {
	return db.Conn.Table("mbranchs").Where("id = ?", id).Updates(input).Error
}

func (db *sqlRepository) DeleteBranch(id int) error {
	// Delete the branch with the given ID
	if err := db.Conn.Table("mbranchs").Where("id = ?", id).Delete(&branchModel.Mbranch{}).Error; err != nil {
		return err
	}
	return nil
}
