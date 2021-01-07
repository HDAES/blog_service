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

 Date: 07/01/2021 18:30:58
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_blog_details
-- ----------------------------
DROP TABLE IF EXISTS `sys_blog_details`;
CREATE TABLE `sys_blog_details`  (
  `id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '详情ID',
  `s_id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类ID',
  `t_id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标签ID',
  `title` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '博客标题',
  `des` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '博客描述',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '博客图片',
  `source` int(0) NULL DEFAULT 0 COMMENT '来源 0: 原创  1:转载',
  `type` int(0) NULL DEFAULT 2 COMMENT '0: pc 1:微信小程序 2：pc和小程序',
  `order` int(0) NULL DEFAULT NULL COMMENT '排序',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_blog_sort
-- ----------------------------
DROP TABLE IF EXISTS `sys_blog_sort`;
CREATE TABLE `sys_blog_sort`  (
  `id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'ID 主键',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名字',
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片',
  `type` int(0) NULL DEFAULT 0 COMMENT '0: pc 1:微信小程序 3：pc和小程序',
  `deleted` int(0) NULL DEFAULT 0 COMMENT '删除状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_blog_sort
-- ----------------------------
INSERT INTO `sys_blog_sort` VALUES ('1346035174449393665', 'string', 'string', '1245346456', 0, 1);
INSERT INTO `sys_blog_sort` VALUES ('1346289147920072706', '123', '12312', 'https://hades0512.oss-cn-beijing.aliyuncs.com/de.jpg', 0, 1);
INSERT INTO `sys_blog_sort` VALUES ('1346337337323126786', 'JavaScript', 'nihao', 'https://hades0512.oss-cn-beijing.aliyuncs.com/1583836605249.jpg', 0, 1);
INSERT INTO `sys_blog_sort` VALUES ('1346339473540874241', '1321', '1233', 'https://hades0512.oss-cn-beijing.aliyuncs.com/1583836605249.jpg', 0, 1);
INSERT INTO `sys_blog_sort` VALUES ('1346353547930595330', 'JavaScript', 'xxxxxxxxxxxx', 'https://hades0512.oss-cn-beijing.aliyuncs.com/1583836605249.jpg', 0, 0);

-- ----------------------------
-- Table structure for sys_blog_tags
-- ----------------------------
DROP TABLE IF EXISTS `sys_blog_tags`;
CREATE TABLE `sys_blog_tags`  (
  `id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标签ID',
  `s_id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类ID',
  `t_name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标签名字',
  `t_icon` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标签图标',
  `deleted` int(0) NULL DEFAULT 0 COMMENT '删除状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_blog_tags
-- ----------------------------
INSERT INTO `sys_blog_tags` VALUES ('1346385377467678722', '1346353547930595330', 'Vue', 'vue', 1);
INSERT INTO `sys_blog_tags` VALUES ('1346393316765016065', '1346353547930595330', 'React', 'react', 1);
INSERT INTO `sys_blog_tags` VALUES ('1346657358586925057', '1346353547930595330', 'React', 'react', 0);

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
INSERT INTO `sys_menus` VALUES ('1340218162262286337', '1334509886049976322', 'Tabs', '/ui/tabs', NULL, 0, 0, 1, '2020-12-19 16:51:25', '2020-12-19 16:51:25');
INSERT INTO `sys_menus` VALUES ('1340218162262286338', '1334509886049976322', 'Tabs', '/ui/tabs', NULL, 0, 0, 1, '2020-12-19 16:51:25', '2020-12-19 16:51:25');
INSERT INTO `sys_menus` VALUES ('1340218434980126722', '1334509886049976322', 'Tabs', '/ui/tabs', NULL, 0, 0, 0, '2020-12-19 16:52:30', '2020-12-19 16:52:30');
INSERT INTO `sys_menus` VALUES ('1340223597518233601', '1334509886049976322', 'Emoji', '/ui/emoji', NULL, 0, 0, 0, '2020-12-19 17:13:00', '2020-12-19 17:13:00');
INSERT INTO `sys_menus` VALUES ('1340307458734399490', '0', '图表', '/chart', NULL, 3, 0, 0, '2020-12-19 22:46:15', '2020-12-19 22:46:15');
INSERT INTO `sys_menus` VALUES ('1340309220111392770', '1340307458734399490', '折线图', '/chart/line', NULL, 0, 0, 0, '2020-12-19 22:53:14', '2020-12-19 22:53:14');
INSERT INTO `sys_menus` VALUES ('1340322176823959553', '1340307458734399490', '条形图', '/chart/bar', NULL, 0, 0, 0, '2020-12-19 23:44:44', '2020-12-19 23:44:44');
INSERT INTO `sys_menus` VALUES ('1340327928586280962', '1340307458734399490', '饼图', '/chart/pie', NULL, 0, 0, 0, '2020-12-20 00:07:35', '2020-12-20 00:07:35');
INSERT INTO `sys_menus` VALUES ('1340334276615053314', '1340307458734399490', '水波图', '/chart/liquid', NULL, 0, 0, 0, '2020-12-20 00:32:48', '2020-12-20 00:32:48');
INSERT INTO `sys_menus` VALUES ('1340663453255966722', '1340307458734399490', '词云图', '/chart/word', NULL, 0, 0, 0, '2020-12-20 22:20:50', '2020-12-20 22:20:50');
INSERT INTO `sys_menus` VALUES ('1340669440910139394', '0', '编辑器', '/editor', NULL, 3, 0, 0, '2020-12-20 22:44:38', '2020-12-20 22:44:38');
INSERT INTO `sys_menus` VALUES ('1340669660444205057', '1340669440910139394', 'Braft-editor', '/editor/braft', NULL, 0, 0, 0, '2020-12-20 22:45:30', '2020-12-20 22:45:30');
INSERT INTO `sys_menus` VALUES ('1346017348217053185', '1334509886049976322', '轮播图', '/ui/carousel', NULL, 0, 0, 0, '2021-01-04 16:55:18', '2021-01-04 16:55:18');
INSERT INTO `sys_menus` VALUES ('1346027299119407105', '0', '博客管理', '/blog', NULL, 3, 0, 0, '2021-01-04 17:34:51', '2021-01-04 17:34:51');
INSERT INTO `sys_menus` VALUES ('1346029084877889538', '1346027299119407105', '分类', '/blog/sort', NULL, 0, 0, 0, '2021-01-04 17:41:57', '2021-01-04 17:41:57');
INSERT INTO `sys_menus` VALUES ('1346357882127216641', '1346027299119407105', '标签', '/blog/tags', NULL, 0, 0, 0, '2021-01-05 15:28:28', '2021-01-05 15:28:50');
INSERT INTO `sys_menus` VALUES ('1346668818037735425', '1346027299119407105', '博客详情', '/blog/details', NULL, 0, 0, 0, '2021-01-06 12:04:01', '2021-01-06 12:04:01');

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
INSERT INTO `sys_user` VALUES ('1339578972312211458', 'iu', 'hades', 'baca962007e33c803f9925eb0835c861', 5, '1334742747201794049', 0, 1, '2020-12-17 22:31:30', '2020-12-17 22:31:30');
INSERT INTO `sys_user` VALUES ('1339753742798274561', '肖磊', 'hades', 'baca962007e33c803f9925eb0835c861', 5, '1334742747201794049', 0, 0, '2020-12-18 10:05:58', '2020-12-18 10:05:58');
INSERT INTO `sys_user` VALUES ('1339756352087375874', '123112312', '12312', '3a7264ee6a44603c0b411862f4316856', 5, '1339025188347236354', 0, 0, '2020-12-18 10:16:20', '2020-12-18 10:16:37');

-- ----------------------------
-- Table structure for sys_user_group
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_group`;
CREATE TABLE `sys_user_group`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户组ID',
  `g_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户组名字',
  `menus` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '用户组权限菜单',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_group
-- ----------------------------
INSERT INTO `sys_user_group` VALUES ('1334742747201794049', '超级管理员', '1334687759586869250,1334509795264266242,1334510221418135554,1339045997518311425,1338120069035687937,1337939648898404354,1334509886049976322,1334510029532921858,1339763191164289026,1339824630574989314,1340134770171797506,1340140297954091009,1340218434980126722,1340223597518233601,1340669440910139394,1340669660444205057,1340309220111392770,1340322176823959553,1340327928586280962,1340334276615053314,1340307458734399490,1346027299119407105,1346029084877889538,1346357882127216641,1346668818037735425', '2020-12-04 14:14:04', '2021-01-06 12:04:10');
INSERT INTO `sys_user_group` VALUES ('1339025188347236354', '游客', '1334509795264266242', '2020-12-16 09:50:57', '2020-12-16 09:50:57');

SET FOREIGN_KEY_CHECKS = 1;
