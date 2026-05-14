package main

import (
	"log"

	"go-rubezh/database"
	"go-rubezh/middleware"
	"go-rubezh/routes"

	"github.com/gin-gonic/gin"
)

func main() {
	db, err := database.Connect()
	if err != nil {
		log.Fatalf("database connection error: %v", err)
	}
	defer db.Close()

	if err := database.InitSchema(db); err != nil {
		log.Fatalf("database init error: %v", err)
	}

	router := gin.New()
	router.Use(gin.Recovery(), middleware.RequestLogger())

	routes.RegisterRoutes(router, db)

	if err := router.Run(":8080"); err != nil {
		log.Fatalf("server start error: %v", err)
	}
}
