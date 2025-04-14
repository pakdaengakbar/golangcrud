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
