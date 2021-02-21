package admin

import (
	"github.com/astaxie/beego"
	"github.com/jinzhu/gorm"
	"mi.com/models"
)

type MainController struct {
	beego.Controller
}

func (this *MainController) Get() {
	// 根据登录用户的权限,动态显示左侧的菜单
	// 从session里面获取登录信息
	userinfo,ok := this.GetSession("userinfo").(models.Manager)
	if ok {
		// 获取角色id
		roleId := userinfo.RoleId

		// 2:获取全部权限
		access := []models.Access{}
		//models.DB.Preload("AccessItem").Where("module_id=0").Find(&access)
		models.DB.Preload("AccessItem", func(db *gorm.DB) *gorm.DB {
			return db.Order("access.sort DESC")
		}).Order("sort desc").Where("module_id=0").Find(&access)

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
		// 5:渲染数据到后台页面
			// 获取用户名
		this.Data["username"] = userinfo.Username
		this.Data["accessList"] = access
		this.Data["isSuper"] = userinfo.IsSuper
	}
	this.TplName = "admin/main/index.html"
}

func (this *MainController) Welcome() {
	this.TplName = "admin/main/welcome.html"
}

//异步修改公共状态(status)接口
func (this *MainController) ChangeStatus()  {
	// ?id=10&table=focus&field=status
	id,err1 := this.GetInt("id")
	if err1 != nil {
		this.Data["json"] = map[string]interface{}{
			"success":false,
			"msg":"非法请求",
		}
		this.ServeJSON()
		return
	}
	table := this.GetString("table")
	field := this.GetString("field")
	err2 := models.DB.Exec("update "+table+" set "+field+"=ABS("+field+"-1) where id=?",id).Error
	if err2 != nil {
		beego.Error("错误")
		this.Data["json"] = map[string]interface{}{
			"success":false,
			"msg":"更新数据失败",
		}
		this.ServeJSON()
		return
	}

	this.Data["json"] = map[string]interface{}{
		"success":true,
		"msg":"更新数据成功",
	}
	this.ServeJSON()
}

// 异步修改数量的公共方法
func (this *MainController) EditNum() {
	id := this.GetString("id")
	table := this.GetString("table")
	field := this.GetString("field")
	num := this.GetString("num")

	err := models.DB.Exec("update " + table + " set " + field + "=" + num + " where id=" + id).Error

	if err != nil {
		this.Data["json"] = map[string]interface{}{
			"success": false,
			"message": "修改数量失败",
		}
		this.ServeJSON()
	} else {
		this.Data["json"] = map[string]interface{}{
			"success": true,
			"message": "修改数量成功",
		}
		this.ServeJSON()
	}
}

func (this *MainController) NoPrivilege() {
	this.TplName = "admin/public/privilege.html"
}
