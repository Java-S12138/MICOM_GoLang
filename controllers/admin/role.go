package admin

import (
	"mi.com/models"
	"strconv"
)

type RoleController struct {
	BaseController
}

func (this *RoleController) Get() {
	// 角色页面初始化函数
	// 实例化Role结构体
	role := []models.Role{}
	// 查找到role表中的所以数据
	models.DB.Find(&role)
	// 渲染到前台页面
	this.Data["role"] = role
	// 渲染模板
	this.TplName = "admin/role/index.html"
}

func (this *RoleController) Add() {
	// 渲染增加角色页面
	this.TplName = "admin/role/add.html"
}

func (this *RoleController) DoAdd() {
	// 获取前台通过POST方式传过来的数据
	title := this.GetString("title")
	description := this.GetString("description")
	// 并进行判断,如果标题为空,首先执行预先设置好的错误页面,接着跳转回增加页面
	if title == "" {
		this.Error("标题不能为空","/role/add")
		return
	}
	// 通过给Role模型赋值,执行增加数据操作
	role := models.Role{}
	role.Title = title
	role.Description = description
	role.Status = 1
	role.AddTime = int(models.GetUnix())
	// 执行增加操作,并返回错误信息,如果有的话
	err := models.DB.Create(&role).Error
	if err != nil {
		this.Error("增加角色失败","/role/add")
	}else {
		this.Success("增加角色成功","/role")
	}
}

func (this *RoleController) Edit() {
	id,err := this.GetInt("id")
	if err != nil {
		this.Error("传入参数错误","/role")
		return
	}

	role := models.Role{Id: id}
	models.DB.Find(&role)
	this.Data["role"] =role
	this.TplName = "admin/role/edit.html"
}

func (this *RoleController) DoEdit() {
	id,err := this.GetInt("id")
	if err != nil {
		this.Error("传入参数错误","/role")
		return
	}
	title := this.GetString("title")
	description := this.GetString("description")

	if title == "" {
		this.Error("标题不能为空","/role/add")
		return
	}
	role := models.Role{Id:id}
	models.DB.Find(&role)

	role.Title = title
	role.Description = description

	err_save := models.DB.Save(&role).Error
	if err_save != nil {
		this.Error("修改数据失败","/role/edit?id="+strconv.Itoa(id))
	}else {
		this.Success("修改数据成功","/role")
	}
}

func (this *RoleController) Delete() {
	id,err := this.GetInt("id")
	if err != nil {
		this.Error("传入参数错误","/role")
		return
	}
	role := models.Role{Id: id}
	models.DB.Delete(&role)
	this.Success("删除角色成功","/role")
}

func (this *RoleController) Auth() {
	// 1:获取角色ID
	roleId,err := this.GetInt("id")
	if err != nil {
		this.Error("传入参数错误","/role")
		return
	}
	// 2:获取全部权限
	access := []models.Access{}
	models.DB.Preload("AccessItem").Where("module_id=0").Find(&access)

	// 3:获取当前角色拥有的权限,并把权限id放在一个map对象里面
	roleAccess := []models.RoleAccess{}
	models.DB.Where("role_id=?",roleId).Find(&roleAccess)


	roleAccessMap := make(map[int]int)
	for _, v := range roleAccess {
		roleAccessMap[v.AccessId] = v.AccessId
	}

	// 4:循环遍历所有的权限数据,判断当前权限的id是否在角色权限的map对象当中
	//	 如果存在,将checked字段变为true
	for i := 0; i <len(access) ; i++ {
		 if _,ok := roleAccessMap[access[i].Id];ok{
		 	access[i].Checked = true
		 }
		for j := 0; j <len(access[i].AccessItem) ; j++ {
			if _,ok := roleAccessMap[access[i].AccessItem[j].Id];ok{
				access[i].AccessItem[j].Checked = true
			}
		}
	}
	// 5:渲染数据
	roleName := models.Role{Id: roleId}
	models.DB.Find(&roleName)
	this.Data["roleName"] = roleName.Title
	this.Data["accessList"] = access
	this.Data["roleId"] = roleId
	this.TplName = "admin/role/auth.html"
}

func (this *RoleController) DoAuth() {
	// 获取需要修改的角色ID
	role_id,err:= this.GetInt("role_id")
	if err != nil {
		this.Error("传入参数错误","/role")
		return
	}
	// 获取后台表单传来的节点信息,也就是勾选的权限
	accessNode := this.GetStrings("access_node")
	// 通过获取的角色ID,查找出角色权限表中的数据,并将其删除
	roleAccess := models.RoleAccess{}
	models.DB.Where("role_id=?",role_id).Delete(&roleAccess)
	// 最后通过for range循环,将节点信息,重新赋值给当前角色的角色权限表
	for _, v := range accessNode {
		accessId, _ := strconv.Atoi(v)
		roleAccess.AccessId =accessId
		roleAccess.RoleId = role_id
		models.DB.Create(&roleAccess)
	}
	this.Success("授权成功","/role/auth?id="+strconv.Itoa(role_id))
}
