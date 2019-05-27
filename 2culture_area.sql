/*
 Navicat MySQL Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80013
 Source Host           : localhost
 Source Database       : shculture

 Target Server Type    : MySQL
 Target Server Version : 80013
 File Encoding         : utf-8

 Date: 04/10/2019 22:04:36 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `culture_area`
-- ----------------------------
DROP TABLE IF EXISTS `culture_area`;
CREATE TABLE `culture_area` (
  `areaid` int(11) NOT NULL AUTO_INCREMENT,
  `areaname` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`areaid`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `culture_area`
-- ----------------------------
BEGIN;
INSERT INTO `culture_area` VALUES ('1', '黄浦区'), ('2', '虹口区'), ('3', '杨浦区'), ('4', '闸北区'), ('5', '普陀区'), ('6', '长宁区'), ('7', '奉贤区'), ('8', '金山区'), ('9', '松江区'), ('10', '青浦区'), ('11', '嘉定区'), ('12', '宝山区'), ('13', '崇明县'), ('14', '静安区'), ('15', '徐汇区'), ('16', '浦东新区');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
