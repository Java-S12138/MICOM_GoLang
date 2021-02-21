package mindex

import (
	"mi.com/models"
	"strconv"
)

type CartController struct {
	BaseController
}

func (this *CartController) Get() {
	this.SuperInit()
	cartList := []models.Cart{}
	models.Cookie.Get(this.Ctx, "cartList", &cartList)

	// 执行计算总价
	var allPrice float64
	for i := 0; i < len(cartList); i++ {
		if cartList[i].Checked {
			allPrice += cartList[i].Price * float64(cartList[i].Num)
		}
	}

	this.Data["cartList"] = cartList
	this.Data["allPrice"] = allPrice
	this.TplName = "mindex/cart/cart.html"

}

func (this *CartController) AddCart() {
	this.SuperInit()

	/*
	   购物车数据保持到哪里？：

	           1、购物车数据保存在本地    （cookie）

	           2、购物车数据保存到服务器(mysql)   （必须登录）

	           3、没有登录 购物车数据保存到本地 ， 登录成功后购物车数据保存到服务器  （用的最多）


	   增加购物车的实现逻辑：

	           1、获取增加购物车的数据  （把哪一个商品加入到购物车）

	           2、判断购物车有没有数据   （cookie）

	           3、如果购物车没有任何数据  直接把当前数据写入cookie

	           4、如果购物车有数据

	               4、1、判断购物车有没有当前数据

	                       有当前数据让当前数据的数量加1，然后写入到cookie

	                       如果没有当前数据直接写入cookie
	*/

	colorId, err1 := this.GetInt("color_id")
	goodsId, err2 := this.GetInt("goods_id")

	goods := models.Goods{}
	goodsColor := models.GoodsColor{}
	err3 := models.DB.Where("id=?", goodsId).Find(&goods).Error
	err4 := models.DB.Where("id=?", colorId).Find(&goodsColor).Error

	if err1 != nil || err2 != nil || err3 != nil || err4 != nil {

		this.Ctx.Redirect(302, "/item_"+strconv.Itoa(goods.Id)+".html")
		return
	}
	// 1、获取增加购物车的数据  （把哪一个商品加入到购物车）

	currentData := models.Cart{
		Id:           goodsId,
		Title:        goods.Title,
		Price:        goods.Price,
		GoodsVersion: goods.GoodsVersion,
		Num:          1,
		GoodsColor:   goodsColor.ColorName,
		GoodsImg:     goods.GoodsImg,
		GoodsGift:    goods.GoodsGift, /*赠品*/
		GoodsAttr:    "",              //根据自己的需求拓展
		Checked:      true,            /*默认选中*/
	}

	//  2、判断购物车有没有数据   （cookie）
	cartList := []models.Cart{}
	models.Cookie.Get(this.Ctx, "cartList", &cartList)
	if len(cartList) > 0 { //购物车有数据
		//4、判断购物车有没有当前数据
		if !models.CartHasData(cartList, currentData, true) {
			cartList = append(cartList, currentData)
		}
		models.Cookie.Set(this.Ctx, "cartList", cartList)

	} else {
		//3、如果购物车没有任何数据  直接把当前数据写入cookie
		cartList = append(cartList, currentData)
		models.Cookie.Set(this.Ctx, "cartList", cartList)
	}

	this.Data["goods"] = goods
	this.Data["GoodsColor"] = goodsColor.ColorName
	this.TplName = "mindex/cart/addcart_success.html"
}

func (this *CartController) DecCart() {
	var flag bool
	var allPrice float64
	var currentAllPrice float64
	var num int

	goodsId, _ := this.GetInt("goods_id")
	goodsColor := this.GetString("goods_color")
	cartList := []models.Cart{}
	models.Cookie.Get(this.Ctx, "cartList", &cartList)
	for i := 0; i < len(cartList); i++ {
		if cartList[i].Id == goodsId && cartList[i].GoodsColor == goodsColor {
			if cartList[i].Num > 1 {
				cartList[i].Num = cartList[i].Num - 1
			}
			flag = true
			num = cartList[i].Num
			currentAllPrice = cartList[i].Price * float64(cartList[i].Num)
		}
			if cartList[i].Checked {
				allPrice += cartList[i].Price * float64(cartList[i].Num)
			}
	}
	if flag {
		models.Cookie.Set(this.Ctx, "cartList", cartList)
		this.Data["json"] = map[string]interface{}{
			"success":         true,
			"message":         "修改数量成功",
			"allPrice":        allPrice,
			"currentAllPrice": currentAllPrice,
			"num":             num,
		}
	} else {
		this.Data["json"] = map[string]interface{}{
			"success": false,
			"message": "传入参数错误",
		}
	}
	this.ServeJSON()
}

