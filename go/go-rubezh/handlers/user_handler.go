package handlers

import (
	"database/sql"
	"net/http"

	"go-rubezh/models"

	"github.com/gin-gonic/gin"
)

type UserHandler struct {
	db *sql.DB
}

func NewUserHandler(db *sql.DB) *UserHandler {
	return &UserHandler{db: db}
}

func (h *UserHandler) GetUsers(c *gin.Context) {
	rows, err := h.db.Query("SELECT id, name, email FROM users ORDER BY id")
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "failed to get users"})
		return
	}
	defer rows.Close()

	users := make([]models.User, 0)
	for rows.Next() {
		var user models.User
		if err := rows.Scan(&user.ID, &user.Name, &user.Email); err != nil {
			c.JSON(http.StatusInternalServerError, gin.H{"error": "failed to scan user"})
			return
		}
		users = append(users, user)
	}

	if err := rows.Err(); err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "failed during rows iteration"})
		return
	}

	c.JSON(http.StatusOK, users)
}
