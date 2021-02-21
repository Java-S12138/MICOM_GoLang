package admin

import (
	"mi.com/models"
	"strconv"
)

type GoodsCateController struct {
	BaseController
}

func (this *GoodsCateController) Get() {
	goodsCate := []models.GoodsCate{}
	models.DB.Preload("GoodsCateItem").Where("pid=0").Find(&goodsCate)
	this.Data["goodsCateList"] = goodsCate
	this.TplName = "admin/goodsCate/index.html"
}

func (this *GoodsCateController) Add() {
	// 加载顶级模块
	goodsCate := []models.GoodsCate{}
	models.DB.Where("pid=0").Find(&goodsCate)
	this.Data["goodsCateList"] = goodsCate
	this.TplName = "admin/goodsCate/add.html"
}

func (this *GoodsCateController) DoAdd() {
	title := this.GetString("title")
	pid, err1 := this.GetInt("pid")
	link := this.GetString("link")
	template := this.GetString("template")
	subTitle := this.GetString("sub_title")
	keywords := this.GetString("keywords")
	description := this.GetString("description")
	sort, err2 := this.GetInt("sort")
	status, err3 := this.GetInt("status")

	if err1 != nil || err3 != nil {
		this.Error("传入参数类型不正确", "/goodsCate/add")
		return
	}
	if err2 != nil {
		this.Error("排序值必须是整数", "/goodsCate/add")
		return
	}
	uploadDir, _ := this.UploadImg("cate_img")
	goodsCate := models.GoodsCate{
		Title:       title,
		Pid:         pid,
		SubTitle:    subTitle,
		Link:        link,
		Template:    template,
		Keywords:    keywords,
		Description: description,
		CateImg:     uploadDir,
		Sort:        sort,
		Status:      status,
		AddTime:     int(models.GetUnix()),
	}
	err := models.DB.Create(&goodsCate).Error
	if err != nil {
		this.Error("增加失败", "/goodsCate/add")
		return
	}
	this.Success("增加成功", "/goodsCate")

}

func (this *GoodsCateController) Edit() {
	//获取当前数据
	id, err := this.GetInt("id")
	if err != nil {
		this.Error("传入参数错误", "/goodsCate")
		return
	}
	goodsCate := models.GoodsCate{Id: id}
	models.DB.Find(&goodsCate)
	this.Data["goodsCate"] = goodsCate

	//顶级分类
	topGoodsCate := []models.GoodsCate{}
	models.DB.Where("pid=0").Find(&topGoodsCate)
	this.Data["goodsCateList"] = topGoodsCate

	//获取要修改的数据
	this.TplName = "admin/goodsCate/edit.html"


}

func (this *GoodsCateController) DoEdit() {
	id, err1 := this.GetInt("id")
	title := this.GetString("title")
	pid, err2 := this.GetInt("pid")
	link := this.GetString("link")
	template := this.GetString("template")
	subTitle := this.GetString("sub_title")
	keywords := this.GetString("keywords")
	description := this.GetString("description")
	sort, err3 := this.GetInt("sort")
	status, err4 := this.GetInt("status")

	if err1 != nil || err2 != nil || err4 != nil {
		this.Error("传入参数类型不正确", "/goodsCate")
		return
	}
	if err3 != nil {
		this.Error("排序值必须是整数", "/goodsCate/edit?id="+strconv.Itoa(id))
		return
	}
	uploadDir, _ := this.UploadImg("cate_img")

	goodsCate := models.GoodsCate{Id: id}
	models.DB.Find(&goodsCate)
	goodsCate.Title = title
	goodsCate.Pid = pid
	goodsCate.Link = link
	goodsCate.Template = template
	goodsCate.SubTitle = subTitle
	goodsCate.Keywords = keywords
	goodsCate.Description = description
	goodsCate.Sort = sort
	goodsCate.Status = status
	if uploadDir != "" {
		goodsCate.CateImg = uploadDir
	}
	err := models.DB.Save(&goodsCate).Error
	if err != nil {
		this.Error("修改失败", "/goodsCate/edit?id="+strconv.Itoa(id))
		return
	}
	this.Success("修改成功", "/goodsCate")

}

func (this *GoodsCateController) Delete() {

	id, err1 := this.GetInt("id")
	if err1 != nil {
		this.Error("传入参数错误", "/goodsCate")
		return
	}
	//获取当前数据
	goodsCate1 := models.GoodsCate{Id: id}
	models.DB.Find(&goodsCate1)
	if goodsCate1.Pid == 0 { //顶级分类
		goodsCate3 := []models.GoodsCate{}
		models.DB.Where("pid=?", goodsCate1.Id).Find(&goodsCate3)
		if len(goodsCate3) > 0 {
			this.Error("当前分类下面还子分类，无法删除", "/goodsCate")
			return
		}
	}
	goodsCate2 := models.GoodsCate{Id: id}
	models.DB.Delete(&goodsCate2)
	this.Success("删除成功", "/goodsCate")

}