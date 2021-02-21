package admin

import (
	"mi.com/models"
	"strings"
)


type LoginController struct {
	BaseController
}

func (this *LoginController) Get() {
	this.TplName="admin/login.html"
}

func (this *LoginController) Dologin() {
		// 1:验证用户输入的验证码是否正确
	flag := models.Cpt.VerifyReq(this.Ctx.Request)
	if flag {
		// 2:获取表单传过来的用户名和密码
		username := strings.Trim(this.GetString("username"),"")
		password := models.Md5(strings.Trim(this.GetString("password"),""))
		// 3:根据表单里面的内容与数据库中的数据进行比较
		manager := []models.Manager{}
		// 条件查询,如果存在返回给manager数据
		models.DB.Where("username=? AND password=?",username,password).Find(&manager)
		if len(manager)>0 {
			if manager[0].Status != 0 {
				// 登录成功
					// 1:保存用户信息
				this.SetSession("userinfo",manager[0])
					// 2:跳转到后台首页
				this.Ctx.Redirect(302,"/admin/")
			}else {
				this.Error("你已被移除管理员身份","/login")
			}

		}else {
			this.Error("账号或密码输入错误","/login")
		}

	}else {
		this.Error("验证码输入错误","/login")
	}
}
func (this *LoginController) LoginOut()  {
	this.DelSession("userinfo")
	this.Success("退出登录成功","/login")
}


