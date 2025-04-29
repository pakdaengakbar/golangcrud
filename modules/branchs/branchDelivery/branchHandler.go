package branchDelivery

import (
	"golangcrud/models/branchModel"
	"golangcrud/modules/branchs" // Ensure this package contains the Branch type
	"net/http"
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

	branchs := r.Group("/branchs")
	branchs.Use(middleware.JWTAuth())
	branchs.Use()
	{
		branchs.GET("/", handler.GetAllBranch)
		branchs.POST("/", handler.Createbranch)
		branchs.GET("/:id", handler.GetBranchByID)
		branchs.PUT("/:id", handler.UpdateBranch)
		branchs.DELETE("/:id", handler.DeleteBranch)
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

func (h *branchHandler) GetBranchByID(c *gin.Context) {
	// Get the branch ID from the URL parameter
	idStr := c.Param("id")
	id, err := strconv.Atoi(idStr)
	if err != nil {
		c.JSON(400, gin.H{"error": "Invalid branch ID"})
		return
	}

	// Call the use case to get the branch by ID
	branch, err := h.branchUsecase.GetBranchByID(id)
	if err != nil {
		c.JSON(404, gin.H{"error": "Branch not found"})
		return
	}

	// Return the branch as a response
	c.JSON(200, branch)
}

func (h *branchHandler) Createbranch(c *gin.Context) {
	// Bind the request body to the Branch struct
	var branch branchModel.BranchUpdateInput
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

func (h *branchHandler) DeleteBranch(c *gin.Context) {
	// Get the branch ID from the URL parameter
	idStr := c.Param("id")
	id, err := strconv.Atoi(idStr)
	if err != nil {
		c.JSON(400, gin.H{"error": "Invalid branch ID"})
		return
	}

	// Call the use case to delete the branch by ID
	err = h.branchUsecase.DeleteBranch(id)
	if err != nil {
		c.JSON(500, gin.H{"error": err.Error()})
		return
	}
	if err != nil {
		c.JSON(404, gin.H{"error": "Branch not found"})
		return
	}

	// Return a success message as a response
	c.JSON(200, gin.H{"message": "Branch deleted successfully"})
}

func (h *branchHandler) UpdateBranch(c *gin.Context) {
	var input branchModel.BranchUpdateInput
	id := c.Param("id") // Make sure you define the route like PUT /branchs/:id

	if err := c.ShouldBindJSON(&input); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid input"})
		return
	}

	// Convert id to int
	intID, err := strconv.Atoi(id)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid branch ID"})
		return
	}

	err = h.branchUsecase.UpdateBranch(intID, input)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		return
	}

	c.JSON(http.StatusOK, gin.H{"message": "Branch updated successfully"})
}
