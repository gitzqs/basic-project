/*
Navicat MySQL Data Transfer

Source Server         : mysql_root
Source Server Version : 50520
Source Host           : localhost:3306
Source Database       : root_test

Target Server Type    : MYSQL
Target Server Version : 50520
File Encoding         : 65001

Date: 2016-08-26 17:20:16
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_permission`;
CREATE TABLE `sys_permission` (
  `id` bigint(19) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL COMMENT '编码',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `parent_permission_id` bigint(19) DEFAULT NULL COMMENT '上级',
  `type` varchar(10) DEFAULT 'MENU' COMMENT '类型',
  `url` varchar(20) DEFAULT NULL COMMENT '路径',
  `priority` int(10) DEFAULT NULL COMMENT '优先级',
  `icon` varchar(20) DEFAULT NULL COMMENT '图标',
  `status` varchar(10) DEFAULT 'ENABLED' COMMENT '状态',
  `creator_id` bigint(19) DEFAULT NULL COMMENT '创建人',
  `creator` varchar(255) DEFAULT NULL COMMENT '创建人名称',
  `created_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `last_operator_id` bigint(19) DEFAULT NULL COMMENT '最后修改人',
  `last_operated_time` timestamp NULL DEFAULT NULL COMMENT '最后修改时间',
  `last_operator` varchar(255) DEFAULT NULL COMMENT '最后修改人名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='权限表';

-- ----------------------------
-- Records of sys_permission
-- ----------------------------
INSERT INTO `sys_permission` VALUES ('1', 'system', '系统管理', '0', 'MENU', null, '1', '&#xe61d;', 'ENABLED', null, null, null, null, null, null);
INSERT INTO `sys_permission` VALUES ('2', 'sys_user', '用户管理', '1', 'MENU', null, '1', null, 'ENABLED', null, null, null, null, null, null);
INSERT INTO `sys_permission` VALUES ('3', 'sys_role', '角色管理', '1', 'MENU', '/sysRole/', '2', null, 'ENABLED', null, null, null, null, null, null);
INSERT INTO `sys_permission` VALUES ('4', 'sys_permission', '权限管理', '1', 'MENU', null, '3', null, 'ENABLED', null, null, null, null, null, null);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` bigint(19) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL COMMENT '角色编码',
  `name` varchar(255) DEFAULT NULL COMMENT '角色名称',
  `status` varchar(10) DEFAULT 'ENABLED' COMMENT '状态',
  `creator_id` bigint(19) DEFAULT NULL COMMENT '创建人',
  `creator` varchar(255) DEFAULT NULL COMMENT '创建人名称',
  `created_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `last_operator_id` bigint(19) DEFAULT NULL COMMENT '最后修改人',
  `last_operator` varchar(255) DEFAULT NULL COMMENT '最后修改人名称',
  `last_operated_time` timestamp NULL DEFAULT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', 'manager', '超级管理员', 'ENABLED', null, null, null, null, null, null);
INSERT INTO `sys_role` VALUES ('2', 'normal', '普通用户', 'ENABLED', null, null, null, null, null, null);

-- ----------------------------
-- Table structure for sys_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_permission`;
CREATE TABLE `sys_role_permission` (
  `id` bigint(19) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(19) DEFAULT NULL COMMENT '角色',
  `permission_id` bigint(19) DEFAULT NULL COMMENT '权限',
  `status` varchar(10) DEFAULT 'ENABLED' COMMENT '状态',
  `creator_id` bigint(19) DEFAULT NULL COMMENT '创建人',
  `creator` varchar(255) DEFAULT NULL COMMENT '创建人名称',
  `created_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `last_operator_id` bigint(19) DEFAULT NULL COMMENT '最后修改人',
  `last_operator` varchar(255) DEFAULT NULL COMMENT '最后修改人名称',
  `last_operated_time` timestamp NULL DEFAULT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='角色-权限表';

-- ----------------------------
-- Records of sys_role_permission
-- ----------------------------
INSERT INTO `sys_role_permission` VALUES ('1', '1', '1', 'ENABLED', null, null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('2', '1', '2', 'ENABLED', null, null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('3', '1', '3', 'ENABLED', null, null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('4', '1', '4', 'ENABLED', null, null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('5', '2', '1', 'ENABLED', null, null, null, null, null, null);
INSERT INTO `sys_role_permission` VALUES ('6', '2', '2', 'ENABLED', null, null, null, null, null, null);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` bigint(19) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL COMMENT '帐号',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `status` varchar(10) DEFAULT 'ENABLED' COMMENT '状态',
  `creator_id` bigint(19) DEFAULT NULL COMMENT '创建人',
  `creator` varchar(255) DEFAULT NULL COMMENT '创建人名称',
  `created_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `last_operator_id` bigint(19) DEFAULT NULL COMMENT '最后修改人',
  `last_operator` varchar(255) DEFAULT NULL COMMENT '最后修改人名称',
  `last_operated_time` timestamp NULL DEFAULT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'root', '63a9f0ea7bb98050796b649e85481845', 'ENABLED', null, null, null, null, null, null);
INSERT INTO `sys_user` VALUES ('2', 'normal', '63a9f0ea7bb98050796b649e85481845', 'ENABLED', null, null, null, null, null, null);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` bigint(19) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(19) DEFAULT NULL COMMENT '用户',
  `role_id` bigint(19) DEFAULT NULL COMMENT '角色',
  `status` varchar(10) DEFAULT 'ENABLED' COMMENT '状态',
  `creator_id` bigint(19) DEFAULT NULL COMMENT '创建人',
  `creator` varchar(255) DEFAULT NULL COMMENT '创建人名称',
  `created_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `last_operator_id` bigint(19) DEFAULT NULL COMMENT '最后修改人',
  `last_operator` varchar(255) DEFAULT NULL COMMENT '最后修改人名称',
  `last_operated_time` timestamp NULL DEFAULT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`id`),
  KEY `sys_link_user_id` (`user_id`) USING BTREE,
  KEY `sys_link_role_id` (`role_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='用户-角色表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '1', '1', 'ENABLED', null, null, null, null, null, null);
INSERT INTO `sys_user_role` VALUES ('2', '2', '2', 'ENABLED', null, null, null, null, null, null);
