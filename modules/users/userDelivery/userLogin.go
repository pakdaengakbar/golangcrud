package userDelivery

import (
	"golangcrud/models/userModel"
	"os"
	"time"

	"github.com/gin-gonic/gin"
	"github.com/golang-jwt/jwt/v5"
	"golang.org/x/crypto/bcrypt"
)

type LoginRequest struct {
	Email    string `json:"email"`
	Password string `json:"password"`
}

func (h *userHandler) LoginHandler(c *gin.Context) {
	var loginRequest LoginRequest
	if err := c.ShouldBindJSON(&loginRequest); err != nil {
		c.JSON(400, gin.H{"error": "Invalid request"})
		return
	}

	user, err := h.UserUsecase.FindByEmail(loginRequest.Email)
	if err != nil {
		c.JSON(401, gin.H{"error": "Invalid credentials"})
		return
	}

	if err := bcrypt.CompareHashAndPassword([]byte(user.Password), []byte(loginRequest.Password)); err != nil {
		c.JSON(401, gin.H{"error": "Invalid credentials"})
		return
	}

	accessToken, err := createAccessToken(user)
	if err != nil {
		c.JSON(500, gin.H{"error": "Could not generate access token"})
		return
	}

	refreshToken, err := createRefreshToken(user)
	if err != nil {
		c.JSON(500, gin.H{"error": "Could not generate refresh token"})
		return
	}

	c.JSON(200, gin.H{
		"access_token":  accessToken,
		"refresh_token": refreshToken,
	})
}

func createAccessToken(user *userModel.User) (string, error) {
	claims := jwt.MapClaims{
		"user_id": user.ID,
		"email":   user.Email,
		"exp":     time.Now().Add(time.Hour * 1).Unix(), // 1 hour expiry
	}

	token := jwt.NewWithClaims(jwt.SigningMethodHS256, claims)
	accessToken, err := token.SignedString([]byte(os.Getenv("JWT_SECRET")))
	if err != nil {
		return "", err
	}

	return accessToken, nil
}

func createRefreshToken(user *userModel.User) (string, error) {
	// Refresh token will have a longer expiry, e.g., 7 days
	claims := jwt.MapClaims{
		"user_id": user.ID,
		"email":   user.Email,                                // <--- IMPORTANT!
		"exp":     time.Now().Add(time.Hour * 24 * 7).Unix(), // 7 days expiry
	}

	token := jwt.NewWithClaims(jwt.SigningMethodHS256, claims)
	refreshToken, err := token.SignedString([]byte(os.Getenv("JWT_SECRET")))
	if err != nil {
		return "", err
	}

	return refreshToken, nil
}
