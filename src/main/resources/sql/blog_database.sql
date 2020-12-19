/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80021
 Source Host           : localhost:3306
 Source Schema         : blog_database

 Target Server Type    : MySQL
 Target Server Version : 80021
 File Encoding         : 65001

 Date: 19/12/2020 16:41:51
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_menus
-- ----------------------------
DROP TABLE IF EXISTS `sys_menus`;
CREATE TABLE `sys_menus`  (
  `id` varchar(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单ID',
  `m_id` varchar(19) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '父级ID',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单名字',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单地址',
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单Icon',
  `sort` int(0) NULL DEFAULT 0 COMMENT '菜单排序',
  `status` int(0) NULL DEFAULT 0 COMMENT '菜单状态',
  `deleted` int(0) NULL DEFAULT 0 COMMENT '逻辑删除',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menus
-- ----------------------------
INSERT INTO `sys_menus` VALUES ('1334509795264266242', '0', '首页', '/index', '/icon', 1, 0, 0, '2020-12-03 22:48:24', '2020-12-03 22:48:24');
INSERT INTO `sys_menus` VALUES ('1334509886049976322', '0', 'ui', '/ui', '/icon-ui', 3, 0, 0, '2020-12-03 22:48:45', '2020-12-13 20:52:26');
INSERT INTO `sys_menus` VALUES ('1334510029532921858', '1334509886049976322', 'Button', '/ui/button', '/icon-ui', 0, 0, 0, '2020-12-03 22:49:20', '2020-12-03 22:49:20');
INSERT INTO `sys_menus` VALUES ('1334510221418135554', '0', '权限管理', '/auth', '/icon-auth', 2, 0, 0, '2020-12-03 22:50:05', '2020-12-03 22:50:05');
INSERT INTO `sys_menus` VALUES ('1334512533704331266', '1334509886049976322', '1313123', '/ui/dilog', 'string', 0, 0, 1, '2020-12-03 22:59:17', '2020-12-04 12:08:18');
INSERT INTO `sys_menus` VALUES ('1334687759586869250', '0', '日志', '/logs', 'string', 4, 0, 0, '2020-12-04 10:35:34', '2020-12-04 10:35:34');
INSERT INTO `sys_menus` VALUES ('1337939648898404354', '1334510221418135554', '菜单', '/auth/menus', '/icon', 2, 0, 0, '2020-12-13 09:57:25', '2020-12-13 21:54:47');
INSERT INTO `sys_menus` VALUES ('1337980579520512001', '1334509886049976322', '轮播图', '/swiper', 'swiper', 0, 0, 1, '2020-12-13 12:40:03', '2020-12-16 11:13:09');
INSERT INTO `sys_menus` VALUES ('1338044026334507010', '0', 'hades23123', '/hades', '1232', 10, 0, 1, '2020-12-13 16:52:10', '2020-12-13 18:08:31');
INSERT INTO `sys_menus` VALUES ('1338120069035687937', '1334510221418135554', '用户组', '/auth/group', NULL, 1, 0, 0, '2020-12-13 21:54:20', '2020-12-13 21:54:59');
INSERT INTO `sys_menus` VALUES ('1339045997518311425', '1334510221418135554', '用户', '/auth/user', NULL, 0, 0, 0, '2020-12-16 11:13:39', '2020-12-16 11:28:52');
INSERT INTO `sys_menus` VALUES ('1339763191164289026', '1334509886049976322', '弹窗', '/ui/modal', NULL, 0, 0, 0, '2020-12-18 10:43:31', '2020-12-18 14:46:54');
INSERT INTO `sys_menus` VALUES ('1339824630574989314', '1334509886049976322', '抽屉', '/ui/drawer', NULL, 0, 0, 0, '2020-12-18 14:47:39', '2020-12-18 14:47:39');
INSERT INTO `sys_menus` VALUES ('1340134770171797506', '1334509886049976322', 'loading', '/ui/loading', NULL, 0, 0, 0, '2020-12-19 11:20:02', '2020-12-19 11:20:55');
INSERT INTO `sys_menus` VALUES ('1340140297954091009', '1334509886049976322', '通知提示', '/ui/note', NULL, 0, 0, 0, '2020-12-19 11:42:00', '2020-12-19 11:42:00');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户ID',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '账号',
  `pass_word` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户密码',
  `type` int(0) UNSIGNED NULL DEFAULT 5 COMMENT '用户类型：0(default): 超级管理员 1：管理员  5：游客',
  `group_id` varchar(19) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户组ID',
  `status` int(0) NULL DEFAULT 0 COMMENT '用户状态： 0：激活  1：未激活',
  `deleted` int(0) NULL DEFAULT 0 COMMENT '逻辑删除',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1339578972312211458', 'iu', 'hades', 'baca962007e33c803f9925eb0835c861', 5, '1334742747201794049', 0, 0, '2020-12-17 22:31:30', '2020-12-17 22:31:30');
INSERT INTO `sys_user` VALUES ('1339753742798274561', '肖磊', 'hades', '7dea0ff174fbb957c1a832d6234beb2a', 5, '1334742747201794049', 0, 0, '2020-12-18 10:05:58', '2020-12-18 10:05:58');
INSERT INTO `sys_user` VALUES ('1339756352087375874', '123112312', '12312', '3a7264ee6a44603c0b411862f4316856', 5, '1339025188347236354', 0, 0, '2020-12-18 10:16:20', '2020-12-18 10:16:37');

-- ----------------------------
-- Table structure for sys_user_group
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_group`;
CREATE TABLE `sys_user_group`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户组ID',
  `g_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户组名字',
  `menus` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户组权限菜单',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_group
-- ----------------------------
INSERT INTO `sys_user_group` VALUES ('1334742747201794049', '超级管理员', '1334687759586869250,1334509795264266242,1334510221418135554,1339045997518311425,1338120069035687937,1337939648898404354,1334509886049976322,1334510029532921858,1339763191164289026,1339824630574989314,1340134770171797506,1340140297954091009', '2020-12-04 14:14:04', '2020-12-19 11:42:10');
INSERT INTO `sys_user_group` VALUES ('1339025188347236354', '游客', '1334509795264266242', '2020-12-16 09:50:57', '2020-12-16 09:50:57');

SET FOREIGN_KEY_CHECKS = 1;
