package admin

import (
	"mi.com/models"
	"strconv"
	"strings"
)

type GoodsTypeAttrController struct {
	BaseController
}

func (this *GoodsTypeAttrController) Get() {
	cateId,err1 := this.GetInt("cate_id")
	if err1 != nil {
		this.Error("非法请求","/goodsType")
	}
	//获取当前的类型
	goodsType := models.GoodsType{Id: cateId}
	models.DB.Find(&goodsType)
	this.Data["goodsType"] = goodsType

	//查询当前类型下面的商品类型属性
	goodsTypeAttr := []models.GoodsTypeAttribute{}
	models.DB.Where("cate_id=?", cateId).Find(&goodsTypeAttr)
	this.Data["goodsTypeAttrList"] = goodsTypeAttr

	this.TplName = "admin/goodsTypeAttribute/index.html"

}

func (this *GoodsTypeAttrController) Add() {
	cateId, err1 := this.GetInt("cate_id")
	if err1 != nil {
		this.Error("非法请求", "/goodsType")
	}

	goodsType := []models.GoodsType{}
	models.DB.Find(&goodsType)
	this.Data["goodsTypeList"] = goodsType
	this.Data["cateId"] = cateId
	this.TplName = "admin/goodsTypeAttribute/add.html"


}

func (this *GoodsTypeAttrController) DoAdd() {
	title := this.GetString("title")
	cateId, err1 := this.GetInt("cate_id")
	attrType, err2 := this.GetInt("attr_type")
	attrValue := this.GetString("attr_value")

	if err1 != nil || err2 != nil {
		this.Error("非法请求", "/goodsType")
		return
	}
	if strings.Trim(title, " ") == "" {
		this.Error("商品类型属性名称不能为空", "/goodsTypeAttribute/add?cate_id="+strconv.Itoa(cateId))
		return
	}

	goodsTypeAttr := models.GoodsTypeAttribute{
		Title:     title,
		CateId:    cateId,
		AttrType:  attrType,
		AttrValue: attrValue,
		Status:    1,
		AddTime:   int(models.GetUnix()),
	}
	models.DB.Create(&goodsTypeAttr)
	this.Success("增加成功", "/goodsTypeAttribute?cate_id="+strconv.Itoa(cateId))

}

func (this *GoodsTypeAttrController) Edit() {

	id, err1 := this.GetInt("id")
	if err1 != nil {
		this.Error("非法请求", "/goodsType")
		return
	}
	//获取商品类型属性
	goodsTypeAttr := models.GoodsTypeAttribute{Id: id}
	models.DB.Find(&goodsTypeAttr)
	this.Data["goodsTypeAttr"] = goodsTypeAttr

	//获取所有类型
	goodsType := []models.GoodsType{}
	models.DB.Find(&goodsType)
	this.Data["goodsType"] = goodsType

	this.TplName = "admin/goodsTypeAttribute/edit.html"
}

func (this *GoodsTypeAttrController) DoEdit() {

	id, err1 := this.GetInt("id")
	title := this.GetString("title")
	cateId, err2 := this.GetInt("cate_id")
	attrType, err3 := this.GetInt("attr_type")
	attrValue := this.GetString("attr_value")
	sort, err4 := this.GetInt("sort")

	if err1 != nil || err2 != nil || err3 != nil {
		this.Error("非法请求", "/goodsTypeAttribute")
		return
	}
	if strings.Trim(title, " ") == "" {
		this.Error("商品类型属性名称不能为空", "/goodsTypeAttribute/edit?id="+strconv.Itoa(id))
		return
	}
	if err4 != nil {
		this.Error("排序值不对", "/goodsTypeAttribute/edit?id="+strconv.Itoa(id))
		return
	}
	goodsTypeAttr := models.GoodsTypeAttribute{Id: id}
	models.DB.Find(&goodsTypeAttr)
	goodsTypeAttr.Title = title
	goodsTypeAttr.CateId = cateId
	goodsTypeAttr.AttrType = attrType
	goodsTypeAttr.AttrValue = attrValue
	goodsTypeAttr.Sort = sort

	err := models.DB.Save(&goodsTypeAttr).Error
	if err != nil {
		this.Error("修改数据失败", "/goodsTypeAttribute/edit?id="+strconv.Itoa(id))
		return
	}
	this.Success("需改数据成功", "/goodsTypeAttribute?cate_id="+strconv.Itoa(cateId))

}

func (this *GoodsTypeAttrController) Delete() {

	id, err1 := this.GetInt("id")
	cateId, err2 := this.GetInt("cate_id")
	if err1 != nil {
		this.Error("传入参数错误", "/goodsTypeAttribute?cate_id="+strconv.Itoa(cateId))
		return
	}
	if err2 != nil {
		this.Error("传入参数错误", "/goodsType")
		return
	}

	goodsTypeAttr := models.GoodsTypeAttribute{Id: id}
	models.DB.Delete(&goodsTypeAttr)
	this.Success("删除数据成功", "/goodsTypeAttribute?cate_id="+strconv.Itoa(cateId))
}

