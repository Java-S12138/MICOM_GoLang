package models

import (
	_ "github.com/jinzhu/gorm"
)

type Goods struct {
	Id            int
	Title         string
	SubTitle      string
	GoodsSn       string
	CateId        int
	ClickCount    int
	GoodsNumber   int
	Price         float64
	MarketPrice   float64
	RelationGoods string
	GoodsAttr     string
	GoodsVersion  string
	GoodsImg      string
	GoodsGift     string
	GoodsFitting  string
	GoodsColor    string
	GoodsKeywords string
	GoodsDesc     string
	GoodsContent  string
	IsDelete      int
	IsHot         int
	IsBest        int
	IsNew         int
	GoodsTypeId   int
	Sort          int
	Status        int
	AddTime       int
}

func (Goods) TableName() string {
	return "goods"
}

/*
	根据商品分类获取推荐商品
	@param {Number} cateId - 分类id
	@param {String} goodsType - hot best new
	@param {Number} limitNum - 数量
*/
func GetGoodsByCategory(cateId int, goodsType string, limitNum int) []Goods {
	goods := []Goods{}

	// 判断cateId是不是顶级分类
	goodsCate := []GoodsCate{}
	DB.Where("pid=?",cateId).Find(&goodsCate)
	var tempSlice []int
	if len(goodsCate) >0 {
		for i := 0; i <len(goodsCate) ; i++ {
			tempSlice = append(tempSlice, goodsCate[i].Id)
		}
	}
	tempSlice = append(tempSlice,cateId)
	where := "cate_id in (?)"
	switch goodsType {
	case "hot":
		where += " AND is_hot=1"
	case "best":
		where += " AND is_best=1"
	case "new":
		where += " AND is_new=1"
	default:
		break
	}

	DB.Where(where, tempSlice).Select("id,title,price,market_price,goods_img,sub_title").Limit(limitNum).Order("sort desc").Find(&goods)
	return goods
}
