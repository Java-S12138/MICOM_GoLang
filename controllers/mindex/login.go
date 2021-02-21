package mindex

import (
	"gopkg.in/gomail.v2"
	"mi.com/models"
	"strconv"
	"strings"
)

type LoginController struct {
	BaseController
}

func (this *LoginController) Get() {
	this.Data["prevpage"] = this.Ctx.Request.Referer()

	this.TplName = "mindex/index/login.html"
}

func (this *LoginController) Pass() {
	this.TplName = "mindex/index/pass.html"
}

func (this *LoginController) Login() {
	// 登录成功后返回上一页
	prevpage := this.GetString("prevpage")
	if prevpage == "" || strings.Contains(prevpage,"verify") {
		prevpage = "/"
	}
	// 1:获取用户登录信息
	email := this.GetString("email")
	passwd := models.Md5(this.GetString("passwd")+"micom")
	// 2:通过email在数据中查询数据
	user := []models.User{}
	models.DB.Where("email=?",email).Find(&user)
	// 3:如果User的结构体切片长度大于的0的话,表示用户存在
	if len(user) >0 {
		// 4:当前如果用户存在,就继续判断用户是否通过验证,即验证status字段是否为1
		if user[0].Status ==1 {
			// 5:当用户通过验证时,判断密码是否正确
			if user[0].Password == passwd {
				// 6:密码输入正确,就将用户信息写入到cookie当中保存起来,并跳转到首页
				models.Cookie.Set(this.Ctx,"userinfo",user[0])
				this.Redirect(prevpage,302)
			// 5.1:当密码输入错误时,首先会弹出提示页面,接着会跳转到登录页面
			}else {
				this.Error("密码错误,请重新输入", "/login")
			}
		// 4.1:如果不等于1即表示用户未激活,会跳转到注册页面
		}else {
			this.Error("账号未激活,请登录邮箱激活", "/pass")
		}
	// 3.1:如果不等于0即表示,用户不存在,会跳转到注册页面
	}else {
		this.Error("账号不存在,请先注册", "/pass")
	}
}

func (this *LoginController) LoginOut(){
	models.Cookie.Remove(this.Ctx,"userinfo","")
	this.Redirect("/",302)
}

