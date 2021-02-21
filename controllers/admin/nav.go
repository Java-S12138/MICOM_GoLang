package admin

import (
	"mi.com/models"
	"math"
	"strconv"
)

type NavController struct {
	BaseController
}

func (this *NavController) Get() {
	//当前页
	page, _ := this.GetInt("page")
	if page == 0 {
		page = 1
	}
	//每一页显示的数量
	pageSize := 20
	//查询数据
	nav := []models.Nav{}
	models.DB.Offset((page - 1) * pageSize).Limit(pageSize).Find(&nav)
	//查询nav表里面的数量
	var count int
	models.DB.Table("nav").Count(&count)

	this.Data["navList"] = nav
	this.Data["totalPages"] = math.Ceil(float64(count) / float64(pageSize))
	this.Data["page"] = page
	this.TplName = "admin/nav/index.html"
}

func (this *NavController) Add() {
	this.TplName = "admin/nav/add.html"
}

func (this *NavController) DoAdd() {
	title := this.GetString("title")
	link := this.GetString("link")
	position, _ := this.GetInt("position")
	isOpennew, _ := this.GetInt("is_opennew")
	relation := this.GetString("relation")
	sort, _ := this.GetInt("sort")
	status, _ := this.GetInt("status")

	nav := models.Nav{
		Title:     title,
		Link:      link,
		Position:  position,
		IsOpennew: isOpennew,
		Relation:  relation,
		Sort:      sort,
		Status:    status,
		AddTime:   int(models.GetUnix()),
	}

	err := models.DB.Create(&nav).Error
	if err != nil {
		this.Error("增加数据失败", "/nav/add")
	} else {
		this.Success("增加成功", "/nav")
	}
}

func (this *NavController) Edit() {
	id, err := this.GetInt("id")
	if err != nil {
		this.Error("传入参数错误", "/nav")
		return
	}
	nav := models.Nav{Id: id}
	models.DB.Find(&nav)
	this.Data["nav"] = nav
	this.Data["prevPage"] = this.Ctx.Request.Referer()
	this.TplName = "admin/nav/edit.html"
}

func (this *NavController) DoEdit() {

	id, err1 := this.GetInt("id")
	if err1 != nil {
		this.Error("传入参数错误", "/nav")
		return
	}
	title := this.GetString("title")
	link := this.GetString("link")
	position, _ := this.GetInt("position")
	isOpennew, _ := this.GetInt("is_opennew")
	relation := this.GetString("relation")
	sort, _ := this.GetInt("sort")
	status, _ := this.GetInt("status")
	prevPage := this.GetString("prevPage")

	//修改
	nav := models.Nav{Id: id}
	models.DB.Find(&nav)
	nav.Title = title
	nav.Link = link
	nav.Position = position
	nav.IsOpennew = isOpennew
	nav.Relation = relation
	nav.Sort = sort
	nav.Status = status

	err2 := models.DB.Save(&nav).Error
	if err2 != nil {
		this.Error("修改数据失败", "/nav/edit?id="+strconv.Itoa(id))
	} else {
		this.Success("修改数据成功", prevPage)
	}

}
func (this *NavController) Delete() {
	id, err1 := this.GetInt("id")
	if err1 != nil {
		this.Error("传入参数错误", "/nav")
		return
	}
	nav := models.Nav{Id: id}
	models.DB.Delete(&nav)

	this.Success("删除数据成功", this.Ctx.Request.Referer())

}

