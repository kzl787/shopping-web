/*
 Navicat Premium Data Transfer

 Source Server         : good
 Source Server Type    : MySQL
 Source Server Version : 80027
 Source Host           : localhost:3306
 Source Schema         : goods

 Target Server Type    : MySQL
 Target Server Version : 80027
 File Encoding         : 65001

 Date: 02/12/2021 11:13:14
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address`  (
  `id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `province` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `city` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  INDEX `id`(`id`) USING BTREE,
  CONSTRAINT `address_ibfk_1` FOREIGN KEY (`id`) REFERENCES `uid` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES ('00001', '广东', '广州');
INSERT INTO `address` VALUES ('2222', '广东', '广州');

-- ----------------------------
-- Table structure for t_admin
-- ----------------------------
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE `t_admin`  (
  `adminId` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `adminName` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `adminPwd` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`adminId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO `t_admin` VALUES ('a1', 'hhhh', '000000');

-- ----------------------------
-- Table structure for t_book
-- ----------------------------
DROP TABLE IF EXISTS `t_book`;
CREATE TABLE `t_book`  (
  `bid` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `bname` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '',
  `author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '',
  `price` decimal(8, 2) NULL DEFAULT 999999.00,
  `currPrice` decimal(8, 2) NULL DEFAULT 999999.00,
  `discount` decimal(3, 1) NULL DEFAULT 0.0,
  `press` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '',
  `publishtime` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '',
  `edition` int NULL DEFAULT 0,
  `pageNum` int NULL DEFAULT 0,
  `wordNum` int NULL DEFAULT 0,
  `printtime` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '',
  `booksize` int NULL DEFAULT 0,
  `paper` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '',
  `cid` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '',
  `image_w` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '',
  `image_b` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '',
  `orderBy` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`bid`) USING BTREE,
  INDEX `orderBy`(`orderBy`) USING BTREE,
  INDEX `FK_t_book_t_category`(`cid`) USING BTREE,
  CONSTRAINT `FK_t_book_t_category` FOREIGN KEY (`cid`) REFERENCES `t_category` (`cid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 117 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_book
-- ----------------------------
INSERT INTO `t_book` VALUES ('000A18FDB38F470DBE9CD0972BADB23F', 'Java Web整合开发实战--基于Struts 2+Hibernate+Spring（99个应用实例，4个项目开发案例，15.5小时配套教学视频，超值DVD光盘含大量开发资源。一本书搞定SSH框架整合开发！）', '贾蓓', 79.80, 55.10, 6.9, '清华大学出版社', '2013-7-1', 1, 640, 1030000, '2013-7-1', 16, '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/23268958-1_w.jpg', 'book_img/23268958-1_b.jpg', 16);
INSERT INTO `t_book` VALUES ('0BE0707984014E66BD9F34F534FCE0F7', 'OSGi实战【OSGi规范制定者亲自撰写 汇集Apache项目技术实战经验】', 'Richard', 99.00, 68.30, 6.9, '人民邮电出版社', '2013-1-1', 1, 468, 721000, '2013-1-1', 16, '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/22938396-1_w.jpg', 'book_img/22938396-1_b.jpg', 58);
INSERT INTO `t_book` VALUES ('0EE8A0AE69154287A378FB110FF2C780', 'Java核心技术：卷Ⅰ基础知识（原书第8版）', '昊斯特曼', 98.00, 67.60, 6.9, '机械工业出版社', '2008-6-1', 1, 694, 0, '2008-6-1', 16, '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/20285763-1_w.jpg', 'book_img/20285763-1_b.jpg', 12);
INSERT INTO `t_book` VALUES ('113D0D1BB9174DD19A7DE7E2B37F677F', 'Java7入门经典（跟编程导师Ivor Horton学Java 预计到货日期9月初）', '霍尔顿', 118.00, 81.40, 6.9, '清华大学出版社', '2012-8-1', 1, 1124, 1918000, '2012-8-1', 16, '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/22813026-1_w.jpg', 'book_img/22813026-1_b.jpg', 94);
INSERT INTO `t_book` VALUES ('1286B13F0EA54E4CB22224762121486A', 'Java核心技术 卷I：基础知识(第9版·英文版)(上、下册)', '霍斯特曼', 109.00, 75.20, 6.9, '人民邮电出版社', '2013-7-1', 1, 0, 1197000, '2013-7-1', 16, '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/23280479-1_w.jpg', 'book_img/23280479-1_b.jpg', 65);
INSERT INTO `t_book` VALUES ('13EBF9B1FDE346A683A1C45BD6773ECB', 'Java开发实战1200例（第Ⅱ卷）（史上最全的“编程实例”类图书，代码分析、实例速查、练习巩固的绝好帮手）', '无', 99.00, 68.30, 6.9, '清华大学出版社', '0', 1, 0, 1754000, '2011-6-1', 16, '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/21110930-1_w_1.jpg', 'book_img/21110930-1_b.jpg', 83);
INSERT INTO `t_book` VALUES ('1A15DC5E8A014A58862ED741D579B530', 'Java深入解析——透析Java本质的36个话题', '梁勇', 49.00, 33.80, 6.9, '电子工业出版社', '2013-11-1', 1, 298, 424000, '2013-11-1', 16, '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/23363997-1_w_1.jpg', 'book_img/23363997-1_b.jpg', 86);
INSERT INTO `t_book` VALUES ('210A3DCA429049C78B623C3986BEB136', 'JavaScript经典教程套装：JavaScript高级程序设计(第3版)+JavaScript DOM编程艺术(第2版)(套装共2册)(超值附赠《码农》光盘1张)', 'Nicholas C. Zakas', 148.00, 88.80, 6.0, '人民邮电出版社', '2013-4-1', 1, 1048, 0, '2013-4-1', 16, '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/23224089-1_w.jpg', 'book_img/23224089-1_b.jpg', 93);
INSERT INTO `t_book` VALUES ('22234CECF15F4ECB813F0B433DDA5365', 'JavaScript从入门到精通（附光盘1张）（连续8月JavaScript类全国零售排行前2名，13小时视频，400个经典实例、369项面试真题、138项测试史上最全资源库）', '明日科技', 69.80, 48.20, 6.9, '清华大学出版社', '2012-9-1', 1, 532, 939000, '2012-9-1', 16, '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/22862057-1_w.jpg', 'book_img/22862057-1_b.jpg', 20);
INSERT INTO `t_book` VALUES ('230A00EC22BF4A1DBA87C64800B54C8D', 'Struts2技术内幕：深入解析Struts架构设计与实现原理', '陆舟', 69.00, 47.60, 6.9, '机械工业出版社', '2012-1-1', 1, 379, 0, '2012-1-1', 16, '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/22577578-1_w.jpg', 'book_img/22577578-1_b.jpg', 56);
INSERT INTO `t_book` VALUES ('260F8A3594F741C1B0EB69616F65045B', 'Tomcat与Java Web开发技术详解（第2版）(含光盘1张)', '孙卫琴', 79.50, 54.90, 6.9, '电子工业出版社', '2009-1-1', 1, 734, 1216000, '2009-1-1', 16, '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/20420983-1_w.jpg', 'book_img/20420983-1_b.jpg', 74);
INSERT INTO `t_book` VALUES ('28A03D28BAD449659A77330BE35FCD65', 'JAVA核心技术卷II：高级特性（原书第8版）', '霍斯特曼', 118.00, 81.40, 6.9, '机械工业出版社', '2008-12-1', 1, 852, 0, '2008-12-1', 16, '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/20446562-1_w.jpg', 'book_img/20446562-1_b.jpg', 18);
INSERT INTO `t_book` VALUES ('2EE1A20A6AF742E387E18619D7E3BB94', 'Java虚拟机并发编程(Java并发编程领域的里程碑之作，资深Java技术专家、并发编程专家、敏捷开发专家和Jolt大奖得主撰写，Amazon五星畅销书)', 'Venkat Subramaniam', 59.00, 40.70, 6.9, '机械工业出版社', '2013-5-1', 1, 215, 0, '2013-5-1', 16, '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/23239786-1_w.jpg', 'book_img/23239786-1_b.jpg', 54);
INSERT INTO `t_book` VALUES ('33ACF97A9A374352AE9F5E89BB791262', '基于MVC的JavaScript Web富应用开发', '麦卡劳', 59.00, 40.70, 6.9, '电子工业出版社', '2012-5-1', 1, 282, 462000, '2012-5-1', 16, '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/22757564-1_w.jpg', 'book_img/22757564-1_b.jpg', 34);
INSERT INTO `t_book` VALUES ('37F75BEAE1FE46F2B14674923F1E7987', '数据结构与算法分析Java语言描述 第2版', '韦斯', 55.00, 38.00, 6.9, '机械工业出版社', '2009-1-1', 2, 440, 0, '2009-1-1', 16, '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/20417467-1_w.jpg', 'book_img/20417467-1_b.jpg', 32);
INSERT INTO `t_book` VALUES ('39F1D0803E8F4592AE1245CACE683214', 'Java程序员修炼之道', '埃文斯', 89.00, 61.40, 6.9, '人民邮电出版社', '2013-8-1', 1, 395, 658000, '2013-8-1', 16, '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/23301847-1_w_1.jpg', 'book_img/23301847-1_b.jpg', 36);
INSERT INTO `t_book` VALUES ('3AE5C8B976B6448A9D3A155C1BDE12BC', '深入理解Java虚拟机:JVM高级特性与最佳实践（超级畅销书，6个月5次印刷，从实践角度解析JVM工作原理，Java程序员必备）', '周志明', 69.00, 47.60, 6.9, '机械工业出版社', '0', 1, 0, 0, '2011-7-1', 16, '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/21108671-1_w_1.jpg', 'book_img/21108671-1_b.jpg', 66);
INSERT INTO `t_book` VALUES ('3DD187217BF44A99B86DD18A4DC628BA', 'Java核心技术 卷1 基础知识（原书第9版）', '霍斯特曼，科内尔', 119.00, 82.10, 6.9, '机械工业出版社', '2014-1-1', 1, 704, 0, '2014-1-1', 16, '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/23362142-1_w_1.jpg', 'book_img/23362142-1_b.jpg', 9);
INSERT INTO `t_book` VALUES ('3E1990E19989422E9DA735978CB1E4CE', 'Effective Java中文版(第2版)', '布洛克', 52.00, 35.90, 6.9, '机械工业出版社', '2009-1-1', 2, 287, 0, '2009-1-1', 16, '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/20459091-1_w.jpg', 'book_img/20459091-1_b.jpg', 25);
INSERT INTO `t_book` VALUES ('400D94DE5A0742B3A618FC76DF107183', 'JavaScript宝典（第7版）（配光盘）', '古德曼', 128.00, 88.30, 6.9, '清华大学出版社', '2013-1-1', 1, 1012, 1657000, '2013-1-1', 32, '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/23169892-1_w.jpg', 'book_img/23169892-1_b.jpg', 88);
INSERT INTO `t_book` VALUES ('4491EA4832E04B8B94F334B71E871983', 'Java语言程序设计：进阶篇（原书第8版）', '梁勇', 79.00, 54.50, 6.9, '机械工业出版社', '2011-6-1', 1, 507, 0, '2011-6-1', 16, '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/21117631-1_w_1.jpg', 'book_img/21117631-1_b.jpg', 48);
INSERT INTO `t_book` VALUES ('48BBFBFC07074ADE8CC906A45BE5D9A6', 'JavaScript权威指南（第6版）（淘宝前端团队倾情翻译！经典权威的JavaScript犀牛书！第6版特别涵盖了HTML5和ECMAScript5！）（经典巨著，当当独家首发）', '弗兰纳根', 139.00, 95.30, 6.9, '机械工业出版社', '2012-4-1', 1, 1004, 0, '2012-4-1', 16, '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/22722790-1_w.jpg', 'book_img/22722790-1_b.jpg', 4);
INSERT INTO `t_book` VALUES ('49D98E7916B94232862F7DCD1B0BAB66', 'HTML5+JavaScript动画基础', '兰贝塔', 69.00, 47.60, 6.9, '人民邮电出版社', '2013-6-1', 1, 393, 553000, '2013-6-1', 16, '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/23266633-1_w.jpg', 'book_img/23266633-1_b.jpg', 51);
INSERT INTO `t_book` VALUES ('4A9574F03A6B40C1B2A437237C17DEEC', 'Spring实战(第3版)（In Action系列中最畅销的Spring图书，近十万读者学习Spring的共同选择）', 'Craig Walls', 59.00, 40.70, 6.9, '人民邮电出版社', '2013-6-1', 1, 374, 487000, '2013-6-1', 16, '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/23254532-1_w.jpg', 'book_img/23254532-1_b.jpg', 11);
INSERT INTO `t_book` VALUES ('4BF6D97DD18A4B77B8DED9B057577F8F', 'Java Web从入门到精通（附光盘1张）（连续8月Java类全国零售排行前2名，27小时视频，951个经典实例、369项面试真题、596项测试史上最全资源库）', '明日科技', 69.80, 48.20, 6.9, '清华大学出版社', '2012-9-1', 1, 547, 979000, '2012-9-1', 16, '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/22862056-1_w.jpg', 'book_img/22862056-1_b.jpg', 23);
INSERT INTO `t_book` VALUES ('4C3331CAD5A5453787A94B8D7CCEAA29', 'Java Web整合开发王者归来（JSP+Servlet+Struts+Hibernate+Spring）（配光盘', '刘京华', 99.80, 68.90, 6.9, '清华大学出版社', '2010-1-1', 1, 1010, 1368000, '2010-1-1', 16, '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/20756351-1_w_1.jpg', 'book_img/20756351-1_b_1.jpg', 17);
INSERT INTO `t_book` VALUES ('4C8838E95A944D0E805E70F683EF1FA4', '山', '百度', 1.00, 2.00, 5.0, '百度出版社', '2021-11-30', 1, 2, 0, '2021-11-30', 16, '图片', '84ECE401C2904DBEA560D04A581A66D9', 'book_img/4532C16A6_a4.jpg', 'book_img/C2FF7451D_b4.jpg', 116);
INSERT INTO `t_book` VALUES ('4D20D2450B084113A331D909FF4975EB', 'jQuery实战(第2版)(畅销书升级版，掌握Web开发利器必修宝典)', 'Bear Bibeault　Yehuda Katz ', 69.00, 47.60, 6.9, '人民邮电出版社', '2012-3-1', 1, 394, 617000, '2012-3-1', 16, '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/22638286-1_w.jpg', 'book_img/22638286-1_b.jpg', 79);
INSERT INTO `t_book` VALUES ('4E44405DAFB7413E8A13BBFFBEE73AC7', 'JavaScript经典实例', '鲍尔斯', 78.00, 53.80, 6.9, '中国电力出版社', '2012-3-1', 1, 512, 625000, '2012-3-1', 16, '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/22692811-1_w.jpg', 'book_img/22692811-1_b.jpg', 68);
INSERT INTO `t_book` VALUES ('504FB999B0444B339907090927FDBE8A', '深入浅出Ext JS(第3版)', '徐会生', 69.00, 47.60, 6.9, '人民邮电出版社', '2013-10-1', 3, 413, 642000, '2013-10-1', 16, '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/23351049-1_w_1.jpg', 'book_img/23351049-1_b.jpg', 71);
INSERT INTO `t_book` VALUES ('52077C8423B645A9BADA96A5E0B14422', 'Spring源码深度解析', '郝佳', 69.00, 47.60, 6.9, '人民邮电出版社', '2013-9-1', 1, 386, 545000, '2013-8-30', 16, '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/23329703-1_w_1.jpg', 'book_img/23329703-1_b.jpg', 52);
INSERT INTO `t_book` VALUES ('52B0EDFF966E4A058BDA5B18EEC698C4', '亮剑Java Web项目开发案例导航(含DVD光盘1张)', '朱雪琴', 69.00, 41.40, 6.0, '电子工业出版社', '2012-3-1', 1, 526, 875000, '2012-3-1', 16, '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/22623766-1_w.jpg', 'book_img/22623766-1_b.jpg', 81);
INSERT INTO `t_book` VALUES ('5315DA60D24042889400AD4C93A37501', 'Spring 3.x企业应用开发实战(含CD光盘1张)', '陈雄华', 90.00, 62.10, 6.9, '电子工业出版社', '2012-2-1', 1, 710, 1158000, '2012-2-1', 16, '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/22605701-1_w.jpg', 'book_img/22605701-1_b.jpg', 24);
INSERT INTO `t_book` VALUES ('56B1B7D8CD8740B098677C7216A673C4', '疯狂 Java 程序员的基本修养（《疯狂Java讲义》最佳拍档，扫清知识死角，夯实基本功）', '李刚', 59.00, 40.70, 6.9, '电子工业出版社', '2013-1-1', 1, 484, 7710000, '2013-1-1', 16, '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/23042420-1_w.jpg', 'book_img/23042420-1_b.jpg', 89);
INSERT INTO `t_book` VALUES ('57B6FF1B89C843C38BA39C717FA557D6', '了不起的Node.js: 将JavaScript进行到底（Web开发首选实时 跨多服务器 高并发）', 'Guillermo Rauch', 79.00, 54.50, 6.9, '电子工业出版社', '2014-1-1', 1, 292, 436000, '2014-1-1', 16, '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/23368351-1_w_2.jpg', 'book_img/23368351-1_b.jpg', 8);
INSERT INTO `t_book` VALUES ('5C4A6F0F4A3B4672AD8C5F89BF5D37D2', 'Java从入门到精通（第3版）（附光盘1张）（连续8月Java类全国零售排行前2名，32小时视频，732个经典实例、369项面试真题、616项测试史上最全资源库）', '明日科技', 59.80, 41.30, 6.9, '清华大学出版社', '2012-9-1', 3, 564, 1013000, '2012-9-1', 16, '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/22862060-1_w.jpg', 'book_img/22862060-1_b.jpg', 1);
INSERT INTO `t_book` VALUES ('5C68141786B84A4CB8929A2415040739', 'JavaScript高级程序设计(第3版)(JavaScript技术名著，国内JavasScript第一书，销量超过8万册)', 'Nicholas C. Zakas', 99.00, 68.30, 6.9, '人民邮电出版社', '2012-3-1', 1, 730, 1092000, '2012-3-1', 16, '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/22628333-1_w.jpg', 'book_img/22628333-1_b.jpg', 5);
INSERT INTO `t_book` VALUES ('5EDB981339C342ED8DB17D5A198D50DC', 'Java程序性能优化', '葛一鸣', 59.00, 40.70, 6.9, '清华大学出版社', '2012-10-1', 1, 400, 649000, '2012-10-1', 16, '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/22881618-1_w.jpg', 'book_img/22881618-1_b.jpg', 27);
INSERT INTO `t_book` VALUES ('6398A7BA400D40258796BCBB2B256068', 'JavaScript设计模式', 'Addy Osmani', 49.00, 33.80, 6.9, '人民邮电出版社', '2013-6-1', 1, 241, 301000, '2013-6-1', 16, '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/23266635-1_w.jpg', 'book_img/23266635-1_b.jpg', 40);
INSERT INTO `t_book` VALUES ('676B56A612AF4E968CF0F6FFE289269D', 'JavaScript和jQuery实战手册（原书第2版）', '麦克法兰', 99.00, 68.30, 6.9, '机械工业出版社', '2013-3-11', 1, 504, 0, '2013-3-1', 16, '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/23201813-1_w.jpg', 'book_img/23201813-1_b.jpg', 42);
INSERT INTO `t_book` VALUES ('7917F5B19A0948FD9551932909328E4E', 'Java项目开发案例全程实录（第2版）（配光盘）（软件项目开发全程实录丛书）', '明日科技', 69.80, 48.20, 6.9, '清华大学出版社', '2011-1-1', 2, 605, 1037000, '2011-1-1', 16, '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/20991549-1_w_1.jpg', 'book_img/20991549-1_b.jpg', 64);
INSERT INTO `t_book` VALUES ('7C0C785FFBEC4DEC802FA36E8B0BC87E', '深入分析Java Web技术内幕', '许令波', 69.00, 47.60, 6.9, '电子工业出版社', '2012-9-1', 1, 442, 746000, '2012-9-1', 16, '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/22881803-1_w.jpg', 'book_img/22881803-1_b.jpg', 50);
INSERT INTO `t_book` VALUES ('7CD79C20258F477AB841518D9312E843', 'Java程序员面试宝典（第三版）', '欧立奇', 49.00, 33.80, 6.9, '电子工业出版社', '2013-9-1', 1, 359, 446400, '2013-9-1', 16, '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/23348683-1_w_1.jpg', 'book_img/23348683-1_b.jpg', 44);
INSERT INTO `t_book` VALUES ('7D7FE81293124793BDB2C6FF1F1C943D', '21天学通Java(第6版)（中文版累计销量超30000册）', 'Rogers Cadenhead', 55.00, 38.00, 6.9, '人民邮电出版社', '2013-4-1', 1, 410, 781000, '2013-4-1', 16, '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/23219731-1_w.jpg', 'book_img/23219731-1_b.jpg', 46);
INSERT INTO `t_book` VALUES ('7FD7F50B15F74248AA769798909F8653', 'Java网络编程（第3版）——O’Reilly Java系列', '哈诺德', 85.00, 51.00, 6.0, '中国电力出版社', '2005-11-1', 1, 718, 668000, '2005-11-1', 16, '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/9062293-1_w.jpg', 'book_img/9062293-1_b.jpg', 35);
INSERT INTO `t_book` VALUES ('819FF56E4423462394E6F83882F78975', '学通Java Web的24堂课（配光盘）（软件开发羊皮卷）', '陈丹丹', 79.80, 55.10, 6.9, '清华大学出版社', '2011-6-1', 1, 718, 1488000, '2011-6-1', 16, '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/21118835-1_w_1.jpg', 'book_img/21118835-1_b.jpg', 91);
INSERT INTO `t_book` VALUES ('81FADA99309342F4978D5C680B0C6E8C', 'Java入门很简单（配光盘）（入门很简单丛书）（打开Java编程之门 Java技术网推荐）', '李世民', 59.80, 41.30, 6.9, '清华大学出版社', '2012-8-1', 1, 459, 745000, '2012-8-1', 16, '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/22839309-1_w.jpg', 'book_img/22839309-1_b.jpg', 85);
INSERT INTO `t_book` VALUES ('89A57D099EA14026A5C3D10CFC10C22C', 'Java 2实用教程（第4版）（21世纪高等学校计算机基础实用规划教材）', '耿祥义', 39.50, 31.60, 8.0, '清华大学出版社', '2012-8-1', 4, 479, 782000, '2012-8-1', 16, '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/22844118-1_w.jpg', 'book_img/22844118-1_b.jpg', 73);
INSERT INTO `t_book` VALUES ('8A5B4042D5B14D6B87A34DABF327387F', 'Java核心技术 卷II：高级特性(第9版·英文版)(上、下册)', '霍斯特曼', 119.00, 82.10, 6.9, '人民邮电出版社', '2013-7-1', 1, 1118, 1370000, '2013-7-1', 16, '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/23280478-1_w.jpg', 'book_img/23280478-1_b.jpg', 57);
INSERT INTO `t_book` VALUES ('8DD0ADF2665B40899E09ED2983DC3F7B', 'jQuery权威指南（被公认的权威的、易学的jQuery实战教程，多次重印，热销中）', '陶国荣', 59.00, 40.70, 6.9, '机械工业出版社', '2011-1-1', 1, 385, 0, '2011-1-1', 16, '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/21006995-1_w_1.jpg', 'book_img/21006995-1_b.jpg', 75);
INSERT INTO `t_book` VALUES ('8E16D59BA4C34374A68029AE877613C4', '轻量级Java EE企业应用实战（第3版）：Struts 2＋Spring 3＋Hibernate整合开发(含CD光盘1张)', '李刚', 99.00, 68.30, 6.9, '电子工业出版社', '2012-4-1', 1, 816, 1440000, '2012-4-1', 16, '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/22685703-1_w.jpg', 'book_img/22685703-1_b.jpg', 6);
INSERT INTO `t_book` VALUES ('8F1520F2CED94C679433B9C109E791CB', 'Java从入门到精通（实例版）（附光盘1张）（连续8月Java类全国零售排行前2名，14小时视频，732个经典实例、369项面试真题、616项测试史上最全资源库）', '明日科技', 69.80, 47.60, 6.9, '清华大学出版社', '2012-9-1', 1, 548, 986000, '2012-9-1', 16, '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/22862061-1_w.jpg', 'book_img/22862061-1_b.jpg', 49);
INSERT INTO `t_book` VALUES ('90E423DBE56042838806673DB3E86BD3', '《Spring技术内幕（第2版）》（畅销书全新升级，Spring类图书销量桂冠，从宏观和微观两个角度解析Spring架构设计和实现原理）', '计文柯', 69.00, 47.60, 6.9, '机械工业出版社', '2012-2-1', 2, 399, 0, '2012-2-1', 16, '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/22606836-1_w.jpg', 'book_img/22606836-1_b.jpg', 45);
INSERT INTO `t_book` VALUES ('926B8F31C5D04F61A72F66679A0CCFFD', 'JavaScript编程精解（华章程序员书库）（JavaScript之父高度评价并强力推荐，系统学习JS首选！）', '哈弗贝克', 49.00, 33.80, 6.9, '械工业出版社', '2012-9-1', 1, 162, 0, '2012-9-1', 16, '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/22873894-1_w.jpg', 'book_img/22873894-1_b.jpg', 70);
INSERT INTO `t_book` VALUES ('95AACC68D64D4D67B1E33E9EAC22B885', 'Head First Java（中文版）（JAVA经典畅销书 生动有趣 轻松学好JAVA）', '塞若', 79.00, 47.40, 6.0, '中国电力出版社', '2007-2-1', 1, 689, 983000, '2001-7-2', 16, '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/9265169-1_w.jpg', 'book_img/9265169-1_b.jpg', 13);
INSERT INTO `t_book` VALUES ('97437DAD03FA456AA7D6154614A43B55', 'HTML、CSS、JavaScript网页制作从入门到精通（两万读者的选择，经久不衰的超级畅销书最新升级版！网页制作学习者入门必读经典！）', '刘西杰', 49.00, 32.90, 6.7, '人民邮电出版社', '2012-12-24', 1, 450, 705000, '2012-12-24', 16, '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/22928649-1_w.jpg', 'book_img/22928649-1_b.jpg', 3);
INSERT INTO `t_book` VALUES ('9923901FBF124623BC707920D8936BC8', 'JavaScript DOM编程艺术(第2版)', '基思', 49.00, 33.80, 6.9, '人民邮电出版社', '2011-4-1', 1, 286, 443000, '2011-4-1', 16, '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/21049601-1_w_1.jpg', 'book_img/21049601-1_b.jpg', 28);
INSERT INTO `t_book` VALUES ('99BF63AC12AD48FCB673F1820888964E', 'Java Web开发实战1200例（第Ⅱ卷）（史上最全的“编程实例”类图书，代码分析、实例速查、练习巩固的绝好帮手）', '无', 99.00, 67.40, 6.8, '清华大学出版社', '0', 0, 0, 1746000, '2011-6-1', 16, '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/21110929-1_w_1.jpg', 'book_img/21110929-1_b.jpg', 78);
INSERT INTO `t_book` VALUES ('9D257176A6934CB79427CEC37E69249F', '疯狂Ajax讲义（第3版）--jQuery/Ext JS/Prototype/DWR企业应用前端开发实战(含CD光盘1张)（畅销书升级版，企业应用前端开发实战指南）', '李刚', 79.00, 54.50, 6.9, '电子工业出版社', '2013-2-1', 1, 624, 997000, '2013-2-1', 16, '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/23184673-1_w.jpg', 'book_img/23184673-1_b.jpg', 53);
INSERT INTO `t_book` VALUES ('9FBD51A7C02D4F5B9862CD2EBBF5CA04', 'Flash ActionScript 3.0全站互动设计', '刘欢 ', 69.80, 48.20, 6.9, '人民邮电出版社', '2012-10-1', 1, 488, 760000, '2012-10-1', 16, '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/22886581-1_w.jpg', 'book_img/22886581-1_b.jpg', 96);
INSERT INTO `t_book` VALUES ('9FF423101836438F874035A48498CF45', 'Java编程思想（英文版·第4版）', '埃克尔 ', 79.00, 54.50, 6.9, '机械工业出版社', '2007-4-1', 1, 1482, 0, '2007-4-1', 16, '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/9288920-1_w.jpg', 'book_img/9288920-1_b.jpg', 31);
INSERT INTO `t_book` VALUES ('A2D5EDB3E56A46E2BD2693A65DFC902B', '海景', '百度', 40.70, 59.00, 6.9, '百度图片', '2021-11-30', 1, 2, 0, '2021-11-30', 16, '胶版纸', '84ECE401C2904DBEA560D04A581A66D9', 'book_img/DB11880DB_a3.jpg', 'book_img/F1C7F8E90_b3.jpg', 115);
INSERT INTO `t_book` VALUES ('A3D464D1D1344ED5983920B472826730', 'Java Web开发详解：XML+DTD+XML Schema+XSLT+Servlet 3 0+JSP 2 2深入剖析与实例应用(含CD光盘1张)', '孙鑫', 119.00, 61.30, 5.2, '电子工业出版社', '2012-5-1', 1, 889, 1760000, '2012-5-1', 16, '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/22788412-1_w.jpg', 'book_img/22788412-1_b.jpg', 60);
INSERT INTO `t_book` VALUES ('A3E2A918EB3A455BAEFB8CD39FBA49AA', 'Spring实战(第3版)', 'Craig Walls', 40.70, 59.00, 6.9, '人民邮电出版社', '2021-11-30', 1, 374, 48700, '2021-11-30', 16, '胶版纸', '84ECE401C2904DBEA560D04A581A66D9', 'book_img/4BD4B9EF0_yunceng.jpg', 'book_img/B4C172647_yunceng-001.jpg', 110);
INSERT INTO `t_book` VALUES ('A46A0F48A4F649AE9008B38EA48FAEBA', 'Java编程全能词典(含DVD光盘2张)', '明日科技', 98.00, 65.70, 6.7, '电子工业出版社', '2010-3-1', 1, 486, 496000, '2010-3-1', 32, '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/20813806-1_w_1.jpg', 'book_img/20813806-1_b.jpg', 90);
INSERT INTO `t_book` VALUES ('A5A6F27DCD174614850B26633A0B4605', 'JavaScript模式', '斯特凡洛夫', 38.00, 22.80, 6.0, '中国电力出版社', '2012-7-1', 1, 208, 253000, '2012-7-1', 16, '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/22819430-1_w.jpg', 'book_img/22819430-1_b.jpg', 61);
INSERT INTO `t_book` VALUES ('A7220EF174704012830E066FDFAAD4AD', 'Spring 3.0就这么简单（国内原创的Java敏捷开发图书，展现作者Spring原创开源项目ROP开发的全过程，所有项目工程均以Maven组织）', '陈雄华', 59.00, 40.70, 6.9, '人民邮电出版社', '2013-1-1', 1, 380, 530000, '2013-1-1', 16, '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/22938474-1_w.jpg', 'book_img/22938474-1_b.jpg', 77);
INSERT INTO `t_book` VALUES ('A7EFD99367C9434682A790635D3C5FDF', 'Java Web技术整合应用与项目实战（JSP+Servlet+Struts2+Hibernate+Spring3）', '张志锋', 98.00, 67.60, 6.9, '清华大学出版社', '2013-6-1', 1, 878, 0, '2013-6-1', 16, '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/23266270-1_w.jpg', 'book_img/23266270-1_b.jpg', 92);
INSERT INTO `t_book` VALUES ('A8EF76FD21A645109538614DEA85F3F7', 'Java语言程序设计：基础篇（原书第8版）', '梁勇', 75.00, 51.80, 6.9, '机械工业出版社', '2011-6-1', 1, 586, 0, '2011-6-1', 16, '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/21122188-1_w_1.jpg', 'book_img/21122188-1_b.jpg', 30);
INSERT INTO `t_book` VALUES ('AD6EA79CCB8240AAAF5B292AD7E5DCAA', 'jQuery Mobile权威指南（根据jQuery Mobile最新版本撰写的权威参考书！全面讲解jQuery Mobile的所有功能、特性、使用方法和开发技巧）', '陶国荣', 59.00, 40.70, 6.9, '机械工业出版社', '2012-8-1', 1, 249, 0, '2012-8-1', 16, '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/22847009-1_w.jpg', 'book_img/22847009-1_b.jpg', 38);
INSERT INTO `t_book` VALUES ('AE0935F13A214436B8599DE285A86220', 'JavaScript基础教程(第8版)(经典JavaScript入门书 涵盖Ajax和jQuery)', 'Tom Negrino　Dori Smith', 69.00, 47.60, 6.9, '人民邮电出版社', '2012-4-1', 1, 392, 694000, '2012-4-1', 16, '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/22717349-1_w.jpg', 'book_img/22717349-1_b.jpg', 37);
INSERT INTO `t_book` VALUES ('AF28ED8F692C4288B32CF411CBDBFC23', '经典Java EE企业应用实战——基于WebLogic/JBoss的JSF+EJB 3+JPA整合开发(含CD光盘1张)', '无', 79.00, 54.50, 6.9, '电子工业出版社', '2010-8-1', 1, 0, 0, '2010-8-1', 16, '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/20928547-1_w_1.jpg', 'book_img/20928547-1_b.jpg', 55);
INSERT INTO `t_book` VALUES ('B329A14DDEF8455F82B3FDF25821D2BB', '名师讲坛——Java Web开发实战经典基础篇（JSP、Servlet、Struts、Ajax）（32小时全真课堂培训，视频超级给力！390项实例及分析，北京魔乐科技培训中心Java Web全部精华）', '李兴华', 69.80, 48.20, 6.9, '清华大学出版社', '2010-8-1', 1, 554, 819000, '2010-8-1', 16, '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/20915948-1_w_3.jpg', 'book_img/20915948-1_b.jpg', 22);
INSERT INTO `t_book` VALUES ('B7A7DA7A94E54054841EED1F70C3027C', '锋利的jQuery(第2版)(畅销书升级版，增加jQuery Mobile和性能优化)', '单东林', 49.00, 33.80, 6.9, '人民邮电出版社', '2012-7-1', 2, 380, 598000, '2012-7-1', 16, '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/22786088-1_w.jpg', 'book_img/22786088-1_b.jpg', 10);
INSERT INTO `t_book` VALUES ('BD1CB005E4A04DCA881DA8689E21D4D0', 'jQuery UI开发指南', 'Eric Sarrion', 39.00, 26.90, 6.9, '人民邮电出版社', '2012-12-1', 1, 212, 286000, '2012-12-1', 16, '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/22910975-1_w.jpg', 'book_img/22910975-1_b.jpg', 63);
INSERT INTO `t_book` VALUES ('C23E6E8A6DB94E27B6E2ABD39DC21AF5', 'JavaScript:The Good Parts(影印版）', '克罗克福特', 28.00, 19.30, 6.9, '东南大学出版社', '2009-1-1', 1, 153, 181000, '2009-1-1', 16, '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/20412979-1_w.jpg', 'book_img/20412979-1_b.jpg', 95);
INSERT INTO `t_book` VALUES ('C3CF52B3ED2D4187A16754551488D733', 'Java从入门到精通（附光盘）', '魔乐科技', 59.00, 35.40, 6.0, '人民邮电出版社', '2010-4-1', 1, 519, 884000, '2010-4-1', 16, '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/20810282-1_w_1.jpg', 'book_img/20810282-1_b.jpg', 29);
INSERT INTO `t_book` VALUES ('C86D3F6FACB449BEBD940D9307ED4A47', '编写高质量代码：改善Java程序的151个建议(从语法、程序设计和架构、工具和框架、编码风格、编程思想5个方面探讨编写高质量Java代码的技巧、禁忌和最佳实践)', '秦小波', 59.00, 40.70, 6.9, '机械工业出版社', '2012-1-1', 1, 303, 0, '2012-1-1', 16, '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/22579686-1_w.jpg', 'book_img/22579686-1_b.jpg', 84);
INSERT INTO `t_book` VALUES ('CB0AB3654945411EA69F368D0EA91A00', 'JavaScript语言精粹（修订版）', '道格拉斯·克罗克福德', 49.00, 39.20, 8.0, '电子工业出版社', '2012-9-1', 1, 155, 258000, '2012-9-1', 16, '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/22872884-1_w.jpg', 'book_img/22872884-1_b.jpg', 33);
INSERT INTO `t_book` VALUES ('CD913617EE964D0DBAF20C60076D32FB', '名师讲坛——Java开发实战经典（配光盘）（60小时全真课堂培训，视频超级给力！790项实例及分析，北京魔乐科技培训中心Java全部精华）', '李兴华', 79.80, 55.10, 6.9, '清华大学出版社', '2009-8-1', 1, 831, 1222000, '2012-8-1', 16, '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/20637368-1_w_2.jpg', 'book_img/20637368-1_b_2.jpg', 19);
INSERT INTO `t_book` VALUES ('CE01F15D435A4C51B0AD8202A318DCA7', 'Java编程思想（第4版）', '布鲁斯.艾克尔', 108.00, 74.50, 6.9, '机械工业出版社', '2007-6-1', 1, 880, 0, '2007-6-1', 0, '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/9317290-1_w.jpg', 'book_img/9317290-1_b.jpg', 2);
INSERT INTO `t_book` VALUES ('CF5546769F2842DABB2EF7A00D51F255', 'jQuery开发从入门到精通（配套视频327节，中小实例232个，实战案例7个商品详情手册11部，网页模版83类）（附1DVD）', '袁江', 79.80, 55.10, 6.9, '清华大学出版社', '2013-6-1', 1, 619, 1109000, '2013-6-1', 16, '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/23263012-1_w.jpg', 'book_img/23263012-1_b.jpg', 43);
INSERT INTO `t_book` VALUES ('D0DA36CEE42549FFB299B7C7129761D5', 'Java应用架构设计：模块化模式与OSGi(全球资深Java技术专家的力作，系统、全面地讲解如何将模块化设计思想引入开发中，涵盖18个有助于实现模块化软件架构的模式)', '克内恩席尔德', 69.00, 47.60, 6.9, '机械工业出版社', '2013-9-1', 1, 251, 0, '2013-9-1', 16, '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/23339643-1_w.jpg', 'book_img/23339643-1_b.jpg', 26);
INSERT INTO `t_book` VALUES ('D0E69F85ACAB4C15BB40966E5AA545F1', 'Java并发编程实战（第16届Jolt大奖提名图书，Java并发编程必读佳作', 'Brian Goetz', 69.00, 47.60, 6.9, '机械工业出版社', '2012-2-1', 1, 290, 0, '2012-2-1', 32, '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/22606835-1_w.jpg', 'book_img/22606835-1_b.jpg', 15);
INSERT INTO `t_book` VALUES ('D2ABA8B06C524632846F27C34568F3CE', 'Java 经典实例', '达尔文', 98.00, 67.60, 6.9, '中国电力出版社', '2009-2-1', 1, 784, 805000, '2009-2-1', 16, '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/20500255-1_w.jpg', 'book_img/20500255-1_b.jpg', 62);
INSERT INTO `t_book` VALUES ('D8723405BA054C13B52357B8F6AEEC24', '深入理解Java虚拟机：JVM高级特性与最佳实践（第2版）', '周志明', 79.00, 54.50, 6.9, '机械工业出版社', '2013-6-1', 2, 433, 0, '2013-6-1', 16, '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/23259731-1_w.jpg', 'book_img/23259731-1_b.jpg', 14);
INSERT INTO `t_book` VALUES ('DC36FD53A1514312A0A9ADD53A583886', 'JavaScript异步编程：设计快速响应的网络应用【掌握JavaScript异步编程必杀技，让代码更具响应度！ 】', 'Trevor Burnham ', 32.00, 22.10, 6.9, '人民邮电出版社', '2013-6-1', 1, 118, 98000, '2013-5-23', 32, '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/23252196-1_w.jpg', 'book_img/23252196-1_b.jpg', 72);
INSERT INTO `t_book` VALUES ('DCB64DF0084E486EBF173F729A3A630A', 'Java设计模式(第2版)', 'Steven John Metsker', 75.00, 51.80, 6.9, '电子工业出版社', '2012-9-1', 1, 0, 0, '2012-9-1', 16, '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/22868759-1_w.jpg', 'book_img/22868759-1_b.jpg', 76);
INSERT INTO `t_book` VALUES ('DEE7BDC7E0E343149E3C3601D2658171', '疯狂HTML 5/CSS 3/JavaScript讲义(含CD光盘1张)', '李刚', 69.00, 47.60, 6.9, '电子工业出版社', '2012-5-1', 1, 500, 819000, '2012-5-1', 16, '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/22783904-1_w.jpg', 'book_img/22783904-1_b.jpg', 21);
INSERT INTO `t_book` VALUES ('DF4E74EEE89B43229BB8212F0B858C38', '精通Hibernate：Java对象持久化技术详解（第2版）(含光盘1张)', '孙卫琴', 75.00, 51.80, 6.9, '电子工业出版社', '2010-2-1', 1, 695, 1148800, '2010-2-1', 16, '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/20773347-1_w_1.jpg', 'book_img/20773347-1_b.jpg', 39);
INSERT INTO `t_book` VALUES ('E4F184188C8B4C7BB32D4E76603426AC', '疯狂Java讲义（第2版，附光盘）', '李刚', 109.00, 75.20, 6.9, '电子工业出版社', '2012-1-1', 1, 844, 1747000, '2012-1-1', 16, '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/22588603-1_w.jpg', 'book_img/22588603-1_b.jpg', 7);
INSERT INTO `t_book` VALUES ('EA695342393C4BE48B831FA5E6B0E5C4', '编写可维护的JavaScript《JavaScript高级程序设计》作者Nicholas Zakas最新力作，构建编码风格手册，帮助开发团队从“游击队”走向“正规军”）', 'Nicholas C. Zakas', 55.00, 38.00, 6.9, '人民邮电出版社', '2013-4-1', 1, 227, 400000, '2013-4-1', 16, '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/23200995-1_w.jpg', 'book_img/23200995-1_b.jpg', 59);
INSERT INTO `t_book` VALUES ('F0E34313BF304CCEBF198BD4E05307B8', 'jQuery Cookbook中文版（jQuery之父鼎力推荐，社区数十位专家倾情力作', 'jQuery社区专家组', 69.00, 47.60, 6.9, '人民邮电出版社', '2013-5-1', 1, 425, 573000, '2013-5-1', 16, '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/23219358-1_w.jpg', 'book_img/23219358-1_b.jpg', 87);
INSERT INTO `t_book` VALUES ('F44CCDECD8B1401981465FC9D48292D3', '风景', '百度', 6.66, 8.88, 1.0, '百度出版社', '2021-11-30', 1, 2, 0, '2021-12-01', 16, '图片', '84ECE401C2904DBEA560D04A581A66D9', 'book_img/528713969_a2.jpg', 'book_img/DF1A93E8F_a1.jpg', 114);
INSERT INTO `t_book` VALUES ('F6162799E913423EA5CB57BEC65AB1E9', 'JUnit实战(第2版)', '塔凯文', 79.00, 54.50, 6.9, '人民邮电出版社', '2012-4-1', 1, 442, 640000, '2012-4-1', 16, '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/22633574-1_w.jpg', 'book_img/22633574-1_b.jpg', 80);
INSERT INTO `t_book` VALUES ('F693239BC3B3444C8538ABE7411BB38E', 'Java Web典型模块与项目实战大全（配光盘）', '常建功', 99.50, 68.70, 6.9, '清华大学出版社', '2011-1-1', 1, 922, 1473000, '2011-1-1', 16, '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/20988080-1_w_1.jpg', 'book_img/20988080-1_b.jpg', 41);
INSERT INTO `t_book` VALUES ('F78C94641DB4475BBA1E72A07DF9B3AE', 'JAVA面向对象编程', '孙卫琴 ', 65.80, 45.40, 6.9, '电子工业出版社', '2006-7-1', 1, 625, 1030400, '2006-7-1', 16, '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/9186890-1_w.jpg', 'book_img/9186890-1_b.jpg', 69);
INSERT INTO `t_book` VALUES ('FC232CD9B6E6411BBBB1A5B781D2C3C9', 'Java与模式(含盘)（超多实例和习题，详解设计原则与设计模式）', '阎宏', 88.00, 60.70, 6.9, '电子工业出版社', '2002-10-1', 1, 1024, 16704000, '2002-10-1', 16, '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/696673-1_w.jpg', 'book_img/696673-1_b.jpg', 67);
INSERT INTO `t_book` VALUES ('FEC3740CF30E442A94021911A25EF0D7', 'Spring攻略(第2版)(Spring攻略(第2版))', 'Gary Mak　Josh Long　Daniel Rubio', 128.00, 88.30, 6.9, '人民邮电出版社', '2012-3-1', 1, 938, 1322000, '2012-3-1', 16, '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/22623020-1_w.jpg', 'book_img/22623020-1_b.jpg', 82);
INSERT INTO `t_book` VALUES ('FFABBED1E5254BC0B2726EC4ED8ACCDA', '深入理解OSGi：Equinox原理、应用与最佳实践（《深入理解Java虚拟机》作者新作！全面解读最新OSGi R5.0规范，深入讲解OSGi原理和服务，以及Equinox框架的用法和原理）', '周志明', 79.00, 54.50, 6.9, '机械工业出版社', '2013-2-1', 1, 414, 0, '2013-2-1', 16, '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/23179003-1_w.jpg', 'book_img/23179003-1_b.jpg', 47);

-- ----------------------------
-- Table structure for t_cartitem
-- ----------------------------
DROP TABLE IF EXISTS `t_cartitem`;
CREATE TABLE `t_cartitem`  (
  `cartItemId` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `number` int NULL DEFAULT NULL,
  `bid` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `uid` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `orderBy` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`cartItemId`) USING BTREE,
  INDEX `orderBy`(`orderBy`) USING BTREE,
  INDEX `FK_t_cartitem_t_book`(`bid`) USING BTREE,
  INDEX `FK_t_cartitem_t_user`(`uid`) USING BTREE,
  CONSTRAINT `FK_t_cartitem_t_book` FOREIGN KEY (`bid`) REFERENCES `t_book` (`bid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_t_cartitem_t_user` FOREIGN KEY (`uid`) REFERENCES `t_user` (`uid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 41 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_cartitem
-- ----------------------------
INSERT INTO `t_cartitem` VALUES ('77F43BCE009842A28118621C1B7A02C4', 5, 'CE01F15D435A4C51B0AD8202A318DCA7', '55790D9C1A1845738E6D93866A148C7E', 18);
INSERT INTO `t_cartitem` VALUES ('BFD2C5B37C38440386E50703E94500B9', 8, '97437DAD03FA456AA7D6154614A43B55', '55790D9C1A1845738E6D93866A148C7E', 20);
INSERT INTO `t_cartitem` VALUES ('C02B4D54D47A4BABBE256E5B1925D454', 2, '5C4A6F0F4A3B4672AD8C5F89BF5D37D2', '32DB3700D2564254982BC58B0E4D95BC', 27);

-- ----------------------------
-- Table structure for t_category
-- ----------------------------
DROP TABLE IF EXISTS `t_category`;
CREATE TABLE `t_category`  (
  `cid` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `cname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '',
  `pid` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '',
  `des` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '',
  `orderby` int NULL DEFAULT NULL,
  PRIMARY KEY (`cid`) USING BTREE,
  UNIQUE INDEX `cname`(`cname`) USING BTREE,
  INDEX `foreign_pid`(`pid`) USING BTREE,
  CONSTRAINT `foreign_pid` FOREIGN KEY (`pid`) REFERENCES `t_category` (`cid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_category
-- ----------------------------
INSERT INTO `t_category` VALUES ('1', '程序设计', NULL, '程序设计分类', 1);
INSERT INTO `t_category` VALUES ('2', '办公室用书', NULL, '办公室用书', 2);
INSERT INTO `t_category` VALUES ('3', '图形 图像 多媒体', NULL, '图形图像多媒体', 3);
INSERT INTO `t_category` VALUES ('4', '操作系统/系统开发', NULL, '操作系统/系统开发', 4);
INSERT INTO `t_category` VALUES ('458795C27E7346A8A5F1B942319297E0', '系统开发', '4', '系统开发分类', 29);
INSERT INTO `t_category` VALUES ('4D01FFF0CB94468EA907EF42780668AB', '购买指南 组装指南 维修', '2', '购买指南 组装指南 维修分类', 18);
INSERT INTO `t_category` VALUES ('5', '数据库', NULL, '数据库', 5);
INSERT INTO `t_category` VALUES ('56AD72718C524147A2485E5F4A95A062', '3DS MAX', '3', '3DS MAX分类', 21);
INSERT INTO `t_category` VALUES ('57DE3C2DDA784B81844029A28217698C', 'Dreamweaver', '3', 'Dreamweaver分类', 24);
INSERT INTO `t_category` VALUES ('5F79D0D246AD4216AC04E9C5FAB3199E', 'Java Javascript', '1', 'Java Javascript分类', 10);
INSERT INTO `t_category` VALUES ('6', '网络与数据通讯', NULL, '网络与数据通讯!', 6);
INSERT INTO `t_category` VALUES ('65640549B80E40B1981CDEC269BFFCAD', 'Photoshop', '3', 'Photoshop分类', 20);
INSERT INTO `t_category` VALUES ('65830AB237EF428BAE9B7ADC78A8D1F6', 'Unix', '4', 'Unix分类', 28);
INSERT INTO `t_category` VALUES ('757BDAB506A445EC8DEDA4CE04303B9F', '网页设计', '3', '网页设计分类', 22);
INSERT INTO `t_category` VALUES ('84ECE401C2904DBEA560D04A581A66D9', 'HTML XML', '1', 'HTML XML分类', 13);
INSERT INTO `t_category` VALUES ('922E6E2DB04143D39C9DDB26365B3EE8', 'C C++ VC VC++', '1', 'C C++ VC VC++分类', 12);
INSERT INTO `t_category` VALUES ('96F209F79DB242E9B99CC1B98FAB01DB', '数据库理论', '5', '数据库理论分类', 33);
INSERT INTO `t_category` VALUES ('A9CFBED0F77746C5BD751F2502FAB2CD', '电子商务 电子政务', '6', '电子商务 电子政务分类', 35);
INSERT INTO `t_category` VALUES ('B596ECE0F9BF40288F40A66B35551806', 'Flush', '3', 'Flush分类', 23);
INSERT INTO `t_category` VALUES ('B92ED191DBE647BE8F75721FB231E207', '因特网 电子邮件', '2', '因特网 电子邮件分类', 19);
INSERT INTO `t_category` VALUES ('C3F9FAAF4EA64857ACFAB0D9C8D0E446', 'PHP', '1', 'PHP分类', 14);
INSERT INTO `t_category` VALUES ('C4DD8CA232864B31A367EE135D86382C', '计算机初级入门', '2', '计算机初级入门分类', 17);
INSERT INTO `t_category` VALUES ('C8E274EE5C99499080A98E24F0BD2E03', '.NET', '1', '.NET分类', 15);
INSERT INTO `t_category` VALUES ('D45D96DA359A4FEAB3AB4DCF2157FC06', 'JSP', '1', 'JSP分类', 11);
INSERT INTO `t_category` VALUES ('DCAD0384A6444C048951C7B36C5D96EE', 'Flash', '3', 'Flash分类', 25);
INSERT INTO `t_category` VALUES ('F4FBD087EB054CA1896093F172AC33D9', '数据仓库与数据挖掘', '5', '数据仓库与数据挖掘分类', 30);
INSERT INTO `t_category` VALUES ('F5C091B3967442A2B35EFEFC4EF8746F', '微软Office', '2', '微软Office分类', 16);
INSERT INTO `t_category` VALUES ('FAB7B7F7084F4D57A0808ADC61117683', 'Windows', '4', 'Windows分类', 26);

-- ----------------------------
-- Table structure for t_order
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order`  (
  `oid` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ordertime` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '',
  `total` decimal(10, 2) NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  `address` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '',
  `uid` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '',
  PRIMARY KEY (`oid`) USING BTREE,
  INDEX `FK_t_order_t_user`(`uid`) USING BTREE,
  CONSTRAINT `FK_t_order_t_user` FOREIGN KEY (`uid`) REFERENCES `t_user` (`uid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_order
-- ----------------------------
INSERT INTO `t_order` VALUES ('058F48DA33694C6D8F5C2C13F3D26CEA', '2013-12-26 21:47:04', 95.30, 1, '李女士 广东省 揭阳市 揭东县 xxx xxx xxx', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `t_order` VALUES ('0A1F4C5BDE754277B984D1E7E763051D', '2014-01-16 15:18:47', 41.30, 5, '广东省 广州市 番禺区 xxx xxx lkz', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `t_order` VALUES ('0ADCEE0510844D2697E7A5C0903A8D3B', '2014-01-16 15:13:03', 41.30, 1, '广东省 广州市 番禺区 xxx xxx lkz', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `t_order` VALUES ('0FBC5F415EF94161AF2937A07EFD8DE8', '2014-01-01 14:18:14', 74.50, 4, '王先生 北京市 北京市 宣武区 xxx xxx xxx', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `t_order` VALUES ('0FD72F77655D43E2B7989892E965864D', '2013-12-30 20:05:53', 88.70, 1, '王先生 北京市 北京市 宣武区 xxx xxx xxx', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `t_order` VALUES ('148668BE43754CE2B64A0AC999C5A2D5', '2014-01-16 14:51:08', 148.70, 1, '广东省 广州市 番禺区 xxx xxx lkz', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `t_order` VALUES ('159B58B3BBCB4069A550BF1A358B4905', '2014-02-07 01:17:28', 41.30, 2, '广东省 广州市 番禺区 xxx xxx lkz', '531D8A16D524478D86F8A115FE95D93F');
INSERT INTO `t_order` VALUES ('15A89AB272394F359EA26A2E15F13405', '2013-12-30 20:06:20', 74.50, 5, '王先生 北京市 北京市 宣武区 xxx xxx xxx', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `t_order` VALUES ('1D640078E4A64AC987FEA7299B57A2F6', '2014-01-01 13:57:41', 74.50, 4, '关羽 云南省 曲靖市 宣威市 11 11 11 11 xx', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `t_order` VALUES ('2142A62F3AF341C1A576D35A030AC757', '2021-11-29 19:16:23', 74.50, 3, '广东省 广州市 番禺区 小谷围街道 李先生', '31F7D630235040C9BB08F69BC807F188');
INSERT INTO `t_order` VALUES ('215480BA59374E9C93664C3037962D01', '2021-11-29 16:30:59', 122.10, 1, '广东省 广州市 番禺区 小谷围街道 李先生', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `t_order` VALUES ('2D9FF0BFB82842CFAA4B623D5997BF1F', '2014-01-01 14:17:47', 74.50, 4, '王先生 北京市 北京市 宣武区 xxx xxx xxx', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `t_order` VALUES ('303E12F4821A4B3F9DB97B23947220C7', '2013-12-26 22:00:41', 82.10, 2, '李女士 广东省 揭阳市 揭东县 xxx xxx xxx', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `t_order` VALUES ('40E9CBE34D4B4209A9A935AEB34BF21E', '2021-12-01 21:16:02', 149.28, 3, '广东省 广州市 番禺区 小谷围街道 李先生', '31F7D630235040C9BB08F69BC807F188');
INSERT INTO `t_order` VALUES ('48041C2902B440BF9A651D8A9A571C75', '2021-11-30 10:01:00', 122.60, 3, '广东省 广州市 番禺区 小谷围街道 李先生', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `t_order` VALUES ('574A31876CA246D4A10C0600EF5CF8A5', '2014-02-06 15:08:23', 74.50, 2, '广东省 广州市 番禺区 xxx xxx lkz', '531D8A16D524478D86F8A115FE95D93F');
INSERT INTO `t_order` VALUES ('5D39377E88E049F8BA19173BAFF295CB', '2014-01-01 14:18:39', 74.50, 4, '李女士 广东省 揭阳市 揭东县 xxx xxx xxx', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `t_order` VALUES ('5FB1E131DD294CBBA34FE93228DF2F02', '2014-01-16 14:48:48', 279.10, 1, '广东省 广州市 番禺区 xxx xxx lkz', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `t_order` VALUES ('605B9D163C1345B6A636D80720794CE8', '2014-01-01 14:17:02', 74.50, 4, '李女士 广东省 揭阳市 揭东县 xxx xxx xxx', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `t_order` VALUES ('6504C742FE65413494E028E714D4D609', '2014-01-16 14:54:43', 41.30, 1, '广东省 广州市 番禺区 xxx xxx lkz', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `t_order` VALUES ('674878FE6CAB48918DB4A9688262FBD5', '2014-01-16 15:10:23', 41.30, 1, '广东省 广州市 番禺区 xxx xxx lkz', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `t_order` VALUES ('6B2FE354C1B649C6B4260766F8DBCB14', '2021-11-29 19:15:03', 41.30, 3, '广东省 广州市 番禺区 小谷围街道 李先生', '31F7D630235040C9BB08F69BC807F188');
INSERT INTO `t_order` VALUES ('794BA19FB00E4AA086EB9877D67B1025', '2021-11-30 10:06:42', 38.00, 4, '广东省 广州市 番禺区 小谷围街道 李先生', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `t_order` VALUES ('7B3FA2910C9149829AB1EF3A39C4785F', '2013-12-31 23:37:41', 74.50, 1, '王先生 北京市 北京市 宣武区 xxx xxx xxx', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `t_order` VALUES ('93576BB2F43C47F89B4DD7B91F5DF5E3', '2014-01-01 14:18:21', 74.50, 4, '王先生 北京市 北京市 宣武区 xxx xxx xxx', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `t_order` VALUES ('938A419EE5844840B1CEF6B9320A0D22', '2021-11-29 16:39:25', 81.40, 1, '广东省 广州市 番禺区 小谷围街道 李先生', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `t_order` VALUES ('96C6D91D916E472681EEC37B1770DE87', '2013-12-31 23:37:06', 67.60, 4, '王先生 北京市 北京市 宣武区 xxx xxx xxx', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `t_order` VALUES ('9721A3FBC37D490588AEE02F761744E2', '2014-01-01 14:17:21', 74.50, 4, '王先生 北京市 北京市 宣武区 xxx xxx xxx', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `t_order` VALUES ('984468779C164A6098A7FE7EECE9E273', '2014-01-16 15:16:15', 41.30, 5, '广东省 广州市 番禺区 xxx xxx lkz', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `t_order` VALUES ('988A8165977540CF981B4A4BEB1A40A8', '2021-11-29 16:11:48', 189.70, 1, '广东省 广州市 番禺区 小谷围街道 李先生', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `t_order` VALUES ('9D3D7C328ED34C74A0E0BFD61EE1021A', '2021-11-29 16:28:26', 74.50, 3, '广东省 广州市 番禺区 小谷围街道 李先生', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `t_order` VALUES ('A2DB4A7B4EA640ADA63F22A7E8311F4B', '2014-01-16 14:51:51', 148.70, 1, '广东省 广州市 番禺区 xxx xxx lkz', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `t_order` VALUES ('B00DF77064C14D55BBB83E281B2EF03B', '2021-11-29 16:49:30', 135.20, 4, '广东省 广州市 番禺区 小谷围街道 李先生', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `t_order` VALUES ('B62C7C1BA61C47C4BCEC4BE96897A72C', '2014-01-16 15:16:07', 41.30, 1, '广东省 广州市 番禺区 xxx xxx lkz', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `t_order` VALUES ('BD1BD9AB58B1413FA0BDC0AACCC8C65F', '2013-12-26 21:40:48', 81.40, 1, '王先生 北京市 北京市 宣武区 xxx xxx xxx', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `t_order` VALUES ('BE24BB4187B1472AA08E206BF8B0ABF7', '2013-12-30 20:08:10', 47.60, 3, '王先生 北京市 北京市 宣武区 xxx xxx xxx', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `t_order` VALUES ('C0841F4DFE7A43BFB183E4E82AE7914C', '2014-01-01 13:48:07', 74.50, 4, '刘备 西藏 那曲地区 巴青县 xxx xxx xxx xxx x', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `t_order` VALUES ('C4A1E40F2F514684BCD97F9EE76A701F', '2014-01-01 14:16:38', 74.50, 4, '王先生 北京市 北京市 宣武区 xxx xxx xxx', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `t_order` VALUES ('C5D3FE7ED99047C8BB7CDC6492553182', '2021-12-01 21:30:07', 181.00, 3, '广东省 广州市 番禺区 小谷围街道 李先生', '31F7D630235040C9BB08F69BC807F188');
INSERT INTO `t_order` VALUES ('CBB735CB5F084C1BB80FF5998F811E63', '2014-01-01 14:18:45', 74.50, 4, '王先生 北京市 北京市 宣武区 xxx xxx xxx', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `t_order` VALUES ('CD21D95779BC479BAF4031031A621F13', '2021-12-01 21:32:30', 193.66, 3, '广东省 广州市 番禺区 小谷围街道 李先生', '31F7D630235040C9BB08F69BC807F188');
INSERT INTO `t_order` VALUES ('D929BD17AB374B49B61B93AF9A194D1A', '2013-12-31 23:39:19', 82.10, 5, '王先生 北京市 北京市 宣武区 xxx xxx xxx', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `t_order` VALUES ('E106BFE7029C485D95A124C733BCC539', '2014-01-16 15:17:50', 41.30, 5, '北京市 昌平区 西三旗 金燕龙办公楼1层 传智播客 张三爷', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `t_order` VALUES ('E3A1EB6D0543489F9729B2B5BC5DB365', '2014-01-02 10:30:30', 115.50, 3, '王先生 北京市 北京市 宣武区 xxx xxx xxx', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `t_order` VALUES ('E6EEEB39CECC4089BC65142BADCC4FC3', '2013-12-26 21:40:10', 73.60, 1, '张小姐 上海市 上海市 浦东新区 xxx xxx xxx xxx', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `t_order` VALUES ('E891D2A05DA6485EB7E12436E8FB3107', '2014-02-06 10:52:56', 162.90, 2, '北京市 昌平区 西三旗 金燕龙办公楼1层 传智播客 张三爷', '531D8A16D524478D86F8A115FE95D93F');
INSERT INTO `t_order` VALUES ('E8AE477323214E99AB48BA38052BE974', '2014-01-01 14:17:39', 74.50, 4, '王先生 北京市 北京市 宣武区 xxx xxx xxx', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `t_order` VALUES ('EC28CE2D4D924FCAAB2E9DF482E60F7A', '2021-11-29 16:47:17', 95.30, 1, '广东省 广州市 番禺区 小谷围街道 李先生', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `t_order` VALUES ('EC3696A4C443494A9B8DD6E8A9B82072', '2014-01-16 15:09:19', 41.30, 1, '北京市 昌平区 西三旗 金燕龙办公楼1层 传智播客 张三爷', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `t_order` VALUES ('F7E603F5179348B9BC3417B9BFB8558D', '2014-02-07 00:12:40', 41.30, 2, '北京市 昌平区 西三旗 金燕龙办公楼1层 传智播客 张三爷', '531D8A16D524478D86F8A115FE95D93F');
INSERT INTO `t_order` VALUES ('F83F6B21FDA243808C7032C0497DA572', '2021-11-29 16:05:54', 0.00, 1, '广东省 广州市 番禺区 小谷围街道 李先生', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `t_order` VALUES ('FAC08EE0DF2C4487A6FA2B11B343307E', '2013-12-26 21:30:19', 340.70, 1, '王先生 北京市 北京市 宣武区 xxx xxx xxx', '32DB3700D2564254982BC58B0E4D95BC');

-- ----------------------------
-- Table structure for t_orderitem
-- ----------------------------
DROP TABLE IF EXISTS `t_orderitem`;
CREATE TABLE `t_orderitem`  (
  `orderItemId` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `quantity` int NULL DEFAULT NULL,
  `subtotal` decimal(8, 2) NULL DEFAULT NULL,
  `bid` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `bname` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `currPrice` decimal(8, 2) NULL DEFAULT NULL,
  `image_b` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `oid` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`orderItemId`) USING BTREE,
  INDEX `FK_t_orderitem_t_order`(`oid`) USING BTREE,
  CONSTRAINT `FK_t_orderitem_t_order` FOREIGN KEY (`oid`) REFERENCES `t_order` (`oid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_orderitem
-- ----------------------------
INSERT INTO `t_orderitem` VALUES ('01D2DF3E5BB34E9F9D2477180C8D94D3', 1, 74.50, 'CE01F15D435A4C51B0AD8202A318DCA7', 'Java编程思想（第4版）', 74.50, 'book_img/9317290-1_b.jpg', 'C0841F4DFE7A43BFB183E4E82AE7914C');
INSERT INTO `t_orderitem` VALUES ('01E58D4FB7964805A1557A5EF2677586', 1, 74.50, 'CE01F15D435A4C51B0AD8202A318DCA7', 'Java编程思想（第4版）', 74.50, 'book_img/9317290-1_b.jpg', '7B3FA2910C9149829AB1EF3A39C4785F');
INSERT INTO `t_orderitem` VALUES ('0377D01200AD4A8A8A62CAB7A1323842', 2, 0.00, '28A03D28BAD449659A77330BE35FCD65', 'JAVA核心技术卷II：高级特性（原书第8版）', 81.40, 'book_img/20446562-1_b.jpg', 'F83F6B21FDA243808C7032C0497DA572');
INSERT INTO `t_orderitem` VALUES ('062005611B014B43BA59E57D3F8394C4', 1, 59.00, 'A2D5EDB3E56A46E2BD2693A65DFC902B', '海景', 59.00, 'book_img/F1C7F8E90_b3.jpg', '40E9CBE34D4B4209A9A935AEB34BF21E');
INSERT INTO `t_orderitem` VALUES ('06AD3253E7EA415B828D1299462DE812', 1, 41.30, '5C4A6F0F4A3B4672AD8C5F89BF5D37D2', 'Java从入门到精通（第3版）（附光盘1张）（连续8月Java类全国零售排行前2名，32小时视频，732个经典实例、369项面试真题、616项测试史上最全资源库）', 41.30, 'book_img/22862060-1_b.jpg', '159B58B3BBCB4069A550BF1A358B4905');
INSERT INTO `t_orderitem` VALUES ('0844DB419E91407FAE223E3ED6B63707', 1, 82.10, '3DD187217BF44A99B86DD18A4DC628BA', 'Java核心技术 卷1 基础知识（原书第9版）', 82.10, 'book_img/23362142-1_b.jpg', 'D929BD17AB374B49B61B93AF9A194D1A');
INSERT INTO `t_orderitem` VALUES ('0AD49A1C760E4EA2B29ADC32E306C2D5', 1, 47.60, 'D0E69F85ACAB4C15BB40966E5AA545F1', 'Java并发编程实战（第16届Jolt大奖提名图书，Java并发编程必读佳作', 47.60, 'book_img/22606835-1_b.jpg', 'BD1BD9AB58B1413FA0BDC0AACCC8C65F');
INSERT INTO `t_orderitem` VALUES ('0BBA5A1132FE46CE981460C68AEB4DF2', 1, 74.50, 'CE01F15D435A4C51B0AD8202A318DCA7', 'Java编程思想（第4版）', 74.50, 'book_img/9317290-1_b.jpg', '9D3D7C328ED34C74A0E0BFD61EE1021A');
INSERT INTO `t_orderitem` VALUES ('0E5B4E1AF6064A6594D848D8569569E7', 3, 177.00, 'A2D5EDB3E56A46E2BD2693A65DFC902B', '海景', 59.00, 'book_img/F1C7F8E90_b3.jpg', 'C5D3FE7ED99047C8BB7CDC6492553182');
INSERT INTO `t_orderitem` VALUES ('0F8620EDA20642D1B6CF6D2768086B0A', 1, 41.30, '5C4A6F0F4A3B4672AD8C5F89BF5D37D2', 'Java从入门到精通（第3版）（附光盘1张）（连续8月Java类全国零售排行前2名，32小时视频，732个经典实例、369项面试真题、616项测试史上最全资源库）', 41.30, 'book_img/22862060-1_b.jpg', 'F7E603F5179348B9BC3417B9BFB8558D');
INSERT INTO `t_orderitem` VALUES ('0F8FCF81AE4D402892AD73C11477B971', 3, 204.90, '5C68141786B84A4CB8929A2415040739', 'JavaScript高级程序设计(第3版)(JavaScript技术名著，国内JavasScript第一书，销量超过8万册)', 68.30, 'book_img/22628333-1_b.jpg', '5FB1E131DD294CBBA34FE93228DF2F02');
INSERT INTO `t_orderitem` VALUES ('0FDE8F9F0C1D4B65AE470BC63783FBF5', 1, 41.30, '5C4A6F0F4A3B4672AD8C5F89BF5D37D2', 'Java从入门到精通（第3版）（附光盘1张）（连续8月Java类全国零售排行前2名，32小时视频，732个经典实例、369项面试真题、616项测试史上最全资源库）', 41.30, 'book_img/22862060-1_b.jpg', '984468779C164A6098A7FE7EECE9E273');
INSERT INTO `t_orderitem` VALUES ('10C2D433E7704AC6A0CB74EBDB1B0AEC', 1, 41.30, '5C4A6F0F4A3B4672AD8C5F89BF5D37D2', 'Java从入门到精通（第3版）（附光盘1张）（连续8月Java类全国零售排行前2名，32小时视频，732个经典实例、369项面试真题、616项测试史上最全资源库）', 41.30, 'book_img/22862060-1_b.jpg', 'FAC08EE0DF2C4487A6FA2B11B343307E');
INSERT INTO `t_orderitem` VALUES ('1286B13F0EA54E4CB22224762121486A', 3, 888.00, '1286B13F0EA54E4CB22224762121486A', 'Java核心技术 卷I：基础知识(第9版·英文版)(上、下册)', 111.00, 'book_img/23280479-1_b.jpg', '0A1F4C5BDE754277B984D1E7E763051D');
INSERT INTO `t_orderitem` VALUES ('12B224096B43477292B652EFE21BC71A', 1, 75.20, 'E4F184188C8B4C7BB32D4E76603426AC', '疯狂Java讲义（第2版，附光盘）', 75.20, 'book_img/22588603-1_b.jpg', '48041C2902B440BF9A651D8A9A571C75');
INSERT INTO `t_orderitem` VALUES ('14128D56EBDE44A2935F0D12EA5DBB03', 1, 74.50, 'CE01F15D435A4C51B0AD8202A318DCA7', 'Java编程思想（第4版）', 74.50, 'book_img/9317290-1_b.jpg', '574A31876CA246D4A10C0600EF5CF8A5');
INSERT INTO `t_orderitem` VALUES ('1B48E8AA75BC4F569306702A33A7CCD5', 1, 74.50, 'CE01F15D435A4C51B0AD8202A318DCA7', 'Java编程思想（第4版）', 74.50, 'book_img/9317290-1_b.jpg', 'E8AE477323214E99AB48BA38052BE974');
INSERT INTO `t_orderitem` VALUES ('1B6B185D53AB44798EE74AE33439BB1A', 2, 67.60, 'B7A7DA7A94E54054841EED1F70C3027C', '锋利的jQuery(第2版)(畅销书升级版，增加jQuery Mobile和性能优化)', 33.80, 'book_img/22786088-1_b.jpg', '96C6D91D916E472681EEC37B1770DE87');
INSERT INTO `t_orderitem` VALUES ('1BF158F7D2E24DC3AE8AD4748A125F7F', 1, 41.30, '5C4A6F0F4A3B4672AD8C5F89BF5D37D2', 'Java从入门到精通（第3版）（附光盘1张）（连续8月Java类全国零售排行前2名，32小时视频，732个经典实例、369项面试真题、616项测试史上最全资源库）', 41.30, 'book_img/22862060-1_b.jpg', 'E106BFE7029C485D95A124C733BCC539');
INSERT INTO `t_orderitem` VALUES ('1D529CD78B34458D96D03F9FB9E8DDC5', 1, 41.30, '5C4A6F0F4A3B4672AD8C5F89BF5D37D2', 'Java从入门到精通（第3版）（附光盘1张）（连续8月Java类全国零售排行前2名，32小时视频，732个经典实例、369项面试真题、616项测试史上最全资源库）', 41.30, 'book_img/22862060-1_b.jpg', 'EC3696A4C443494A9B8DD6E8A9B82072');
INSERT INTO `t_orderitem` VALUES ('1D5352893B8F421CAD3DCCA2623671CA', 1, 41.30, '5C4A6F0F4A3B4672AD8C5F89BF5D37D2', 'Java从入门到精通（第3版）（附光盘1张）（连续8月Java类全国零售排行前2名，32小时视频，732个经典实例、369项面试真题、616项测试史上最全资源库）', 41.30, 'book_img/22862060-1_b.jpg', '0ADCEE0510844D2697E7A5C0903A8D3B');
INSERT INTO `t_orderitem` VALUES ('213DC574D8E84B15A7A5EE4687034FCB', 2, 81.40, 'AD6EA79CCB8240AAAF5B292AD7E5DCAA', 'jQuery Mobile权威指南（根据jQuery Mobile最新版本撰写的权威参考书！全面讲解jQuery Mobile的所有功能、特性、使用方法和开发技巧）', 40.70, 'book_img/22847009-1_b.jpg', '40E9CBE34D4B4209A9A935AEB34BF21E');
INSERT INTO `t_orderitem` VALUES ('2659227EFA5C4FF49B4C9E0E5FF3CDAD', 1, 74.50, 'CE01F15D435A4C51B0AD8202A318DCA7', 'Java编程思想（第4版）', 74.50, 'book_img/9317290-1_b.jpg', '1D640078E4A64AC987FEA7299B57A2F6');
INSERT INTO `t_orderitem` VALUES ('26D125337FB146FD923620A8E7C87556', 1, 32.90, '97437DAD03FA456AA7D6154614A43B55', 'HTML、CSS、JavaScript网页制作从入门到精通（两万读者的选择，经久不衰的超级畅销书最新升级版！网页制作学习者入门必读经典！）', 32.90, 'book_img/22928649-1_b.jpg', 'E6EEEB39CECC4089BC65142BADCC4FC3');
INSERT INTO `t_orderitem` VALUES ('26FFD473E4654C27B59BDB404E3982C5', 1, 74.50, 'CE01F15D435A4C51B0AD8202A318DCA7', 'Java编程思想（第4版）', 74.50, 'book_img/9317290-1_b.jpg', '605B9D163C1345B6A636D80720794CE8');
INSERT INTO `t_orderitem` VALUES ('2754A72B64774B03A6FF5E08233D5445', 1, 95.30, '48BBFBFC07074ADE8CC906A45BE5D9A6', 'JavaScript权威指南（第6版）（淘宝前端团队倾情翻译！经典权威的JavaScript犀牛书！第6版特别涵盖了HTML5和ECMAScript5！）（经典巨著，当当独家首发）', 95.30, 'book_img/22722790-1_b.jpg', 'E891D2A05DA6485EB7E12436E8FB3107');
INSERT INTO `t_orderitem` VALUES ('285F32EA770A4F9593537FEAC1B8705A', 1, 74.50, 'CE01F15D435A4C51B0AD8202A318DCA7', 'Java编程思想（第4版）', 74.50, 'book_img/9317290-1_b.jpg', 'CBB735CB5F084C1BB80FF5998F811E63');
INSERT INTO `t_orderitem` VALUES ('2953F9C5BC6F4475AE3AD52B921B6875', 1, 41.30, '5C4A6F0F4A3B4672AD8C5F89BF5D37D2', 'Java从入门到精通（第3版）（附光盘1张）（连续8月Java类全国零售排行前2名，32小时视频，732个经典实例、369项面试真题、616项测试史上最全资源库）', 41.30, 'book_img/22862060-1_b.jpg', '0FD72F77655D43E2B7989892E965864D');
INSERT INTO `t_orderitem` VALUES ('29E8A4EEA3914F16BE2287DC95AC14CD', 1, 74.50, 'CE01F15D435A4C51B0AD8202A318DCA7', 'Java编程思想（第4版）', 74.50, 'book_img/9317290-1_b.jpg', '15A89AB272394F359EA26A2E15F13405');
INSERT INTO `t_orderitem` VALUES ('2E3E86265EC34D8F9907F52044AE2DD2', 1, 47.40, '95AACC68D64D4D67B1E33E9EAC22B885', 'Head First Java（中文版）（JAVA经典畅销书 生动有趣 轻松学好JAVA）', 47.40, 'book_img/9265169-1_b.jpg', '0FD72F77655D43E2B7989892E965864D');
INSERT INTO `t_orderitem` VALUES ('2EC79387485D42F699DFAC6CF2CFF26A', 2, 82.60, '5C4A6F0F4A3B4672AD8C5F89BF5D37D2', 'Java从入门到精通（第3版）（附光盘1张）（连续8月Java类全国零售排行前2名，32小时视频，732个经典实例、369项面试真题、616项测试史上最全资源库）', 41.30, 'book_img/22862060-1_b.jpg', 'E3A1EB6D0543489F9729B2B5BC5DB365');
INSERT INTO `t_orderitem` VALUES ('346BFB39E1524650A695DEAD8397F811', 2, 150.40, '1286B13F0EA54E4CB75434762121486A', 'Java核心技术 卷I：基础知识(第9版·英文版)(上、下册)', 75.20, 'book_img/23280479-1_b.jpg', 'FAC08EE0DF2C4487A6FA2B11B343307E');
INSERT INTO `t_orderitem` VALUES ('35B0B801D25845D8B76B61DD3CD5759A', 1, 41.30, '5C4A6F0F4A3B4672AD8C5F89BF5D37D2', 'Java从入门到精通（第3版）（附光盘1张）（连续8月Java类全国零售排行前2名，32小时视频，732个经典实例、369项面试真题、616项测试史上最全资源库）', 41.30, 'book_img/22862060-1_b.jpg', 'B62C7C1BA61C47C4BCEC4BE96897A72C');
INSERT INTO `t_orderitem` VALUES ('37D26DB2F215411E8BFB761D61769021', 1, 47.60, 'AE0935F13A214436B8599DE285A86220', 'JavaScript基础教程(第8版)(经典JavaScript入门书 涵盖Ajax和jQuery)', 47.60, 'book_img/22717349-1_b.jpg', 'BE24BB4187B1472AA08E206BF8B0ABF7');
INSERT INTO `t_orderitem` VALUES ('38132C2B0A8E4A7499A4A00A2C68D342', 1, 32.90, '97437DAD03FA456AA7D6154614A43B55', 'HTML、CSS、JavaScript网页制作从入门到精通（两万读者的选择，经久不衰的超级畅销书最新升级版！网页制作学习者入门必读经典！）', 32.90, 'book_img/22928649-1_b.jpg', '148668BE43754CE2B64A0AC999C5A2D5');
INSERT INTO `t_orderitem` VALUES ('3C3293DB10A142188E4DCEB45D0EB28B', 4, 135.20, 'B7A7DA7A94E54054841EED1F70C3027C', '锋利的jQuery(第2版)(畅销书升级版，增加jQuery Mobile和性能优化)', 33.80, 'book_img/22786088-1_b.jpg', 'B00DF77064C14D55BBB83E281B2EF03B');
INSERT INTO `t_orderitem` VALUES ('3C585F544A494041AE75375D1CE8F086', 1, 41.30, '5C4A6F0F4A3B4672AD8C5F89BF5D37D2', 'Java从入门到精通（第3版）（附光盘1张）（连续8月Java类全国零售排行前2名，32小时视频，732个经典实例、369项面试真题、616项测试史上最全资源库）', 41.30, 'book_img/22862060-1_b.jpg', 'A2DB4A7B4EA640ADA63F22A7E8311F4B');
INSERT INTO `t_orderitem` VALUES ('3D44299B30314D7E9CAD52B2CBA4F063', 2, 81.40, '5EDB981339C342ED8DB17D5A198D50DC', 'Java程序性能优化', 40.70, 'book_img/22881618-1_b.jpg', '938A419EE5844840B1CEF6B9320A0D22');
INSERT INTO `t_orderitem` VALUES ('3DA0F5E8A5F34755A7254783B2A2C002', 1, 74.50, 'CE01F15D435A4C51B0AD8202A318DCA7', 'Java编程思想（第4版）', 74.50, 'book_img/9317290-1_b.jpg', '0FBC5F415EF94161AF2937A07EFD8DE8');
INSERT INTO `t_orderitem` VALUES ('3F775AC1F66943598642F13FFB8F8DF5', 1, 47.40, '95AACC68D64D4D67B1E33E9EAC22B885', 'Head First Java（中文版）（JAVA经典畅销书 生动有趣 轻松学好JAVA）', 47.40, 'book_img/9265169-1_b.jpg', '48041C2902B440BF9A651D8A9A571C75');
INSERT INTO `t_orderitem` VALUES ('44AF075EF3BD4DBEB55C23C1930CB3B7', 1, 32.90, '97437DAD03FA456AA7D6154614A43B55', 'HTML、CSS、JavaScript网页制作从入门到精通（两万读者的选择，经久不衰的超级畅销书最新升级版！网页制作学习者入门必读经典！）', 32.90, 'book_img/22928649-1_b.jpg', '5FB1E131DD294CBBA34FE93228DF2F02');
INSERT INTO `t_orderitem` VALUES ('4A53FDF198474C16A0D4028CC9C1532B', 1, 41.30, '5C4A6F0F4A3B4672AD8C5F89BF5D37D2', 'Java从入门到精通（第3版）（附光盘1张）（连续8月Java类全国零售排行前2名，32小时视频，732个经典实例、369项面试真题、616项测试史上最全资源库）', 41.30, 'book_img/22862060-1_b.jpg', '674878FE6CAB48918DB4A9688262FBD5');
INSERT INTO `t_orderitem` VALUES ('4ABE8B2691F84258AE4B79EF14068920', 1, 74.50, 'CE01F15D435A4C51B0AD8202A318DCA7', 'Java编程思想（第4版）', 74.50, 'book_img/9317290-1_b.jpg', 'C4A1E40F2F514684BCD97F9EE76A701F');
INSERT INTO `t_orderitem` VALUES ('4AD70581ED09443DBE176C341D7B51BA', 1, 74.50, 'CE01F15D435A4C51B0AD8202A318DCA7', 'Java编程思想（第4版）', 74.50, 'book_img/9317290-1_b.jpg', '93576BB2F43C47F89B4DD7B91F5DF5E3');
INSERT INTO `t_orderitem` VALUES ('4F8776C84CF241AF9C4FB5BF8282E870', 1, 74.50, 'CE01F15D435A4C51B0AD8202A318DCA7', 'Java编程思想（第4版）', 74.50, 'book_img/9317290-1_b.jpg', '5D39377E88E049F8BA19173BAFF295CB');
INSERT INTO `t_orderitem` VALUES ('50C4D3F0F28A4648BF89BD18C7931B60', 1, 95.30, '48BBFBFC07074ADE8CC906A45BE5D9A6', 'JavaScript权威指南（第6版）（淘宝前端团队倾情翻译！经典权威的JavaScript犀牛书！第6版特别涵盖了HTML5和ECMAScript5！）（经典巨著，当当独家首发）', 95.30, 'book_img/22722790-1_b.jpg', '058F48DA33694C6D8F5C2C13F3D26CEA');
INSERT INTO `t_orderitem` VALUES ('570876E9F0D14186A10D876A68BE4AFB', 3, 123.90, '5C4A6F0F4A3B4672AD8C5F89BF5D37D2', 'Java从入门到精通（第3版）（附光盘1张）（连续8月Java类全国零售排行前2名，32小时视频，732个经典实例、369项面试真题、616项测试史上最全资源库）', 41.30, 'book_img/22862060-1_b.jpg', '988A8165977540CF981B4A4BEB1A40A8');
INSERT INTO `t_orderitem` VALUES ('59C13A2A03C448098F20E5DC07B6D1D9', 1, 41.30, '5C4A6F0F4A3B4672AD8C5F89BF5D37D2', 'Java从入门到精通（第3版）（附光盘1张）（连续8月Java类全国零售排行前2名，32小时视频，732个经典实例、369项面试真题、616项测试史上最全资源库）', 41.30, 'book_img/22862060-1_b.jpg', '6504C742FE65413494E028E714D4D609');
INSERT INTO `t_orderitem` VALUES ('5AD3850D25D143C6B54FBD84890A15EB', 1, 41.30, '5C4A6F0F4A3B4672AD8C5F89BF5D37D2', 'Java从入门到精通（第3版）（附光盘1张）（连续8月Java类全国零售排行前2名，32小时视频，732个经典实例、369项面试真题、616项测试史上最全资源库）', 41.30, 'book_img/22862060-1_b.jpg', '148668BE43754CE2B64A0AC999C5A2D5');
INSERT INTO `t_orderitem` VALUES ('5B17BD28CDAA4E4F98C5AAC48BCEB7BB', 1, 82.10, '3DD187217BF44A99B86DD18A4DC628BA', 'Java核心技术 卷1 基础知识（原书第9版）', 82.10, 'book_img/23362142-1_b.jpg', '303E12F4821A4B3F9DB97B23947220C7');
INSERT INTO `t_orderitem` VALUES ('5C7AC4DEFBE340EBA43C1C7886147E7E', 2, 17.76, 'F44CCDECD8B1401981465FC9D48292D3', '风景', 8.88, 'book_img/DF1A93E8F_a1.jpg', 'CD21D95779BC479BAF4031031A621F13');
INSERT INTO `t_orderitem` VALUES ('5DADDF8045D7408DA4C9AAD9694AF5BF', 1, 74.50, 'CE01F15D435A4C51B0AD8202A318DCA7', 'Java编程思想（第4版）', 74.50, 'book_img/9317290-1_b.jpg', '2D9FF0BFB82842CFAA4B623D5997BF1F');
INSERT INTO `t_orderitem` VALUES ('5DF78D39DA9947048EED4F38DE027CEB', 1, 74.50, 'CE01F15D435A4C51B0AD8202A318DCA7', 'Java编程思想（第4版）', 74.50, 'book_img/9317290-1_b.jpg', '9721A3FBC37D490588AEE02F761744E2');
INSERT INTO `t_orderitem` VALUES ('858F3DC208EA4B1C95165BE1F02C9576', 2, 65.80, '97437DAD03FA456AA7D6154614A43B55', 'HTML、CSS、JavaScript网页制作从入门到精通（两万读者的选择，经久不衰的超级畅销书最新升级版！网页制作学习者入门必读经典！）', 32.90, 'book_img/22928649-1_b.jpg', '988A8165977540CF981B4A4BEB1A40A8');
INSERT INTO `t_orderitem` VALUES ('98F4279E0DA74314A0DF73FF96C1F2B0', 1, 74.50, 'CE01F15D435A4C51B0AD8202A318DCA7', 'Java编程思想（第4版）', 74.50, 'book_img/9317290-1_b.jpg', '2142A62F3AF341C1A576D35A030AC757');
INSERT INTO `t_orderitem` VALUES ('9B4E48F385D842519B7F05BEBBBEB09F', 2, 121.40, 'FC232CD9B6E6411BBBB1A5B781D2C3C9', 'Java与模式(含盘)（超多实例和习题，详解设计原则与设计模式）', 60.70, 'book_img/696673-1_b.jpg', 'CD21D95779BC479BAF4031031A621F13');
INSERT INTO `t_orderitem` VALUES ('9E29E99E08F348F9A0DC26BF001761F4', 3, 122.10, '4A9574F03A6B40C1B2A437237C17DEEC', 'Spring实战(第3版)（In Action系列中最畅销的Spring图书，近十万读者学习Spring的共同选择）', 40.70, 'book_img/23254532-1_b.jpg', '215480BA59374E9C93664C3037962D01');
INSERT INTO `t_orderitem` VALUES ('A282D7B28519483C928613871FE39C28', 1, 8.88, 'F44CCDECD8B1401981465FC9D48292D3', '风景', 8.88, 'book_img/DF1A93E8F_a1.jpg', '40E9CBE34D4B4209A9A935AEB34BF21E');
INSERT INTO `t_orderitem` VALUES ('B29028871FEB4D789E9681A3F376F404', 1, 95.30, '48BBFBFC07074ADE8CC906A45BE5D9A6', 'JavaScript权威指南（第6版）（淘宝前端团队倾情翻译！经典权威的JavaScript犀牛书！第6版特别涵盖了HTML5和ECMAScript5！）（经典巨著，当当独家首发）', 95.30, 'book_img/22722790-1_b.jpg', 'EC28CE2D4D924FCAAB2E9DF482E60F7A');
INSERT INTO `t_orderitem` VALUES ('C91C15880D5B434F96B0BE5FAFD4308A', 2, 4.00, '4C8838E95A944D0E805E70F683EF1FA4', '山', 2.00, 'book_img/C2FF7451D_b4.jpg', 'C5D3FE7ED99047C8BB7CDC6492553182');
INSERT INTO `t_orderitem` VALUES ('D612790A503A49A998FF08CC4F7E1C96', 1, 38.00, 'EA695342393C4BE48B831FA5E6B0E5C4', '编写可维护的JavaScript《JavaScript高级程序设计》作者Nicholas Zakas最新力作，构建编码风格手册，帮助开发团队从“游击队”走向“正规军”）', 38.00, 'book_img/23200995-1_b.jpg', '794BA19FB00E4AA086EB9877D67B1025');
INSERT INTO `t_orderitem` VALUES ('DFE40AA423994FF6B5E16C19AB0C8621', 1, 41.30, '5C4A6F0F4A3B4672AD8C5F89BF5D37D2', 'Java从入门到精通（第3版）（附光盘1张）（连续8月Java类全国零售排行前2名，32小时视频，732个经典实例、369项面试真题、616项测试史上最全资源库）', 41.30, 'book_img/22862060-1_b.jpg', '6B2FE354C1B649C6B4260766F8DBCB14');
INSERT INTO `t_orderitem` VALUES ('E8F47FE8E699440D9239C8EF3EC97F46', 1, 54.50, '9FF423101836438F874035A48498CF45', 'Java编程思想（英文版·第4版）', 54.50, 'book_img/9288920-1_b.jpg', 'CD21D95779BC479BAF4031031A621F13');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `uid` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `loginname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `loginpass` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT NULL,
  `activationCode` char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`uid`) USING BTREE,
  UNIQUE INDEX `loginname`(`loginname`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('31F7D630235040C9BB08F69BC807F188', 'slkdffkjde', '666', '78740186@qq.com', 1, '132E72C733A94C18A7731D97EE72010AB6B9265B61154D1AA6699E59476D77DC');
INSERT INTO `t_user` VALUES ('32DB3700D2564254982BC58B0E4D95BC', 'liSi', '123', 'itcast_cxf@126.com', 1, '15682E9C4D2849E2AB5D8AFF55D2F7BA87126B0EF55A45C6A136E3CAA90D60F2');
INSERT INTO `t_user` VALUES ('4DE7E4D829A54D4FAB150B7451407198', 'def', 'def', 'itcast_cxf@soh.com', 0, 'D00FAA82457748FF8C1B912042E615B39F3602053E154181B98CDD48D9ECFC96');
INSERT INTO `t_user` VALUES ('531D8A16D524478D86F8A115FE95D93F', 'aaaa', '123', 'hh@hh.com', 1, '10032D0DFD2B49DC98CA9739F929656B6819FA1C10EC4425695206D0C3D62094');
INSERT INTO `t_user` VALUES ('55790D9C1A1845738E6D93866A148C7E', 'wangWu', '123', 'itcast_cxf@sina.com', 1, '659903B3D5FF4576B82425A593962DFE64B6137EBE934AE5AE19F614E71F4549');
INSERT INTO `t_user` VALUES ('709DCB45DB2C420B8C0AF7A093512846', 'slkdffkj', '0000', 'emaillkz@163.com', 0, '46DCCAE3A64B42BBA86F49260B1E4211C3980F5B0DEA46A695926143C12FBCDC');
INSERT INTO `t_user` VALUES ('9CC972DFA2D4481F89841A46FD1B3E7B', 'abc', 'abc', 'itcast_cxf@qq.com', 0, 'D7CEB3DE44364749A4807D98F8B2F63017FDFED9FFC842B6BBC64E20698FED5F');
INSERT INTO `t_user` VALUES ('B30258EA32F94B95A0AD1A1ADA6BF0FB', 'sdf', '1111', '786@qq.com', 0, '21D09C303D3C4015B3B9BBA55994511413FB76EA86D347C698349EA39FA1E613');
INSERT INTO `t_user` VALUES ('B50ADE921BF14F6EB5331777B1874763', 'aabb', 'aaa', 'abc@abc.cn', 0, '10032D0DFD2B49DC98CA9739F929656B6819FA1C10EC44F8A95206D0C3D62094');
INSERT INTO `t_user` VALUES ('E77841BBB3DE4135A8B1CDC4308ABF28', 'sadfadf', '123', '78740186@qq.com', 0, '6D25F9B33A1F4014A0BB3866CF4E57E22C5E7B817DE44914947141927435A48E');

-- ----------------------------
-- Table structure for uid
-- ----------------------------
DROP TABLE IF EXISTS `uid`;
CREATE TABLE `uid`  (
  `name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of uid
-- ----------------------------
INSERT INTO `uid` VALUES ('llll', '00001');
INSERT INTO `uid` VALUES ('kdk', '21212');
INSERT INTO `uid` VALUES ('ksdk', '2222');
INSERT INTO `uid` VALUES ('lk', '23662323');

SET FOREIGN_KEY_CHECKS = 1;
