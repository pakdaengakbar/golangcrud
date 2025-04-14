package userDelivery

import (
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
