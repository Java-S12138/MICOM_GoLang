/*
 Navicat MySQL Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80017
 Source Host           : localhost:3306
 Source Schema         : micom

 Target Server Type    : MySQL
 Target Server Version : 80017
 File Encoding         : 65001

 Date: 18/02/2021 18:41:32
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for access
-- ----------------------------
DROP TABLE IF EXISTS `access`;
CREATE TABLE `access`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0',
  `type` tinyint(1) NULL DEFAULT NULL,
  `action_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `module_id` int(11) NULL DEFAULT NULL,
  `sort` int(11) NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `add_time` int(11) NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 94 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of access
-- ----------------------------
INSERT INTO `access` VALUES (52, '用户管理', 1, '', '', 0, 100, '管理员管理', 0, 1);
INSERT INTO `access` VALUES (53, '角色管理', 1, '', '', 0, 100, '角色管理', 0, 1);
INSERT INTO `access` VALUES (54, '用户管理', 2, '管理员列表', '/manager', 52, 100, '管理员列表', 0, 1);
INSERT INTO `access` VALUES (55, '用户管理', 2, '增加管理员', '/manager/add', 52, 100, '管理员列表', 0, 1);
INSERT INTO `access` VALUES (56, '用户管理', 3, '编辑管理员', '/manager/edit', 52, 100, '编辑管理员', 0, 1);
INSERT INTO `access` VALUES (57, '用户管理', 3, '删除管理员', '/manager/delete', 52, 100, '删除管理员', 0, 1);
INSERT INTO `access` VALUES (59, '角色管理', 2, '角色列表', '/role', 53, 100, '角色列表', 0, 1);
INSERT INTO `access` VALUES (60, '角色管理', 2, '增加角色', '/role/add', 53, 100, '增加角色', 0, 1);
INSERT INTO `access` VALUES (61, '角色管理', 3, '编辑角色', '/role/edit', 53, 100, '编辑角色', 0, 1);
INSERT INTO `access` VALUES (62, '角色管理', 3, '删除角色', '/role/delete', 53, 100, '删除角色', 0, 1);
INSERT INTO `access` VALUES (63, '权限管理', 1, '', '', 0, 100, '权限管理', 0, 1);
INSERT INTO `access` VALUES (64, '权限管理', 2, '权限列表', '/access', 63, 100, '权限列表', 0, 1);
INSERT INTO `access` VALUES (65, '权限管理  ', 2, '增加权限', '/access/add', 63, 100, '增加权限', 0, 1);
INSERT INTO `access` VALUES (71, '轮播管理', 1, '', '', 0, 100, '轮播图管理', 0, 1);
INSERT INTO `access` VALUES (72, '轮播图管理', 2, '轮播图列表', '/focus', 71, 100, '轮播图列表', 0, 1);
INSERT INTO `access` VALUES (73, '轮播图管理', 2, '增加轮播图', '/focus/add', 71, 100, '增加轮播图', 0, 1);
INSERT INTO `access` VALUES (74, '权限管理', 3, '编辑权限', '/access/edit', 63, 100, '编辑权限', 0, 1);
INSERT INTO `access` VALUES (75, '权限管理', 3, '删除权限', '/access/delete', 63, 100, '删除权限', 0, 1);
INSERT INTO `access` VALUES (76, '轮播图管理', 1, '编辑轮播图', '/focus/edit', 71, 100, '编辑轮播图', 0, 1);
INSERT INTO `access` VALUES (77, '轮播图管理', 3, '删除轮播图', '/focus/delete', 71, 100, '删除轮播图', 0, 1);
INSERT INTO `access` VALUES (78, '商品管理', 1, '', '', 0, 100, '', 0, 1);
INSERT INTO `access` VALUES (79, '商品分类列表', 2, '商品分类列表', '/goodsCate', 78, 100, '商品分类列表', 0, 1);
INSERT INTO `access` VALUES (80, '增加商品分类', 3, '增加商品分类', '/goodsCate/add', 78, 100, '增加商品分类', 0, 1);
INSERT INTO `access` VALUES (81, '商品分类管理', 3, '编辑商品分类', '/goodsCate/edit', 78, 100, '编辑商品分类', 0, 1);
INSERT INTO `access` VALUES (82, '商品分类管理', 3, '删除商品分类', '/goodsCate/delete', 78, 100, '删除商品分类', 0, 1);
INSERT INTO `access` VALUES (83, '商品类型列表', 2, '商品类型列表', '/goodsType', 78, 100, '商品类型列表', 0, 1);
INSERT INTO `access` VALUES (84, '增加商品类型', 3, '增加商品类型', '/goodsType/add', 78, 100, '增加商品类型', 0, 1);
INSERT INTO `access` VALUES (85, '商品类型管理', 3, '编辑商品类型', '/goodsType/edit', 78, 100, '编辑商品类型', 0, 1);
INSERT INTO `access` VALUES (86, '商品类型管理', 3, '删除商品类型', '/goodsType/delete', 78, 100, '删除商品类型', 0, 1);
INSERT INTO `access` VALUES (87, '商品列表', 2, '商品列表', '/goods', 78, 101, '', 0, 1);
INSERT INTO `access` VALUES (88, '其他配置', 1, '', '', 0, 100, '', 0, 1);
INSERT INTO `access` VALUES (89, '其他配置', 2, '导航管理', '/nav', 88, 100, '导航管理', 0, 1);
INSERT INTO `access` VALUES (90, '其他配置', 3, '增加导航', '/nav/add', 88, 100, '/nav/add', 0, 1);
INSERT INTO `access` VALUES (91, '其他配置', 3, '修改导航', '/nav/edit', 88, 100, '', 0, 1);
INSERT INTO `access` VALUES (92, '其他配置', 3, '删除导航', '/nav/delete', 88, 100, '', 0, 1);
INSERT INTO `access` VALUES (93, '其他配置', 2, '商店设置', '/setting', 88, 100, '', 0, 1);

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `default_address` tinyint(1) NULL DEFAULT NULL,
  `add_time` int(11) NULL DEFAULT NULL,
  `zipcode` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES (7, 5, '张海浪', '13100861132', '重庆市沙坪坝区大学城', 1, 0, '100001');

-- ----------------------------
-- Table structure for focus
-- ----------------------------
DROP TABLE IF EXISTS `focus`;
CREATE TABLE `focus`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `focus_type` tinyint(1) NULL DEFAULT NULL,
  `focus_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `link` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sort` int(11) NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT NULL,
  `add_time` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of focus
-- ----------------------------
INSERT INTO `focus` VALUES (6, '小米10', 1, 'static/upload/20210201/1612149698.jpg', 'https://www.mi.com/buy/detail?product_id=10000214', 110, 1, 1612149698);
INSERT INTO `focus` VALUES (8, 'Redmi Note 9', 1, 'static/upload/20210206/1612583100642542000.jpg', 'https://www.mi.com/buy/detail?product_id=10000267', 1000, 1, 1612583101);
INSERT INTO `focus` VALUES (9, 'Redmi MAX 98\"', 1, 'static/upload/20210206/1612583142996734400.jpg', 'https://www.mi.com/redmitv/98', 1000, 1, 1612583143);
INSERT INTO `focus` VALUES (10, '小米电视 大师\"', 1, 'static/upload/20210206/1612583203368199200.jpg', 'https://www.mi.com/a/h/17671.html', 1000, 1, 1612583203);

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sub_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `goods_sn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `cate_id` int(11) NULL DEFAULT NULL,
  `click_count` int(11) NULL DEFAULT NULL,
  `goods_number` int(11) NULL DEFAULT NULL,
  `price` decimal(10, 2) NULL DEFAULT NULL,
  `market_price` decimal(10, 2) NULL DEFAULT NULL,
  `relation_goods` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `goods_attr` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `goods_color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `goods_version` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `goods_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `goods_gift` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `goods_fitting` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `goods_keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `goods_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `goods_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `is_delete` tinyint(4) NULL DEFAULT NULL,
  `is_hot` tinyint(4) NULL DEFAULT NULL,
  `is_best` tinyint(4) NULL DEFAULT NULL,
  `is_new` tinyint(4) NULL DEFAULT NULL,
  `goods_type_id` int(11) NULL DEFAULT NULL,
  `sort` int(11) NULL DEFAULT NULL,
  `status` tinyint(4) NULL DEFAULT NULL,
  `add_time` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 78 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES (17, '小米11', '骁龙888｜2K AMOLED 四曲面柔性屏｜1亿像素三摄｜时尚轻薄机身｜55W 有线闪充｜50W 无线闪充｜10W 无线反充｜LPDDR5｜WiFi6（增强版）｜视频「超级夜景」｜哈曼卡顿音频认证｜立体声双扬声器', '', 34, 100, 0, 3999.00, 3999.00, '17,61', '', '1,2,4,6', '8GB+128GB', 'static/upload/20210206/1612610846473649300.jpg', '18,23,27', '', '', '', '<ul style=\'margin: 0px; padding: 20px 0px 0px; list-style: none; overflow: hidden; color: rgb(102, 102, 102); font-family: tahoma, arial, \"Microsoft YaHei\", \"Hiragino Sans GB\", u5b8bu4f53, sans-serif; font-size: 12px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\'><li style=\"margin: 0px 0px 5px; padding: 0px 0px 0px 42px; list-style: none; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 485px; float: left;\" title=\"小米（MI）\">品牌：&nbsp;<a href=\"#\" style=\"margin: 0px; padding: 0px; color: rgb(94, 105, 173); text-decoration: none;\" target=\"_blank\">小米（MI）</a></li></ul><ul style=\'margin: 0px; padding: 20px 0px 15px; list-style: none; overflow: hidden; color: rgb(102, 102, 102); font-family: tahoma, arial, \"Microsoft YaHei\", \"Hiragino Sans GB\", u5b8bu4f53, sans-serif; font-size: 12px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\'><li style=\"margin: 0px 0px 5px; padding: 0px 0px 0px 42px; list-style: none; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\" title=\"小米 11\">商品名称：小米 11</li><li style=\"margin: 0px 0px 5px; padding: 0px 0px 0px 42px; list-style: none; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\" title=\"100009958327\">商品编号：100009958327</li><li style=\"margin: 0px 0px 5px; padding: 0px 0px 0px 42px; list-style: none; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\" title=\"360.00g\">商品毛重：360.00g</li><li style=\"margin: 0px 0px 5px; padding: 0px 0px 0px 42px; list-style: none; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\" title=\"中国大陆\">商品产地：中国大陆</li><li style=\"margin: 0px 0px 5px; padding: 0px 0px 0px 42px; list-style: none; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\" title=\"超大字体，语音命令，极简桌面模式\">特殊功能：超大字体，语音命令，极简桌面模式</li><li style=\"margin: 0px 0px 5px; padding: 0px 0px 0px 42px; list-style: none; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\" title=\"≥90%\">屏占比：&ge;90%</li><li style=\"margin: 0px 0px 5px; padding: 0px 0px 0px 42px; list-style: none; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\" title=\"Android(安卓)\">操作系统：Android(安卓)</li><li style=\"margin: 0px 0px 5px; padding: 0px 0px 0px 42px; list-style: none; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\" title=\"游戏音效增强，液冷散热，游戏显示增强，游戏震感，游戏深度优化，游戏勿扰模式，游戏性能模式\">游戏配置：游戏音效增强，液冷散热，游戏显示增强，游戏震感，游戏深度优化，游戏勿扰模式，游戏性能模式</li><li style=\"margin: 0px 0px 5px; padding: 0px 0px 0px 42px; list-style: none; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\" title=\"发烧级\">游戏性能：发烧级</li><li style=\"margin: 0px 0px 5px; padding: 0px 0px 0px 42px; list-style: none; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\" title=\"50-100W\">充电功率：50-100W</li></ul><p><img src=\"http://bee.sunyj.xyz/static/upload/20210209/1612839688245059900.jpg\" style=\"width: 300px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"http://bee.sunyj.xyz/static/upload/20210209/1612839821483437900.jpg\" style=\"width: 300px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"http://bee.sunyj.xyz/static/upload/20210209/1612839856305507300.jpg\" style=\"width: 300px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"http://bee.sunyj.xyz/static/upload/20210209/1612839892791597600.jpg\" style=\"width: 300px;\" class=\"fr-fic fr-dib\"></p>', 0, 1, 1, 1, 1, 10, 1, 1612610846);
INSERT INTO `goods` VALUES (18, '小米10', '骁龙865/1亿像素相机', '', 38, 100, 0, 3399.00, 3999.00, '', '', '2,4,5', '10', 'static/upload/20210206/1612611221459829900.jpg', '', '', '', '', '<p><span style=\'color: rgb(176, 176, 176); font-family: \"Helvetica Neue\", Helvetica, Arial, \"Microsoft Yahei\", \"Hiragino Sans GB\", \"Heiti SC\", \"WenQuanYi Micro Hei\", sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\'>骁龙865处理器 / 1亿像素8K电影相机 / 双模5G / 新一代LPDDR5内存 / 对称式立体声 / 90Hz刷新率+180Hz采样率 / UFS 3.0高速存储 / 全面适配Wi-Fi 6 / 超强VC液冷散热 / 30W极速闪充+30W无线闪充+10W无线反充 / 4780mAh大电量 / 多功能NFC</span> </p>', 0, 1, 1, 0, 1, 0, 1, 1612611221);
INSERT INTO `goods` VALUES (19, 'Note 9 Pro', '一亿像素夜景相机，120Hz六档变速高刷屏', '', 46, 100, 0, 1599.00, 1599.00, '', '', '2,5', '9', 'static/upload/20210206/1612611470921445200.jpg', '', '', '', '', '<p><span style=\'color: rgb(176, 176, 176); font-family: \"Helvetica Neue\", Helvetica, Arial, \"Microsoft Yahei\", \"Hiragino Sans GB\", \"Heiti SC\", \"WenQuanYi Micro Hei\", sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\'>一亿像素夜景相机 / 120Hz六档变速高刷屏 / 国内首发骁龙750G / 6.67&quot;小孔径全面屏 / 立体声双扬声器 / 4820mAh+33W闪充 / 多功能NFC / 线性马达 / 红外遥控 / 全新MIUI 12系统</span> </p>', 0, 1, 1, 0, 1, 0, 1, 1612611470);
INSERT INTO `goods` VALUES (20, 'Note 9', '天玑 800U处理器，5000mAh电池，', '', 47, 100, 0, 1299.00, 1299.00, '', '', '2,5', '9', 'static/upload/20210206/1612611646515128000.jpg', '', '', '', '', '<p><span style=\'color: rgb(176, 176, 176); font-family: \"Helvetica Neue\", Helvetica, Arial, \"Microsoft Yahei\", \"Hiragino Sans GB\", \"Heiti SC\", \"WenQuanYi Micro Hei\", sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\'>天玑 800U处理器 / 4800万像素主摄 / 6.53英寸超高清小孔全面屏 / 小金刚品质 / 5000mAh+18W快充 / 双5G待机 / 侧边指纹识别 / 线性马达 / 红外遥控</span> </p>', 0, 1, 1, 0, 1, 0, 1, 1612611646);
INSERT INTO `goods` VALUES (21, 'Note 9 4G', '6000mAh长续航', '', 57, 100, 0, 999.00, 999.00, '', '', '1,2,5', '9', 'static/upload/20210206/1612614141217682900.jpg', '', '', '', '', '<p><span style=\'color: rgb(176, 176, 176); font-family: \"Helvetica Neue\", Helvetica, Arial, \"Microsoft Yahei\", \"Hiragino Sans GB\", \"Heiti SC\", \"WenQuanYi Micro Hei\", sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\'>6000mAh超长续航 / 4800万超清三摄 / 全高清6.53英寸护眼屏 / 骁龙662处理器 / 18W快速充电 / 立体声双扬声器 / 侧边指纹识别 / 90%高屏占比 / 康宁大猩猩保护玻璃</span> </p>', 0, 1, 1, 0, 1, 0, 1, 1612614141);
INSERT INTO `goods` VALUES (22, 'Redmi 9A', '5000mAh长循环大电量，6.53\"超大护眼屏幕', '', 58, 100, 0, 599.00, 599.00, '', '', '2', '9', 'static/upload/20210206/1612614381106766400.jpg', '', '', '', '', '<p><span style=\'color: rgb(176, 176, 176); font-family: \"Helvetica Neue\", Helvetica, Arial, \"Microsoft Yahei\", \"Hiragino Sans GB\", \"Heiti SC\", \"WenQuanYi Micro Hei\", sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\'>5000mAh长循环大电量 / 6.53&quot;超大护眼屏幕 / G25八核处理器 / 大音量扬声器 / 1300万 AI相机 / 人脸解锁 / 最高支持512GB存储扩展</span> </p>', 0, 1, 1, 0, 1, 0, 1, 1612614381);
INSERT INTO `goods` VALUES (23, 'Redmi K30S 至尊纪念版', '144Hz[7档]变速高刷屏', '', 40, 100, 0, 2599.00, 2599.00, '', '', '2,5', '30', 'static/upload/20210206/1612614728674860500.jpg', '', '', '', '', '<p><span style=\'color: rgb(176, 176, 176); font-family: \"Helvetica Neue\", Helvetica, Arial, \"Microsoft Yahei\", \"Hiragino Sans GB\", \"Heiti SC\", \"WenQuanYi Micro Hei\", sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\'>骁龙865 / 144Hz[7档]变速高刷屏 / 专业原色显示+全局护眼 / 5000mAh大电量+33W快充 / 6400万AI三摄 / 立体声双扬声器+X轴马达 / LPDDR5+UFS3.1+WiFi6</span> </p>', 0, 1, 1, 0, 1, 0, 1, 1612614728);
INSERT INTO `goods` VALUES (24, 'Redmi K30 至尊版', '120Hz弹出全面屏，天玑1000+旗舰处理器', '', 43, 100, 0, 1999.00, 1999.00, '', '', '2,5', '30', 'static/upload/20210206/1612614872806800300.jpg', '', '', '', '', '<p><span style=\'color: rgb(176, 176, 176); font-family: \"Helvetica Neue\", Helvetica, Arial, \"Microsoft Yahei\", \"Hiragino Sans GB\", \"Heiti SC\", \"WenQuanYi Micro Hei\", sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\'>120Hz弹出全面屏 / 天玑1000+旗舰处理器 / 索尼6400万四摄 / 立体声双扬声器 / 4500mAh+33W闪充 / 双模5G / 多功能NFC / 线性震动马达 / 红外遥控</span> </p>', 0, 1, 1, 0, 1, 0, 1, 1612614872);
INSERT INTO `goods` VALUES (25, '小米10至尊纪念版', '', '', 37, 100, 0, 5299.00, 5299.00, '', '', '', '', 'static/upload/20210207/1612702477153054700.jpg', '', '', '', '', '', 0, 0, 0, 0, 0, 5, 1, 1612702108);
INSERT INTO `goods` VALUES (26, '小米10 青春版 5G', '', '', 39, 100, 0, 2399.00, 2799.00, '', '', '', '', 'static/upload/20210207/1612702772700565400.jpg', '', '', '', '', '', 0, 0, 0, 0, 0, 0, 1, 1612702772);
INSERT INTO `goods` VALUES (27, '小米MIX Alpha', '', '', 181, 100, 0, 19999.00, 19999.00, '', '', '', '', 'static/upload/20210207/1612702864966009700.jpg', '', '', '', '', '', 0, 0, 0, 0, 0, 0, 1, 1612702864);
INSERT INTO `goods` VALUES (28, 'Redmi Note 9 5G', '', '', 47, 100, 0, 1299.00, 1299.00, '', '', '', '', 'static/upload/20210207/1612703241799280800.jpg', '', '', '', '', '', 0, 0, 0, 0, 0, 0, 1, 1612703241);
INSERT INTO `goods` VALUES (29, 'Redmi K30S 至尊纪念版', '', '', 40, 100, 0, 2799.00, 2799.00, '', '', '', '', 'static/upload/20210207/1612703354084775500.jpg', '', '', '', '', '', 0, 0, 0, 0, 0, 0, 1, 1612703354);
INSERT INTO `goods` VALUES (31, 'Redmi 9A', '', '', 58, 100, 0, 599.00, 599.00, '', '', '', '', 'static/upload/20210207/1612703405310228000.jpg', '', '', '', '', '', 0, 0, 0, 0, 0, 0, 1, 1612703405);
INSERT INTO `goods` VALUES (32, 'Redmi K30', '', '', 42, 100, 0, 1399.00, 1399.00, '', '', '', '', 'static/upload/20210207/1612703437435275800.jpg', '', '', '', '', '', 0, 0, 0, 0, 0, 0, 1, 1612703437);
INSERT INTO `goods` VALUES (33, 'Redmi 10X Pro', '', '', 44, 100, 0, 2099.00, 2099.00, '', '', '', '', 'static/upload/20210207/1612703519629511600.jpg', '', '', '', '', '', 0, 0, 0, 0, 0, 0, 1, 1612703519);
INSERT INTO `goods` VALUES (34, '小米电视大师 82英寸', '', '', 60, 100, 0, 9999.00, 9999.00, '', '', '', '', 'static/upload/20210207/1612703859162560400.jpg', '', '', '', '', '', 0, 0, 0, 0, 0, 0, 1, 1612703859);
INSERT INTO `goods` VALUES (35, '小米透明电视', '', '', 59, 100, 0, 49999.00, 49999.00, '', '', '', '', 'static/upload/20210207/1612703941788200500.jpg', '', '', '', '', '', 0, 0, 0, 0, 0, 0, 1, 1612703941);
INSERT INTO `goods` VALUES (36, '小米电视 大师 65英寸', '', '', 61, 100, 0, 9999.00, 12999.00, '', '', '', '', 'static/upload/20210207/1612703980700179500.jpg', '', '', '', '', '', 0, 0, 0, 0, 0, 0, 1, 1612703980);
INSERT INTO `goods` VALUES (37, 'Redmi 智能电视 MAX 98\'\'', '', '', 62, 100, 0, 19999.00, 19999.00, '', '', '', '', 'static/upload/20210207/1612704018065873400.jpg', '', '', '', '', '', 0, 0, 0, 0, 0, 0, 1, 1612704018);
INSERT INTO `goods` VALUES (38, '小米电视4A 60英寸', '', '', 69, 100, 0, 2599.00, 2599.00, '', '', '', '', 'static/upload/20210207/1612704047788492700.png', '', '', '', '', '', 0, 0, 0, 0, 0, 0, 1, 1612704047);
INSERT INTO `goods` VALUES (39, 'Redmi G 游戏本', '', '', 73, 100, 0, 4999.00, 4999.00, '', '', '', '', 'static/upload/20210207/1612705903481219500.jpg', '', '', '', '', '', 0, 0, 0, 0, 0, 0, 1, 1612705903);
INSERT INTO `goods` VALUES (40, 'RedmiBook 16', '', '', 79, 100, 0, 4699.00, 4999.00, '', '', '', '', 'static/upload/20210207/1612705934351314300.jpg', '', '', '', '', '', 0, 0, 0, 0, 0, 0, 1, 1612705934);
INSERT INTO `goods` VALUES (41, 'RedmiBook 14 Ⅱ', '', '', 81, 100, 0, 4699.00, 4999.00, '', '', '', '', 'static/upload/20210207/1612705972041033500.jpg', '', '', '', '', '', 0, 0, 0, 0, 0, 0, 1, 1612705972);
INSERT INTO `goods` VALUES (42, 'Pro 15.6\" 2020款', '', '', 83, 100, 0, 6799.00, 6999.00, '', '', '', '', 'static/upload/20210207/1612706008296486400.jpg', '', '', '', '', '', 0, 0, 0, 0, 0, 0, 1, 1612706008);
INSERT INTO `goods` VALUES (43, 'RedmiBook Air 13', '', '', 76, 100, 0, 4899.00, 4899.00, '', '', '', '', 'static/upload/20210207/1612706043872153300.jpg', '', '', '', '', '', 0, 0, 0, 0, 0, 0, 1, 1612706043);
INSERT INTO `goods` VALUES (44, '小米曲面显示器 34英寸', '', '', 82, 100, 0, 2399.00, 2499.00, '', '', '', '', 'static/upload/20210207/1612706073394096800.jpg', '', '', '', '', '', 0, 0, 0, 0, 0, 0, 1, 1612706073);
INSERT INTO `goods` VALUES (45, '米家互联网空调 1.5匹', '', '', 95, 100, 0, 2399.00, 2699.00, '', '', '', '', 'static/upload/20210207/1612706168023174700.jpg', '', '', '', '', '', 0, 0, 0, 0, 0, 0, 1, 1612706168);
INSERT INTO `goods` VALUES (46, '米家互联网空调 1.5匹', '', '', 95, 100, 0, 2399.00, 2699.00, '', '', '', '', 'static/upload/20210207/1612706200732777900.jpg', '', '', '', '', '', 0, 0, 0, 0, 0, 0, 1, 1612706200);
INSERT INTO `goods` VALUES (47, 'Redmi全自动波轮洗衣机1A', '', '', 99, 100, 0, 799.00, 899.00, '', '', '', '', 'static/upload/20210207/1612706241898813100.jpg', '', '', '', '', '', 0, 0, 0, 0, 0, 0, 1, 1612706241);
INSERT INTO `goods` VALUES (48, '米家互联网洗烘一体机', '', '', 99, 100, 0, 1999.00, 2299.00, '', '', '', '', 'static/upload/20210207/1612706278937944500.jpg', '', '', '', '', '', 0, 0, 0, 0, 0, 0, 1, 1612706278);
INSERT INTO `goods` VALUES (49, '米家风冷对开门冰箱 ', '', '', 87, 100, 0, 2369.00, 2499.00, '', '', '', '', 'static/upload/20210207/1612706305576951100.jpg', '', '', '', '', '', 0, 0, 0, 0, 0, 0, 1, 1612706305);
INSERT INTO `goods` VALUES (50, '米家两门冰箱', '', '', 87, 100, 0, 949.00, 1099.00, '', '', '', '', 'static/upload/20210207/1612706345351867500.jpg', '', '', '', '', '', 0, 0, 0, 0, 0, 0, 1, 1612706345);
INSERT INTO `goods` VALUES (51, '小米路由器AX6000', '', '', 182, 100, 0, 599.00, 599.00, '', '', '', '', 'static/upload/20210207/1612706534837971900.jpg', '', '', '', '', '', 0, 0, 0, 0, 0, 0, 1, 1612706534);
INSERT INTO `goods` VALUES (52, 'Redmi路由器 AX6', '', '', 126, 100, 0, 329.00, 399.00, '', '', '', '', 'static/upload/20210207/1612706566261216500.jpg', '', '', '', '', '', 0, 0, 0, 0, 0, 0, 1, 1612706566);
INSERT INTO `goods` VALUES (53, 'Redmi路由器 AX5', '', '', 126, 100, 0, 249.00, 249.00, '', '', '', '', 'static/upload/20210207/1612706595701041100.jpg', '', '', '', '', '', 0, 0, 0, 0, 0, 0, 1, 1612706595);
INSERT INTO `goods` VALUES (54, '小米路由器 AX1800', '', '', 182, 100, 0, 329.00, 329.00, '', '', '', '', 'static/upload/20210207/1612706617371076000.jpg', '', '', '', '', '', 0, 0, 0, 0, 0, 0, 1, 1612706617);
INSERT INTO `goods` VALUES (55, '小米AIoT路由器 AX3600', '', '', 182, 100, 0, 499.00, 599.00, '', '', '', '', 'static/upload/20210207/1612706674855008000.jpg', '', '', '', '', '', 0, 0, 0, 0, 0, 0, 1, 1612706674);
INSERT INTO `goods` VALUES (56, 'Redmi路由器AC2100', '', '', 126, 100, 0, 169.00, 169.00, '', '', '', '', 'static/upload/20210207/1612706708224989000.jpg', '', '', '', '', '', 0, 0, 0, 0, 0, 0, 1, 1612706708);
INSERT INTO `goods` VALUES (57, '小米全自动智能门锁', '', '', 120, 100, 0, 1799.00, 1799.00, '', '', '', '', 'static/upload/20210207/1612706795810055800.jpg', '', '', '', '', '', 0, 0, 0, 0, 0, 0, 1, 1612706795);
INSERT INTO `goods` VALUES (58, 'Redmi小爱触屏音箱Pro8', '', '', 158, 100, 0, 499.00, 499.00, '', '', '', '', 'static/upload/20210207/1612706834390146200.jpg', '', '', '', '', '', 0, 0, 0, 0, 0, 0, 1, 1612706834);
INSERT INTO `goods` VALUES (59, '小米小爱触屏音箱', '', '', 163, 100, 0, 199.00, 199.00, '', '', '', '', 'static/upload/20210207/1612706872243031400.jpg', '', '', '', '', '', 0, 0, 0, 0, 0, 0, 1, 1612706872);
INSERT INTO `goods` VALUES (60, 'Redmi小爱音箱 Play', '', '', 156, 100, 0, 79.00, 129.00, '', '', '', '', 'static/upload/20210207/1612706914355114900.jpg', '', '', '', '', '', 0, 0, 0, 0, 0, 0, 1, 1612706914);
INSERT INTO `goods` VALUES (61, '小米11', '骁龙888｜2K AMOLED 四曲面柔性屏｜1亿像素三摄｜时尚轻薄机身｜55W 有线闪充｜50W 无线闪充｜10W 无线反充｜LPDDR5｜WiFi6（增强版）｜视频「超级夜景」｜哈曼卡顿音频认证｜立体声双扬声器', '', 34, 100, 0, 4299.00, 4299.00, '17,61', '', '2,4,5', '8GB+258GB', 'static/upload/20210206/1612610846473649300.jpg', '', '', '', '', '<ul style=\'margin: 0px; padding: 20px 0px 0px; list-style: none; overflow: hidden; color: rgb(102, 102, 102); font-family: tahoma, arial, \"Microsoft YaHei\", \"Hiragino Sans GB\", u5b8bu4f53, sans-serif; font-size: 12px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\'><li style=\"margin: 0px 0px 5px; padding: 0px 0px 0px 42px; list-style: none; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 485px; float: left;\" title=\"小米（MI）\">品牌：&nbsp;<a href=\"#\" style=\"margin: 0px; padding: 0px; color: rgb(94, 105, 173); text-decoration: none;\" target=\"_blank\">小米（MI）</a></li></ul><ul style=\'margin: 0px; padding: 20px 0px 15px; list-style: none; overflow: hidden; color: rgb(102, 102, 102); font-family: tahoma, arial, \"Microsoft YaHei\", \"Hiragino Sans GB\", u5b8bu4f53, sans-serif; font-size: 12px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\'><li style=\"margin: 0px 0px 5px; padding: 0px 0px 0px 42px; list-style: none; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\" title=\"小米 11\">商品名称：小米 11</li><li style=\"margin: 0px 0px 5px; padding: 0px 0px 0px 42px; list-style: none; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\" title=\"100009958327\">商品编号：100009958327</li><li style=\"margin: 0px 0px 5px; padding: 0px 0px 0px 42px; list-style: none; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\" title=\"360.00g\">商品毛重：360.00g</li><li style=\"margin: 0px 0px 5px; padding: 0px 0px 0px 42px; list-style: none; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\" title=\"中国大陆\">商品产地：中国大陆</li><li style=\"margin: 0px 0px 5px; padding: 0px 0px 0px 42px; list-style: none; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\" title=\"超大字体，语音命令，极简桌面模式\">特殊功能：超大字体，语音命令，极简桌面模式</li><li style=\"margin: 0px 0px 5px; padding: 0px 0px 0px 42px; list-style: none; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\" title=\"≥90%\">屏占比：&ge;90%</li><li style=\"margin: 0px 0px 5px; padding: 0px 0px 0px 42px; list-style: none; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\" title=\"Android(安卓)\">操作系统：Android(安卓)</li><li style=\"margin: 0px 0px 5px; padding: 0px 0px 0px 42px; list-style: none; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\" title=\"游戏音效增强，液冷散热，游戏显示增强，游戏震感，游戏深度优化，游戏勿扰模式，游戏性能模式\">游戏配置：游戏音效增强，液冷散热，游戏显示增强，游戏震感，游戏深度优化，游戏勿扰模式，游戏性能模式</li><li style=\"margin: 0px 0px 5px; padding: 0px 0px 0px 42px; list-style: none; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\" title=\"发烧级\">游戏性能：发烧级</li><li style=\"margin: 0px 0px 5px; padding: 0px 0px 0px 42px; list-style: none; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\" title=\"50-100W\">充电功率：50-100W</li></ul><p><img src=\"http://bee.sunyj.xyz/static/upload/20210209/1612839688245059900.jpg\" style=\"width: 300px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"http://bee.sunyj.xyz/static/upload/20210209/1612839821483437900.jpg\" style=\"width: 300px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"http://bee.sunyj.xyz/static/upload/20210209/1612839856305507300.jpg\" style=\"width: 300px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"http://bee.sunyj.xyz/static/upload/20210209/1612839892791597600.jpg\" style=\"width: 300px;\" class=\"fr-fic fr-dib\"></p>', 0, 0, 0, 0, 1, 10, 1, 1612610846);
INSERT INTO `goods` VALUES (62, '小米全面屏电视65英寸 E65X', '全面屏设计', '', 50, 100, 0, 2899.00, 3099.00, '', '', '2', '', 'static/upload/20210216/1613463880897236000.jpg', '', '', '', '', '<p>全面屏设计</p>', 0, 1, 0, 0, 0, 0, 1, 1613463880);
INSERT INTO `goods` VALUES (63, '全面屏电视E43K', '潮流全面屏设计', '', 50, 100, 0, 1299.00, 1399.00, '', '', '2', '', 'static/upload/20210216/1613465108508560000.jpg', '', '', '', '', '<p>潮流全面屏设计</p>', 0, 1, 0, 0, 0, 0, 1, 1613465108);
INSERT INTO `goods` VALUES (64, '小米电视4A 70英寸', '大屏更享受', '', 50, 100, 0, 3299.00, 3999.00, '', '', '2', '70英寸', 'static/upload/20210216/1613465314289094400.jpg', '', '', '', '', '<p>大屏更享受</p>', 0, 1, 0, 0, 0, 0, 1, 1613465314);
INSERT INTO `goods` VALUES (65, '米家空调', '出众静音，快速制冷热', '', 50, 100, 0, 1699.00, 1799.00, '', '', '6', '', 'static/upload/20210216/1613465571761608000.jpg', '', '', '', '', '<p>出众静音，快速制冷热</p>', 0, 1, 0, 0, 0, 0, 1, 1613465571);
INSERT INTO `goods` VALUES (66, '米家互联网洗烘一体机 Pro 10kg', '智能洗烘，省心省力', '', 50, 100, 0, 2999.00, 3299.00, '', '', '6', '', 'static/upload/20210216/1613465878231306400.jpg', '', '', '', '', '<p>智能洗烘，省心省力</p>', 0, 1, 0, 0, 0, 0, 1, 1613465878);
INSERT INTO `goods` VALUES (67, 'Redmi全自动波轮洗衣机1A 8kg', '一键操作，父母都爱用', '', 50, 100, 0, 799.00, 899.00, '', '', '6', '', 'static/upload/20210216/1613466014959423400.jpg', '', '', '', '', '<p>一键操作，父母都爱用</p>', 0, 1, 0, 0, 0, 0, 1, 1613466014);
INSERT INTO `goods` VALUES (68, '米家互联网烟灶套装', '烟灶联动 /缔造爆炒大吸力', '', 50, 100, 0, 2099.00, 2298.00, '', '', '2', '', 'static/upload/20210216/1613466884985180500.jpg', '', '', '', '', '<p>烟灶联动 /缔造爆炒大吸力</p>', 0, 1, 0, 0, 0, 0, 1, 1613466884);
INSERT INTO `goods` VALUES (69, '米家投影仪2 Pro', '全向自动校正 / 1300 ANSI 流明', '', 50, 100, 0, 4599.00, 4599.00, '', '', '6', '', 'static/upload/20210216/1613466991707167500.png', '', '', '', '', '<p>全向自动校正 / 1300 ANSI 流明</p>', 0, 1, 0, 0, 0, 0, 1, 1613466991);
INSERT INTO `goods` VALUES (70, '小米小爱音箱 Play', '听音乐、语音遥控家电', '', 52, 100, 0, 99.00, 169.00, '', '', '6', '', 'static/upload/20210217/1613553956054957400.jpg', '', '', '', '', '<p>听音乐、语音遥控家电</p>', 0, 1, 0, 0, 0, 0, 1, 1613553956);
INSERT INTO `goods` VALUES (71, '米家智能窗帘', '窗帘开合随心控', '', 52, 100, 0, 799.00, 799.00, '', '', '6', '', 'static/upload/20210217/1613554160118554500.jpg', '', '', '', '', '<p>窗帘开合随心控</p>', 0, 1, 0, 0, 0, 0, 1, 1613554160);
INSERT INTO `goods` VALUES (72, '小米体脂秤2', '轻松掌握身体脂肪率', '', 52, 100, 0, 99.00, 99.00, '', '', '6', '', 'static/upload/20210217/1613554279371590100.jpg', '', '', '', '', '<p>轻松掌握身体脂肪率</p>', 0, 1, 0, 0, 0, 0, 1, 1613554279);
INSERT INTO `goods` VALUES (73, '九号平衡车', '年轻人的酷玩具', '', 52, 100, 0, 1799.00, 1999.00, '', '', '6', '', 'static/upload/20210217/1613554407127985500.jpg', '', '', '', '', '<p>年轻人的酷玩具</p>', 0, 1, 0, 0, 0, 0, 1, 1613554407);
INSERT INTO `goods` VALUES (74, '小米智能门锁 推拉式', '一步推拉，高端智能门锁', '', 52, 100, 0, 1599.00, 1699.00, '', '', '2', '', 'static/upload/20210217/1613554520954612100.jpg', '', '', '', '', '', 0, 1, 0, 0, 0, 0, 1, 1613554496);
INSERT INTO `goods` VALUES (75, '小米手环5', '11种运动模式 磁吸式充电', '', 52, 100, 0, 179.00, 189.00, '', '', '2', '', 'static/upload/20210217/1613554663041048200.jpg', '', '', '', '', '<p>11种运动模式 磁吸式充电</p>', 0, 1, 0, 0, 0, 0, 1, 1613554663);
INSERT INTO `goods` VALUES (76, '骑记电动助力自行车', '更多助力选择，更多城市风景', '', 52, 100, 0, 2799.00, 2999.00, '', '', '2', '', 'static/upload/20210217/1613554757186225200.jpg', '', '', '', '', '<p>更多助力选择，更多城市风景</p>', 0, 1, 0, 0, 0, 0, 1, 1613554757);
INSERT INTO `goods` VALUES (77, '小米米家对讲机2', '向更远出发', '', 52, 100, 0, 449.00, 449.00, '', '', '2', '', 'static/upload/20210217/1613554849427509900.jpg', '', '', '', '', '<p>向更远出发</p>', 0, 1, 0, 0, 0, 0, 1, 1613554849);

-- ----------------------------
-- Table structure for goods_attr
-- ----------------------------
DROP TABLE IF EXISTS `goods_attr`;
CREATE TABLE `goods_attr`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NULL DEFAULT NULL,
  `attribute_cate_id` int(11) NULL DEFAULT NULL,
  `attribute_id` int(11) NULL DEFAULT NULL,
  `attribute_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `attribute_type` tinyint(1) NULL DEFAULT NULL,
  `attribute_value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sort` int(11) NULL DEFAULT NULL,
  `add_time` int(11) NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 265 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods_attr
-- ----------------------------
INSERT INTO `goods_attr` VALUES (22, 1, 1, 1, '基本信息', 1, '123', 10, 1612591897, 1);
INSERT INTO `goods_attr` VALUES (23, 1, 1, 7, '性能	', 2, '321', 10, 1612591897, 1);
INSERT INTO `goods_attr` VALUES (24, 1, 1, 8, '相机', 2, '123', 10, 1612591897, 1);
INSERT INTO `goods_attr` VALUES (25, 1, 1, 9, '支持蓝牙', 3, '是\r\n', 10, 1612591897, 1);
INSERT INTO `goods_attr` VALUES (26, 1, 1, 10, '屏幕', 2, '123', 10, 1612591897, 1);
INSERT INTO `goods_attr` VALUES (27, 1, 1, 11, '外观', 2, '123', 10, 1612591897, 1);
INSERT INTO `goods_attr` VALUES (28, 1, 1, 12, '电池', 1, '123', 10, 1612591897, 1);
INSERT INTO `goods_attr` VALUES (43, 18, 1, 1, '基本信息', 1, '小米10', 10, 1612611221, 1);
INSERT INTO `goods_attr` VALUES (44, 18, 1, 7, '性能	', 2, '骁龙865处理器', 10, 1612611221, 1);
INSERT INTO `goods_attr` VALUES (45, 18, 1, 8, '相机', 2, '1亿像素8K电影相机', 10, 1612611221, 1);
INSERT INTO `goods_attr` VALUES (46, 18, 1, 9, '支持蓝牙', 3, '是\r\n', 10, 1612611221, 1);
INSERT INTO `goods_attr` VALUES (47, 18, 1, 10, '屏幕', 2, '90Hz刷新率+180Hz采样率', 10, 1612611221, 1);
INSERT INTO `goods_attr` VALUES (48, 18, 1, 11, '外观', 2, '美丽', 10, 1612611221, 1);
INSERT INTO `goods_attr` VALUES (49, 18, 1, 12, '电池', 1, '4780mAh', 10, 1612611221, 1);
INSERT INTO `goods_attr` VALUES (50, 19, 1, 1, '基本信息', 1, 'Note 9 Pro 5G', 10, 1612611471, 1);
INSERT INTO `goods_attr` VALUES (51, 19, 1, 7, '性能	', 2, '骁龙750G', 10, 1612611471, 1);
INSERT INTO `goods_attr` VALUES (52, 19, 1, 8, '相机', 2, '一亿像素夜景相机', 10, 1612611471, 1);
INSERT INTO `goods_attr` VALUES (53, 19, 1, 9, '支持蓝牙', 3, '是\r\n', 10, 1612611471, 1);
INSERT INTO `goods_attr` VALUES (54, 19, 1, 10, '屏幕', 2, '6.67\"小孔径全面屏', 10, 1612611471, 1);
INSERT INTO `goods_attr` VALUES (55, 19, 1, 11, '外观', 2, '美丽', 10, 1612611471, 1);
INSERT INTO `goods_attr` VALUES (56, 19, 1, 12, '电池', 1, ' 4820mAh', 10, 1612611471, 1);
INSERT INTO `goods_attr` VALUES (57, 20, 1, 1, '基本信息', 1, 'Note 9 5G', 10, 1612611646, 1);
INSERT INTO `goods_attr` VALUES (58, 20, 1, 7, '性能	', 2, '天玑 800U处理器', 10, 1612611646, 1);
INSERT INTO `goods_attr` VALUES (59, 20, 1, 8, '相机', 2, '4800万像素主摄', 10, 1612611646, 1);
INSERT INTO `goods_attr` VALUES (60, 20, 1, 9, '支持蓝牙', 3, '是\r\n', 10, 1612611646, 1);
INSERT INTO `goods_attr` VALUES (61, 20, 1, 10, '屏幕', 2, '6.53英寸超高清小孔全面屏', 10, 1612611646, 1);
INSERT INTO `goods_attr` VALUES (62, 20, 1, 11, '外观', 2, '小金刚品质', 10, 1612611646, 1);
INSERT INTO `goods_attr` VALUES (63, 20, 1, 12, '电池', 1, '5000mAh', 10, 1612611646, 1);
INSERT INTO `goods_attr` VALUES (64, 21, 1, 1, '基本信息', 1, 'Note 9 4G', 10, 1612614141, 1);
INSERT INTO `goods_attr` VALUES (65, 21, 1, 7, '性能	', 2, '骁龙662处理器 /', 10, 1612614141, 1);
INSERT INTO `goods_attr` VALUES (66, 21, 1, 8, '相机', 2, '4800万超清三摄', 10, 1612614141, 1);
INSERT INTO `goods_attr` VALUES (67, 21, 1, 9, '支持蓝牙', 3, '是\r\n', 10, 1612614141, 1);
INSERT INTO `goods_attr` VALUES (68, 21, 1, 10, '屏幕', 2, ' 90%高屏占比 / 康宁大猩猩保护玻璃', 10, 1612614141, 1);
INSERT INTO `goods_attr` VALUES (69, 21, 1, 11, '外观', 2, '美丽', 10, 1612614141, 1);
INSERT INTO `goods_attr` VALUES (70, 21, 1, 12, '电池', 1, '6000mAh', 10, 1612614141, 1);
INSERT INTO `goods_attr` VALUES (71, 22, 1, 1, '基本信息', 1, 'Redmi 9A', 10, 1612614381, 1);
INSERT INTO `goods_attr` VALUES (72, 22, 1, 7, '性能	', 2, 'G25八核处理器', 10, 1612614381, 1);
INSERT INTO `goods_attr` VALUES (73, 22, 1, 8, '相机', 2, '300万 AI相机', 10, 1612614381, 1);
INSERT INTO `goods_attr` VALUES (74, 22, 1, 9, '支持蓝牙', 3, '是\r\n', 10, 1612614381, 1);
INSERT INTO `goods_attr` VALUES (75, 22, 1, 10, '屏幕', 2, '6.53\"超大护眼屏幕', 10, 1612614381, 1);
INSERT INTO `goods_attr` VALUES (76, 22, 1, 11, '外观', 2, '美丽', 10, 1612614381, 1);
INSERT INTO `goods_attr` VALUES (77, 22, 1, 12, '电池', 1, '5000mAh长循环大电量', 10, 1612614381, 1);
INSERT INTO `goods_attr` VALUES (78, 23, 1, 1, '基本信息', 1, 'Redmi K30S 至尊纪念版', 10, 1612614728, 1);
INSERT INTO `goods_attr` VALUES (79, 23, 1, 7, '性能	', 2, '骁龙865', 10, 1612614728, 1);
INSERT INTO `goods_attr` VALUES (80, 23, 1, 8, '相机', 2, '6400万AI三摄', 10, 1612614728, 1);
INSERT INTO `goods_attr` VALUES (81, 23, 1, 9, '支持蓝牙', 3, '是\r\n', 10, 1612614728, 1);
INSERT INTO `goods_attr` VALUES (82, 23, 1, 10, '屏幕', 2, '44Hz[7档]变速高刷屏 / 专业原色显示+全局护眼', 10, 1612614728, 1);
INSERT INTO `goods_attr` VALUES (83, 23, 1, 11, '外观', 2, '美丽', 10, 1612614728, 1);
INSERT INTO `goods_attr` VALUES (84, 23, 1, 12, '电池', 1, '5000mAh', 10, 1612614728, 1);
INSERT INTO `goods_attr` VALUES (85, 24, 1, 1, '基本信息', 1, 'Redmi K30 至尊纪念版', 10, 1612614873, 1);
INSERT INTO `goods_attr` VALUES (86, 24, 1, 7, '性能	', 2, '天玑1000+旗舰处理器', 10, 1612614873, 1);
INSERT INTO `goods_attr` VALUES (87, 24, 1, 8, '相机', 2, '\r\n索尼6400 万四摄', 10, 1612614873, 1);
INSERT INTO `goods_attr` VALUES (88, 24, 1, 9, '支持蓝牙', 3, '是\r\n', 10, 1612614873, 1);
INSERT INTO `goods_attr` VALUES (89, 24, 1, 10, '屏幕', 2, '120Hz弹出全面屏 ', 10, 1612614873, 1);
INSERT INTO `goods_attr` VALUES (90, 24, 1, 11, '外观', 2, '美丽', 10, 1612614873, 1);
INSERT INTO `goods_attr` VALUES (91, 24, 1, 12, '电池', 1, '4500mAh', 10, 1612614873, 1);
INSERT INTO `goods_attr` VALUES (259, 17, 1, 1, '基本信息', 1, '### 小米11\r\n - 时尚轻薄机身\r\n - 高通骁龙™888\r\n - LPDDR5 （满血版）丨WiFi6 （增强版）\r\n - 4600mAh丨55W 有线闪充\r\n - 50W 无线闪充丨10W 无线反充\r\n - 2K + 120Hz AMOLED 四曲面柔性屏\r\n - 1 亿像素电影相机丨视频超级夜景\r\n - 哈曼卡顿丨立体声双扬声器\r\n', 10, 1613102757, 1);
INSERT INTO `goods_attr` VALUES (260, 17, 1, 7, '性能	', 2, ' - 高通骁龙™888\r\n - CPU 架构工艺：Kryo 680 架构，5nm 工艺制程；\r\n - CPU 主频：八核处理器，最高主频可达：2.84GHz\r\n - GPU ：Adreno 660 图形处理器，最高频率可达 840MHz\r\n - AI：第六代 AI 引擎', 10, 1613102757, 1);
INSERT INTO `goods_attr` VALUES (261, 17, 1, 8, '相机', 2, '### 后置 1 亿像素三摄\r\n - 1 亿像素超清主摄：1/1.33″超大感光元件丨支持四合一 1.6μm 大像素输出丨7P丨f/1.85 大光圈 | OIS 光学防抖\r\n - 123° 超广角镜头：13MP丨f/2.4 光圈\r\n - 500 万像素长焦微距镜头', 10, 1613102757, 1);
INSERT INTO `goods_attr` VALUES (262, 17, 1, 9, '支持蓝牙', 3, '是\r\n', 10, 1613102757, 1);
INSERT INTO `goods_attr` VALUES (263, 17, 1, 11, '外观', 2, ' - 长度：164.3mm\r\n - 宽度：74.6mm\r\n - 厚度：8.06mm（玻璃版） 8.56mm（素皮版）\r\n - 重量：196g（玻璃版） 194g（素皮版）', 10, 1613102757, 1);
INSERT INTO `goods_attr` VALUES (264, 17, 1, 12, '电池', 1, ' - 4600mAh（typ） / 4500mAh（min）\r\n - 内置锂离子聚合物电池，不可拆卸\r\n - USB Type-C 双面充电接口\r\n - 手机支持 QC4+ / QC3+ / PD3.0 快充协议\r\n - 55W 有线闪充 + 50W 无线闪充 + 10W 无线反充', 10, 1613102757, 1);

-- ----------------------------
-- Table structure for goods_cate
-- ----------------------------
DROP TABLE IF EXISTS `goods_cate`;
CREATE TABLE `goods_cate`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cate_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `link` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `template` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pid` int(11) NULL DEFAULT NULL,
  `sub_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `keywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT NULL,
  `sort` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `add_time` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 183 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of goods_cate
-- ----------------------------
INSERT INTO `goods_cate` VALUES (33, '手机 电话卡', '', '', '', 0, '', '', '', 1, '10', 1612594284);
INSERT INTO `goods_cate` VALUES (34, '小米11', 'static/upload/20210206/1612594356096072500.png', '', '', 33, '', '', '', 1, '10', 1612594356);
INSERT INTO `goods_cate` VALUES (35, '电视 盒子', '', '', '', 0, '', '', '', 1, '10', 1612595006);
INSERT INTO `goods_cate` VALUES (36, '笔记本 显示器', '', '', '', 0, '', '', '', 1, '10', 1612595047);
INSERT INTO `goods_cate` VALUES (37, '小米10 至尊纪念版', 'static/upload/20210206/1612596013932423900.png', '', '', 33, '', '', '', 1, '10', 1612596014);
INSERT INTO `goods_cate` VALUES (38, '小米10', 'static/upload/20210206/1612596421219097800.png', '', '', 33, '', '', '', 1, '10', 1612596421);
INSERT INTO `goods_cate` VALUES (39, '小米10 青春版', 'static/upload/20210206/1612596780469387500.png', '', '', 33, '', '', '', 1, '10', 1612596780);
INSERT INTO `goods_cate` VALUES (40, 'Redmi K30S 至尊纪念版', 'static/upload/20210206/1612597122582716800.png', '', '', 33, '', '', '', 1, '10', 1612597122);
INSERT INTO `goods_cate` VALUES (41, 'Redmi K30 Pro 变焦版', 'static/upload/20210206/1612597176331882900.jpg', '', '', 33, '', '', '', 1, '10', 1612597176);
INSERT INTO `goods_cate` VALUES (42, 'Redmi K30 5G', 'static/upload/20210206/1612597212517591300.jpg', '', '', 33, '', '', '', 1, '10', 1612597212);
INSERT INTO `goods_cate` VALUES (43, 'Redmi K30 至尊版', 'static/upload/20210206/1612597241349709900.jpg', '', '', 33, '', '', '', 1, '10', 1612597241);
INSERT INTO `goods_cate` VALUES (44, 'Redmi 10X Pro', 'static/upload/20210206/1612597278165855800.png', '', '', 33, '', '', '', 1, '10', 1612597278);
INSERT INTO `goods_cate` VALUES (46, 'Redmi Note 9 Pro', 'static/upload/20210206/1612597377997422500.png', '', '', 33, '', '', '', 1, '10', 1612597378);
INSERT INTO `goods_cate` VALUES (47, 'Redmi Note 9 5G', 'static/upload/20210206/1612597477440858200.png', '', '', 33, '', '', '', 1, '10', 1612597477);
INSERT INTO `goods_cate` VALUES (48, 'Redmi Note 8 Pro', 'static/upload/20210206/1612597514024330800.png', '', '', 33, '', '', '', 1, '10', 1612597514);
INSERT INTO `goods_cate` VALUES (50, '家电 插线板', '', '', '', 0, '', '', '', 1, '10', 1612597594);
INSERT INTO `goods_cate` VALUES (51, '出行 穿戴', '', '', '', 0, '', '', '', 1, '10', 1612597612);
INSERT INTO `goods_cate` VALUES (52, '智能 路由器', '', '', '', 0, '', '', '', 1, '10', 1612597623);
INSERT INTO `goods_cate` VALUES (53, '电源 配件', '', '', '', 0, '', '', '', 1, '10', 1612597631);
INSERT INTO `goods_cate` VALUES (54, '健康 儿童', '', '', '', 0, '', '', '', 1, '10', 1612597639);
INSERT INTO `goods_cate` VALUES (55, '耳机 音箱', '', '', '', 0, '', '', '', 1, '10', 1612597660);
INSERT INTO `goods_cate` VALUES (56, '生活 箱包', '', '', '', 0, '', '', '', 1, '10', 1612597672);
INSERT INTO `goods_cate` VALUES (57, 'Note 9 4G', 'static/upload/20210206/1612613623931106200.png', '', '', 33, '', '', '', 1, '10', 1612613624);
INSERT INTO `goods_cate` VALUES (58, 'Redmi 9A', 'static/upload/20210206/1612613687304560400.jpg', '', '', 33, '', '', '', 1, '10', 1612613687);
INSERT INTO `goods_cate` VALUES (59, '小米透明电视', 'static/upload/20210207/1612692656558642000.png', '', '', 35, '', '', '', 1, '10', 1612692656);
INSERT INTO `goods_cate` VALUES (60, '小米电视大师 82英寸', 'static/upload/20210207/1612692696422603500.png', '', '', 35, '', '', '', 1, '10', 1612692696);
INSERT INTO `goods_cate` VALUES (61, '大师电视65英寸', 'static/upload/20210207/1612692728070331200.png', '', '', 35, '', '', '', 1, '10', 1612692728);
INSERT INTO `goods_cate` VALUES (62, 'Redmi MAX 98\"', 'static/upload/20210207/1612692757073434600.jpg', '', '', 35, '', '', '', 1, '10', 1612692757);
INSERT INTO `goods_cate` VALUES (63, '小米电视 5 Pro 55英寸', 'static/upload/20210207/1612692809473648700.png', '', '', 35, '', '', '', 1, '10', 1612692809);
INSERT INTO `goods_cate` VALUES (64, '小米电视 5 Pro 65英寸', 'static/upload/20210207/1612692986763118100.png', '', '', 35, '', '', '', 1, '10', 1612692986);
INSERT INTO `goods_cate` VALUES (65, '小米电视5 Pro 75英寸', 'static/upload/20210207/1612693006885089300.png', '', '', 35, '', '', '', 1, '10', 1612693007);
INSERT INTO `goods_cate` VALUES (66, '小米电视5 75英寸', 'static/upload/20210207/1612693024937536700.png', '', '', 35, '', '', '', 1, '10', 1612693025);
INSERT INTO `goods_cate` VALUES (67, '小米电视5 65英寸', 'static/upload/20210207/1612693050951700100.png', '', '', 35, '', '', '', 1, '10', 1612693051);
INSERT INTO `goods_cate` VALUES (68, '小米电视5 55英寸', 'static/upload/20210207/1612693069774358800.png', '', '', 35, '', '', '', 1, '10', 1612693069);
INSERT INTO `goods_cate` VALUES (69, '小米电视4A 60英寸', 'static/upload/20210207/1612693086727489000.png', '', '', 35, '', '', '', 1, '10', 1612693086);
INSERT INTO `goods_cate` VALUES (70, '小米电视4A 70英寸', 'static/upload/20210207/1612693104791656500.png', '', '', 35, '', '', '', 1, '10', 1612693104);
INSERT INTO `goods_cate` VALUES (71, 'Redmi 智能电视 A系列', 'static/upload/20210207/1612693129806650800.png', '', '', 35, '', '', '', 1, '10', 1612693129);
INSERT INTO `goods_cate` VALUES (72, '小米盒子', 'static/upload/20210207/1612693147141506200.jpg', '', '', 35, '', '', '', 1, '10', 1612693147);
INSERT INTO `goods_cate` VALUES (73, 'Redmi G 游戏本', 'static/upload/20210207/1612693198489591800.png', '', '', 36, '', '', '', 1, '10', 1612693198);
INSERT INTO `goods_cate` VALUES (74, '小米笔记本 Air 13.3\"', 'static/upload/20210207/1612693227996634900.png', '', '', 36, '', '', '', 1, '10', 1612693228);
INSERT INTO `goods_cate` VALUES (75, '键鼠套装', 'static/upload/20210207/1612693247904939100.png', '', '', 36, '', '', '', 1, '10', 1612693248);
INSERT INTO `goods_cate` VALUES (76, 'RedmiBook Air 13', 'static/upload/20210207/1612693279860904200.png', '', '', 36, '', '', '', 1, '10', 1612693280);
INSERT INTO `goods_cate` VALUES (77, '小米笔记本 Air 12.5\"', 'static/upload/20210207/1612693301845081300.jpg', '', '', 36, '', '', '', 1, '10', 1612693302);
INSERT INTO `goods_cate` VALUES (78, '鼠标', 'static/upload/20210207/1612693322780203900.png', '', '', 36, '', '', '', 1, '10', 1612693322);
INSERT INTO `goods_cate` VALUES (79, 'RedmiBook 16', 'static/upload/20210207/1612693344982281700.png', '', '', 36, '', '', '', 1, '10', 1612693345);
INSERT INTO `goods_cate` VALUES (80, '小米游戏本', 'static/upload/20210207/1612693365635307500.jpg', '', '', 36, '', '', '', 1, '10', 1612693365);
INSERT INTO `goods_cate` VALUES (81, 'RedmiBook 14', 'static/upload/20210207/1612693394723154200.png', '', '', 36, '', '', '', 1, '10', 1612693394);
INSERT INTO `goods_cate` VALUES (82, '小米显示器34英寸', 'static/upload/20210207/1612693411780018100.png', '', '', 36, '', '', '', 1, '10', 1612693411);
INSERT INTO `goods_cate` VALUES (83, '小米笔记本Pro 15.6\"', 'static/upload/20210207/1612693430091315000.png', '', '', 36, '', '', '', 1, '10', 1612693430);
INSERT INTO `goods_cate` VALUES (84, '小米显示器27英寸', 'static/upload/20210207/1612693445688975100.png', '', '', 36, '', '', '', 1, '10', 1612693445);
INSERT INTO `goods_cate` VALUES (85, 'RedmiBook 13', 'static/upload/20210207/1612693469630025500.jpg', '', '', 36, '', '', '', 1, '10', 1612693469);
INSERT INTO `goods_cate` VALUES (86, 'Redmi显示器23.8英寸', 'static/upload/20210207/1612693487205387200.png', '', '', 36, '', '', '', 1, '10', 1612693487);
INSERT INTO `goods_cate` VALUES (87, '冰箱', 'static/upload/20210207/1612693529634456600.jpg', '', '', 50, '', '', '', 1, '10', 1612693529);
INSERT INTO `goods_cate` VALUES (88, '微波炉', 'static/upload/20210207/1612693541728262400.jpg', '', '', 50, '', '', '', 1, '10', 1612693541);
INSERT INTO `goods_cate` VALUES (89, '电磁炉', 'static/upload/20210207/1612693552073810200.jpg', '', '', 50, '', '', '', 1, '10', 1612693552);
INSERT INTO `goods_cate` VALUES (90, '插线板', 'static/upload/20210207/1612693567459663800.jpg', '', '', 50, '', '', '', 1, '10', 1612693567);
INSERT INTO `goods_cate` VALUES (91, '立式空调', 'static/upload/20210207/1612693596382943200.png', '', '', 50, '', '', '', 1, '10', 1612693596);
INSERT INTO `goods_cate` VALUES (92, '电烤箱', 'static/upload/20210207/1612693617363051700.jpg', '', '', 50, '', '', '', 1, '10', 1612693617);
INSERT INTO `goods_cate` VALUES (93, '电水壶', 'static/upload/20210207/1612693637054933600.jpg', '', '', 50, '', '', '', 1, '10', 1612693637);
INSERT INTO `goods_cate` VALUES (94, '新风机', 'static/upload/20210207/1612693652249396300.jpg', '', '', 50, '', '', '', 1, '10', 1612693652);
INSERT INTO `goods_cate` VALUES (95, '壁挂空调', 'static/upload/20210207/1612693681395305100.png', '', '', 50, '', '', '', 1, '10', 1612693681);
INSERT INTO `goods_cate` VALUES (96, '扫地机器人', 'static/upload/20210207/1612693698055968700.jpg', '', '', 50, '', '', '', 1, '10', 1612693698);
INSERT INTO `goods_cate` VALUES (97, '滤水壶', 'static/upload/20210207/1612693727118465400.jpg', '', '', 50, '', '', '', 1, '10', 1612693727);
INSERT INTO `goods_cate` VALUES (98, '电暖器', 'static/upload/20210207/1612693748916256700.jpg', '', '', 50, '', '', '', 1, '10', 1612693749);
INSERT INTO `goods_cate` VALUES (99, '滚筒洗衣机', 'static/upload/20210207/1612693765387530000.png', '', '', 50, '', '', '', 1, '10', 1612693765);
INSERT INTO `goods_cate` VALUES (100, '吸尘器', 'static/upload/20210207/1612693781861568000.jpg', '', '', 50, '', '', '', 1, '10', 1612693782);
INSERT INTO `goods_cate` VALUES (101, 'Redmi 手表', 'static/upload/20210207/1612693821751234700.png', '', '', 51, '', '', '', 1, '10', 1612693821);
INSERT INTO `goods_cate` VALUES (102, '自行车', 'static/upload/20210207/1612693841930955500.png', '', '', 51, '', '', '', 1, '10', 1612693842);
INSERT INTO `goods_cate` VALUES (103, '无线车充', 'static/upload/20210207/1612693853347235100.jpg', '', '', 51, '', '', '', 1, '10', 1612693853);
INSERT INTO `goods_cate` VALUES (104, '手环5NFC', 'static/upload/20210207/1612693877647527300.png', '', '', 51, '', '', '', 1, '10', 1612693877);
INSERT INTO `goods_cate` VALUES (105, '滑板车', 'static/upload/20210207/1612693897916050200.jpg', '', '', 51, '', '', '', 1, '10', 1612693898);
INSERT INTO `goods_cate` VALUES (106, '充气宝', 'static/upload/20210207/1612693928446409100.jpg', '', '', 51, '', '', '', 1, '10', 1612693928);
INSERT INTO `goods_cate` VALUES (107, '手环5', 'static/upload/20210207/1612693941508823200.png', '', '', 51, '', '', '', 1, '10', 1612693941);
INSERT INTO `goods_cate` VALUES (108, '车载充电器', 'static/upload/20210207/1612693954717967600.jpg', '', '', 51, '', '', '', 1, '10', 1612693954);
INSERT INTO `goods_cate` VALUES (109, '石英表', 'static/upload/20210207/1612693967095139000.jpg', '', '', 51, '', '', '', 1, '10', 1612693967);
INSERT INTO `goods_cate` VALUES (110, '小米手表', 'static/upload/20210207/1612693984686878900.png', '', '', 51, '', '', '', 1, '10', 1612693984);
INSERT INTO `goods_cate` VALUES (111, '平衡车配件', 'static/upload/20210207/1612693999095698100.jpg', '', '', 51, '', '', '', 1, '10', 1612693999);
INSERT INTO `goods_cate` VALUES (112, 'VR', 'static/upload/20210207/1612694008887354100.jpg', '', '', 51, '', '', '', 1, '10', 1612694009);
INSERT INTO `goods_cate` VALUES (113, '智能后视镜', 'static/upload/20210207/1612694025994116600.jpg', '', '', 51, '', '', '', 1, '10', 1612694026);
INSERT INTO `goods_cate` VALUES (114, '平衡车', 'static/upload/20210207/1612694037325910900.jpg', '', '', 51, '', '', '', 1, '10', 1612694037);
INSERT INTO `goods_cate` VALUES (115, '打印机', 'static/upload/20210207/1612694094165792200.jpg', '', '', 52, '', '', '', 1, '10', 1612694094);
INSERT INTO `goods_cate` VALUES (116, '摄像机', 'static/upload/20210207/1612694113287310100.jpg', '', '', 52, '', '', '', 1, '10', 1612694113);
INSERT INTO `goods_cate` VALUES (117, '小爱音箱', 'static/upload/20210207/1612694139107598800.jpg', '', '', 52, '', '', '', 1, '10', 1612694139);
INSERT INTO `goods_cate` VALUES (118, '喷墨打印机', 'static/upload/20210207/1612694154217975200.png', '', '', 52, '', '', '', 1, '10', 1612694154);
INSERT INTO `goods_cate` VALUES (119, '照相机', 'static/upload/20210207/1612694165751173200.jpg', '', '', 52, '', '', '', 1, '10', 1612694165);
INSERT INTO `goods_cate` VALUES (120, '智能门锁', 'static/upload/20210207/1612694189570597300.jpg', '', '', 52, '', '', '', 1, '10', 1612694189);
INSERT INTO `goods_cate` VALUES (121, '小米路由器', 'static/upload/20210207/1612694203589087800.png', '', '', 52, '', '', '', 1, '10', 1612694203);
INSERT INTO `goods_cate` VALUES (122, '视频门铃', 'static/upload/20210207/1612694214374037800.jpg', '', '', 52, '', '', '', 1, '10', 1612694214);
INSERT INTO `goods_cate` VALUES (123, '智能家庭', 'static/upload/20210207/1612694224982642800.jpg', '', '', 52, '', '', '', 1, '10', 1612694225);
INSERT INTO `goods_cate` VALUES (124, '小爱老师', 'static/upload/20210207/1612694235506240900.png', '', '', 52, '', '', '', 1, '10', 1612694235);
INSERT INTO `goods_cate` VALUES (125, '对讲机', 'static/upload/20210207/1612694252707093100.jpg', '', '', 52, '', '', '', 1, '10', 1612694252);
INSERT INTO `goods_cate` VALUES (126, 'Redmi路由器', 'static/upload/20210207/1612694269174535300.png', '', '', 52, '', '', '', 1, '10', 1612694269);
INSERT INTO `goods_cate` VALUES (127, '云服务空间年卡', 'static/upload/20210207/1612694286998234500.png', '', '', 52, '', '', '', 1, '10', 1612694287);
INSERT INTO `goods_cate` VALUES (128, '云服务空间月卡', 'static/upload/20210207/1612694301707821800.png', '', '', 52, '', '', '', 1, '10', 1612694301);
INSERT INTO `goods_cate` VALUES (129, '移动电源', 'static/upload/20210207/1612694375494058000.png', '', '', 53, '', '', '', 1, '10', 1612694375);
INSERT INTO `goods_cate` VALUES (130, '手机壳', 'static/upload/20210207/1612694386504220400.jpg', '', '', 53, '', '', '', 1, '10', 1612694386);
INSERT INTO `goods_cate` VALUES (131, '数据线', 'static/upload/20210207/1612694396634587400.jpg', '', '', 53, '', '', '', 1, '10', 1612694396);
INSERT INTO `goods_cate` VALUES (132, '手机贴膜', 'static/upload/20210207/1612694409387536900.jpg', '', '', 53, '', '', '', 1, '10', 1612694409);
INSERT INTO `goods_cate` VALUES (133, '车充', 'static/upload/20210207/1612694420576406500.jpg', '', '', 53, '', '', '', 1, '10', 1612694420);
INSERT INTO `goods_cate` VALUES (134, '无线充电器', 'static/upload/20210207/1612694436352018600.png', '', '', 53, '', '', '', 1, '10', 1612694436);
INSERT INTO `goods_cate` VALUES (135, '充电器', 'static/upload/20210207/1612694447365410800.png', '', '', 53, '', '', '', 1, '10', 1612694447);
INSERT INTO `goods_cate` VALUES (136, '平板配件', 'static/upload/20210207/1612694462090512200.jpg', '', '', 53, '', '', '', 1, '10', 1612694462);
INSERT INTO `goods_cate` VALUES (137, '电池', 'static/upload/20210207/1612694473768684300.jpg', '', '', 53, '', '', '', 1, '10', 1612694473);
INSERT INTO `goods_cate` VALUES (138, '黑鲨配件', 'static/upload/20210207/1612694488990234500.jpg', '', '', 53, '', '', '', 1, '10', 1612694489);
INSERT INTO `goods_cate` VALUES (139, '自拍杆', 'static/upload/20210207/1612694506096512300.jpg', '', '', 53, '', '', '', 1, '10', 1612694506);
INSERT INTO `goods_cate` VALUES (140, '其他配件', 'static/upload/20210207/1612694517256301900.jpg', '', '', 53, '', '', '', 1, '10', 1612694517);
INSERT INTO `goods_cate` VALUES (141, '洗手机', 'static/upload/20210207/1612698685556347000.jpg', '', '', 54, '', '', '', 1, '10', 1612698685);
INSERT INTO `goods_cate` VALUES (142, '体脂秤', 'static/upload/20210207/1612698706183320900.jpg', '', '', 54, '', '', '', 1, '10', 1612698706);
INSERT INTO `goods_cate` VALUES (143, '儿童书包', 'static/upload/20210207/1612698730013850000.jpg', '', '', 54, '', '', '', 1, '10', 1612698730);
INSERT INTO `goods_cate` VALUES (144, '剃须刀', 'static/upload/20210207/1612698741247702400.jpg', '', '', 54, '', '', '', 1, '10', 1612698741);
INSERT INTO `goods_cate` VALUES (145, '早教启智', 'static/upload/20210207/1612698765868146700.jpg', '', '', 54, '', '', '', 1, '10', 1612698766);
INSERT INTO `goods_cate` VALUES (146, '健身车', 'static/upload/20210207/1612698781400386300.png', '', '', 54, '', '', '', 1, '10', 1612698781);
INSERT INTO `goods_cate` VALUES (147, '修剪器', 'static/upload/20210207/1612698794598024000.jpg', '', '', 54, '', '', '', 1, '10', 1612698794);
INSERT INTO `goods_cate` VALUES (148, '益智积木', 'static/upload/20210207/1612698816150155200.png', '', '', 54, '', '', '', 1, '10', 1612698816);
INSERT INTO `goods_cate` VALUES (149, '走步机', 'static/upload/20210207/1612698829731899500.jpg', '', '', 54, '', '', '', 1, '10', 1612698829);
INSERT INTO `goods_cate` VALUES (150, '牙刷', 'static/upload/20210207/1612698838125039500.jpg', '', '', 54, '', '', '', 1, '10', 1612698838);
INSERT INTO `goods_cate` VALUES (151, '儿童手表', 'static/upload/20210207/1612698849974771400.jpg', '', '', 54, '', '', '', 1, '10', 1612698850);
INSERT INTO `goods_cate` VALUES (152, '智能遥控车', 'static/upload/20210207/1612698860631809100.png', '', '', 54, '', '', '', 1, '10', 1612698860);
INSERT INTO `goods_cate` VALUES (153, '吹风机', 'static/upload/20210207/1612698871660721100.jpg', '', '', 54, '', '', '', 1, '10', 1612698871);
INSERT INTO `goods_cate` VALUES (154, '儿童滑板车', 'static/upload/20210207/1612698887148526800.jpg', '', '', 54, '', '', '', 1, '10', 1612698887);
INSERT INTO `goods_cate` VALUES (155, '小爱音箱 Art 电池版', 'static/upload/20210207/1612698929956463100.png', '', '', 55, '', '', '', 1, '10', 1612698930);
INSERT INTO `goods_cate` VALUES (156, 'Redmi音箱', 'static/upload/20210207/1612698948419318800.png', '', '', 55, '', '', '', 1, '10', 1612698948);
INSERT INTO `goods_cate` VALUES (157, '蓝牙音箱', 'static/upload/20210207/1612698976750570400.png', '', '', 55, '', '', '', 1, '10', 1612698976);
INSERT INTO `goods_cate` VALUES (158, '小爱触屏音箱Pro 8', 'static/upload/20210207/1612699040877663100.png', '', '', 55, '', '', '', 1, '10', 1612699041);
INSERT INTO `goods_cate` VALUES (159, '小米小爱音箱 Play', 'static/upload/20210207/1612699064595472900.jpg', '', '', 55, '', '', '', 1, '10', 1612699064);
INSERT INTO `goods_cate` VALUES (160, '小米AI音箱', 'static/upload/20210207/1612699117629976500.jpg', '', '', 55, '', '', '', 1, '10', 1612699117);
INSERT INTO `goods_cate` VALUES (161, '小米小爱音箱HD', 'static/upload/20210207/1612699159455003000.jpg', '', '', 55, '', '', '', 1, '10', 1612699159);
INSERT INTO `goods_cate` VALUES (162, '小爱音箱 Pro', 'static/upload/20210207/1612699177326079300.png', '', '', 55, '', '', '', 1, '10', 1612699177);
INSERT INTO `goods_cate` VALUES (163, '小米小爱触屏音箱', 'static/upload/20210207/1612699221498684100.jpg', '', '', 55, '', '', '', 1, '10', 1612699221);
INSERT INTO `goods_cate` VALUES (164, '线控耳机', 'static/upload/20210207/1612699237764744400.jpg', '', '', 55, '', '', '', 1, '10', 1612699237);
INSERT INTO `goods_cate` VALUES (165, '蓝牙耳机', 'static/upload/20210207/1612699247706747900.png', '', '', 55, '', '', '', 1, '10', 1612699247);
INSERT INTO `goods_cate` VALUES (166, '头戴耳机', 'static/upload/20210207/1612699261020199500.jpg', '', '', 55, '', '', '', 1, '10', 1612699261);
INSERT INTO `goods_cate` VALUES (167, '品牌耳机', 'static/upload/20210207/1612699274070244800.jpg', '', '', 55, '', '', '', 1, '10', 1612699274);
INSERT INTO `goods_cate` VALUES (168, '小背包', 'static/upload/20210207/1612699345734232200.jpg', '', '', 56, '', '', '', 1, '10', 1612699345);
INSERT INTO `goods_cate` VALUES (170, '米兔', 'static/upload/20210207/1612699368137760700.png', '', '', 56, '', '', '', 1, '10', 1612699368);
INSERT INTO `goods_cate` VALUES (171, '双肩包', 'static/upload/20210207/1612699433205043800.jpg', '', '', 56, '', '', '', 1, '10', 1612699433);
INSERT INTO `goods_cate` VALUES (172, '枕头', 'static/upload/20210207/1612699444929721900.png', '', '', 56, '', '', '', 1, '10', 1612699445);
INSERT INTO `goods_cate` VALUES (173, '笔', 'static/upload/20210207/1612699456328649700.jpg', '', '', 56, '', '', '', 1, '10', 1612699456);
INSERT INTO `goods_cate` VALUES (174, '胸包', 'static/upload/20210207/1612699467105309600.jpg', '', '', 56, '', '', '', 1, '10', 1612699467);
INSERT INTO `goods_cate` VALUES (175, '螺丝刀', 'static/upload/20210207/1612699479862578600.jpg', '', '', 56, '', '', '', 1, '10', 1612699479);
INSERT INTO `goods_cate` VALUES (176, '旅行箱', 'static/upload/20210207/1612699498795307000.jpg', '', '', 56, '', '', '', 1, '10', 1612699498);
INSERT INTO `goods_cate` VALUES (177, '保温杯', 'static/upload/20210207/1612699508661993300.jpg', '', '', 56, '', '', '', 1, '10', 1612699508);
INSERT INTO `goods_cate` VALUES (178, '运动鞋', 'static/upload/20210207/1612699519710301400.jpg', '', '', 56, '', '', '', 1, '10', 1612699519);
INSERT INTO `goods_cate` VALUES (179, '驱蚊器', 'static/upload/20210207/1612699531081259700.jpg', '', '', 56, '', '', '', 1, '10', 1612699531);
INSERT INTO `goods_cate` VALUES (180, '眼镜', 'static/upload/20210207/1612699543545762800.jpg', '', '', 56, '', '', '', 1, '10', 1612699543);
INSERT INTO `goods_cate` VALUES (181, '小米MIX Alpha', 'static/upload/20210207/1612702836050216300.jpg', '', '', 33, '', '', '', 0, '10', 1612702836);

-- ----------------------------
-- Table structure for goods_color
-- ----------------------------
DROP TABLE IF EXISTS `goods_color`;
CREATE TABLE `goods_color`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `color_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `color_value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods_color
-- ----------------------------
INSERT INTO `goods_color` VALUES (1, '紫色', '#CCCCFF', 1);
INSERT INTO `goods_color` VALUES (2, '黑色', '#000', 1);
INSERT INTO `goods_color` VALUES (3, '黄色', 'yellow', 1);
INSERT INTO `goods_color` VALUES (4, '蓝色', '#99CCFF', 1);
INSERT INTO `goods_color` VALUES (5, '灰色', '#eee', 1);
INSERT INTO `goods_color` VALUES (6, '白色', 'white', 1);

-- ----------------------------
-- Table structure for goods_image
-- ----------------------------
DROP TABLE IF EXISTS `goods_image`;
CREATE TABLE `goods_image`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NULL DEFAULT NULL,
  `img_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `color_id` int(11) NULL DEFAULT NULL,
  `sort` int(11) NULL DEFAULT NULL,
  `add_time` int(11) NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 121 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods_image
-- ----------------------------
INSERT INTO `goods_image` VALUES (1, 1, 'static/upload/20210203/1612333739872657800.jpg', 2, 10, 1612333742, 1);
INSERT INTO `goods_image` VALUES (5, 1, 'static/upload/20210205/1612515527872402300.jpg', 0, 10, 1612515529, 1);
INSERT INTO `goods_image` VALUES (6, 15, 'static/upload/20210206/1612592703106359600.jpg', 0, 10, 1612592704, 1);
INSERT INTO `goods_image` VALUES (7, 17, 'static/upload/20210206/1612610845186532400.jpg', 0, 10, 1612610846, 1);
INSERT INTO `goods_image` VALUES (8, 17, 'static/upload/20210206/1612610845162631100.jpg', 0, 10, 1612610846, 1);
INSERT INTO `goods_image` VALUES (9, 17, 'static/upload/20210206/1612610845211465800.jpg', 0, 10, 1612610846, 1);
INSERT INTO `goods_image` VALUES (10, 18, 'static/upload/20210206/1612611218745403800.jpg', 0, 10, 1612611221, 1);
INSERT INTO `goods_image` VALUES (11, 18, 'static/upload/20210206/1612611218768342100.jpg', 0, 10, 1612611221, 1);
INSERT INTO `goods_image` VALUES (12, 18, 'static/upload/20210206/1612611218724460400.jpg', 0, 10, 1612611221, 1);
INSERT INTO `goods_image` VALUES (13, 18, 'static/upload/20210206/1612611218988756900.jpg', 0, 10, 1612611221, 1);
INSERT INTO `goods_image` VALUES (14, 18, 'static/upload/20210206/1612611219011695300.jpg', 0, 10, 1612611221, 1);
INSERT INTO `goods_image` VALUES (15, 18, 'static/upload/20210206/1612611218970804600.jpg', 0, 10, 1612611221, 1);
INSERT INTO `goods_image` VALUES (16, 19, 'static/upload/20210206/1612611469780770500.jpg', 0, 10, 1612611471, 1);
INSERT INTO `goods_image` VALUES (17, 19, 'static/upload/20210206/1612611469759861100.jpg', 0, 10, 1612611471, 1);
INSERT INTO `goods_image` VALUES (18, 20, 'static/upload/20210206/1612611643833452600.jpg', 0, 10, 1612611646, 1);
INSERT INTO `goods_image` VALUES (19, 20, 'static/upload/20210206/1612611643808519400.jpg', 0, 10, 1612611646, 1);
INSERT INTO `goods_image` VALUES (20, 21, 'static/upload/20210206/1612614140183989400.jpg', 0, 10, 1612614141, 1);
INSERT INTO `goods_image` VALUES (21, 21, 'static/upload/20210206/1612614140159068900.jpg', 0, 10, 1612614141, 1);
INSERT INTO `goods_image` VALUES (22, 22, 'static/upload/20210206/1612614379565748100.jpg', 0, 10, 1612614381, 1);
INSERT INTO `goods_image` VALUES (23, 22, 'static/upload/20210206/1612614379588019500.jpg', 0, 10, 1612614381, 1);
INSERT INTO `goods_image` VALUES (24, 23, 'static/upload/20210206/1612614727144258000.jpg', 0, 10, 1612614728, 1);
INSERT INTO `goods_image` VALUES (25, 23, 'static/upload/20210206/1612614727170192100.jpg', 0, 10, 1612614728, 1);
INSERT INTO `goods_image` VALUES (26, 24, 'static/upload/20210206/1612614871889522300.jpg', 0, 10, 1612614873, 1);
INSERT INTO `goods_image` VALUES (27, 24, 'static/upload/20210206/1612614871867558100.jpg', 0, 10, 1612614873, 1);
INSERT INTO `goods_image` VALUES (28, 61, 'static/upload/20210206/1612610845186532400.jpg', 0, 10, 1612610846, 1);
INSERT INTO `goods_image` VALUES (29, 61, 'static/upload/20210206/1612610845162631100.jpg', 0, 10, 1612610846, 1);
INSERT INTO `goods_image` VALUES (30, 61, 'static/upload/20210206/1612610845211465800.jpg', 0, 10, 1612610846, 1);
INSERT INTO `goods_image` VALUES (36, 17, 'static/upload/20210209/1612850303966305500.jpg', 2, 10, 1612850305, 1);
INSERT INTO `goods_image` VALUES (37, 17, 'static/upload/20210209/1612850303904734800.jpg', 2, 10, 1612850305, 1);
INSERT INTO `goods_image` VALUES (38, 17, 'static/upload/20210209/1612850303950348800.jpg', 2, 10, 1612850305, 1);
INSERT INTO `goods_image` VALUES (39, 17, 'static/upload/20210209/1612850304130526100.jpg', 2, 10, 1612850305, 1);
INSERT INTO `goods_image` VALUES (40, 17, 'static/upload/20210209/1612850304155427700.jpg', 2, 10, 1612850305, 1);
INSERT INTO `goods_image` VALUES (41, 17, 'static/upload/20210209/1612851280052539600.jpg', 4, 10, 1612851281, 1);
INSERT INTO `goods_image` VALUES (42, 17, 'static/upload/20210209/1612851280034374100.jpg', 4, 10, 1612851281, 1);
INSERT INTO `goods_image` VALUES (43, 17, 'static/upload/20210209/1612851280069013800.jpg', 4, 10, 1612851281, 1);
INSERT INTO `goods_image` VALUES (44, 17, 'static/upload/20210209/1612851280285716500.jpg', 4, 10, 1612851281, 1);
INSERT INTO `goods_image` VALUES (45, 17, 'static/upload/20210209/1612851280347725600.jpg', 4, 10, 1612851281, 1);
INSERT INTO `goods_image` VALUES (46, 17, 'static/upload/20210209/1612851424282191600.jpg', 1, 10, 1612851425, 1);
INSERT INTO `goods_image` VALUES (47, 17, 'static/upload/20210209/1612851424315308600.jpg', 1, 10, 1612851425, 1);
INSERT INTO `goods_image` VALUES (48, 17, 'static/upload/20210209/1612851424299342100.jpg', 1, 10, 1612851425, 1);
INSERT INTO `goods_image` VALUES (49, 17, 'static/upload/20210209/1612851424508559100.jpg', 1, 10, 1612851425, 1);
INSERT INTO `goods_image` VALUES (50, 17, 'static/upload/20210209/1612851424487544100.jpg', 1, 10, 1612851425, 1);
INSERT INTO `goods_image` VALUES (51, 17, 'static/upload/20210209/1612851769333611300.jpg ', 6, 10, 1612851770, 1);
INSERT INTO `goods_image` VALUES (52, 17, 'static/upload/20210209/1612851769348571200.jpg', 6, 10, 1612851770, 1);
INSERT INTO `goods_image` VALUES (53, 17, 'static/upload/20210209/1612851769313664400.jpg', 6, 10, 1612851770, 1);
INSERT INTO `goods_image` VALUES (54, 17, 'static/upload/20210209/1612851769510829400.jpg', 6, 10, 1612851770, 1);
INSERT INTO `goods_image` VALUES (55, 17, 'static/upload/20210209/1612851769537244000.jpg', 6, 10, 1612851770, 1);
INSERT INTO `goods_image` VALUES (56, 62, 'static/upload/20210216/1613463879669363000.jpg', 0, 10, 1613463881, 1);
INSERT INTO `goods_image` VALUES (57, 62, 'static/upload/20210216/1613463879684294900.jpg', 2, 10, 1613463881, 1);
INSERT INTO `goods_image` VALUES (58, 62, 'static/upload/20210216/1613463879708532800.jpg', 0, 10, 1613463881, 1);
INSERT INTO `goods_image` VALUES (59, 62, 'static/upload/20210216/1613463909183098300.jpg', 2, 10, 1613463910, 1);
INSERT INTO `goods_image` VALUES (60, 62, 'static/upload/20210216/1613463909165873900.jpg', 2, 10, 1613463910, 1);
INSERT INTO `goods_image` VALUES (61, 63, 'static/upload/20210216/1613465107388446000.jpg', 2, 10, 1613465108, 1);
INSERT INTO `goods_image` VALUES (62, 63, 'static/upload/20210216/1613465107407359700.jpg', 2, 10, 1613465108, 1);
INSERT INTO `goods_image` VALUES (63, 63, 'static/upload/20210216/1613465107369461100.jpg', 0, 10, 1613465108, 1);
INSERT INTO `goods_image` VALUES (64, 63, 'static/upload/20210216/1613465107628971800.jpg', 0, 10, 1613465108, 1);
INSERT INTO `goods_image` VALUES (65, 63, 'static/upload/20210216/1613465107652928500.jpg', 2, 10, 1613465108, 1);
INSERT INTO `goods_image` VALUES (66, 64, 'static/upload/20210216/1613465313151684100.jpg', 2, 10, 1613465314, 1);
INSERT INTO `goods_image` VALUES (67, 64, 'static/upload/20210216/1613465313131738400.jpg', 0, 10, 1613465314, 1);
INSERT INTO `goods_image` VALUES (68, 64, 'static/upload/20210216/1613465313108474000.jpg', 0, 10, 1613465314, 1);
INSERT INTO `goods_image` VALUES (69, 64, 'static/upload/20210216/1613465313355971300.jpg', 2, 10, 1613465314, 1);
INSERT INTO `goods_image` VALUES (70, 64, 'static/upload/20210216/1613465313405674500.jpg', 2, 10, 1613465314, 1);
INSERT INTO `goods_image` VALUES (71, 65, 'static/upload/20210216/1613465569492253300.jpg', 0, 10, 1613465571, 1);
INSERT INTO `goods_image` VALUES (72, 65, 'static/upload/20210216/1613465569471194600.jpg', 6, 10, 1613465571, 1);
INSERT INTO `goods_image` VALUES (73, 66, 'static/upload/20210216/1613465877223334200.jpg', 6, 10, 1613465878, 1);
INSERT INTO `goods_image` VALUES (74, 66, 'static/upload/20210216/1613465877200408200.jpg', 6, 10, 1613465878, 1);
INSERT INTO `goods_image` VALUES (75, 66, 'static/upload/20210216/1613465877243280300.jpg', 0, 10, 1613465878, 1);
INSERT INTO `goods_image` VALUES (76, 66, 'static/upload/20210216/1613465877455863400.jpg', 0, 10, 1613465878, 1);
INSERT INTO `goods_image` VALUES (77, 67, 'static/upload/20210216/1613466014221218900.jpg', 0, 10, 1613466015, 1);
INSERT INTO `goods_image` VALUES (78, 67, 'static/upload/20210216/1613466014252135300.jpg', 6, 10, 1613466015, 1);
INSERT INTO `goods_image` VALUES (79, 67, 'static/upload/20210216/1613466014279063700.jpg', 0, 10, 1613466015, 1);
INSERT INTO `goods_image` VALUES (80, 68, 'static/upload/20210216/1613466880034755200.jpg', 0, 10, 1613466885, 1);
INSERT INTO `goods_image` VALUES (81, 68, 'static/upload/20210216/1613466892064364200.jpg', 2, 10, 1613466892, 1);
INSERT INTO `goods_image` VALUES (82, 69, 'static/upload/20210216/1613466988965489900.png', 0, 10, 1613466991, 1);
INSERT INTO `goods_image` VALUES (83, 69, 'static/upload/20210216/1613466988946542900.png', 6, 10, 1613466991, 1);
INSERT INTO `goods_image` VALUES (84, 69, 'static/upload/20210216/1613466988953522600.png', 0, 10, 1613466991, 1);
INSERT INTO `goods_image` VALUES (85, 70, 'static/upload/20210217/1613553954613225900.jpg', 6, 10, 1613553956, 1);
INSERT INTO `goods_image` VALUES (86, 70, 'static/upload/20210217/1613553954628171200.jpg', 0, 10, 1613553956, 1);
INSERT INTO `goods_image` VALUES (87, 70, 'static/upload/20210217/1613553954649834200.jpg', 6, 10, 1613553956, 1);
INSERT INTO `goods_image` VALUES (88, 70, 'static/upload/20210217/1613553955055889600.jpg', 0, 10, 1613553956, 1);
INSERT INTO `goods_image` VALUES (89, 70, 'static/upload/20210217/1613553955076305700.jpg', 6, 10, 1613553956, 1);
INSERT INTO `goods_image` VALUES (90, 70, 'static/upload/20210217/1613553955121272000.jpg', 0, 10, 1613553956, 1);
INSERT INTO `goods_image` VALUES (91, 71, 'static/upload/20210217/1613554158928247000.jpg', 6, 10, 1613554160, 1);
INSERT INTO `goods_image` VALUES (92, 71, 'static/upload/20210217/1613554158907568200.jpg', 0, 10, 1613554160, 1);
INSERT INTO `goods_image` VALUES (93, 71, 'static/upload/20210217/1613554158885490500.jpg', 0, 10, 1613554160, 1);
INSERT INTO `goods_image` VALUES (94, 71, 'static/upload/20210217/1613554159083798500.jpg', 6, 10, 1613554160, 1);
INSERT INTO `goods_image` VALUES (95, 71, 'static/upload/20210217/1613554159132056300.jpg', 6, 10, 1613554160, 1);
INSERT INTO `goods_image` VALUES (96, 71, 'static/upload/20210217/1613554159102601800.jpg', 0, 10, 1613554160, 1);
INSERT INTO `goods_image` VALUES (97, 72, 'static/upload/20210217/1613554278244167500.jpg', 6, 10, 1613554279, 1);
INSERT INTO `goods_image` VALUES (98, 72, 'static/upload/20210217/1613554278225566100.jpg', 0, 10, 1613554279, 1);
INSERT INTO `goods_image` VALUES (99, 72, 'static/upload/20210217/1613554278266361300.jpg', 6, 10, 1613554279, 1);
INSERT INTO `goods_image` VALUES (100, 72, 'static/upload/20210217/1613554278427665000.jpg', 0, 10, 1613554279, 1);
INSERT INTO `goods_image` VALUES (101, 72, 'static/upload/20210217/1613554278459408100.jpg', 0, 10, 1613554279, 1);
INSERT INTO `goods_image` VALUES (102, 73, 'static/upload/20210217/1613554406196978900.jpg', 0, 10, 1613554407, 1);
INSERT INTO `goods_image` VALUES (103, 73, 'static/upload/20210217/1613554406146751200.jpg', 6, 10, 1613554407, 1);
INSERT INTO `goods_image` VALUES (104, 74, 'static/upload/20210217/1613554518287781300.jpg', 2, 10, 1613554521, 1);
INSERT INTO `goods_image` VALUES (105, 74, 'static/upload/20210217/1613554518336167300.jpg', 2, 10, 1613554521, 1);
INSERT INTO `goods_image` VALUES (106, 74, 'static/upload/20210217/1613554518311461600.jpg', 0, 10, 1613554521, 1);
INSERT INTO `goods_image` VALUES (107, 74, 'static/upload/20210217/1613554518564791300.jpg', 0, 10, 1613554521, 1);
INSERT INTO `goods_image` VALUES (108, 74, 'static/upload/20210217/1613554518530047600.jpg', 0, 10, 1613554521, 1);
INSERT INTO `goods_image` VALUES (109, 74, 'static/upload/20210217/1613554518598994900.jpg', 2, 10, 1613554521, 1);
INSERT INTO `goods_image` VALUES (110, 75, 'static/upload/20210217/1613554661685064500.jpg', 2, 10, 1613554663, 1);
INSERT INTO `goods_image` VALUES (111, 75, 'static/upload/20210217/1613554661661490300.jpg', 2, 10, 1613554663, 1);
INSERT INTO `goods_image` VALUES (112, 75, 'static/upload/20210217/1613554661708161700.jpg', 0, 10, 1613554663, 1);
INSERT INTO `goods_image` VALUES (113, 75, 'static/upload/20210217/1613554661903494100.jpg', 0, 10, 1613554663, 1);
INSERT INTO `goods_image` VALUES (114, 75, 'static/upload/20210217/1613554661949122000.jpg', 0, 10, 1613554663, 1);
INSERT INTO `goods_image` VALUES (115, 76, 'static/upload/20210217/1613554755827288200.jpg', 2, 10, 1613554757, 1);
INSERT INTO `goods_image` VALUES (116, 76, 'static/upload/20210217/1613554755869959400.jpg', 0, 10, 1613554757, 1);
INSERT INTO `goods_image` VALUES (117, 76, 'static/upload/20210217/1613554755847527200.jpg', 0, 10, 1613554757, 1);
INSERT INTO `goods_image` VALUES (118, 76, 'static/upload/20210217/1613554756124601600.jpg', 2, 10, 1613554757, 1);
INSERT INTO `goods_image` VALUES (119, 77, 'static/upload/20210217/1613554848273435900.jpg', 2, 10, 1613554849, 1);
INSERT INTO `goods_image` VALUES (120, 77, 'static/upload/20210217/1613554848250401200.jpg', 0, 10, 1613554849, 1);

-- ----------------------------
-- Table structure for goods_type
-- ----------------------------
DROP TABLE IF EXISTS `goods_type`;
CREATE TABLE `goods_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL,
  `add_time` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods_type
-- ----------------------------
INSERT INTO `goods_type` VALUES (1, '手机', '手机', 1, 1582120088);
INSERT INTO `goods_type` VALUES (2, '电脑', '电脑', 1, 1582120130);
INSERT INTO `goods_type` VALUES (3, '笔记本', '笔记本', 1, 1582120143);
INSERT INTO `goods_type` VALUES (4, '路由器', '路由器', 1, 1591784140);

-- ----------------------------
-- Table structure for goods_type_attribute
-- ----------------------------
DROP TABLE IF EXISTS `goods_type_attribute`;
CREATE TABLE `goods_type_attribute`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cate_id` int(11) NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `attr_type` tinyint(1) NULL DEFAULT NULL,
  `attr_value` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT NULL,
  `sort` int(11) NULL DEFAULT NULL,
  `add_time` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods_type_attribute
-- ----------------------------
INSERT INTO `goods_type_attribute` VALUES (1, 1, '基本信息', 1, '', 1, 10, 1582358795);
INSERT INTO `goods_type_attribute` VALUES (2, 2, '主体', 1, '', 1, NULL, 1582361589);
INSERT INTO `goods_type_attribute` VALUES (3, 2, '内存', 1, '', 1, NULL, 1582361598);
INSERT INTO `goods_type_attribute` VALUES (4, 2, '硬盘', 1, '', 1, NULL, 1582361780);
INSERT INTO `goods_type_attribute` VALUES (5, 2, '显示器', 1, '', 1, NULL, 1582361804);
INSERT INTO `goods_type_attribute` VALUES (6, 2, '支持蓝牙', 3, '是\r\n否', 1, NULL, 1582362691);
INSERT INTO `goods_type_attribute` VALUES (7, 1, '性能	', 2, '', 1, 111, 1591844598);
INSERT INTO `goods_type_attribute` VALUES (8, 1, '相机', 2, '', 1, 0, 1591844635);
INSERT INTO `goods_type_attribute` VALUES (9, 1, '支持蓝牙', 3, '是\r\n否', 1, 0, 1591844649);
INSERT INTO `goods_type_attribute` VALUES (10, 1, '屏幕', 2, '', 1, 0, 1591844675);
INSERT INTO `goods_type_attribute` VALUES (11, 1, '外观', 2, '', 1, 0, 1591844688);
INSERT INTO `goods_type_attribute` VALUES (12, 1, '电池', 1, '', 1, 0, 1591844695);
INSERT INTO `goods_type_attribute` VALUES (13, 4, '品牌', 1, '', 1, 0, 1591851350);
INSERT INTO `goods_type_attribute` VALUES (14, 3, '硬盘', 1, '', 1, 0, 1591851429);
INSERT INTO `goods_type_attribute` VALUES (15, 3, '内存', 1, '', 1, 0, 1591851442);
INSERT INTO `goods_type_attribute` VALUES (16, 3, '尺寸', 3, '14寸\r\n15寸', 1, 0, 1591851471);

-- ----------------------------
-- Table structure for manager
-- ----------------------------
DROP TABLE IF EXISTS `manager`;
CREATE TABLE `manager`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `password` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `mobile` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT 1,
  `role_id` int(11) NULL DEFAULT NULL,
  `add_time` int(11) NULL DEFAULT NULL,
  `is_super` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of manager
-- ----------------------------
INSERT INTO `manager` VALUES (1, 'admin', 'e10adc3949ba59abbe56e057f20f883e', '13100861132', '1007643852@qq.com', 1, 1, 1611802453, 1);
INSERT INTO `manager` VALUES (2, 'syjun', 'e10adc3949ba59abbe56e057f20f883e', '13100861132', '1007643852@qq.com', 0, 2, 1611912321, 0);
INSERT INTO `manager` VALUES (4, 'zhl', 'e10adc3949ba59abbe56e057f20f883e', '10086', '100861132@qq.com', 1, 3, 1612078402, 0);
INSERT INTO `manager` VALUES (5, 'tourists', 'e10adc3949ba59abbe56e057f20f883e', '10086', '101011@qq.com', 1, 6, 1613556217, 0);

-- ----------------------------
-- Table structure for nav
-- ----------------------------
DROP TABLE IF EXISTS `nav`;
CREATE TABLE `nav`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `position` tinyint(1) NULL DEFAULT NULL,
  `is_opennew` tinyint(1) NULL DEFAULT NULL,
  `relation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sort` int(11) NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT NULL,
  `add_time` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of nav
-- ----------------------------
INSERT INTO `nav` VALUES (2, '小米商城', '/', 1, 1, '', 10, 1, 1612578421);
INSERT INTO `nav` VALUES (3, 'MIUI', 'https://home.miui.com/', 1, 2, '', 10, 1, 1612578522);
INSERT INTO `nav` VALUES (4, 'IoT', 'https://iot.mi.com/', 1, 2, '', 10, 1, 1612578559);
INSERT INTO `nav` VALUES (5, '云服务', 'https://i.mi.com/', 1, 1, '', 10, 1, 1612578587);
INSERT INTO `nav` VALUES (6, '天星数科', 'https://airstar.com/home', 1, 2, '', 10, 1, 1612578663);
INSERT INTO `nav` VALUES (7, '有品', 'https://www.xiaomiyoupin.com/', 1, 2, '', 10, 1, 1612578696);
INSERT INTO `nav` VALUES (8, '小爱开放平台', 'https://xiaoai.mi.com/', 1, 2, '', 10, 1, 1612578722);
INSERT INTO `nav` VALUES (9, '企业团购', 'https://qiye.mi.com/', 1, 2, '', 10, 1, 1612578782);
INSERT INTO `nav` VALUES (10, '资质证照', 'https://www.mi.com/aptitude/list?id=41', 1, 2, '', 10, 1, 1612578800);
INSERT INTO `nav` VALUES (11, '协议规则', 'https://www.mi.com/aptitude/list', 1, 2, '', 10, 1, 1612578819);
INSERT INTO `nav` VALUES (12, '下载app', 'https://www.mi.com/appdownload', 1, 2, '', 10, 1, 1612578833);
INSERT INTO `nav` VALUES (13, '智能生活', 'https://xiaomishare.mi.com/?from=micom#/', 1, 2, '', 10, 1, 1612578848);
INSERT INTO `nav` VALUES (14, 'Select location or language', '', 1, 1, '', 10, 1, 1612578860);
INSERT INTO `nav` VALUES (15, '小米手机', '', 2, 1, '17,18,25,26,27', 10, 1, 1612599317);
INSERT INTO `nav` VALUES (16, 'Redmi 红米', '', 2, 1, '28,29,24,31,32,33', 10, 1, 1612599331);
INSERT INTO `nav` VALUES (17, '电视', '', 2, 1, '34,35,36,37,38', 10, 1, 1612599337);
INSERT INTO `nav` VALUES (18, '笔记本', '', 2, 1, '39,40,41,42,43,44', 10, 1, 1612599347);
INSERT INTO `nav` VALUES (19, '家电', '', 2, 1, '45,46,47,48,49,50', 10, 1, 1612599352);
INSERT INTO `nav` VALUES (20, '路由器', '', 2, 1, '51,52,53,54,55,56', 10, 1, 1612599357);
INSERT INTO `nav` VALUES (21, '智能硬件', '', 2, 1, '57,58,59,60', 10, 1, 1612599368);
INSERT INTO `nav` VALUES (22, '服务', '', 2, 1, '', 10, 1, 1612599373);
INSERT INTO `nav` VALUES (23, '社区', '', 2, 1, '', 10, 1, 1612599378);

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NULL DEFAULT NULL,
  `order_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `all_price` decimal(10, 2) NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `zipcode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `pay_status` tinyint(1) NULL DEFAULT NULL,
  `pay_type` tinyint(1) NULL DEFAULT NULL,
  `order_status` tinyint(1) NULL DEFAULT NULL,
  `add_time` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES (9, 5, '2021021419021850', 3999.00, '张海浪', '13100861132', '重庆', '100001', 0, 0, 0, 1613300577);
INSERT INTO `order` VALUES (13, 5, '2021021610151850', 3999.00, '张海浪', '13100861132', '重庆市沙坪坝区大学城', '100001', 1, 1, 1, 1613441718);
INSERT INTO `order` VALUES (14, 5, '2021021610371850', 5998.00, '张海浪', '13100861132', '重庆市沙坪坝区大学城', '100001', 0, 0, 0, 1613443077);

-- ----------------------------
-- Table structure for order_item
-- ----------------------------
DROP TABLE IF EXISTS `order_item`;
CREATE TABLE `order_item`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NULL DEFAULT NULL,
  `uid` int(11) NULL DEFAULT NULL,
  `product_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `product_id` int(11) NULL DEFAULT NULL,
  `product_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `product_price` decimal(10, 2) NULL DEFAULT NULL,
  `add_time` int(11) NULL DEFAULT NULL,
  `product_num` int(11) NULL DEFAULT NULL,
  `goods_version` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `goods_color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of order_item
-- ----------------------------
INSERT INTO `order_item` VALUES (9, 9, 5, '小米11', 17, 'static/upload/20210206/1612610846473649300.jpg', 3999.00, 0, 1, '8GB+128GB', '紫色');
INSERT INTO `order_item` VALUES (13, 13, 5, '小米11', 17, 'static/upload/20210206/1612610846473649300.jpg', 3999.00, 0, 1, '8GB+128GB', '紫色');
INSERT INTO `order_item` VALUES (14, 14, 5, '小米10', 18, 'static/upload/20210206/1612611221459829900.jpg', 3399.00, 0, 1, '10', '蓝色');
INSERT INTO `order_item` VALUES (15, 14, 5, 'Redmi K30S 至尊纪念版', 23, 'static/upload/20210206/1612614728674860500.jpg', 2599.00, 0, 1, '30', '黑色');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT NULL,
  `add_time` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, '技术部门', '技术部门', 1, 1611886203);
INSERT INTO `role` VALUES (2, '销售部门', '销售部门', 1, 1611886240);
INSERT INTO `role` VALUES (3, '编辑部门', '主要负责文章编辑', 1, 1611887228);
INSERT INTO `role` VALUES (6, '游客', '游客访问后台', 1, 1613556735);

-- ----------------------------
-- Table structure for role_access
-- ----------------------------
DROP TABLE IF EXISTS `role_access`;
CREATE TABLE `role_access`  (
  `role_id` int(11) NOT NULL,
  `access_id` int(11) NOT NULL,
  PRIMARY KEY (`role_id`, `access_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role_access
-- ----------------------------
INSERT INTO `role_access` VALUES (1, 53);
INSERT INTO `role_access` VALUES (1, 59);
INSERT INTO `role_access` VALUES (1, 60);
INSERT INTO `role_access` VALUES (1, 61);
INSERT INTO `role_access` VALUES (1, 62);
INSERT INTO `role_access` VALUES (2, 53);
INSERT INTO `role_access` VALUES (2, 59);
INSERT INTO `role_access` VALUES (2, 60);
INSERT INTO `role_access` VALUES (3, 63);
INSERT INTO `role_access` VALUES (3, 64);
INSERT INTO `role_access` VALUES (3, 65);
INSERT INTO `role_access` VALUES (6, 52);
INSERT INTO `role_access` VALUES (6, 53);
INSERT INTO `role_access` VALUES (6, 54);
INSERT INTO `role_access` VALUES (6, 59);
INSERT INTO `role_access` VALUES (6, 63);
INSERT INTO `role_access` VALUES (6, 64);
INSERT INTO `role_access` VALUES (6, 71);
INSERT INTO `role_access` VALUES (6, 72);
INSERT INTO `role_access` VALUES (6, 78);
INSERT INTO `role_access` VALUES (6, 79);
INSERT INTO `role_access` VALUES (6, 83);
INSERT INTO `role_access` VALUES (6, 87);
INSERT INTO `role_access` VALUES (6, 88);

-- ----------------------------
-- Table structure for setting
-- ----------------------------
DROP TABLE IF EXISTS `setting`;
CREATE TABLE `setting`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `site_logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `site_keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `site_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `no_picture` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `site_icp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `site_tel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `search_keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `tongji_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `appid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `app_secret` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `end_point` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `bucket_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `oss_status` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of setting
-- ----------------------------
INSERT INTO `setting` VALUES (1, '小米商城', 'static/upload/20210217/1613559590962180000.png', '小米', '让全世界的人民享受到科技带来的乐趣!', 'static/upload/20210217/1613559591240958100.png', '', '', '', '', '', '', '', 'micom', 1);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `add_time` int(11) NULL DEFAULT NULL,
  `last_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (5, '13100861132', '4ade67287c5b16d151542ffcb1380587', 1613184824, '127.0.0.1:3108', '1007643852@qq.com', 1);

SET FOREIGN_KEY_CHECKS = 1;
