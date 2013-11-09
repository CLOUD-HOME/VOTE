/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1-3306
Source Server Version : 50532
Source Host           : localhost:3306
Source Database       : vote

Target Server Type    : MYSQL
Target Server Version : 50532
File Encoding         : 65001

Date: 2013-11-09 14:28:52
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for answer
-- ----------------------------
DROP TABLE IF EXISTS `answer`;
CREATE TABLE `answer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `examid` int(11) DEFAULT NULL,
  `answer` varchar(50) DEFAULT NULL,
  `paperid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_1` (`userid`),
  KEY `FK_Reference_2` (`examid`),
  CONSTRAINT `FK_Reference_1` FOREIGN KEY (`userid`) REFERENCES `employee` (`id`),
  CONSTRAINT `FK_Reference_2` FOREIGN KEY (`examid`) REFERENCES `examination` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of answer
-- ----------------------------
INSERT INTO `answer` VALUES ('19', '18', '3', 'shangjia', '1');
INSERT INTO `answer` VALUES ('20', '18', '4', '18201225770', '1');
INSERT INTO `answer` VALUES ('21', '18', '5', 'chenyunzhan', '1');
INSERT INTO `answer` VALUES ('22', '18', '6', '2013', '1');
INSERT INTO `answer` VALUES ('23', '18', '7', 'xian#北京', '1');
INSERT INTO `answer` VALUES ('24', '18', '1', ' 1', '1');
INSERT INTO `answer` VALUES ('25', '18', '2', ' 1', '1');
INSERT INTO `answer` VALUES ('26', '18', '3', 'shangjia', '1');
INSERT INTO `answer` VALUES ('27', '18', '4', '18201225770', '1');
INSERT INTO `answer` VALUES ('28', '18', '5', 'chenyunzhan', '1');
INSERT INTO `answer` VALUES ('29', '18', '6', '2013', '1');
INSERT INTO `answer` VALUES ('30', '18', '7', 'xian#北京', '1');
INSERT INTO `answer` VALUES ('31', '18', '1', ' null', '1');
INSERT INTO `answer` VALUES ('32', '18', '2', ' null', '1');

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `emailmd5` varchar(50) DEFAULT NULL,
  `randommd5` varchar(50) DEFAULT NULL,
  `isactivate` varchar(1) DEFAULT NULL,
  `vcode` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES ('18', '815855867@qq.com', 'snow21', '19b2604d7a374d9a0a6ba543c1cee12a', '6a6d66d8b5560f7d9c00570e79e2cdd0', '1', 'T29IWI');
INSERT INTO `employee` VALUES ('19', '815855867@qq.c', 'xxxxxxx', 'b740287a6aeb6073839ac480aa13b589', '79d50f632e03c847a66761e52ba5e820', '0', 'GC9FAE');
INSERT INTO `employee` VALUES ('20', '815855867@qq.c', 'k', 'b740287a6aeb6073839ac480aa13b589', 'a3fc44978747a5edd87ce22c87552358', '0', '00GN4P');
INSERT INTO `employee` VALUES ('21', 'admin@admin.com', 'admin', null, null, '2', null);
INSERT INTO `employee` VALUES ('22', 'asdfsdaf', null, null, null, null, null);
INSERT INTO `employee` VALUES ('23', 'sfsdfasdf', null, null, null, null, null);
INSERT INTO `employee` VALUES ('24', 'sssssssssssss', null, null, null, null, null);
INSERT INTO `employee` VALUES ('25', 'dsfsdddddddddddddd', null, null, null, null, null);
INSERT INTO `employee` VALUES ('26', 'sdfsdfsdf', null, null, null, null, null);
INSERT INTO `employee` VALUES ('27', null, null, 'sf', null, null, null);
INSERT INTO `employee` VALUES ('28', null, 'ssdfsf', null, null, null, null);
INSERT INTO `employee` VALUES ('29', null, null, null, null, '1', null);
INSERT INTO `employee` VALUES ('30', 'sdfsfsdf', null, null, null, null, null);
INSERT INTO `employee` VALUES ('31', 'sdfsdf', null, null, null, null, null);
INSERT INTO `employee` VALUES ('32', 'ssssssssssssssssss', null, null, null, null, null);
INSERT INTO `employee` VALUES ('33', 'fffffffffffff', null, null, null, null, null);
INSERT INTO `employee` VALUES ('34', 'eeeeeeeeeeeeeeeeeeeeee', null, null, null, null, null);

-- ----------------------------
-- Table structure for examination
-- ----------------------------
DROP TABLE IF EXISTS `examination`;
CREATE TABLE `examination` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `paperid` int(11) DEFAULT NULL,
  `papername` varchar(50) DEFAULT NULL,
  `content` varchar(500) DEFAULT NULL,
  `type` varchar(1) DEFAULT NULL,
  `answer` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of examination
-- ----------------------------
INSERT INTO `examination` VALUES ('1', '1', '工艺美术调查表', '1.我很明了本测试的说明：$A.是的#B.不一定#C.不是的', '1', 'A');
INSERT INTO `examination` VALUES ('2', '1', '工艺美术调查表', '2.产品类型：$A.实用品#B.观赏品#C.实用与观赏相结合', '1', 'A');
INSERT INTO `examination` VALUES ('3', '1', '工艺美术调查表', '公司名称：_', '0', '#');
INSERT INTO `examination` VALUES ('4', '1', '工艺美术调查表', '联系电话：_', '0', '#');
INSERT INTO `examination` VALUES ('5', '1', '工艺美术调查表', '联系人：_', '0', '#');
INSERT INTO `examination` VALUES ('6', '1', '工艺美术调查表', '填表时间：_', '0', '#');
INSERT INTO `examination` VALUES ('7', '1', '工艺美术调查表', '产地：_市_（区.镇）', '0', '#');
INSERT INTO `examination` VALUES ('24', '2', '大学生消费观调查问卷', '你的性别？$男#女', '1', '');
INSERT INTO `examination` VALUES ('25', '2', '大学生消费观调查问卷', '你的性别？$男#女', '1', '');
INSERT INTO `examination` VALUES ('26', '2', '大学生消费观调查问卷', '你的性别？$男#女', '1', '');
INSERT INTO `examination` VALUES ('27', '2', '大学生消费观调查问卷', '你的性别？$男#女', '1', '');
INSERT INTO `examination` VALUES ('28', '2', '大学生消费观调查问卷', '你的性别？$男#女', '1', '');
