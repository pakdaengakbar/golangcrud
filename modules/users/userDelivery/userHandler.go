package userDelivery

import (
	"golangcrud/models/userModel"
	"golangcrud/modules/users"

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
		users.DELETE("/", handler.DeleteUserHandler)
	}
}

func (h *userHandler) GetAllUsers(c *gin.Context) {
	users, err := h.UserUsecase.GetAllUsers()
	if err != nil {
		c.JSON(500, gin.H{"error": "Internal Server Error"})
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
	id, err := h.UserUsecase.CreateUser(&user)
	if err != nil {
		c.JSON(500, gin.H{"error": "Internal Server Error"})
		return
	}
	c.JSON(201, gin.H{"id": id})
}

// DeleteUserHandler is a function that sets up the user creation route
func (h *userHandler) DeleteUserHandler(c *gin.Context) {
	var user userModel.User
	if err := c.ShouldBindJSON(&user); err != nil {
		c.JSON(400, gin.H{"error": "Bad Request"})
		return
	}
	id, err := h.UserUsecase.CreateUser(&user)
	if err != nil {
		c.JSON(500, gin.H{"error": "Internal Server Error"})
		return
	}
	c.JSON(201, gin.H{"id": id})
}
