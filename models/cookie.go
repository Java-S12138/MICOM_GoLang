package models

import (
	"encoding/json"

	"github.com/astaxie/beego/context"
)

//定义结构体  缓存结构体 私有
type cookie struct{}

//写入数据的方法
func (c cookie) Set(ctx *context.Context, key string, value interface{}) {
	bytes, _ := json.Marshal(value)
	ctx.SetSecureCookie("micom", key, string(bytes), 3600*24*30)

}

//获取数据的方法
func (c cookie) Get(ctx *context.Context, key string, obj interface{}) bool {
	tempData, ok := ctx.GetSecureCookie("micom", key)
	if !ok {
		return false
	}
	json.Unmarshal([]byte(tempData), obj)
	return true

}

//删除指定Cookie
func (c cookie) Remove(ctx *context.Context, key string, value interface{}) {
	bytes, _ := json.Marshal(value)
	ctx.SetSecureCookie("micom", key, string(bytes), -1)
}

//实例化结构体
var Cookie = &cookie{}
