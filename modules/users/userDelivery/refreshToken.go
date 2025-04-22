package userDelivery

import (
	"os"

	"github.com/gin-gonic/gin"
	"github.com/golang-jwt/jwt/v5"
)

func (h *userHandler) RefreshHandler(c *gin.Context) {
	var req struct {
		RefreshToken string `json:"refresh_token"`
	}

	if err := c.ShouldBindJSON(&req); err != nil || req.RefreshToken == "" {
		c.JSON(400, gin.H{"error": "Invalid request"})
		return
	}

	// Parse and validate refresh token
	token, err := jwt.Parse(req.RefreshToken, func(token *jwt.Token) (interface{}, error) {
		return []byte(os.Getenv("JWT_SECRET")), nil
	})
	if err != nil || !token.Valid {
		c.JSON(401, gin.H{"error": "Invalid or expired refresh token"})
		return
	}

	claims, ok := token.Claims.(jwt.MapClaims)
	if !ok {
		c.JSON(401, gin.H{"error": "Invalid token claims"})
		return
	}

	email, ok := claims["email"].(string)
	if !ok {
		c.JSON(401, gin.H{"error": "Invalid email in token"})
		return
	}

	// Find user again
	user, err := h.UserUsecase.FindByEmail(email)
	if err != nil {
		c.JSON(404, gin.H{"error": "User not found"})
		return
	}

	// Create a new access token
	newAccessToken, err := createAccessToken(user)
	if err != nil {
		c.JSON(500, gin.H{"error": "Could not generate access token"})
		return
	}

	c.JSON(200, gin.H{
		"access_token": newAccessToken,
	})
}
