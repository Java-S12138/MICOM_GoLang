package mindex

import (
	"math"
	"mi.com/models"
	"strconv"
	"strings"
)

type ProductController struct {
	BaseController
}

func (this *ProductController) CategoryList() {
	// 调用公共功能
	this.SuperInit()

	//分页
	page, _ := this.GetInt("page")
	if page == 0 {
		page = 1
	}
	//每一页显示的数量
	pageSize := 10

	// 获取id值
	id := this.Ctx.Input.Param(":id")
	cateId, _ := strconv.Atoi(id)
	curretGoodsCate := models.GoodsCate{}
	subGoodsCate := []models.GoodsCate{}
	models.DB.Where("id=?", cateId).Find(&curretGoodsCate)

	var tempSlice []int
	if curretGoodsCate.Pid == 0 { //顶级分类
		//二级分类
		models.DB.Where("pid=?", curretGoodsCate.Id).Find(&subGoodsCate)
		for i := 0; i < len(subGoodsCate); i++ {
			tempSlice = append(tempSlice, subGoodsCate[i].Id)
		}
	} else {
		//获取当前二级分类对应的兄弟分类
		models.DB.Where("pid=?", curretGoodsCate.Pid).Find(&subGoodsCate)
	}
	tempSlice = append(tempSlice, cateId)
	where := "cate_id in (?)"
	goods := []models.Goods{}
	models.DB.Where(where, tempSlice).Select("id,title,price,goods_img,sub_title").Offset((page - 1) * pageSize).Limit(pageSize).Order("sort desc").Find(&goods)
	//查询goods表里面的数量
	var count int
	models.DB.Where(where, tempSlice).Table("goods").Count(&count)

	// 获取关联商品


	this.Data["goodsList"] = goods
	this.Data["subGoodsCate"] = subGoodsCate
	this.Data["curretGoodsCate"] = curretGoodsCate
	this.Data["totalPages"] = math.Ceil(float64(count) / float64(pageSize))
	this.Data["page"] = page

	//指定分类模板
	tpl := curretGoodsCate.Template
	if tpl == "" {
		tpl = "mindex/product/list.html"
	}

	this.TplName = tpl
}

func (this *ProductController) ProductItem() {
	this.SuperInit()

	id := this.Ctx.Input.Param(":id")
	//1、获取商品信息
	goods := models.Goods{}
	models.DB.Where("id=?", id).Find(&goods)
	this.Data["goods"] = goods

	//2、获取关联商品  RelationGoods
	relationGoods := []models.Goods{}
	goods.RelationGoods = strings.ReplaceAll(goods.RelationGoods, "，", ",")
	relationIds := strings.Split(goods.RelationGoods, ",")
	models.DB.Where("id in (?)", relationIds).Select("id,title,price,goods_version").Find(&relationGoods)
	this.Data["relationGoods"] = relationGoods

	//3、获取关联赠品 GoodsGift
	goodsGift := []models.Goods{}
	goods.GoodsGift = strings.ReplaceAll(goods.GoodsGift, "，", ",")
	giftIds := strings.Split(goods.GoodsGift, ",")
	models.DB.Where("id in (?)", giftIds).Select("id,title,price,goods_img").Find(&goodsGift)
	this.Data["goodsGift"] = goodsGift

	//4、获取关联颜色 GoodsColor
	goodsColor := []models.GoodsColor{}
	goods.GoodsColor = strings.ReplaceAll(goods.GoodsColor, "，", ",")
	colorIds := strings.Split(goods.GoodsColor, ",")
	models.DB.Where("id in (?)", colorIds).Find(&goodsColor)
	this.Data["goodsColor"] = goodsColor

	//5、获取关联配件 GoodsFitting
	goodsFitting := []models.Goods{}
	goods.GoodsFitting = strings.ReplaceAll(goods.GoodsFitting, "，", ",")
	fittingIds := strings.Split(goods.GoodsFitting, ",")
	models.DB.Where("id in (?)", fittingIds).Select("id,title,price,goods_img").Find(&goodsFitting)
	this.Data["goodsFitting"] = goodsFitting

	//6、获取商品关联的图片 GoodsImage
	goodsImage := []models.GoodsImage{}
	models.DB.Where("goods_id=?", goods.Id).Find(&goodsImage)
	this.Data["goodsImage"] = goodsImage

	//7、获取规格参数信息 GoodsAttr
	goodsAttr := []models.GoodsAttr{}
	models.DB.Where("goods_id=?", goods.Id).Find(&goodsAttr)
	this.Data["goodsAttr"] = goodsAttr

	//8、获取商品其他规格参数
	//var goodsItemAttr []models.GoodsItemAttr
	//goodsAttrStr := "颜色:红色,白色,黄色|尺寸:41,42,43|套餐:套餐1,套餐2"
	//goodsAttrStr = strings.ReplaceAll(goodsAttrStr, "：", ":")
	//goodsAttrStr = strings.ReplaceAll(goodsAttrStr, "，", ",")
	//
	//if strings.Contains(goodsAttrStr, ":") {
	//	goodsAttrSlice := strings.Split(goodsAttrStr, "|")
	//	//分配存储空间
	//	goodsItemAttr = make([]models.GoodsItemAttr, len(goodsAttrSlice))
	//	for i := 0; i < len(goodsAttrSlice); i++ {
	//		tempSlice := strings.Split(goodsAttrSlice[i], ":")
	//		//分类
	//		goodsItemAttr[i].Cate = tempSlice[0]
	//		//列表
	//		listSlice := strings.Split(tempSlice[1], ",")
	//		// goodsItemAttr[i].List = append(goodsItemAttr[i].List, listSlice...)
	//		goodsItemAttr[i].List = listSlice
	//
	//	}
	//}
	//this.Data["json"] = goodsItemAttr

	this.TplName = "mindex/product/item.html"
}

func (this *ProductController) GetImgList() {
	goods_id,err1 := this.GetInt("goods_id")
	goods_color,err2 := this.GetInt("color_id")

	// 查询商品图库信息
	goodsImage := []models.GoodsImage{}
	err3 := models.DB.Where("color_id=? AND goods_id=?",goods_color,goods_id).Find(&goodsImage).Error
	if err1 != nil || err2 != nil || err3 != nil{
		this.Data["json"] = map[string]interface{}{
			"result":"失败",
			"success":false,
		}
		this.ServeJSON()
	}else {
		this.Data["json"] = map[string]interface{}{
			"result":goodsImage,
			"success":true,
		}
		this.ServeJSON()
	}
}
