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

 Date: 05/22/2019 20:24:36 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `culture_activity`
-- ----------------------------
DROP TABLE IF EXISTS `culture_activity`;
CREATE TABLE `culture_activity` (
  `activityID` int(11) NOT NULL AUTO_INCREMENT,
  `activityName` varchar(256) DEFAULT NULL,
  `sponsor` varchar(256) DEFAULT NULL,
  `meetingPlace` varchar(256) DEFAULT NULL,
  `secondSponsor` varchar(256) DEFAULT NULL,
  `needSchoolRang` varchar(256) DEFAULT NULL,
  `startDate` datetime DEFAULT NULL,
  `endDate` datetime DEFAULT NULL,
  `shdesc` varchar(256) DEFAULT NULL,
  `shstate` tinyint(4) DEFAULT '0' COMMENT '0有效，1删除',
  `startAddress` varchar(256) DEFAULT NULL,
  `needSchoolPass` int(11) DEFAULT NULL,
  `needSceneryPass` int(11) DEFAULT NULL,
  `settingStart` tinyint(4) DEFAULT NULL COMMENT '是否设置起点0不，1设置',
  `startSceneryid` int(11) DEFAULT NULL,
  `settingEnd` tinyint(4) DEFAULT NULL COMMENT '是否设置终点0不，1设置',
  `endSceneryid` int(11) DEFAULT NULL,
  `isGroup` tinyint(4) DEFAULT NULL,
  `groupNum` int(11) DEFAULT NULL,
  `createDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `createbyuserid` int(11) DEFAULT NULL,
  `isrecommend` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`activityID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `culture_activity_scenery`
-- ----------------------------
DROP TABLE IF EXISTS `culture_activity_scenery`;
CREATE TABLE `culture_activity_scenery` (
  `activityid` int(11) DEFAULT NULL,
  `sceneryid` int(11) DEFAULT NULL,
  `questionid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `culture_answer`
-- ----------------------------
DROP TABLE IF EXISTS `culture_answer`;
CREATE TABLE `culture_answer` (
  `answerID` int(11) NOT NULL AUTO_INCREMENT,
  `questionid` int(11) DEFAULT NULL,
  `answerTitle` varchar(256) DEFAULT NULL,
  `isRight` tinyint(4) DEFAULT NULL COMMENT '0非；1正确答案',
  PRIMARY KEY (`answerID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `culture_answer_question`
-- ----------------------------
DROP TABLE IF EXISTS `culture_answer_question`;
CREATE TABLE `culture_answer_question` (
  `studentid` int(11) DEFAULT NULL,
  `answerid` int(11) DEFAULT NULL,
  `questionid` int(11) DEFAULT NULL,
  `createDate` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
--  Table structure for `culture_attention_activity`
-- ----------------------------
DROP TABLE IF EXISTS `culture_attention_activity`;
CREATE TABLE `culture_attention_activity` (
  `studentid` int(11) DEFAULT NULL,
  `sceneryid` int(11) DEFAULT NULL,
  `activityid` int(11) DEFAULT NULL,
  `shstate` tinyint(4) DEFAULT NULL,
  `createdate` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `culture_discuss`
-- ----------------------------
DROP TABLE IF EXISTS `culture_discuss`;
CREATE TABLE `culture_discuss` (
  `discussID` int(11) NOT NULL AUTO_INCREMENT,
  `distype` tinyint(4) DEFAULT '0' COMMENT '留言类型，0景点，1活动, 2学校,3首页',
  `targetid` int(11) DEFAULT NULL COMMENT 'distype为0时对应sceneryid, 1 对应activityid,2 学校schoolid, 3 app首页',
  `studentid` int(11) DEFAULT NULL,
  `content` varchar(256) DEFAULT NULL,
  `shstate` tinyint(4) DEFAULT '0' COMMENT '0待审核，1审核通过，2删除,3受理，4拒绝',
  `createdate` datetime DEFAULT CURRENT_TIMESTAMP,
  `isrecommend` tinyint(4) DEFAULT '0',
  `clicknum` int(11) DEFAULT '0',
  PRIMARY KEY (`discussID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `culture_group`
-- ----------------------------
DROP TABLE IF EXISTS `culture_group`;
CREATE TABLE `culture_group` (
  `groupid` int(11) NOT NULL AUTO_INCREMENT,
  `activityid` int(11) DEFAULT NULL,
  `groupName` varchar(128) DEFAULT '',
  `shstate` tinyint(4) DEFAULT NULL,
  `createDate` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`groupid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `culture_like_discuss`
-- ----------------------------
DROP TABLE IF EXISTS `culture_like_discuss`;
CREATE TABLE `culture_like_discuss` (
  `studentid` int(11) DEFAULT NULL,
  `discussid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `culture_pagecache`
-- ----------------------------
DROP TABLE IF EXISTS `culture_pagecache`;
CREATE TABLE `culture_pagecache` (
  `cacheid` int(11) NOT NULL AUTO_INCREMENT,
  `cachename` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`cacheid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `culture_pagecache_copy`
-- ----------------------------
DROP TABLE IF EXISTS `culture_pagecache_copy`;
CREATE TABLE `culture_pagecache_copy` (
  `cacheid` int(11) NOT NULL AUTO_INCREMENT,
  `cachename` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`cacheid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `culture_permission`
-- ----------------------------
DROP TABLE IF EXISTS `culture_permission`;
CREATE TABLE `culture_permission` (
  `permissionID` int(11) NOT NULL AUTO_INCREMENT,
  `permissionName` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`permissionID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `culture_permission_school`
-- ----------------------------
DROP TABLE IF EXISTS `culture_permission_school`;
CREATE TABLE `culture_permission_school` (
  `schoolid` int(11) DEFAULT NULL,
  `permissionid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `culture_question`
-- ----------------------------
DROP TABLE IF EXISTS `culture_question`;
CREATE TABLE `culture_question` (
  `questionID` int(11) NOT NULL AUTO_INCREMENT,
  `sceneryid` int(11) DEFAULT NULL,
  `questionTitle` varchar(256) DEFAULT NULL,
  `questionType` tinyint(4) DEFAULT '0' COMMENT '0单选；1多选',
  `score` int(11) DEFAULT '0',
  `shstate` tinyint(4) DEFAULT '0' COMMENT '0有效；1无效',
  `createDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `answerA` varchar(256) DEFAULT NULL,
  `answerB` varchar(256) DEFAULT NULL,
  `answerC` varchar(256) DEFAULT NULL,
  `answerD` varchar(256) DEFAULT NULL,
  `rightAnswer` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`questionID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `culture_role`
-- ----------------------------
DROP TABLE IF EXISTS `culture_role`;
CREATE TABLE `culture_role` (
  `roleID` int(11) NOT NULL AUTO_INCREMENT,
  `roleName` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`roleID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `culture_role_permission`
-- ----------------------------
DROP TABLE IF EXISTS `culture_role_permission`;
CREATE TABLE `culture_role_permission` (
  `permissionid` int(11) DEFAULT NULL,
  `roleid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `culture_scenery`
-- ----------------------------
DROP TABLE IF EXISTS `culture_scenery`;
CREATE TABLE `culture_scenery` (
  `sceneryID` int(11) NOT NULL AUTO_INCREMENT,
  `schoolid` int(11) DEFAULT NULL,
  `address` varchar(256) DEFAULT NULL,
  `shdesc` varchar(256) DEFAULT NULL,
  `longitude` varchar(128) DEFAULT NULL,
  `latitude` varchar(128) DEFAULT NULL,
  `sctype` tinyint(4) DEFAULT '0' COMMENT '0景点；1人文；2历史，3事件',
  `shstate` tinyint(4) DEFAULT '0' COMMENT '0有效，1删除',
  `sceneryTitle` varchar(256) DEFAULT NULL,
  `soundurl` varchar(256) DEFAULT NULL,
  `videourl` varchar(256) DEFAULT NULL,
  `isrecommend` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`sceneryID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `culture_school`
-- ----------------------------
DROP TABLE IF EXISTS `culture_school`;
CREATE TABLE `culture_school` (
  `schoolID` int(11) NOT NULL AUTO_INCREMENT,
  `schoolName` varchar(256) DEFAULT NULL,
  `province` varchar(64) DEFAULT NULL,
  `city` varchar(64) DEFAULT NULL,
  `address` varchar(256) DEFAULT NULL,
  `schooldesc` varchar(1000) DEFAULT NULL,
  `shstate` tinyint(4) DEFAULT '0',
  `longitude` varchar(64) DEFAULT NULL,
  `latitude` varchar(64) DEFAULT NULL,
  `soundurl` varchar(256) DEFAULT NULL,
  `videourl` varchar(256) DEFAULT NULL,
  `parentid` int(11) DEFAULT '0',
  `areaid` int(11) DEFAULT NULL,
  `createbyuserid` int(11) DEFAULT NULL,
  `ispublic` tinyint(4) DEFAULT '1',
  `shortName` varchar(64) DEFAULT '',
  PRIMARY KEY (`schoolID`)
) ENGINE=InnoDB AUTO_INCREMENT=238 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `culture_source`
-- ----------------------------
DROP TABLE IF EXISTS `culture_source`;
CREATE TABLE `culture_source` (
  `sourceID` int(11) NOT NULL AUTO_INCREMENT,
  `sourceType` tinyint(4) DEFAULT NULL COMMENT '0 学校，1景点，2活动,4音频，5视频',
  `sourceAddress` varchar(256) DEFAULT NULL,
  `createDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `targetid` int(11) DEFAULT NULL COMMENT '资源id, 0对应学校表schoolid;1对象景点表scenneryid,2对应活动表actionid',
  `shstate` tinyint(4) DEFAULT '0',
  `picdesc` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`sourceID`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `culture_student`
-- ----------------------------
DROP TABLE IF EXISTS `culture_student`;
CREATE TABLE `culture_student` (
  `studentID` int(11) NOT NULL AUTO_INCREMENT,
  `studentName` varchar(64) DEFAULT NULL,
  `sex` tinyint(4) DEFAULT NULL COMMENT '0男，1女',
  `wxchat` varchar(256) DEFAULT NULL,
  `tel` varchar(36) DEFAULT NULL,
  `stuNo` int(20) DEFAULT NULL,
  `IDCard` varchar(30) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `schoolid` int(11) DEFAULT NULL,
  `photo` varchar(256) DEFAULT NULL,
  `shstate` tinyint(4) DEFAULT '0' COMMENT '0有效，1删除，2绑定，3解绑',
  `pwd` varchar(30) DEFAULT NULL,
  `wxopenid` varchar(30) DEFAULT NULL,
  `nickname` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`studentID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `culture_student_activity`
-- ----------------------------
DROP TABLE IF EXISTS `culture_student_activity`;
CREATE TABLE `culture_student_activity` (
  `studentID` int(11) DEFAULT NULL,
  `activityid` int(11) DEFAULT NULL,
  `shstate` tinyint(4) DEFAULT NULL COMMENT '0想去，1签到，2去过，3推荐，4分享',
  `createdate` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `culture_student_group`
-- ----------------------------
DROP TABLE IF EXISTS `culture_student_group`;
CREATE TABLE `culture_student_group` (
  `groupid` int(11) DEFAULT NULL,
  `studentid` int(11) DEFAULT NULL,
  `createDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `activityid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `culture_student_scenery`
-- ----------------------------
DROP TABLE IF EXISTS `culture_student_scenery`;
CREATE TABLE `culture_student_scenery` (
  `studentid` int(11) DEFAULT NULL,
  `sceneryid` int(11) DEFAULT NULL,
  `shstate` tinyint(4) DEFAULT NULL COMMENT '0想去，1签到，2去过，3推荐，4分享',
  `createdate` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `culture_student_school`
-- ----------------------------
DROP TABLE IF EXISTS `culture_student_school`;
CREATE TABLE `culture_student_school` (
  `studentid` int(11) DEFAULT NULL,
  `schoolid` int(11) DEFAULT NULL,
  `shstate` int(11) DEFAULT '0' COMMENT '0想去，1签到，2去过，3推荐，4分享',
  `createDate` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `culture_user`
-- ----------------------------
DROP TABLE IF EXISTS `culture_user`;
CREATE TABLE `culture_user` (
  `sysUserID` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(128) DEFAULT NULL,
  `pwd` varchar(20) DEFAULT NULL,
  `usertype` tinyint(4) DEFAULT '0',
  `schoolid` int(11) DEFAULT NULL,
  `shstate` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`sysUserID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `culture_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `culture_user_role`;
CREATE TABLE `culture_user_role` (
  `sysuserid` int(11) DEFAULT NULL,
  `roleid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SET FOREIGN_KEY_CHECKS = 1;
