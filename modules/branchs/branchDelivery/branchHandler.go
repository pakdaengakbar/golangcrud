package branchDelivery

import (
	"golangcrud/modules/branchs"

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
	branch.Use()
	{
		branch.GET("/", handler.GetAllBranch)
		branch.GET("/filter/:name", handler.GetBranchesFiltered)

	}
}

func (h *branchHandler) GetAllBranch(c *gin.Context) {
	branches, err := h.branchUsecase.GetAllBranches()
	if err != nil {
		c.JSON(500, gin.H{"error": err.Error()})
		return
	}
	c.JSON(200, branches)
}

func (h *branchHandler) GetBranchesFiltered(c *gin.Context) {
	name := c.Param("name")
	// Check if name is empty
	if name == "" {
		c.JSON(400, gin.H{"error": "Bad Request : name cannot be empty"})
		return
	}
	// page := c.Query("page")
	// pageSize := c.Query("pageSize")

	// pageInt, err := strconv.Atoi(page)
	// if err != nil {
	// 	c.JSON(500, gin.H{"error": err.Error()})
	// 	return
	// }

	// pageSizeInt, err := strconv.Atoi(pageSize)
	// if err != nil {
	// 	c.JSON(500, gin.H{"error": err.Error()})
	// 	return
	// }

	branches, err := h.branchUsecase.GetBranchesFiltered(name)
	if err != nil {
		//c.JSON(404, gin.H{"error": "Data not Found..!"})
		c.JSON(500, gin.H{"error": err.Error()})
		return
	}
	c.JSON(200, branches)
}
