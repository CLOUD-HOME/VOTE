/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1-3306
Source Server Version : 50532
Source Host           : localhost:3306
Source Database       : vote

Target Server Type    : MYSQL
Target Server Version : 50532
File Encoding         : 65001

Date: 2013-11-06 17:51:56
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES ('18', '815855867@qq.com', 'snow21', '19b2604d7a374d9a0a6ba543c1cee12a', '6a6d66d8b5560f7d9c00570e79e2cdd0', '1', 'T29IWI');

-- ----------------------------
-- Table structure for examination
-- ----------------------------
DROP TABLE IF EXISTS `examination`;
CREATE TABLE `examination` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `paperid` int(11) DEFAULT NULL,
  `papername` varchar(20) DEFAULT NULL,
  `content` varchar(500) DEFAULT NULL,
  `type` varchar(1) DEFAULT NULL,
  `answer` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

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
