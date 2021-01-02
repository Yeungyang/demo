/*
 Navicat Premium Data Transfer

 Source Server         : jsu
 Source Server Type    : MySQL
 Source Server Version : 80021
 Source Host           : localhost:3306
 Source Schema         : salary

 Target Server Type    : MySQL
 Target Server Version : 80021
 File Encoding         : 65001

 Date: 02/01/2021 08:14:03
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tb_department
-- ----------------------------
DROP TABLE IF EXISTS `tb_department`;
CREATE TABLE `tb_department`  (
  `mg_id` int NOT NULL,
  `dt_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `dt_creatTime` date NOT NULL,
  `dt_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `dt_bz` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `em_id` int NULL DEFAULT NULL,
  `em_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `em_tel` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `em_email` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `dt_salary` double NULL DEFAULT NULL,
  PRIMARY KEY (`dt_id`, `mg_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_employee
-- ----------------------------
DROP TABLE IF EXISTS `tb_employee`;
CREATE TABLE `tb_employee`  (
  `mg_id` int NOT NULL,
  `em_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `em_jobnum` int NOT NULL,
  `em_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `em_sex` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `em_age` int NULL DEFAULT NULL,
  `em_IDCard` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `em_typeWork` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `em_dt_id` int UNSIGNED NULL DEFAULT NULL,
  `em_dt_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `em_address` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `em_tel` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `em_email` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `em_birthday` date NULL DEFAULT NULL,
  PRIMARY KEY (`em_id`, `mg_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 47 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_manager
-- ----------------------------
DROP TABLE IF EXISTS `tb_manager`;
CREATE TABLE `tb_manager`  (
  `mg_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `mg_email` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mg_pwd` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`mg_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_salary
-- ----------------------------
DROP TABLE IF EXISTS `tb_salary`;
CREATE TABLE `tb_salary`  (
  `mg_id` int NOT NULL,
  `salary_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `em_departName` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `em_id` int UNSIGNED NOT NULL,
  `em_jobNum` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `em_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `base_salary` double NULL DEFAULT NULL,
  `reward` double NULL DEFAULT NULL,
  `penalty` double NULL DEFAULT NULL,
  `special` double NULL DEFAULT NULL,
  `pretax_salary` double NULL DEFAULT NULL,
  `taxation` double NULL DEFAULT NULL,
  `actual_salary` double NULL DEFAULT NULL,
  `time` date NULL DEFAULT NULL,
  `yanglao` double NULL DEFAULT NULL,
  `yiliao` double NULL DEFAULT NULL,
  `shiye` double NULL DEFAULT NULL,
  `gongshang` double NULL DEFAULT NULL,
  `shenyu` double NULL DEFAULT NULL,
  `gongjijin` double NULL DEFAULT NULL,
  PRIMARY KEY (`salary_id`, `mg_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

SET FOREIGN_KEY_CHECKS = 1;
