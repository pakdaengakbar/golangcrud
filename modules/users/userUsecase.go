package users

import "golangcrud/models/userModel"

type UserUsecase interface {
	GetAllUsers() (*[]userModel.User, error)
	CreateUser(user *userModel.User) (*int64, error)
	DeleteUser(id int) error
	GetUser(id int) (*userModel.User, error)
	UpdateUser(user *userModel.User) error
}
