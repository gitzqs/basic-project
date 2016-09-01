/*
Navicat MySQL Data Transfer

Source Server         : mysql_root
Source Server Version : 50520
Source Host           : localhost:3306
Source Database       : root_test

Target Server Type    : MYSQL
Target Server Version : 50520
File Encoding         : 65001

Date: 2016-08-31 17:03:38
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
  `url` varchar(20) DEFAULT '' COMMENT '路径',
  `priority` int(10) DEFAULT NULL COMMENT '优先级',
  `icon` varchar(20) DEFAULT '' COMMENT '图标',
  `status` varchar(10) DEFAULT 'ENABLED' COMMENT '状态',
  `creator_id` bigint(19) DEFAULT NULL COMMENT '创建人',
  `creator` varchar(255) DEFAULT NULL COMMENT '创建人名称',
  `created_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `last_operator_id` bigint(19) DEFAULT NULL COMMENT '最后修改人',
  `last_operator` varchar(255) DEFAULT NULL COMMENT '最后修改人名称',
  `last_operated_time` timestamp NULL DEFAULT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='权限表';

-- ----------------------------
-- Records of sys_permission
-- ----------------------------
INSERT INTO `sys_permission` VALUES ('1', 'system', '系统管理', '0', 'MENU', '', '1', '&#xe61d;', 'ENABLED', '1', 'root', '2016-08-15 14:06:50', '1', 'root', '2016-08-29 14:07:07');
INSERT INTO `sys_permission` VALUES ('2', 'sys_user', '用户管理', '1', 'MENU', '/sysUser/', '1', null, 'ENABLED', '1', 'root', '2016-08-29 14:28:51', '1', 'root', '2016-08-30 14:07:36');
INSERT INTO `sys_permission` VALUES ('3', 'sys_role', '角色管理', '1', 'MENU', '/sysRole/', '2', null, 'ENABLED', '1', 'root', '2016-08-29 14:28:55', '1', 'root', '2016-08-29 14:07:51');
INSERT INTO `sys_permission` VALUES ('4', 'sys_permission', '权限管理', '1', 'MENU', '/sysPermission/', '3', null, 'ENABLED', '1', 'root', '2016-08-29 14:28:59', '1', 'root', '2016-08-29 14:07:54');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` bigint(19) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL COMMENT '角色编码',
  `name` varchar(255) DEFAULT NULL COMMENT '角色名称',
  `status` varchar(10) DEFAULT 'ENABLED' COMMENT '状态',
  `description` varchar(255) DEFAULT NULL COMMENT '备注',
  `creator_id` bigint(19) DEFAULT NULL COMMENT '创建人',
  `creator` varchar(255) DEFAULT NULL COMMENT '创建人名称',
  `created_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `last_operator_id` bigint(19) DEFAULT NULL COMMENT '最后修改人',
  `last_operator` varchar(255) DEFAULT NULL COMMENT '最后修改人名称',
  `last_operated_time` timestamp NULL DEFAULT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', 'manager', '超级管理员', 'ENABLED', '最高权限', '1', 'root', '2016-08-15 13:37:32', '1', 'root', '2016-08-23 13:37:38');
INSERT INTO `sys_role` VALUES ('2', 'normal', '普通用户', 'ENABLED', '普通权限', '1', 'root', '2016-08-22 13:37:44', '1', 'root', '2016-08-29 13:37:50');
INSERT INTO `sys_role` VALUES ('3', 'tourist', '游客', 'ENABLED', '没有权限', '1', 'root', '2016-08-16 13:38:03', '1', 'root', '2016-08-28 13:38:31');
INSERT INTO `sys_role` VALUES ('4', 'manager_2', '一般管理员', 'ENABLED', '普通权限高一点', '1', 'root', '2016-08-17 13:38:06', '1', 'root', '2016-08-29 13:38:35');
INSERT INTO `sys_role` VALUES ('5', 'system_assistant', '系统助理', 'ENABLED', '没有权限', '1', 'root', '2016-08-18 13:38:10', '1', 'root', '2016-08-29 13:38:38');
INSERT INTO `sys_role` VALUES ('6', 'system_maintain', '系统维护', 'ENABLED', '权限比较高', '1', 'root', '2016-08-19 13:38:13', '1', 'root', '2016-08-29 13:38:41');
INSERT INTO `sys_role` VALUES ('7', 'assistant_manager', '助理管理', 'ENABLED', '没有权限', '1', 'root', '2016-08-20 13:38:17', '1', 'root', '2016-08-29 13:38:46');

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'root', '63a9f0ea7bb98050796b649e85481845', 'ENABLED', '1', 'root', '2016-08-15 14:02:19', '1', 'root', '2016-08-29 14:02:25');
INSERT INTO `sys_user` VALUES ('2', 'normal', '63a9f0ea7bb98050796b649e85481845', 'ENABLED', '1', 'root', '2016-08-16 14:02:31', '1', 'root', '2016-08-29 14:02:36');
INSERT INTO `sys_user` VALUES ('3', 'test1', '63a9f0ea7bb98050796b649e85481845', 'ENABLED', null, null, null, null, null, null);
INSERT INTO `sys_user` VALUES ('4', 'test2', '63a9f0ea7bb98050796b649e85481845', 'ENABLED', null, null, null, null, null, null);

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

-- ----------------------------
-- Table structure for user_database
-- ----------------------------
DROP TABLE IF EXISTS `user_database`;
CREATE TABLE `user_database` (
  `id` bigint(19) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(19) DEFAULT NULL COMMENT '用户id',
  `database_driver` varchar(255) DEFAULT NULL COMMENT '数据库驱动',
  `database_url` varchar(255) DEFAULT NULL COMMENT '数据库地址',
  `database_name` varchar(50) DEFAULT NULL COMMENT '数据库名',
  `database_user` varchar(50) DEFAULT NULL COMMENT '数据库用户名',
  `database_password` varchar(255) DEFAULT NULL COMMENT '用户密码',
  `status` varchar(20) DEFAULT 'ENABLED' COMMENT '状态',
  `description` varchar(255) DEFAULT NULL COMMENT '备注',
  `creator_id` bigint(19) DEFAULT NULL,
  `creator` varchar(50) DEFAULT NULL,
  `created_time` timestamp NULL DEFAULT NULL,
  `last_operator_id` bigint(19) DEFAULT NULL,
  `last_operator` varchar(50) DEFAULT NULL,
  `last_operated_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_database
-- ----------------------------
INSERT INTO `user_database` VALUES ('1', '3', 'com.mysql.jdbc.Driver', 'jdbc:mysql://localhost:3306/test?useUnicode=true&characterEncoding=utf-8', 'test', 'root', 'root', 'ENABLED', null, null, null, null, null, null, null);
INSERT INTO `user_database` VALUES ('2', '4', 'com.mysql.jdbc.Driver', 'jdbc:mysql://localhost:3306/test2?useUnicode=true&characterEncoding=utf-8', 'test2', 'root', 'root', 'ENABLED', null, null, null, null, null, null, null);
