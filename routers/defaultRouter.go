package routers

import (
	"mi.com/controllers/mindex"
	"github.com/astaxie/beego"
	"mi.com/middleware"
)

func init() {
    beego.Router("/", &mindex.IndexController{})
	beego.Router("/login", &mindex.LoginController{})
	beego.Router("/pass", &mindex.LoginController{},"get:Pass")
	beego.Router("/pass/login", &mindex.LoginController{},"post:Login")
	beego.Router("/pass/loginOut", &mindex.LoginController{},"get:LoginOut")
	beego.Router("/pass/setpass", &mindex.LoginController{},"post:SetPass")
	beego.Router("/pass/verifyUrl", &mindex.LoginController{},"get:VerifyUrl")
	beego.Router("/category_:id([0-9]+).html", &mindex.ProductController{},"get:CategoryList")
	beego.Router("/item_:id([0-9]+).html", &mindex.ProductController{},"get:ProductItem")
	beego.Router("/product/getImgList", &mindex.ProductController{},"get:GetImgList")
	beego.Router("/cart", &mindex.CartController{})
	beego.Router("/cart/addCart", &mindex.CartController{}, "get:AddCart")
	beego.Router("/cart/decCart", &mindex.CartController{}, "get:DecCart")
	beego.Router("/cart/incCart", &mindex.CartController{}, "get:IncCart")
	beego.Router("/cart/changeOneCart", &mindex.CartController{}, "get:ChangeOneCart")
	beego.Router("/cart/changeAllCart", &mindex.CartController{}, "get:ChangeAllCart")
	beego.Router("/cart/delCart", &mindex.CartController{}, "get:DelCart")

    // 配置中间件判断权限
    beego.InsertFilter("/buy/*",beego.BeforeRouter,middleware.DefaultAuth)
	beego.Router("/buy/checkout", &mindex.BuyController{}, "get:CheckOut")
	beego.Router("/buy/doOrder", &mindex.BuyController{}, "post:DoOrder")
	beego.Router("/buy/confirm", &mindex.BuyController{}, "get:Confirm")

	beego.InsertFilter("/address/*",beego.BeforeRouter,middleware.DefaultAuth)
	beego.Router("/address/addAddress", &mindex.AddressController{}, "post:AddAddress")
	beego.Router("/address/getOneAddressList", &mindex.AddressController{}, "get:GetOneAddressList")
	beego.Router("/address/doEditAddressList", &mindex.AddressController{}, "post:DoEditAddressList")
	beego.Router("/address/changeDefaultAddress", &mindex.AddressController{}, "get:ChangeDefaultAddress")

	beego.InsertFilter("/user/*",beego.BeforeRouter,middleware.DefaultAuth)
    beego.Router("/user", &mindex.UserController{})
    beego.Router("/user/order", &mindex.UserController{},"get:OrderList")
    beego.Router("/user/orderinfo", &mindex.UserController{},"get:OrderInfo")
    beego.Router("/user/delOrder", &mindex.UserController{},"get:DelOrder")
}
