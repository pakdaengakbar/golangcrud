package connection

import (
	"errors"
	"fmt"
	"log"
	"os"

	"gorm.io/driver/mysql"
	"gorm.io/gorm"
)

func ConnGORM() (*gorm.DB, error) {
	dsn := os.Getenv("DB_DSN")    // Ensure you have DB_DSN in your .env file
	fmt.Println("DSNKABAR:", dsn) // Debugging line to check the DSN value
	if dsn == "" {
		// dsn = "golang:password@tcp(localhost:3306)/db_project" // Replace with your actual default DSN
		log.Println("DB_DSN is not set in the environment variables, using default DSN")
		return nil, errors.New("DB_DSN is not set in the environment variables")
	}
	db, err := gorm.Open(mysql.Open(dsn), &gorm.Config{})
	if err != nil {
		log.Printf("Error connecting to database: %v", err)
		return nil, err
	}
	return db, nil
}
