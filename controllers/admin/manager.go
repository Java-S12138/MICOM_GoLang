package admin

import (
	"mi.com/models"
	"strconv"
)

type ManagerController struct {
	BaseController
}

func (this *ManagerController) Get() {
	manager := []models.Manager{}
	models.DB.Preload("Role").Find(&manager)
	this.Data["managerList"] = manager
	this.TplName = "admin/manager/index.html"
}

func (this *ManagerController) Add() {
	role := []models.Role{}
	models.DB.Find(&role)
	this.Data["role"] = role

	this.TplName = "admin/manager/add.html"
}

func (this *ManagerController) DoAdd() {
	roleId,err_num := this.GetInt("role_id")
	if err_num != nil {
		this.Error("非法请求","/manager/add")
	}

	username := this.GetString("username")
	password := models.Md5(this.GetString("password"))
	mobile := this.GetString("mobile")
	email := this.GetString("email")

	if len(username)<2 || len(password)<6 {
		this.Error("用户名或者密码长度不合法","/manage/add")
		return
	}
	// 判断数据里面是否存在已有用户
	managerList := []models.Manager{}
	models.DB.Where("username=?",username).Find(&managerList)
	if len(managerList)>0 {
		this.Error("用户名已经存在","/manager/add")
		return
	}

	manager := models.Manager{}
	manager.Username = username
	manager.Password = password
	manager.Mobile = mobile
	manager.Email = email
	manager.AddTime = int(models.GetUnix())
	manager.RoleId = roleId
	manager.Status = 1

	err := models.DB.Create(&manager).Error
	if err !=nil {
		this.Error("增加管理员失败","/manager/add")
		return
	}
	this.Success("增加管理员成功","/manager")
}

func (this *ManagerController) Edit() {
	// 获取所以角色
	role := []models.Role{}
	models.DB.Find(&role)
	this.Data["role"] = role

	// 获取管理员信息
	id,err := this.GetInt("id")
	if err != nil {
		this.Error("非法请求","/manager")
		return
	}
	manager := models.Manager{Id: id}
	models.DB.Find(&manager)
	this.Data["manager"] = manager

	this.TplName = "admin/manager/edit.html"
}

func (this *ManagerController) DoEdit() {
	id,err1 := this.GetInt("id")
	if err1 != nil {
		this.Error("非法请求","/manager")
		return
	}

	roleId,err2 := this.GetInt("role_id")
	if err2 != nil {
		this.Error("非法请求","/managerd")
		return
	}

	password := this.GetString("password")
	mobile := this.GetString("mobile")
	email := this.GetString("email")

	// 获取数据
	manager := models.Manager{Id: id}
	models.DB.Find(&manager)
	manager.RoleId = roleId
	manager.Mobile = mobile
	manager.Email = email

	if password != "" {
		if len(password)<6 {
			this.Error("密码长度不能小于6位","/manager/edit?id="+strconv.Itoa(id))
		}
		manager.Password =models.Md5(password)
	}
	err := models.DB.Save(&manager).Error
	if err != nil {
		this.Error("修改数据失败","/manager/edit?id="+strconv.Itoa(id))
	}else {
		this.Success("修改数据成功","/manager")
	}
}

func (this *ManagerController) Delete() {
	id,err := this.GetInt("id")
	if err != nil {
		this.Error("传入参数错误","/manager")
		return
	}
	manager := models.Manager{Id: id}
	models.DB.Delete(&manager)
	this.Success("删除角色成功","/manager")
}