package branchDelivery

import (
	"golangcrud/modules/branchs"
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
	}

	branches, err := h.branchUsecase.GetBranchesFiltered(name, page, offset)
	if err != nil {
		//c.JSON(404, gin.H{"error": "Data not Found..!"})
		c.JSON(500, gin.H{"error": err.Error()})
		return
	}
	c.JSON(200, branches)

}
