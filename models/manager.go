package models

import (
	_ "github.com/jinzhu/gorm"
)

type Manager struct {
	Id       int
	Username string
	Password string
	Mobile   string
	Email    string
	Status   int
	RoleId   int
	AddTime  int
	IsSuper  int
	Role     Role `gorm:"foreignkey:Id;association_foreignkey:RoleId"`
}

func (Manager) TableName() string {
	return "manager"
}
