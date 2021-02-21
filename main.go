package main

import (
	"encoding/gob"
	"github.com/astaxie/beego"
	_ "github.com/astaxie/beego/session/redis"
	"mi.com/models"
	_ "mi.com/routers"
)

func init()  {
	gob.Register(models.Manager{})
}

func main() {
	// 注册模板函数
	beego.AddFuncMap("unixToDate",models.UnixToDate)
	beego.AddFuncMap("formatImg",models.FormatImg)
	beego.AddFuncMap("formatAttr",models.FormatAttr)
	beego.AddFuncMap("cutStr",models.CutStr)
	beego.AddFuncMap("mul",models.Mul)
	beego.AddFuncMap("judge",models.Judge)

	// 配置session保存在redis里面
	beego.BConfig.WebConfig.Session.SessionProvider = "redis"
	beego.BConfig.WebConfig.Session.SessionProviderConfig = "127.0.0.1:6379"
	beego.Run()
	defer models.DB.Close()
}