func (this *LoginController) SetPass() {
	// 1:获取前台的信息
	phone := this.GetString("phone")
	email := this.GetString("email")
	passwd := this.GetString("passwd")

	// 2: 判断输入的验证码是否正确
	flag := models.Cpt.VerifyReq(this.Ctx.Request)
	if flag {
		// 3:验证码输入正确后,首先会在数据库中查询是否存在此用户
		userVarify := []models.User{}
		models.DB.Where("email=? AND phone=?",email,phone).Find(&userVarify)
		// 3.1:如果当前注册的用户存在,会弹出提示界面,并直接跳转到登录页面
		if len(userVarify) > 0 {
			this.Error("用户存在请直接登录","/login")
			return
		// 4:如果不存在,会将前台获取到的数据保存到数据中,并设置status为0
		}else {
			userDb := models.User{
				Phone: phone,
				Email: email,
				Password: models.Md5(passwd+"micom"),
				AddTime: int(models.GetUnix()),
				Status: 0,
				LastIp: strings.Split(this.Ctx.Request.RemoteAddr,":")[0],
			}
			models.DB.Create(&userDb)

			// 5:定义验证url
			verifyUrl := "部署上线的域名地址/pass/verifyUrl?verify="+models.Md5(passwd+"micom")+"&email="+email
			//邮件主题为"小米商城GoLang注册验证"
			subject := "小米商城GoLang注册验证"
			// 6:定义邮件正文
			body := `<table width="100%"style="background-color: rgb(31,200,153);  border-radius: 45px"bgcolor="#1FC899"><tbody><tr><td width="100%"valign="top"align="center"style="border: 0px none transparent; background-color: rgb(31,200,153); color: rgb(56, 56, 56);border-radius: 45px"bgcolor="#1fc899"><div><table width="600"border="0"cellpadding="0"cellspacing="0"><tr><td><table width="100%"cellspacing="0"cellpadding="0"border="0"><tbody><tr><td style="padding: 20px; border-collapse: collapse; display: block"align="center"><img src="https://syjun.vip/image/Logo.png"style="max-width: 140px; display: block;"width="140px"></td><td style="padding: 20px; border-collapse: collapse; display: block"align="center"><strong style="font-weight: 200;font-size: 48px; font-family: Impact, Chicago; color: #ffffff; line-height: 125%;">小米商城GoLang注册验证</strong></td><td style=" margin-bottom: 10px; border-collapse: collapse; display: block"align="center"><span style="font-size: 24px; font-family: Tahoma, Arial, Helvetica, sans-serif; color: #ffffff; line-height: 150%;">点击下方链接即可完成验证</span></td><td style="margin-bottom: 10px; border-collapse: collapse; display: block"align="center"><span style="font-size: 24px; font-family: Tahoma, Arial, Helvetica, sans-serif; color: #ffffff; line-height: 150%;"></span></td><td style="margin-bottom: 50px; border-collapse: collapse; display: block"align="center"><a href="`+verifyUrl+`"style="list-style: none"><span style="font-size: 24px; font-family: Tahoma, Arial, Helvetica, sans-serif; color: #ffffff; line-height: 150%;">戳我戳我</span></a></td><td style="margin-bottom: 10px; border-collapse: collapse; display: block"align="center"><img src="https://syjun.vip/usr/uploads/2021/01/525314553.png"class="mobile-img-large"width="560"style="max-width: 1120px; display: block; width: 560px;"alt=""border="0"></td></tr></tbody></table></td></tr></table></div></td></tr></tbody></table>`
			// 7:发送给用户注册邮件
			err := SendMail(email, subject, body)
			if err != nil {
				this.Error("验证码发送失败","/pass")
			}else {
				this.TplName = "admin/public/email.html"
			}

		}
	// 2.1:验证码如果输入错误,重新加载注册页面
	} else {
		this.Error("验证码输入错误", "/pass")
	}
}

func (this *LoginController) VerifyUrl()  {
	// 1:通过url获取注册信息
	email := this.GetString("email")
	verify := this.GetString("verify")
	if email == "" || verify =="" {
		this.Error("验证失败,注册信息为空","部署上线的域名地址/pass")
	}
	// 2:通过邮箱在数据库找到对应的数据
	user := []models.User{}
	models.DB.Where("email=?",email).Find(&user)
	if len(user) == 0 {
		this.Error("验证失败,注册信息为空","部署上线的域名地址/pass")
		return
	}
	// 3:如果verify与数据库保存的密码一样
	//   那么就表示验证成功,并将数据表中的status字段设置为1,表示注册成功
	if user[0].Password== verify {
		user[0].Status = 1
		models.DB.Save(&user[0])
		// 4:验证成功后,会直接跳转到登录页面,即可进行登录
		this.Success("验证成功,即将跳转登录界面","部署上线的域名地址/login")
	}else {
		// 5:如果验证失败,会删除数据库中的数据,并且重新跳转到注册页面
		models.DB.Delete(&user)
		this.Error("验证失败,请重新注册","部署上线的域名地址/pass")
	}
}

func SendMail(mailTo string,subject string, body string ) error {
	//定义邮箱服务器连接信息，如果是阿里邮箱 pass填密码，qq邮箱填授权码
	mailConn := map[string]string {
		"user": "",
		"pass": "",  
		"host": "",
		"port": "",
	}

	port, _ := strconv.Atoi(mailConn["port"]) //转换端口类型为int

	m := gomail.NewMessage()
	m.SetHeader("From","GoLang" + "<" + mailConn["user"] + ">")  //这种方式可以添加别名，即“XD Game”， 也可以直接用<code>m.SetHeader("From",mailConn["user"])</code> 读者可以自行实验下效果
	m.SetHeader("To", mailTo)  //发送给用户
	m.SetHeader("Subject", subject)  //设置邮件主题
	m.SetBody("text/html", body)     //设置邮件正文

	d := gomail.NewDialer(mailConn["host"], port, mailConn["user"], mailConn["pass"])

	err := d.DialAndSend(m)
	return err

}