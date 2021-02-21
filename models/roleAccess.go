package models

import (
	_ "github.com/jinzhu/gorm"
)

type RoleAccess struct {
	AccessId int
	RoleId   int
}

func (RoleAccess) TableName() string {
	return "role_access"
}
