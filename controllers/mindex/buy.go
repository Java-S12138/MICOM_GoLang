package mindex

import (
	"mi.com/models"
	"strconv"
)

type BuyController struct {
	BaseController
}

func (this *BuyController) CheckOut() {
	// 调用公共的功能
	this.SuperInit()

	// 获取结算的商品
	cartList := []models.Cart{}
	orderList := []models.Cart{} // 需要结算的商品
	models.Cookie.Get(this.Ctx, "cartList", &cartList)
	var allPrice float64

	for i := 0; i < len(cartList); i++ {
		if cartList[i].Checked {
			allPrice += cartList[i].Price * float64(cartList[i].Num)
			orderList = append(orderList, cartList[i])
		}
	}
	// 判断去结算页面有没有要结算的商品
	if len(orderList) == 0 {
		this.Redirect("/", 302)
		return
	}

	this.Data["orderList"] = orderList
	this.Data["allPrice"] = allPrice

	// 获取收货地址
	user := models.User{}
	models.Cookie.Get(this.Ctx, "userinfo", &user)
	addressList := []models.Address{}
	models.DB.Where("uid=?", user.Id).Order("default_address desc").Find(&addressList)
	this.Data["addressList"] = addressList

	// 防止重复提交订单 生成签名
	orderSign := models.Md5(models.GetRandomNum())
	this.SetSession("orderSign", orderSign)
	this.Data["orderSign"] = orderSign
	this.TplName = "mindex/buy/checkout.html"

}

func (this *BuyController) DoOrder() {
	// 0: 防止重复订单
	orderSign := this.GetString("orderSign")
	sessionOrderSign := this.GetString("orderSign")
	if sessionOrderSign != orderSign {
		this.Redirect("/", 302)
		return
	}
	this.DelSession("orderSign")

	// 1:获取收获地址信息
	user := models.User{}
	models.Cookie.Get(this.Ctx, "userinfo", &user)
	addressResult := []models.Address{}
	models.DB.Where("uid=? AND default_address=1", user.Id).Find(&addressResult)
	if len(addressResult) == 0  {
		this.Error("您还没有填写地址,无法完成支付","/buy/checkout")
		return
	}
	
	// 2:获取购物商品的信息  orderList就是要购买的商品信息
	cartList := []models.Cart{}
	orderList := []models.Cart{}
	models.Cookie.Get(this.Ctx, "cartList", &cartList)
	var allPrice float64
	for i := 0; i < len(cartList); i++ {
		if cartList[i].Checked {
			allPrice += cartList[i].Price * float64(cartList[i].Num)
			orderList = append(orderList, cartList[i])
		}
	}

	// 3:把订单信息放在订单表中,把商品信息放在商品表中
	order := models.Order{
		OrderId:     models.GetOrderId(),
		Uid:         user.Id,
		AllPrice:    allPrice,
		Phone:       addressResult[0].Phone,
		Name:        addressResult[0].Name,
		Address:     addressResult[0].Address,
		Zipcode:     addressResult[0].Zipcode,
		PayStatus:   0,
		PayType:     0,
		OrderStatus: 0,
		AddTime:     int(models.GetUnix()),
	}
	err := models.DB.Create(&order).Error
	if err == nil {
		for i := 0; i < len(orderList); i++ {
			orderItem := models.OrderItem{
				OrderId:      order.Id,
				Uid:          user.Id,
				ProductTitle: orderList[i].Title,
				ProductId:    orderList[i].Id,
				ProductImg:   orderList[i].GoodsImg,
				ProductPrice: orderList[i].Price,
				ProductNum:   orderList[i].Num,
				GoodsVersion: orderList[i].GoodsVersion,
				GoodsColor:   orderList[i].GoodsColor,
			}
			models.DB.Create(&orderItem)
		}

	} else {
		// 非法请求
		this.Redirect("/buy/chackout", 302)
	}
	// 4、删除购物车里面的选中数据

	noSelectedCartList := []models.Cart{}
	for i := 0; i < len(cartList); i++ {
		if !cartList[i].Checked {
			noSelectedCartList = append(noSelectedCartList, cartList[i])
		}
	}
	models.Cookie.Set(this.Ctx, "cartList", noSelectedCartList)
	this.Redirect("/buy/confirm?id="+strconv.Itoa(order.Id), 302)

}

func (this *BuyController) Confirm() {
	this.SuperInit()
	id, err := this.GetInt("id")
	if err != nil {
		this.Redirect("/", 302)
		return
	}
	//获取用户信息
	user := models.User{}
	models.Cookie.Get(this.Ctx, "userinfo", &user)

	//获取主订单信息
	order := models.Order{}
	models.DB.Where("id=?", id).Find(&order)
	this.Data["order"] = order
	//判断当前数据是否合法
	if user.Id != order.Uid {
		this.Redirect("/", 302)
		return
	}

	//获取主订单下面的商品信息
	orderItem := []models.OrderItem{}
	models.DB.Where("order_id=?", id).Find(&orderItem)
	this.Data["orderItem"] = orderItem

	this.TplName = "mindex/buy/confirm.html"

}
