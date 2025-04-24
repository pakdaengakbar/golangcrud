package branchDelivery

import (
	"golangcrud/models/branchModel"
	"golangcrud/modules/branchs" // Ensure this package contains the Branch type
	"strconv"

	"golangcrud/middleware"

	"github.com/gin-gonic/gin"
)

type branchHandler struct {
	branchUsecase branchs.BranchUsecase
}

func NewBranchHandler(r *gin.Engine, branchUsecase branchs.BranchUsecase) {
	handler := branchHandler{
		branchUsecase: branchUsecase,
	}

	branch := r.Group("/branchs")
	branch.Use(middleware.JWTAuth())
	branch.Use()
	{
		branch.GET("/", handler.GetAllBranch)
		branch.POST("/", handler.Createbranch)

	}
}

func (h *branchHandler) GetAllBranch(c *gin.Context) {
	// Get the "name" query parameter
	name := c.Query("name")
	pageStr := c.Query("pages")
	offsetStr := c.Query("offset")

	// Convert page and offset to integers
	page, err := strconv.Atoi(pageStr)
	if err != nil || page < 1 {
		page = 1
	}
	offset, err := strconv.Atoi(offsetStr)
	if err != nil || offset < 1 {
		offset = 10
	}

	if name == "" {
		branches, err := h.branchUsecase.GetAllBranches()
		if err != nil {
			c.JSON(500, gin.H{"error": err.Error()})
			return
		}
		c.JSON(200, branches)
	} else {
		branches, err := h.branchUsecase.GetBranchesFiltered(name, page, offset)
		if err != nil {
			//c.JSON(404, gin.H{"error": "Data not Found..!"})
			c.JSON(500, gin.H{"error": err.Error()})
			return
		}
		c.JSON(200, branches)

	}
}

func (h *branchHandler) Createbranch(c *gin.Context) {
	// Bind the request body to the Branch struct
	var branch branchModel.Mbranch
	if err := c.ShouldBindJSON(&branch); err != nil {
		c.JSON(400, gin.H{"error": err.Error()})
		return
	}

	// Call the use case to create the branch
	id, err := h.branchUsecase.CreateBranch(&branch)
	if err != nil {
		c.JSON(500, gin.H{"error": err.Error()})
		return
	}

	// Return the created branch ID as a response
	c.JSON(201, gin.H{"id": id})
}
