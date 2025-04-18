package compDelivery

import (
	"fmt"
	"golangcrud/models/companieModel"
	"golangcrud/modules/companies"
	"log"
	"strconv"

	"github.com/gin-gonic/gin"
)

type compHandler struct {
	compUsecase companies.CompUsecase
}

func NewCompanieHandler(r *gin.Engine, compUsecase companies.CompUsecase) {
	handler := compHandler{
		compUsecase: compUsecase,
	}

	companies := r.Group("/companies")
	companies.Use()
	{
		companies.GET("/", handler.GetAllComp)
		companies.POST("/", handler.CreateComp)
		companies.DELETE("/:id", handler.DeleteComp)
		companies.GET("/:id", handler.GetComp)
	}
	fmt.Println(companies)
	log.Println(companies)
}

func (h *compHandler) GetAllComp(c *gin.Context) {
	companies, err := h.compUsecase.GetAllCompanies()
	if err != nil {
		c.JSON(500, gin.H{"error": "Internal Server Error.."})
		return
	}
	c.JSON(200, companies)
}

func (h *compHandler) CreateComp(c *gin.Context) {
	var comp companieModel.Companie
	if err := c.ShouldBindJSON(&comp); err != nil {
		c.JSON(400, gin.H{"error": "Bad Request"})
		return
	}

	id, err := h.compUsecase.CreateCompanie(&comp)
	if err != nil {
		c.JSON(500, gin.H{"error": "Internal Server Error"})
		return
	}
	c.JSON(201, gin.H{"id": id})
}

func (h *compHandler) DeleteComp(c *gin.Context) {
	id := c.Param("id")
	// Check if id is empty
	if id == "" {
		c.JSON(400, gin.H{"error": "Bad Request : id cannot be empty"})
		return
	}
	// Convert id to int
	idInt, err := strconv.Atoi(id)
	log.Println("ID:", idInt)

	if err != nil {
		c.JSON(400, gin.H{"error": "Bad Request : id must be a number"})
		return
	}
	log.Println("Query error:", err)

	err = h.compUsecase.DeleteCompanie(idInt)
	if err != nil {
		c.JSON(500, gin.H{"error": "Internal Server Error"})
		return
	}
	c.JSON(201, gin.H{"message": "User deleted successfully"})
}

func (h *compHandler) GetComp(c *gin.Context) {
	id := c.Param("id")
	// Check if id is empty
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
	comp, err := h.compUsecase.GetCompanie(idInt)
	if err != nil {
		c.JSON(404, gin.H{"error": "No Data Found"})
		return
	}
	c.JSON(200, comp)
}
