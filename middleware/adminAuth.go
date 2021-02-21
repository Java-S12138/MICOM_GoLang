package middleware

import (
	"mi.com/models"
	"github.com/astaxie/beego"
	"github.com/astaxie/beego/context"
	"net/url"
	"strings"
)

func AdminAuth(ctx *context.Context)  {
	adminPath := beego.AppConfig.String("adminPath")
	userinfo,ok := ctx.Input.Session("userinfo").(models.Manager)
	pathname := ctx.Request.URL.String()
	// 判断进入后台的用户是否登录
	if !(ok&&userinfo.Username != "") { // 若没有登录重定向登录页面
		if pathname!= "/"+adminPath+"/login" && pathname!="/"+adminPath+"/login/doLogin" {
			ctx.Redirect(302, "/"+adminPath+"/login")
		}
	}else { // 若登录,判断此用户的权限是否可以访问相应的路由
		pathname = strings.Replace(pathname,"/"+adminPath,"",1)
		urlObj,_ := url.Parse(pathname)
		// 判断管理员是否是超级管理员
		if userinfo.IsSuper != 1 && !excludeAuthPath(urlObj.Path) {
			// 1:根据角色ID获取当前角色的权限列表,然后把权限ID放在一个map类型的对象里面
			roleId := userinfo.RoleId
			roleAccess := []models.RoleAccess{}
			models.DB.Where("role_id=?",roleId).Find(&roleAccess)
			roleAccessMap := make(map[int]int)
			for _, val := range roleAccess {
				roleAccessMap[val.AccessId] = val.AccessId
			}
			// 2:获取当前访问的url(row--->23-24),并获取对应的权限id
			access := models.Access{}
			models.DB.Where("url=?",urlObj.Path).Find(&access)
			// 3:判断当前用户访问的路由,是否在用户所拥有的权限列表中
			if _,ok := roleAccessMap[access.Id];!ok {
				//ctx.WriteString("请注意素质,你没有权限访问!")
				ctx.Redirect(302,"/admin/privilege")
				return
			}
		}
	}
}

func excludeAuthPath(urlPath string) bool  {
	excludeAuthPathSlice := strings.Split(beego.AppConfig.String("excludeAuthPath"),",")
	for _, val := range excludeAuthPathSlice {
		if val == urlPath {
			return true
		}
	}
	return false
}

