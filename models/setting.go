package models

import (
	_ "github.com/jinzhu/gorm"
)

type Setting struct {
	Id              int    `form:"id"`
	SiteTitle       string `form:"site_title"`
	SiteLogo        string `form:"site_logo"`
	SiteKeywords    string `form:"site_keywords"`
	SiteDescription string `form:"site_description"`
	NoPicture       string `form:"no_picture"`
	SiteIcp         string `form:"site_icp"`
	SiteTel         string `form:"site_tel"`
	SearchKeywords  string `form:"search_keywords"`
	TongjiCode      string `form:"tongji_code"`
	Appid           string `form:"appid"`
	AppSecret       string `form:"app_secret"`
	EndPoint        string `form:"end_point"`
	BucketName      string `form:"bucket_name"`
	OssStatus       int    `form:"oss_status"`
}

func (Setting) TableName() string {
	return "setting"
}

