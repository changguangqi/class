/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50624
Source Host           : localhost:3306
Source Database       : zyzcbpt

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2018-01-08 19:23:13
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_ddmy
-- ----------------------------
DROP TABLE IF EXISTS `t_ddmy`;
CREATE TABLE `t_ddmy` (
  `id` int(16) NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_ddmy
-- ----------------------------
INSERT INTO `t_ddmy` VALUES ('1', 'CORP_ID', 'ding8d3c13f616d3d80e35c2f4657eb6378f');
INSERT INTO `t_ddmy` VALUES ('2', 'CORP_SECRET', '-6Mj9W1IGMzzTsB-8IkUJB-auYpiyxXKUxXl3TPZFiWzdde39j-S2aYSoguJtOlT');
INSERT INTO `t_ddmy` VALUES ('3', 'SSO_Secret', 'gKd8yb6xll8l4B8Hp2JJjtwHaipAJD1sdI_G37IMrlvlDdP76L9MVa18-9TZA6tn');
INSERT INTO `t_ddmy` VALUES ('4', 'agentId', '157087671');
