package models

import (
	"github.com/astaxie/beego/cache"
	"github.com/astaxie/beego/utils/captcha"
)

var Cpt *captcha.Captcha
// verify生成验证码
func init()  {
	store := cache.NewMemoryCache()
	Cpt = captcha.NewWithFilter("/captcha/",store)
	Cpt.ChallengeNums = 4
	Cpt.StdHeight = 41
	Cpt.StdWidth = 250
}