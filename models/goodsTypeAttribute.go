package models

import (
	_ "github.com/jinzhu/gorm"
)

type GoodsTypeAttribute struct {
	Id        int    `json:"id"`
	CateId    int    `json:"cate_id"`
	Title     string `json:"title"`
	AttrType  int    `json:"attr_type"`
	AttrValue string `json:"attr_value"`
	Status    int    `json:"status"`
	Sort      int    `json:"sort"`
	AddTime   int    `json:"add_time"`
}

func (GoodsTypeAttribute) TableName() string {
	return "goods_type_attribute"
}
