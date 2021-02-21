package models

type Cart struct {
	Id           int
	Title        string
	Price        float64
	GoodsVersion string
	Num          int
	GoodsGift    string
	GoodsFitting string
	GoodsColor   string
	GoodsImg     string
	GoodsAttr    string
	Checked      bool `gorm:"-"` // 忽略本字段
}

func (Cart) TableName() string {
	return "cart"
}

//判断购物车里面有没有当前数据
func CartHasData(cartList []Cart, currentData Cart,isPlus bool) bool {
	for i := 0; i < len(cartList); i++ {
		if cartList[i].Id == currentData.Id && cartList[i].GoodsColor == currentData.GoodsColor && cartList[i].GoodsAttr == currentData.GoodsAttr {
			if isPlus {
				cartList[i].Num = cartList[i].Num+1
				return true
			}
			return true
		}
	}
	return false
}
