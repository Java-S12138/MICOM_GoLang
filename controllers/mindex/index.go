package mindex

import (
	"mi.com/models"
)

type IndexController struct {
	BaseController
}

func (this *IndexController) Get() {
	// 调用公共的功能
	this.SuperInit()

	//获取轮播图
	focus := []models.Focus{}
	if hasFocus := models.CacheDb.Get("focus",&focus); hasFocus == true {
		this.Data["focusList"] = focus
	} else {
		models.DB.Where("status=1 AND focus_type=1").Order("sort desc").Find(&focus)
		this.Data["focusList"] = focus
		models.CacheDb.Set("focus",focus)
	}

	// 获取手机楼层数据
	redisPhone := []models.Goods{}
	if hasPhone := models.CacheDb.Get("phone", &redisPhone); hasPhone == true {
		this.Data["phoneList"] = redisPhone
	} else {
		phone := models.GetGoodsByCategory(33, "hot", 8)
		this.Data["phoneList"] = phone
		models.CacheDb.Set("phone", phone)
	}

	// 获取家电楼层数据
	redisAppliances := []models.Goods{}
	if hasAppliances := models.CacheDb.Get("appliances", &redisAppliances); hasAppliances == true {
		this.Data["appliancesList"] = redisAppliances
	} else {
		appliances := models.GetGoodsByCategory(50, "hot", 8)
		this.Data["appliancesList"] = appliances
		models.CacheDb.Set("appliances", appliances)
	}

	// 获取智能楼层数据
	redisSmart := []models.Goods{}
	if hasSmart := models.CacheDb.Get("smart", &redisSmart); hasSmart == true {
		this.Data["smartList"] = redisSmart
	} else {
		smart := models.GetGoodsByCategory(52, "hot", 8)
		this.Data["smartList"] = smart
		models.CacheDb.Set("smart", smart)
	}

	this.TplName = "mindex/index/index.html"
}
