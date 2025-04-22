package users

import "golangcrud/models/userModel"

type UserRepository interface {
	FindByEmail(email string) (*userModel.User, error)

	// GetAllUsers retrieves all users from the database
	GetAllUsers() (*[]userModel.User, error)
	CreateUser(user *userModel.User) (*int64, error)
	DeleteUser(id int) error
	GetUser(id int) (*userModel.User, error)
	UpdateUser(user *userModel.User) error
}
