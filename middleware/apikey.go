package middleware

// Middleware for API key authentication

import (
	"net/http"
	"os"
	"strings"
)

func APIKeyAuth(next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		authHeader := r.Header.Get("Authorization")
		if authHeader == "" {
			http.Error(w, "Authorization header missing", http.StatusUnauthorized)
			return
		}

		if !strings.HasPrefix(authHeader, "ApiKey ") {
			http.Error(w, "Invalid authorization format", http.StatusUnauthorized)
			return
		}

		apiKey := strings.TrimPrefix(authHeader, "ApiKey ")
		expectedKey := os.Getenv("API_KEY") // load from env for security

		if apiKey != expectedKey {
			http.Error(w, "Invalid API key", http.StatusUnauthorized)
			return
		}

		next.ServeHTTP(w, r)
	})
}
