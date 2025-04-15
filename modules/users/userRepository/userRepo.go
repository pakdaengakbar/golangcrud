package userRepository

import (
	"database/sql"
	"golangcrud/models/userModel"
	"log"
)

type sqlRepository struct {
	Conn *sql.DB
}

func NewUserRepository(Conn *sql.DB) *sqlRepository {
	return &sqlRepository{Conn}
}

func (db *sqlRepository) GetAllUsers() (*[]userModel.User, error) {
	var users []userModel.User
	rows, err := db.Conn.Query("SELECT id, name, email, created_at FROM users")
	if err != nil {
		log.Println("Query error:", err)
		return nil, err
	}
	defer rows.Close()

	for rows.Next() {
		var user userModel.User
		if err := rows.Scan(&user.ID, &user.Name, &user.Email, &user.CreatedAt); err != nil {
			return nil, err
		}
		users = append(users, user)
	}

	return &users, nil
}

func (db *sqlRepository) CreateUser(user *userModel.User) (*int64, error) {

	result, err := db.Conn.Exec("INSERT INTO users (name, email) VALUES (?, ?)", user.Name, user.Email)
	if err != nil {
		log.Println("Query error:", err)
		return nil, err
	}

	id, err := result.LastInsertId()
	if err != nil {
		return nil, err
	}

	return &id, err
}

func (db *sqlRepository) DeleteUser(user *userModel.User) (*int64, error) error {
	query := "DELETE FROM users WHERE id = ?"
	_, err := db.Exec(query, user.ID)
	if err != nil {
		return err
	}
	return nil
}
