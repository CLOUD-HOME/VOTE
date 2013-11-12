/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1-3306
Source Server Version : 50532
Source Host           : localhost:3306
Source Database       : vote

Target Server Type    : MYSQL
Target Server Version : 50532
File Encoding         : 65001

Date: 2013-11-12 18:22:25
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
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of answer
-- ----------------------------
INSERT INTO `answer` VALUES ('33', '21', '24', '1', '2');
INSERT INTO `answer` VALUES ('34', '21', '25', '1', '2');
INSERT INTO `answer` VALUES ('35', '21', '26', '1', '2');
INSERT INTO `answer` VALUES ('36', '21', '27', '1', '2');
INSERT INTO `answer` VALUES ('37', '21', '28', '1', '2');
INSERT INTO `answer` VALUES ('38', '18', '24', '1', '2');
INSERT INTO `answer` VALUES ('39', '18', '25', '1', '2');
INSERT INTO `answer` VALUES ('40', '18', '26', '1', '2');
INSERT INTO `answer` VALUES ('41', '18', '27', '1', '2');
INSERT INTO `answer` VALUES ('42', '18', '28', '1', '2');
INSERT INTO `answer` VALUES ('43', '18', '3', 'shangjia', '1');
INSERT INTO `answer` VALUES ('44', '18', '4', '18201225770', '1');
INSERT INTO `answer` VALUES ('45', '18', '5', 'chenyunzhan', '1');
INSERT INTO `answer` VALUES ('46', '18', '6', '2013', '1');
INSERT INTO `answer` VALUES ('47', '18', '7', '北京#北京', '1');
INSERT INTO `answer` VALUES ('48', '18', '1', '1', '1');
INSERT INTO `answer` VALUES ('49', '18', '2', '2', '1');
INSERT INTO `answer` VALUES ('50', '18', '29', '2#3', '1');
INSERT INTO `answer` VALUES ('51', '40', '3', 'zhongzhi', '1');
INSERT INTO `answer` VALUES ('52', '40', '4', '18201225779', '1');
INSERT INTO `answer` VALUES ('53', '40', '5', 'xxxxx', '1');
INSERT INTO `answer` VALUES ('54', '40', '6', '2019', '1');
INSERT INTO `answer` VALUES ('55', '40', '7', '西安#焦岱镇', '1');
INSERT INTO `answer` VALUES ('56', '40', '1', '1', '1');
INSERT INTO `answer` VALUES ('57', '40', '2', '1', '1');
INSERT INTO `answer` VALUES ('58', '40', '29', '3#4', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES ('18', '815855867@qq.com', 'snow21', '19b2604d7a374d9a0a6ba543c1cee12a', '6a6d66d8b5560f7d9c00570e79e2cdd0', '1', 'T29IWI');
INSERT INTO `employee` VALUES ('21', 'admin@admin.com', 'admin', null, null, '2', null);
INSERT INTO `employee` VALUES ('40', 'chenyunzhan08@126.com', 'snow21', 'd67b7dcff8d344eb69bbfc23ec2b9353', '28cdefd70b3917aaeca03666dca80e06', '1', 'F4PQJR');

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
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

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
INSERT INTO `examination` VALUES ('29', '1', '工艺美术调查表', '3，你喜欢的体育有：$A. 篮球 #B. 橄榄球 #C. 乒乓球 #D. 围棋', '2', '');
