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

func (uc *UserUsecase) CreateUser(user *userModel.User) (*int64, error) {
	id, err := uc.UserRepository.CreateUser(user)
	if err != nil {
		return nil, err
	}
	return id, nil
}

func (uc *UserUsecase) DeleteUser(id int) error {
	err := uc.UserRepository.DeleteUser(id)
	return err
}

func (uc *UserUsecase) UpdateUser(user *userModel.User) error {
	err := uc.UserRepository.UpdateUser(user)
	return err
}

func (uc *UserUsecase) GetUser(id int) (*userModel.User, error) {
	users, err := uc.UserRepository.GetUser(id)
	if err != nil {
		return nil, err
	}
	return users, nil
}
