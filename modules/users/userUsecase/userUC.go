package userUsecase

import (
	"golangcrud/models/userModel"
	"golangcrud/modules/users"
)

type UserUsecase struct {
	UserRepository users.UserRepository
}

func NewUserUsecase(userRepository users.UserRepository) *UserUsecase {
	return &UserUsecase{UserRepository: userRepository}
}

func (uc *UserUsecase) GetAllUsers() (*[]userModel.User, error) {
	users, err := uc.UserRepository.GetAllUsers()
	if err != nil {
		return nil, err
	}
	return users, nil
}
