package mindex

import (
	"fmt"
	"github.com/astaxie/beego"
	"github.com/jinzhu/gorm"
	"mi.com/models"
	"net/url"
	"strings"
)

type BaseController struct {
	beego.Controller
}


func (this *BaseController) SuperInit()  {
	//获取顶部导航
	topNav := []models.Nav{}

	if hasTopNav := models.CacheDb.Get("topNav",&topNav); hasTopNav == true {
		this.Data["topNavList"] = topNav
	} else {
		models.DB.Where("status=1 AND position=1").Order("sort desc").Find(&topNav)
		this.Data["topNavList"] = topNav
		models.CacheDb.Set("topNav",topNav)
	}

	// 左侧分类
	goodsCate := []models.GoodsCate{}

	if hasGoodsCate := models.CacheDb.Get("goodsCate",&goodsCate); hasGoodsCate == true {
		this.Data["goodsCateList"] = goodsCate
	} else {
		models.DB.Preload("GoodsCateItem", func(db *gorm.DB) *gorm.DB {
			return db.Where("goods_cate.status=1").Order("goods_cate.sort DESC")
		}).Where("pid=0 AND status=1").Order("sort desc").Find(&goodsCate)
		this.Data["goodsCateList"] = goodsCate
		models.CacheDb.Set("goodsCate",goodsCate)
	}

	// 获取中间导航数据
	middleNav := []models.Nav{}
	if hasMiddleNav := models.CacheDb.Get("middleNav", &middleNav); hasMiddleNav == true {
		this.Data["middleNavList"] = middleNav
	} else {
		models.DB.Where("status=1 AND position=2").Order("sort desc").Find(&middleNav)

		for i := 0; i < len(middleNav); i++ {
			// 获取关联商品
			// middleNav[i].Relation  19,20,21
			middleNav[i].Relation = strings.ReplaceAll(middleNav[i].Relation, "，", ",")
			relation := strings.Split(middleNav[i].Relation, ",")
			goods := []models.Goods{}
			models.DB.Where("id in (?)", relation).Select("id,title,goods_img,price").Order("sort desc").Find(&goods)
			middleNav[i].GoodsItem = goods
			if len(goods) > 1 {
				middleNav[i].GoodsNil = "NO"
			}else {
				middleNav[i].GoodsNil = "YES"
			}
		}
		this.Data["middleNavList"] = middleNav

		models.CacheDb.Set("middleNav", middleNav)
	}

	// 判断用户是否登录
	user := models.User{}
	models.Cookie.Get(this.Ctx,"userinfo",&user)
	if len(user.Phone) ==11 {
		str := fmt.Sprintf(`<ul>
			<li class="userinfo">
				<a href="#">%v</a>		

				<i class="i"></i>
				<ol>
					<li><a href="/user">个人中心</a></li>

					<li><a href="#">喜欢</a></li>

					<li><a href="/pass/loginOut">退出登录</a></li>
				</ol>
			
			</li>
		</ul> `, user.Email)
		this.Data["userinfo"] = str

	}else {
		str := fmt.Sprintf(`<ul>
			<li><a href="/login/" target="_blank">登录</a></li>
			<li>|</li>
			<li><a href="/pass/" target="_blank" >注册</a></li>							
		</ul>`)
		this.Data["userinfo"] = str

	}
	ulrPath,_ := url.Parse(this.Ctx.Request.URL.String())
	this.Data["pathname"] = ulrPath.Path

}

func (this *BaseController) Success(message,redirect string) {
	this.Data["message"] = message
	this.Data["redirect"] = redirect
	this.TplName = "admin/public/success.html"
}
func (this *BaseController) Error(message,redirect string) {
	this.Data["message"] = message
	this.Data["redirect"] = redirect
	this.TplName = "admin/public/error.html"
}