package users

import "golangcrud/models/userModel"

type UserRepository interface {
	GetAllUsers() (*[]userModel.User, error)
	CreateUser(user *userModel.User) (*int64, error)
	DeleteUser(id int) error
	UpdateUser(user *userModel.User) error
}
