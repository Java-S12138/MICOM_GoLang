package models

import (
	_ "github.com/jinzhu/gorm"
)

type GoodsCate struct {
	Id            int
	Title         string
	CateImg       string
	Link          string
	Template      string
	Pid           int
	SubTitle      string
	Keywords      string
	Description   string
	Sort          int
	Status        int
	AddTime       int
	GoodsCateItem []GoodsCate `gorm:"foreignkey:Pid;association_foreignkey:Id"`
}

func (GoodsCate) TableName() string {
	return "goods_cate"
}
