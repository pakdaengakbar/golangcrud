package main

import (
	"database/sql"
	"golangcrud/connection"
	"golangcrud/middleware"

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

	"fmt"
	"log"
	"net/http"

	"github.com/gin-gonic/gin"
	_ "github.com/go-sql-driver/mysql"
	// Import the connection package for database connection
)

func main() {
	mux := http.NewServeMux()
	mux.Handle("/secure-endpoint", middleware.APIKeyAuth(http.HandlerFunc(secureHandler)))
	http.ListenAndServe(":8000", mux)

	// Initialize database connection
	var db *sql.DB
	var err error
	db, err = connection.Conn()
	if err != nil {
		log.Fatal(err)
	}
	defer db.Close()

	// Initialize router
	router := gin.New()
	// Initialize user
	userRepo := userRepository.NewUserRepository(db)
	userUsecase := userUsecase.NewUserUsecase(userRepo)
	userDelivery.NewUserHandler(router, userUsecase)
	// Initialize company
	compRepo := compRepository.NewCompRepository(db)
	compUsecase := compUsecase.NewCompUsecase(compRepo)
	compDelivery.NewCompanieHandler(router, compUsecase)
	// Initialize branch
	branchRepo := branchRepository.NewBranchRepository(db)
	branchUsecase := branchUsecase.NewBranchUsecase(branchRepo)
	branchDelivery.NewBranchHandler(router, branchUsecase)

	// Start server on port 8000
	log.Fatal(http.ListenAndServe(":8000", router))

}

func secureHandler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintln(w, "Welcome! You passed the API key check.")
}
