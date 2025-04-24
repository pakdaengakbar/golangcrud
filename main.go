package main

import (
	// Database connection
	"golangcrud/connection"

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

	"gorm.io/gorm"
)

func main() {
	// Initialize env
	var err error
	err = godotenv.Load(".env")
	if err != nil {
		log.Fatal("Error loading .env file")
	}

	// Initialize database connection
	var db *gorm.DB
	db, err = connection.ConnGORM()
	if err != nil {
		log.Fatal(err)
	}

	sqlDB, err := db.DB()
	if err != nil {
		log.Fatal(err)
	}
	defer sqlDB.Close()

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
