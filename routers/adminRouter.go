package routers

import (
	"github.com/astaxie/beego"
	"mi.com/controllers/admin"
	"mi.com/middleware"
)

func init() {
	adminPath := beego.AppConfig.String("adminPath")
    ns :=
    	beego.NewNamespace("/"+adminPath,
    		beego.NSBefore(middleware.AdminAuth),
    		// 后台管理
			beego.NSRouter("/",&admin.MainController{}),
			beego.NSRouter("/welcome",&admin.MainController{},"get:Welcome"),
			beego.NSRouter("/main/changeStatus",&admin.MainController{},"get:ChangeStatus"),
			beego.NSRouter("/main/editNum",&admin.MainController{},"get:EditNum"),
    		beego.NSRouter("/login",&admin.LoginController{}),
    		beego.NSRouter("/login/doLogin",&admin.LoginController{},"post:Dologin"),
    		beego.NSRouter("/login/loginOut",&admin.LoginController{},"get:LoginOut"),
    		beego.NSRouter("/focus",&admin.FocusController{}),
			beego.NSRouter("/privilege",&admin.MainController{},"get:NoPrivilege"),

			// 角色管理
			beego.NSRouter("/role",&admin.RoleController{}),
			beego.NSRouter("/role/add",&admin.RoleController{},"get:Add"),
			beego.NSRouter("/role/edit",&admin.RoleController{},"get:Edit"),
			beego.NSRouter("/role/doAdd",&admin.RoleController{},"post:DoAdd"),
			beego.NSRouter("/role/doEdit",&admin.RoleController{},"post:DoEdit"),
			beego.NSRouter("/role/delete",&admin.RoleController{},"get:Delete"),
			beego.NSRouter("/role/auth",&admin.RoleController{},"get:Auth"),
			beego.NSRouter("/role/doAuth",&admin.RoleController{},"post:DoAuth"),

			// 管理员管理
			beego.NSRouter("/manager",&admin.ManagerController{}),
			beego.NSRouter("/manager/add",&admin.ManagerController{},"get:Add"),
			beego.NSRouter("/manager/doAdd",&admin.ManagerController{},"post:DoAdd"),
			beego.NSRouter("/manager/edit",&admin.ManagerController{},"get:Edit"),
			beego.NSRouter("/manager/doEdit",&admin.ManagerController{},"post:DoEdit"),
			beego.NSRouter("/manager/delete",&admin.ManagerController{},"get:Delete"),

			// 权限管理
			beego.NSRouter("/access",&admin.AccessController{}),
			beego.NSRouter("/access/add",&admin.AccessController{},"get:Add"),
			beego.NSRouter("/access/doAdd",&admin.AccessController{},"post:DoAdd"),
			beego.NSRouter("/access/edit",&admin.AccessController{},"get:Edit"),
			beego.NSRouter("/access/doEdit",&admin.AccessController{},"post:DoEdit"),
			beego.NSRouter("/access/delete",&admin.AccessController{},"get:Delete"),

			// 轮播图管理
			beego.NSRouter("/focus",&admin.FocusController{}),
			beego.NSRouter("/focus/add",&admin.FocusController{},"get:Add"),
			beego.NSRouter("/focus/doAdd",&admin.FocusController{},"post:DoAdd"),
			beego.NSRouter("/focus/edit",&admin.FocusController{},"get:Edit"),
			beego.NSRouter("/focus/doEdit",&admin.FocusController{},"post:DoEdit"),
			beego.NSRouter("/focus/delete",&admin.FocusController{},"get:Delete"),

			// 商品分类管理
			beego.NSRouter("/goodsCate",&admin.GoodsCateController{}),
			beego.NSRouter("/goodsCate/add",&admin.GoodsCateController{},"get:Add"),
			beego.NSRouter("/goodsCate/doAdd",&admin.GoodsCateController{},"post:DoAdd"),
			beego.NSRouter("/goodsCate/edit",&admin.GoodsCateController{},"get:Edit"),
			beego.NSRouter("/goodsCate/doEdit",&admin.GoodsCateController{},"post:DoEdit"),
			beego.NSRouter("/goodsCate/delete",&admin.GoodsCateController{},"get:Delete"),

			// 商品类型管理
			beego.NSRouter("/goodsType",&admin.GoodsTypeController{}),
			beego.NSRouter("/goodsType/add",&admin.GoodsTypeController{},"get:Add"),
			beego.NSRouter("/goodsType/doAdd",&admin.GoodsTypeController{},"post:DoAdd"),
			beego.NSRouter("/goodsType/edit",&admin.GoodsTypeController{},"get:Edit"),
			beego.NSRouter("/goodsType/doEdit",&admin.GoodsTypeController{},"post:DoEdit"),
			beego.NSRouter("/goodsType/delete",&admin.GoodsTypeController{},"get:Delete"),

			// 商品类型属性管理
			beego.NSRouter("/goodsTypeAttribute",&admin.GoodsTypeAttrController{}),
			beego.NSRouter("/goodsTypeAttribute/add",&admin.GoodsTypeAttrController{},"get:Add"),
			beego.NSRouter("/goodsTypeAttribute/doAdd",&admin.GoodsTypeAttrController{},"post:DoAdd"),
			beego.NSRouter("/goodsTypeAttribute/edit",&admin.GoodsTypeAttrController{},"get:Edit"),
			beego.NSRouter("/goodsTypeAttribute/doEdit",&admin.GoodsTypeAttrController{},"post:DoEdit"),
			beego.NSRouter("/goodsTypeAttribute/delete",&admin.GoodsTypeAttrController{},"get:Delete"),

			// 商品管理
			beego.NSRouter("/goods",&admin.GoodsController{}),
			beego.NSRouter("/goods/add",&admin.GoodsController{},"get:Add"),
			beego.NSRouter("/goods/doAdd",&admin.GoodsController{},"post:DoAdd"),
			beego.NSRouter("/goods/edit",&admin.GoodsController{},"get:Edit"),
			beego.NSRouter("/goods/doEdit",&admin.GoodsController{},"post:DoEdit"),
			beego.NSRouter("/goods/delete",&admin.GoodsController{},"get:Delete"),
			beego.NSRouter("/goods/doUpload",&admin.GoodsController{},"post:DoUpload"),
			beego.NSRouter("/goods/doUploadPhoto",&admin.GoodsController{},"post:DoUploadPhoto"),
			beego.NSRouter("/goods/getGoodsTypeAttribute",&admin.GoodsController{},"get:GetGoodsTypeAttribute"),
			beego.NSRouter("/goods/changeGoodsImageColor",&admin.GoodsController{},"get:ChangeGoodsImageColor"),
			beego.NSRouter("/goods/removeGoodsImage",&admin.GoodsController{},"get:RemoveGoodsImage"),

			//导航管理
			beego.NSRouter("/nav", &admin.NavController{}),
			beego.NSRouter("/nav/add", &admin.NavController{}, "get:Add"),
			beego.NSRouter("/nav/edit", &admin.NavController{}, "get:Edit"),
			beego.NSRouter("/nav/doAdd", &admin.NavController{}, "post:DoAdd"),
			beego.NSRouter("/nav/doEdit", &admin.NavController{}, "post:DoEdit"),
			beego.NSRouter("/nav/delete", &admin.NavController{}, "get:Delete"),

			//系统设置
			beego.NSRouter("/setting", &admin.SettingController{}),
			beego.NSRouter("/setting/doEdit", &admin.SettingController{}, `post:DoEdit`),

		)
    beego.AddNamespace(ns)


}
