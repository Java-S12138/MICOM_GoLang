package models

import (
	"crypto/md5"
	"encoding/hex"
	"github.com/astaxie/beego"
	"github.com/gomarkdown/markdown"
	. "github.com/hunterhug/go_image"
	"math/rand"
	"path"
	"reflect"
	"strconv"
	"strings"
	"time"
)

func UnixToDate(timestamp int) string {

	t := time.Unix(int64(timestamp), 0)

	return t.Format("2006-01-02 15:04:05")
}

//2020-05-02 15:04:05
func DateToUnix(str string) int64 {
	template := "2006-01-02 15:04:05"
	t, err := time.ParseInLocation(template, str, time.Local)
	if err != nil {
		beego.Info(err)
		return 0
	}
	return t.Unix()
}

func GetUnix() int64 {
	return time.Now().Unix()
}

func GetUnixNano() int64 {
	return time.Now().UnixNano()
}
func GetDate() string {
	template := "2006-01-02 15:04:05"
	return time.Now().Format(template)
}
func GetSettingFromColum(columnName string) string {
	setting := Setting{}
	DB.First(&setting)

	// 反射获取结构体中的值
	v := reflect.ValueOf(setting)
	val := v.FieldByName(columnName).String()
	return val
}

func Md5(str string) string {
	m := md5.New()
	m.Write([]byte(str))
	return string(hex.EncodeToString(m.Sum(nil)))
}

func GetDay() string {
	template := "20060102"
	return time.Now().Format(template)
}

// 获取订单号
func GetOrderId() string  {
	template := "200601021504"
	return time.Now().Format(template)+GetRandomNum()
}

func ResizeImage(filename string) {
	extName := path.Ext(filename)
	resizeImage := strings.Split(beego.AppConfig.String("resizeImageSize"), ",")
	beego.Info(filename)
	for i := 0; i < len(resizeImage); i++ {
		w := resizeImage[i]
		width, _ := strconv.Atoi(w)
		savepath := filename + "_" + w + "x" + w + extName
		err := ThumbnailF2F(filename, savepath, width, width)
		if err != nil {
			beego.Error(err)
		}
	}

}

func FormatImg(picname string) string  {
	ossStatus,err := beego.AppConfig.Bool("ossStatus")
	flag := strings.Contains(picname,"/static")
	if err != nil {
		// 判断目录前面是否有/
		if flag {
			return picname
		}else {
			return "/"+picname
		}
	}
	if ossStatus {
		return beego.AppConfig.String("ossDomain")+"/"+picname
	}else {
		if flag {
			return picname
		}else {
			return "/"+picname
		}
	}
}

func FormatAttr(str string) string {
	md := []byte(str)
	htmlByte := markdown.ToHTML(md,nil,nil)
	return string(htmlByte)
}

func CutStr(str string) string {
	rs := []int32(str)
	if len(rs) > 15 {
		return string(rs[0:15])+"..."
	}
	return str
}
// 乘法的函数
func Mul(price float64,num int) float64 {
	return price*(float64(num))
}
// 判断4 或 9 
func Judge(num int)bool  {
	if num == 4 || num ==9 {
		return true
	}else {
		return false
	}

}

// 生成四位随机数
func GetRandomNum() string  {
	var str string
	for i := 0; i < 4; i++ {
		current := rand.Intn(10)
		str += strconv.Itoa(current)
	}
	return str
}