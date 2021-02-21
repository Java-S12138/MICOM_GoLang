package admin

import (
	"mi.com/models"
	"strconv"
	"strings"
)

type GoodsTypeController struct {
	BaseController
}

func (this *GoodsTypeController) Get() {

	goodsType := []models.GoodsType{}
	models.DB.Find(&goodsType)
	this.Data["goodsTypeList"] = goodsType
	this.TplName = "admin/goodsType/index.html"
}

func (this *GoodsTypeController) Add() {
	this.TplName = "admin/goodsType/add.html"
}

func (this *GoodsTypeController) DoAdd() {
	title := strings.Trim(this.GetString("title"), " ")
	description := strings.Trim(this.GetString("description"), " ")
	status, err1 := this.GetInt("status")
	if err1 != nil {
		this.Error("传入参数不正确", "/goodsType/add")
		return
	}
	if title == "" {
		this.Error("标题不能为空", "/goodsType/add")
		return
	}
	goodsType := models.GoodsType{}
	goodsType.Title = title
	goodsType.Description = description
	goodsType.Status = status
	goodsType.AddTime = int(models.GetUnix())
	err := models.DB.Create(&goodsType).Error
	if err != nil {
		this.Error("增加商品类型失败", "/goodsType/add")
	} else {
		this.Success("增加商品类型成功", "/goodsType")
	}
}

func (this *GoodsTypeController) Edit() {
	id, err := this.GetInt("id")
	if err != nil {
		this.Error("传入参数错误", "/goodsType")
		return
	}

	goodsType := models.GoodsType{Id: id}
	models.DB.Find(&goodsType)
	this.Data["goodsType"] = goodsType
	this.TplName = "admin/goodsType/edit.html"
}

func (this *GoodsTypeController) DoEdit() {

	id, err1 := this.GetInt("id")

	title := strings.Trim(this.GetString("title"), " ")
	description := strings.Trim(this.GetString("description"), " ")
	status, err2 := this.GetInt("status")
	if err1 != nil || err2 != nil {
		this.Error("传入参数错误", "/goodsType")
		return
	}

	if title == "" {
		this.Error("标题不能为空", "/role/add")
		return
	}
	//修改
	goodsType := models.GoodsType{Id: id}
	models.DB.Find(&goodsType)
	goodsType.Title = title
	goodsType.Description = description
	goodsType.Status = status

	err3 := models.DB.Save(&goodsType).Error
	if err3 != nil {
		this.Error("修改数据失败", "/goodsType/edit?id="+strconv.Itoa(id))
	} else {
		this.Success("修改数据成功", "/goodsType")
	}

}

func (this *GoodsTypeController) Delete() {
	id, err1 := this.GetInt("id")
	if err1 != nil {
		this.Error("传入参数错误", "/goodsType")
		return
	}
	goodsType := models.GoodsType{Id: id}
	models.DB.Delete(&goodsType)
	this.Success("删除数据成功", "/goodsType")

}

