package main

import (
	"os"

	// Removed duplicate import
	"golangcrud/modules/users/userDelivery"
	"golangcrud/modules/users/userRepository"
	"golangcrud/modules/users/userUsecase"

	"golangcrud/modules/companies/compDelivery"
	"golangcrud/modules/companies/compRepository"
	"golangcrud/modules/companies/compUsecase"

	"golangcrud/modules/branchs/branchDelivery"
	"golangcrud/modules/branchs/branchRepository"
	"golangcrud/modules/branchs/branchUsecase"

	"log"
	"net/http"

	"github.com/gin-gonic/gin"
	_ "github.com/go-sql-driver/mysql"
	"github.com/joho/godotenv"
	"gorm.io/driver/mysql"
	"gorm.io/gorm"
	// Import the connection package for database connection
)

func main() {
	// Initialize database connection
	var db *gorm.DB
	var err error
	db, err = ConnGORM()
	if err != nil {
		log.Fatal(err)
	}

	sqlDB, err := db.DB()
	if err != nil {
		log.Fatal(err)
	}
	defer sqlDB.Close()

	// Initialize env
	err = godotenv.Load()
	if err != nil {
		log.Fatal("Error loading .env file")
	}

	// Initialize router
	router := gin.New()
	// Initialize user
	userRepo := userRepository.NewUserRepository(sqlDB)
	userUsecase := userUsecase.NewUserUsecase(userRepo)
	userDelivery.NewUserHandler(router, userUsecase)

	// Initialize company
	compRepo := compRepository.NewCompRepository(sqlDB)
	compUsecase := compUsecase.NewCompUsecase(compRepo)
	compDelivery.NewCompanieHandler(router, compUsecase)

	// Initialize branch
	branchRepo := branchRepository.NewBranchRepository(db)
	branchUsecase := branchUsecase.NewBranchUsecase(branchRepo)
	branchDelivery.NewBranchHandler(router, branchUsecase)

	// Start server on port 8000
	log.Fatal(http.ListenAndServe(":8080", router))

}

// ConnGORM establishes a connection to the database using GORM.
func ConnGORM() (*gorm.DB, error) {
	dsn := os.Getenv("DB_DSN") // Ensure you have DB_DSN in your .env file
	if dsn == "" {
		dsn = "golang:password@tcp(localhost:3306)/db_project" // Replace with your actual default DSN
		log.Println("DB_DSN is not set in the environment variables, using default DSN")
	}
	db, err := gorm.Open(mysql.Open(dsn), &gorm.Config{})
	if err != nil {
		log.Printf("Error connecting to database: %v", err)
		return nil, err
	}
	return db, nil
}
