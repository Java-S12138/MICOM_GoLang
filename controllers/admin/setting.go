package admin

import (
	"mi.com/models"
)

type SettingController struct {
	BaseController
}

func (this *SettingController) Get() {
	setting := models.Setting{}
	models.DB.First(&setting)
	this.Data["setting"] = setting
	this.TplName = "admin/setting/index.html"
}

func (this *SettingController) DoEdit() {
	//1、获取数据库里面的数据
	setting := models.Setting{}
	models.DB.Find(&setting)
	//2、修改数据
	this.ParseForm(&setting)
	//上传图片 site_logo
	siteLogo, err1 := this.UploadImg("site_logo")
	if len(siteLogo) > 0 && err1 == nil {
		setting.SiteLogo = siteLogo
	}
	//上传图片no_picture
	noPicture, err2 := this.UploadImg("no_picture")
	if len(noPicture) > 0 && err2 == nil {
		setting.NoPicture = noPicture
	}
	//执行保存数据
	err3 := models.DB.Where("id=1").Save(&setting).Error
	if err3 != nil {
		this.Error("修改数据失败", "/setting")
		return
	}
	this.Success("修改数据成功", "/setting")

}

