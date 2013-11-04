/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1-3306
Source Server Version : 50532
Source Host           : localhost:3306
Source Database       : vote

Target Server Type    : MYSQL
Target Server Version : 50532
File Encoding         : 65001

Date: 2013-11-04 18:22:02
*/

SET FOREIGN_KEY_CHECKS=0;

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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES ('1', '815855867@qq.com', 'admin', '19b2604d7a374d9a0a6ba543c1cee12a', 'eb5be8e69025f0a1333e0084af7ec8d0', '1', 'BW2KBI');
INSERT INTO `employee` VALUES ('2', '815855867@qq.com', 'admin', '19b2604d7a374d9a0a6ba543c1cee12a', 'cde658c48579aa0f54850b0f68804491', '1', 'U4T9B9');
INSERT INTO `employee` VALUES ('3', '815855867@qq.com', '11111a', '19b2604d7a374d9a0a6ba543c1cee12a', '981ee11c08e460dc540242ee105b5ced', '1', 'L1SY3R');
INSERT INTO `employee` VALUES ('4', '815855867@qq.com', 'sdfsdfsdfsd', '19b2604d7a374d9a0a6ba543c1cee12a', '39269ee614adfdad51e2da9172680055', '0', 'AYW6LB');
INSERT INTO `employee` VALUES ('5', '815855867@qq.com', 'sdfsdfsdfsd', '19b2604d7a374d9a0a6ba543c1cee12a', 'de629226e67f740cc10950e9b7cd78de', '0', 'NFTRCN');
INSERT INTO `employee` VALUES ('6', '815855867@qq.com', 'snow21', '19b2604d7a374d9a0a6ba543c1cee12a', 'e051255f88dc99ef1e2cf6c508f92558', '0', '9PJ1A9');
INSERT INTO `employee` VALUES ('7', '815855867@qq.com', 'snow21', '19b2604d7a374d9a0a6ba543c1cee12a', '54ae9984a5ad9759114bc6fc832b2dc2', '1', 'XCK895');
INSERT INTO `employee` VALUES ('8', '815855867@qq.com', '11111a', '19b2604d7a374d9a0a6ba543c1cee12a', 'a9b9c14386441fb4b47786dbeed1fade', '1', 'IOSI6U');
INSERT INTO `employee` VALUES ('9', '815855867@qq.com', 'admin', '19b2604d7a374d9a0a6ba543c1cee12a', 'f3bef0161e87b0057c1588faf2499b4b', '0', 'R7I9TD');
INSERT INTO `employee` VALUES ('10', '815855867@qq.com', 'admin', '19b2604d7a374d9a0a6ba543c1cee12a', '2836b30231a04c452cecef4e2303439c', '1', 'YTX1SH');
INSERT INTO `employee` VALUES ('11', '815855867@qq.com', '11111a', '19b2604d7a374d9a0a6ba543c1cee12a', '09dda5e878f2e6e0dd2f2986b4596bd2', '1', 'PYMD9H');
INSERT INTO `employee` VALUES ('12', '815855867@qq.com', 'sdfsdfs', '19b2604d7a374d9a0a6ba543c1cee12a', 'd2bbdb72fd874cb759e74e635e246103', '0', 'W6BJPT');
INSERT INTO `employee` VALUES ('13', '815855867@qq.com', '11111a', '19b2604d7a374d9a0a6ba543c1cee12a', 'ee346de6f4021fd5e9f4e1a3c8e63f29', '0', 'UMCZ8B');
INSERT INTO `employee` VALUES ('14', '815855867@qq.com', 'sdfsdf', '19b2604d7a374d9a0a6ba543c1cee12a', '4b7fdb843994370b46f9c3757e9fee5a', '0', '8MRY5I');
INSERT INTO `employee` VALUES ('15', '815855867@qq.com', 'tomcat', '19b2604d7a374d9a0a6ba543c1cee12a', '84da71c9775b60bdc7df2194a1ee40e9', '0', 'THHSE2');
INSERT INTO `employee` VALUES ('16', '815855867@qq.com', '11111a', '19b2604d7a374d9a0a6ba543c1cee12a', 'a8c5835600f3286c876619330295a93d', '1', '21F85H');
INSERT INTO `employee` VALUES ('17', '815855867@qq.com', '11111a', '19b2604d7a374d9a0a6ba543c1cee12a', 'b0635a97ebd964d76c8400a12148383a', '1', 'MU4LNS');

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
