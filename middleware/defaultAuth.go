package middleware

import (
	"github.com/astaxie/beego/context"
	"mi.com/models"
)

func DefaultAuth(ctx *context.Context) {
	// 判断前端用户是否登录
	user := models.User{}
	models.Cookie.Get(ctx, "userinfo", &user)
	if len(user.Phone) != 11 {
		ctx.Redirect(302,"/login")
	}
}
