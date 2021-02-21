package models

import (
	_ "github.com/jinzhu/gorm"
)

type GoodsType struct {
	Id          int
	Title       string
	Description string
	Status      int
	AddTime     int
}

func (GoodsType) TableName() string {
	return "goods_type"
}
