package mindex

import (
	"mi.com/models"
)

type AddressController struct {
	BaseController
}

// 增加收货地址
func (this *AddressController) AddAddress() {
	/*
	   1、获取表单提交的数据

	   2、判断收货地址的数量

	   3、更新当前用户的所有收货地址的默认收货地址状态为0

	   4、增加当前收货地址，让默认收货地址状态是1

	   5、返回当前用户的所有收货地址返回

	*/
	// 1、获取表单提交的数据
	user := models.User{}
	models.Cookie.Get(this.Ctx, "userinfo", &user)

	name := this.GetString("name")
	phone := this.GetString("phone")
	address := this.GetString("address")
	zipcode := this.GetString("zipcode")

	// 2、判断收货地址的数量
	var addressCount int
	models.DB.Where("uid=?", user.Id).Table("address").Count(&addressCount)
	if addressCount > 10 {
		this.Data["json"] = map[string]interface{}{
			"success": false,
			"message": "增加收货地址失败 收货地址数量超过限制",
		}
		this.ServeJSON()
		return
	}

	// 3、更新当前用户的所有收货地址的默认收货地址状态为0
	models.DB.Table("address").Where("uid=?", user.Id).Updates(map[string]interface{}{"default_address": 0})

	// 4、增加当前收货地址，让默认收货地址状态是1

	addressResult := models.Address{
		Uid:            user.Id,
		Name:           name,
		Phone:          phone,
		Address:        address,
		Zipcode:        zipcode,
		DefaultAddress: 1,
	}
	models.DB.Create(&addressResult)

	// 5、返回当前用户的所有收货地址返回
	allAddressResult := []models.Address{}
	models.DB.Where("uid=?", user.Id).Find(&allAddressResult)

	this.Data["json"] = map[string]interface{}{
		"success": true,
		"result":  allAddressResult,
	}
	this.ServeJSON()

}

// 获取一个收货地址  返回指定收货地址id的收货地址
func (this *AddressController) GetOneAddressList() {

	addressId,err := this.GetInt("address_id")
	if err != nil {
		this.Data["json"] = map[string]interface{}{
			"success":false,
			"message":"传入参数错误",
		}
		this.ServeJSON()
		return
	}

	address := models.Address{}
	models.DB.Where("id=?",addressId).Find(&address)
	this.Data["json"] = map[string]interface{}{
		"success":true,
		"result":address,
	}
	this.ServeJSON()

}

// 编辑收货地址
func (this *AddressController) DoEditAddressList() {
	/*
	   1、获取表单增加的数据

	   2、更新当前用户的所有收货地址的默认收货地址状态为0

	   3、修改当前收货地址，让默认收货地址状态是1

	    4、查询当前用户的所有收货地址并返回

	*/
	user := models.User{}
	models.Cookie.Get(this.Ctx, "userinfo", &user)

	addressId, err := this.GetInt("address_id")
	if err != nil {
		this.Data["json"] = map[string]interface{}{
			"success": false,
			"message": "传入参数错误",
		}
		this.ServeJSON()
		return
	}
	name := this.GetString("name")
	phone := this.GetString("phone")
	address := this.GetString("address")
	zipcode := this.GetString("zipcode")

	// 2、更新当前用户的所有收货地址的默认收货地址状态为0
	models.DB.Table("address").Where("uid=?", user.Id).Updates(map[string]interface{}{"default_address": 0})
	// 3、修改当前收货地址，让默认收货地址状态是1
	addressModel := models.Address{}
	models.DB.Where("id=?", addressId).Find(&addressModel)
	addressModel.Name = name
	addressModel.Phone = phone
	addressModel.Address = address
	addressModel.Zipcode = zipcode
	addressModel.DefaultAddress = 1
	models.DB.Save(&addressModel)
	// 4、查询当前用户的所有收货地址并返回
	allAddressResult := []models.Address{}
	models.DB.Where("uid=?", user.Id).Order("default_address desc").Find(&allAddressResult)

	this.Data["json"] = map[string]interface{}{
		"success": true,
		"result":  allAddressResult,
	}
	this.ServeJSON()

}

// 修改默认的收货地址
func (this *AddressController) ChangeDefaultAddress() {
	/*
	   1、获取当前用户收货地址id 以及用户id
	   2、更新当前用户的所有收货地址的默认收货地址状态为0
	   3、更新当前收货地址的默认收货地址状态为1
	*/
	user := models.User{}
	models.Cookie.Get(this.Ctx, "userinfo", &user)
	addressId, err := this.GetInt("address_id")
	if err != nil {
		this.Data["json"] = map[string]interface{}{
			"success": false,
			"message": "传入参数错误",
		}
		this.ServeJSON()
		return
	}
	models.DB.Table("address").Where("uid=?", user.Id).Updates(map[string]interface{}{"default_address": 0})

	models.DB.Table("address").Where("id=?", addressId).Updates(map[string]interface{}{"default_address": 1})

	this.Data["json"] = map[string]interface{}{
		"success": true,
		"result":  "更新默认收货地址成功",
	}
	this.ServeJSON()

}

