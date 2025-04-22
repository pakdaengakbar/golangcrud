package userRepository

import (
	"database/sql"
	"fmt"
	"golangcrud/models/userModel"
	"log"
	"time"

	"golang.org/x/crypto/bcrypt"
)

type sqlRepository struct {
	Conn *sql.DB
}

func NewUserRepository(Conn *sql.DB) *sqlRepository {
	return &sqlRepository{Conn}
}

func (r *sqlRepository) FindByEmail(email string) (*userModel.User, error) {
	query := "SELECT id, name, email, password FROM users WHERE email = ?"
	row := r.Conn.QueryRow(query, email)

	var user userModel.User
	err := row.Scan(&user.ID, &user.Name, &user.Email, &user.Password)
	if err != nil {
		return nil, err
	}
	return &user, nil
}

func (db *sqlRepository) GetAllUsers() (*[]userModel.User, error) {
	var users []userModel.User
	rows, err := db.Conn.Query("SELECT id, name, email, created_at FROM users")
	if err != nil {
		log.Println("Query error:", err)
		return nil, err
	}
	defer rows.Close()
	log.Println("Rows :", rows)

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

	now := time.Now() // Current timestamp
	var encryption = pswEncryption(user.Password)

	result, err := db.Conn.Exec("INSERT INTO users (name, email, password, created_at) VALUES (?, ?, ?, ?)", user.Name, user.Email, encryption, now)
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

func (db *sqlRepository) DeleteUser(id int) error {
	query := "DELETE FROM users WHERE id = ?"
	_, err := db.Conn.Exec(query, id)
	if err != nil {
		return err
	}
	return err
}

func (db *sqlRepository) UpdateUser(user *userModel.User) error {
	_, err := db.Conn.Exec("UPDATE users SET name = ?, email = ? WHERE id = ?", user.Name, user.Email, user.ID)

	return err
}

func (db *sqlRepository) GetUser(id int) (*userModel.User, error) {
	var user userModel.User

	row := db.Conn.QueryRow("SELECT id, name, email, created_at FROM users WHERE id = ?", id)
	if err := row.Scan(&user.ID, &user.Name, &user.Email, &user.CreatedAt); err != nil {
		if err == sql.ErrNoRows {
			return nil, fmt.Errorf("no data found for id %d", id) // No rows found
		}
		return nil, err
	}
	return &user, nil
}

func pswEncryption(password string) string {
	hashedPassword, err := bcrypt.GenerateFromPassword([]byte(password), bcrypt.DefaultCost)
	if err != nil {
		panic(err)
	}
	return string(hashedPassword)
}
