package userDelivery

import (
	"fmt"
	"golangcrud/models/userModel"
	"golangcrud/modules/users"
	"log"
	"strconv"

	"github.com/gin-gonic/gin"
)

type userHandler struct {
	UserUsecase users.UserUsecase
}

func NewUserHandler(r *gin.Engine, userUsecase users.UserUsecase) {
	handler := userHandler{
		UserUsecase: userUsecase,
	}
	users := r.Group("/users")
	users.Use()
	{
		users.GET("/", handler.GetAllUsers)
		users.POST("/", handler.CreateUserHandler)
		users.DELETE("/:id", handler.DeleteUserHandler)
		users.GET("/:id", handler.GetUser)
		users.PUT("/", handler.UpdateUserHandler)
	}
}

func (h *userHandler) GetAllUsers(c *gin.Context) {
	users, err := h.UserUsecase.GetAllUsers()
	if err != nil {
		c.JSON(500, gin.H{"error": err.Error()})
		return
	}
	c.JSON(200, users)
}

// CreateUserHandler is a function that sets up the user creation route
func (h *userHandler) CreateUserHandler(c *gin.Context) {
	var user userModel.User
	if err := c.ShouldBindJSON(&user); err != nil {
		c.JSON(400, gin.H{"error": "Bad Request"})
		return
	}
	log.Println("User.. =", user)

	id, err := h.UserUsecase.CreateUser(&user)
	if err != nil {
		// c.JSON(500, gin.H{"error": "Internal Server Error"})
		c.JSON(500, gin.H{"error": err.Error()})
		return
	}
	c.JSON(201, gin.H{"id": id})
}

func (h *userHandler) GetUser(c *gin.Context) {
	id := c.Param("id")
	if id == "" {
		c.JSON(400, gin.H{"error": "Bad Request : Id cannot be empty"})
		return
	}
	// Convert id to int
	idInt, err := strconv.Atoi(id)
	if err != nil {
		c.JSON(400, gin.H{"error": "Bad Request : Id must be a number"})
		return
	}
	// chek id is exist in db
	user, err := h.UserUsecase.GetUser(idInt)
	if err != nil {
		c.JSON(404, gin.H{"error": "No Data Found"})
		return
	}
	c.JSON(200, user)
}

// DeleteUserHandler is a function that sets up the user creation route
func (h *userHandler) DeleteUserHandler(c *gin.Context) {
	id := c.Param("id")
	if id == "" {
		c.JSON(400, gin.H{"error": "Bad Request : id cannot be empty"})
		return
	}

	// Convert id to int
	idInt, err := strconv.Atoi(id)
	if err != nil {
		c.JSON(400, gin.H{"error": "Bad Request : id must be a number"})
		return
	}
	log.Println("Query error:", id)

	err = h.UserUsecase.DeleteUser(idInt)
	if err != nil {
		c.JSON(500, gin.H{"error": "Internal Server Error"})
		return
	}
	c.JSON(201, gin.H{"message": "User deleted successfully"})
}

func (h *userHandler) UpdateUserHandler(c *gin.Context) {
	var user userModel.User

	if err := c.ShouldBindJSON(&user); err != nil {
		c.JSON(400, gin.H{"error": "Bad Request"})
		return
	}
	fmt.Println(user)
	err := h.UserUsecase.UpdateUser(&user)
	if err != nil {
		c.JSON(500, gin.H{"error": "Internal Server Error"})
		return
	}
	c.JSON(200, gin.H{"message": "User updated successfully"})
}
