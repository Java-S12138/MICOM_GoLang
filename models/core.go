package models
import (
	"github.com/astaxie/beego"
	"github.com/jinzhu/gorm"
	_ "github.com/jinzhu/gorm/dialects/mysql"
)

var DB *gorm.DB
var err error

func init() {
	DB,err = gorm.Open("mysql", "root:123456@/micom?charset=utf8&parseTime=True&loc=Local")
	if err != nil {
		beego.Error(err)
	}
}
