package models

import (
	"encoding/json"
	"fmt"
	"github.com/astaxie/beego"
	"github.com/astaxie/beego/cache"
	_ "github.com/astaxie/beego/cache/redis"
	"time"
)

var redisClient cache.Cache
var enableRedis, _ = beego.AppConfig.Bool("enableRedis")
var redisTime,_ = beego.AppConfig.Int("redisTime")

func init() {
	if enableRedis {
		config := map[string]string{
			"key":      beego.AppConfig.String("redisKey"),
			"conn":     beego.AppConfig.String("redisConn"),
			"dbNum":    beego.AppConfig.String("redisDbNum"),
			"password": beego.AppConfig.String("redisPwd"),
		}
		bytes, _ := json.Marshal(config)
		redisClient, err = cache.NewCache("redis", string(bytes))
		if err != nil {
			fmt.Println(err)
			fmt.Println("连接redis数据库失败")
		} else {
			fmt.Println("连接redis数据库成功")
		}
	}
}

// 定义结构体
type cacheDb struct {}

// redis写入数据
func (c cacheDb) Set(key string,value interface{})  {
	if enableRedis {
		bytes,_ := json.Marshal(value)
		redisClient.Put(key,string(bytes),time.Second*time.Duration(redisTime))
	}
}

// redis获取数据
func (c cacheDb) Get(key string,obj interface{}) bool {
	if enableRedis {
		if redisStr := redisClient.Get(key);redisStr != nil{
			redisValue,_ := redisStr.([]uint8)
			json.Unmarshal([]byte(redisValue),obj)
			return true
		}
		return false
	}
	return false
}

// 实例化cacheDb结构体
var CacheDb = &cacheDb{}