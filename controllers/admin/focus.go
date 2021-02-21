package admin

import (
	"mi.com/models"
	"strconv"
)

type FocusController struct {
	BaseController
}

func (this *FocusController) Get() {
	focus := []models.Focus{}
	models.DB.Find(&focus)
	this.Data["focusList"] = focus
	this.TplName = "admin/focus/index.html"
}

func (this *FocusController) Add() {
	this.TplName = "admin/focus/add.html"
}

func (this *FocusController) DoAdd() {
	focusType, err1 := this.GetInt("focus_type")
	title := this.GetString("title")
	link := this.GetString("link")
	sort, err2 := this.GetInt("sort")
	status, err3 := this.GetInt("status")

	if err1 != nil || err3 != nil {
		this.Error("非法请求", "/focus/add")
	}
	if err2 != nil {
		this.Error("排序表单里面输入的数据不合法", "/focus/add")
	}

	// 执行图片上传
	focusImgSrc,_ :=  this.UploadImg("focus_img")

	focus := models.Focus{
		Title:     title,
		FocusType: focusType,
		FocusImg:  focusImgSrc,
		Link:      link,
		Sort:      sort,
		Status:    status,
		AddTime:   int(models.GetUnix()),
	}
	models.DB.Create(&focus)
	this.Success("增加轮播图成功", "/focus")

}

func (this *FocusController) Edit() {

	id, err := this.GetInt("id")
	if err != nil {
		this.Error("非法请求", "/focus")
		return
	}
	focus := models.Focus{Id: id}
	models.DB.Find(&focus)
	this.Data["focus"] = focus

	this.TplName = "admin/focus/edit.html"

}

func (this *FocusController) DoEdit() {
	id, err1 := this.GetInt("id")
	focusType, err2 := this.GetInt("focus_type")
	title := this.GetString("title")
	link := this.GetString("link")
	sort, err3 := this.GetInt("sort")
	status, err4 := this.GetInt("status")

	if err1 != nil || err2 != nil || err4 != nil {
		this.Error("非法请求", "/focus")
	}
	if err3 != nil {
		this.Error("排序表单里面输入的数据不合法", "/focus/edit?id="+strconv.Itoa(id))
	}
	//执行图片上传
	focusImgSrc, _ := this.UploadImg("focus_img")

	focus := models.Focus{Id: id}
	models.DB.Find(&focus)
	focus.Title = title
	focus.FocusType = focusType
	focus.Link = link
	focus.Sort = sort
	focus.Status = status
	if focusImgSrc != "" {
		focus.FocusImg = focusImgSrc
	}
	err := models.DB.Save(&focus).Error
	if err != nil {
		this.Error("修改数据失败", "/focus/edit?id="+strconv.Itoa(id))
		return
	}
	this.Success("修改数据成功", "/focus")
}

func (this *FocusController) Delete() {

	id, err1 := this.GetInt("id")
	if err1 != nil {
		this.Error("传入参数错误", "/focus")
		return
	}
	focus := models.Focus{Id: id}
	models.DB.Delete(&focus)
	this.Success("删除轮播图成功", "/focus")
}

