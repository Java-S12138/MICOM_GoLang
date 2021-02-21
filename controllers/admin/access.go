package admin

import (
	"mi.com/models"
	"strconv"
)

type AccessController struct {
	BaseController
}

func (this *AccessController) Get() {
	access := []models.Access{}
	models.DB.Preload("AccessItem").Where("module_id=0").Find(&access)
	this.Data["accessList"] = access
	this.TplName = "admin/access/index.html"
}

func (this *AccessController) Add() {
	// 加载顶级模块
	access := []models.Access{}
	models.DB.Where("module_id=0").Find(&access)
	this.Data["accessList"] = access
	this.TplName = "admin/access/add.html"
}

func (this *AccessController) DoAdd() {
	moduleName := this.GetString("module_name")
	iType, err1 := this.GetInt("type")
	actionName := this.GetString("action_name")
	url := this.GetString("url")
	moduleId, err2 := this.GetInt("module_id")
	sort, err3 := this.GetInt("sort")
	description := this.GetString("description")
	status, err4 := this.GetInt("status")
	if err1 != nil || err2 != nil || err3 != nil || err4 != nil {
		this.Error("传入参数错误", "/access/add")
		return
	}
	access := models.Access{
		ModuleName:  moduleName,
		Type:        iType,
		ActionName:  actionName,
		Url:         url,
		ModuleId:    moduleId,
		Sort:        sort,
		Description: description,
		Status:      status,
	}
	err := models.DB.Create(&access).Error
	if err != nil {
		this.Error("增加数据失败", "/access/add")
	} else {
		this.Success("增加数据成功", "/access")
	}

}

func (this *AccessController) Edit() {
	//获取要修改的数据
	id, err1 := this.GetInt("id")
	if err1 != nil {
		this.Error("传入参数错误", "/access")
		return
	}
	access := models.Access{Id: id}
	models.DB.Find(&access)
	this.Data["access"] = access

	//获取顶级模块
	accessList := []models.Access{}
	models.DB.Where("module_id=0").Find(&accessList)
	this.Data["accessList"] = accessList

	this.TplName = "admin/access/edit.html"

}

func (this *AccessController) DoEdit() {
	id, err1 := this.GetInt("id")
	moduleName := this.GetString("module_name")
	iType, err2 := this.GetInt("type")
	actionName := this.GetString("action_name")
	url := this.GetString("url")
	moduleId, err3 := this.GetInt("module_id")
	sort, err4 := this.GetInt("sort")
	description := this.GetString("description")
	status, err5 := this.GetInt("status")
	if err1 != nil || err2 != nil || err3 != nil || err4 != nil || err5 != nil {
		this.Error("传入参数错误", "/access")
		return
	}
	access := models.Access{Id: id}
	models.DB.Find(&access)
	access.ModuleName = moduleName
	access.Type = iType
	access.ActionName = actionName
	access.Url = url
	access.ModuleId = moduleId
	access.Sort = sort
	access.Description = description
	access.Status = status
	err := models.DB.Save(&access).Error
	if err != nil {
		this.Error("修改失败", "/access/edit?id="+strconv.Itoa(id))
		return
	}
	this.Success("修改成功", "/access/")

}

func (this *AccessController) Delete() {
	id, err1 := this.GetInt("id")
	if err1 != nil {
		this.Error("传入参数错误", "/access")
		return
	}

	// 获取当前数据
	access := models.Access{Id: id}
	models.DB.Find(&access)
	if access.ModuleId == 0 {
		accessSmall := []models.Access{}
		models.DB.Where("module_id=?", access.Id).Find(&accessSmall)
		if len(accessSmall) > 0 {
			this.Error("当前模块下面还有菜单或者操作,无法删除", "/access")
			return
		}
	}else {
		models.DB.Delete(&access)
		this.Success("删除成功","/access")
	}

}