func (this *CartController) IncCart() {
	var flag bool
	var allPrice float64
	var currentAllPrice float64
	var num int

	goodsId, _ := this.GetInt("goods_id")
	goodsColor := this.GetString("goods_color")
	cartList := []models.Cart{}
	models.Cookie.Get(this.Ctx, "cartList", &cartList)
	for i := 0; i < len(cartList); i++ {
		if cartList[i].Id == goodsId && cartList[i].GoodsColor == goodsColor {
			cartList[i].Num = cartList[i].Num + 1
			flag = true
			num = cartList[i].Num
			currentAllPrice = cartList[i].Price * float64(cartList[i].Num)
		}
		if cartList[i].Checked {
			allPrice += cartList[i].Price * float64(cartList[i].Num)
		}
	}
	if flag {
		models.Cookie.Set(this.Ctx, "cartList", cartList)
		this.Data["json"] = map[string]interface{}{
			"success":         true,
			"message":         "修改数量成功",
			"allPrice":        allPrice,
			"currentAllPrice": currentAllPrice,
			"num":             num,
		}
	} else {
		this.Data["json"] = map[string]interface{}{
			"success": false,
			"message": "传入参数错误",
		}
	}
	this.ServeJSON()
}

func (this *CartController) ChangeOneCart() {
	var flag bool
	var allPrice float64
	goodsId, _ := this.GetInt("goods_id")
	goodsColor := this.GetString("goods_color")
	goodsAttr := ""

	cartList := []models.Cart{}
	models.Cookie.Get(this.Ctx, "cartList", &cartList)

	for i := 0; i < len(cartList); i++ {
		if cartList[i].Id == goodsId && cartList[i].GoodsColor == goodsColor && cartList[i].GoodsAttr == goodsAttr {
			cartList[i].Checked = !cartList[i].Checked
			flag = true
		}
		if cartList[i].Checked {
			allPrice += cartList[i].Price * float64(cartList[i].Num)
		}
	}

	if flag {
		models.Cookie.Set(this.Ctx, "cartList", cartList)
		this.Data["json"] = map[string]interface{}{
			"success":  true,
			"message":  "修改状态成功",
			"allPrice": allPrice,
		}

	} else {
		this.Data["json"] = map[string]interface{}{
			"success": false,
			"message": "传入参数错误",
		}
	}
	this.ServeJSON()
}

//全选反选
func (this *CartController) ChangeAllCart() {
	flag, _ := this.GetInt("flag")
	var allPrice float64
	cartList := []models.Cart{}
	models.Cookie.Get(this.Ctx, "cartList", &cartList)
	for i := 0; i < len(cartList); i++ {
		if flag == 1 {
			cartList[i].Checked = true
		} else {
			cartList[i].Checked = false
		}
		//计算总价
		if cartList[i].Checked {
			allPrice += cartList[i].Price * float64(cartList[i].Num)
		}
	}
	models.Cookie.Set(this.Ctx, "cartList", cartList)

	this.Data["json"] = map[string]interface{}{
		"success":  true,
		"allPrice": allPrice,
	}
	this.ServeJSON()
}

func (this *CartController) DelCart() {

	goodsId, _ := this.GetInt("goods_id")
	goodsColor := this.GetString("goods_color")
	goodsAttr := ""

	cartList := []models.Cart{}
	models.Cookie.Get(this.Ctx, "cartList", &cartList)
	for i := 0; i < len(cartList); i++ {
		if cartList[i].Id == goodsId && cartList[i].GoodsColor == goodsColor && cartList[i].GoodsAttr == goodsAttr {
			//执行删除 切片再切片
			cartList = append(cartList[:i], cartList[(i+1):]...)
		}
	}
	models.Cookie.Set(this.Ctx, "cartList", cartList)

	this.Redirect("/cart", 302)

}