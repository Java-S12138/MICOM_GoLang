package admin

import (
	"errors"
	"github.com/aliyun/aliyun-oss-go-sdk/oss"
	"github.com/astaxie/beego"
	"mi.com/models"
	"os"
	"path"
	"strconv"
	"strings"
)

type BaseController struct {
	beego.Controller
}

func (this *BaseController) Success(message,redirect string) {
	this.Data["message"] = message
	if strings.Contains(redirect,"http"){
		this.Data["redirect"] = redirect
	}else {
		this.Data["redirect"] = "/"+ beego.AppConfig.String("adminPath") + redirect
	}
	this.TplName = "admin/public/success.html"
}
func (this *BaseController) Error(message,redirect string) {
	this.Data["message"] = message
	if strings.Contains(redirect,"http"){
		this.Data["redirect"] = redirect
	}else {
		this.Data["redirect"] = "/"+ beego.AppConfig.String("adminPath") + redirect
	}
	this.TplName = "admin/public/error.html"
}

func (this *BaseController) Goto(redirect string) {
	this.Redirect("/"+ beego.AppConfig.String("adminPath") + redirect,302)
}

func (this *BaseController) UploadImg(picName string) (string, error) {
	ossStatus,_:= beego.AppConfig.Bool("ossStatus")
	if  ossStatus== true {
		return this.OssUploadImg(picName)
	}else {
		return this.LoclUploadImg(picName)
	}
}

// 本地上传
func  (this *BaseController) LoclUploadImg(picName string) (string, error) {
	//1、获取上传的文件
	f, h, err := this.GetFile(picName)
	if err != nil {
		return "", err
	}
	//2、关闭文件流
	defer f.Close()
	//3、获取后缀名 判断类型是否正确  .jpg .png .gif .jpeg
	extName := path.Ext(h.Filename)

	allowExtMap := map[string]bool{
		".jpg":  true,
		".png":  true,
		".gif":  true,
		".jpeg": true,
	}

	if _, ok := allowExtMap[extName]; !ok {

		return "", errors.New("图片后缀名不合法")
	}
	//4、创建图片保存目录  static/upload/20210201
	day := models.GetDay()
	dir := "static/upload/" + day

	if err := os.MkdirAll(dir, 0666); err != nil {
		return "", err
	}
	//5、生成文件名称   144325235235.png
	fileUnixName := strconv.FormatInt(models.GetUnixNano(), 10)
	//static/upload/20200623/144325235235.png
	saveDir := path.Join(dir, fileUnixName+extName)
	//6、保存图片
	this.SaveToFile(picName, saveDir)

	return saveDir, nil
}

// Oss云存储
func  (this *BaseController) OssUploadImg(picName string) (string, error) {
	//0:获取系统信息
	setting := models.Setting{}
	models.DB.First(&setting)

	//1、获取上传的文件
	f, h, err := this.GetFile(picName)
	if err != nil {
		return "", err
	}
	//2、关闭文件流
	defer f.Close()
	//3、获取后缀名 判断类型是否正确  .jpg .png .gif .jpeg
	extName := path.Ext(h.Filename)

	allowExtMap := map[string]bool{
		".jpg":  true,
		".png":  true,
		".gif":  true,
		".jpeg": true,
	}

	if _, ok := allowExtMap[extName]; !ok {
		return "", errors.New("图片后缀名不合法")
	}

	// 把文件流上传到oss里面

	// 创建OSSClient实例
	client, err := oss.New(setting.EndPoint, setting.Appid, setting.AppSecret)
	if err != nil {
		return "", err
	}

	// 获取存储空间
	bucket, err := client.Bucket(setting.BucketName)
	if err != nil {
		return "", err
	}

	//创建图片保存目录
	day := models.GetDay()
	dir := "static/upload/" + day
	//生成文件名称   144325235235.png
	fileUnixName := strconv.FormatInt(models.GetUnixNano(), 10)
	//static/upload/20200623/144325235235.png
	saveDir := path.Join(dir, fileUnixName+extName)

	// 上传文件流
	err = bucket.PutObject(saveDir, f)
	if err != nil {
		return "", err
	}
	return saveDir, nil
}

func  (this *BaseController) GetSetting() models.Setting {
	setting := models.Setting{Id: 1}
	models.DB.First(&setting)
	return setting
}