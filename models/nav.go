package models

import (
	_ "github.com/jinzhu/gorm"
)

type Nav struct {
	Id        int
	Title     string
	Link      string
	Position  int
	IsOpennew int
	Relation  string
	Sort      int
	Status    int
	AddTime   int
	GoodsItem []Goods `gorm:"-"`
	GoodsNil  string  `gorm:"-"`
}

func (Nav) TableName() string {
	return "nav"
}
