package routes

import (
	"database/sql"
	"net/http"

	"go-rubezh/handlers"

	"github.com/gin-gonic/gin"
)

func RegisterRoutes(router *gin.Engine, db *sql.DB) {
	userHandler := handlers.NewUserHandler(db)

	router.GET("/ping", func(c *gin.Context) {
		c.JSON(http.StatusOK, gin.H{"message": "server is working"})
	})

	router.GET("/users", userHandler.GetUsers)
}
