package models

import (
	_ "github.com/jinzhu/gorm"
)

type Access struct {
	Id          int
	ModuleName  string //模块名称
	ActionName  string //操作名称
	Type        int    //节点类型 :  1、表示模块    2、表示菜单     3、操作
	Url         string //路由跳转地址
	ModuleId    int    //此module_id和当前模型的_id关联      module_id= 0 表示模块
	Sort        int
	Description string
	Status      int
	AddTime     int
	AccessItem  []Access `gorm:"foreignkey:ModuleId;association_foreignkey:Id"`
	Checked     bool     `gorm:"-"` // 忽略本字段
}

func (Access) TableName() string {
	return "access"
}
