package users

import "golangcrud/models/userModel"

type UserUsecase interface {
	GetAllUsers() (*[]userModel.User, error)
}
