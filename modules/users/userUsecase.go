package users

import "golangcrud/models/userModel"

type UserUsecase interface {
	GetAllUsers() (*[]userModel.User, error)
	CreateUser(user *userModel.User) (*int64, error)
}
