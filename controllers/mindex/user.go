package mindex

import (
	"math"
	"mi.com/models"
	"strconv"
	"strings"
)

type UserController struct {
	BaseController
}

func (this *UserController) Get() {
	this.SuperInit()

	user := models.User{}
	models.Cookie.Get(this.Ctx,"userinfo",&user)
	order := []models.Order{}
	models.DB.Where("uid=? And order_status=0", user.Id).Preload("OrderItem").Find(&order)
	this.Data["noPay"] = len(order)
	this.Data["user"] = user
	this.TplName = "mindex/user/welcome.html"
}

func (this *UserController) OrderList() {
	this.SuperInit()

	// 1:获取当前用户
	user := models.User{}
	models.Cookie.Get(this.Ctx, "userinfo", &user)

	// 2:获取当前用户下面的订单信息
	page, _ := this.GetInt("page")
	if page == 0 {
		page = 1
	}
	pageSize := 3

	// 3:获取关键词,搜索功能
	where := "uid=?"
	keywords := this.GetString("keywords")
	if keywords != "" {
		orderItem := []models.OrderItem{}
		models.DB.Where("product_title like ?", "%"+keywords+"%").Find(&orderItem)

		var str string
		for i := 0; i < len(orderItem); i++ {
			str += "," + strconv.Itoa(orderItem[i].OrderId)
		}
		str = strings.Trim(str, ",")
		where += " And id in (" + str + ")"
	}

	// 4:获取筛选条件
	orderStatus,stasusError := this.GetInt("order_status")
	if stasusError == nil {
		where += " And order_status="+strconv.Itoa(orderStatus)
		this.Data["orderStatus"] = orderStatus
	}else {
		this.Data["orderStatus"] = ""
	}


	var count int // 商品总数量
	models.DB.Where(where, user.Id).Table("order").Count(&count)

	order := []models.Order{}
	models.DB.Where(where, user.Id).Offset((page - 1) * pageSize).Limit(pageSize).Preload("OrderItem").Order("add_time desc").Find(&order)
	this.Data["order"] = order
	this.Data["page"] = page
	this.Data["totalPages"] = math.Ceil(float64(count) / float64(pageSize))
	this.Data["keywords"] = keywords

	this.TplName = "mindex/user/order.html"

}

func (this *UserController) OrderInfo() {
	this.SuperInit()
	id,_ := this.GetInt("id")
	user := models.User{}
	models.Cookie.Get(this.Ctx,"userinfo",&user)
	order := models.Order{}
	models.DB.Where("id=? And uid=?",id,user.Id).Preload("OrderItem").Find(&order)
	this.Data["order"] = order
	if order.OrderId =="" {
		this.Redirect("/",302)
	}
	this.TplName = "mindex/user/order_info.html"
}

func (this *UserController) DelOrder() {
	id,_ := this.GetInt("id")
	user := models.User{}
	models.Cookie.Get(this.Ctx,"userinfo",&user)
	order := models.Order{}
	models.DB.Where("id=? And uid=?",id,user.Id).Delete(&order)
	orderItem := models.OrderItem{}
	models.DB.Where("order_id=?",id).Delete(&orderItem)
	this.Success("删除订单成功", "/user/order")
}
