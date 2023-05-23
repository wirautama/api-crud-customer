/*
 Navicat Premium Data Transfer

 Source Server         : laragon
 Source Server Type    : MySQL
 Source Server Version : 80030 (8.0.30)
 Source Host           : localhost:3306
 Source Schema         : sales

 Target Server Type    : MySQL
 Target Server Version : 80030 (8.0.30)
 File Encoding         : 65001

 Date: 23/05/2023 13:49:13
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cabang
-- ----------------------------
DROP TABLE IF EXISTS `cabang`;
CREATE TABLE `cabang`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_perusahaan` int NOT NULL,
  `nama_cabang` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `alamat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_perusahaan`(`id_perusahaan` ASC) USING BTREE,
  CONSTRAINT `cabang_ibfk_1` FOREIGN KEY (`id_perusahaan`) REFERENCES `perusahaan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cabang
-- ----------------------------
INSERT INTO `cabang` VALUES (1, 1, 'PT. Wuling Kawula Bahari', 'Jl. Pahlawan No.6 Beji, Pasuruan');
INSERT INTO `cabang` VALUES (2, 2, 'PT. Jasa Media Pratama', 'Jl. Apel No.03 Rembang, Pasuruan');

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `sales_id` int NULL DEFAULT NULL,
  `nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `no_tlpn` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `alamat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `status` enum('Q&A','Ragu-Ragu','Un-Cover') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `metode_ketemu` enum('Ketemu','Chat') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sales_id`(`sales_id` ASC) USING BTREE,
  CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`sales_id`) REFERENCES `sales` (`id_sales`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES (1, 1, 'Anthonius Hudan Pratama', '082567123213', 'Kejapanan Gang Masjid, Gempol, Pasuruan', 'Q&A', 'Ketemu');
INSERT INTO `customer` VALUES (2, 2, 'Mochammad Holil', '087654321876', 'Jl. Raya Candi, Gelam, Sidoarjo', 'Un-Cover', 'Chat');
INSERT INTO `customer` VALUES (3, 3, 'Jihan Anisa Mukti', '087980764123', 'Perumtas III Blok C5, Tulangan Sidoarjo', 'Ragu-Ragu', 'Ketemu');
INSERT INTO `customer` VALUES (4, 4, 'Jawahira Agnesfi', '088876451432', 'Jl. Garuda No.7, Sedati, Sidoarjo', 'Q&A', 'Ketemu');
INSERT INTO `customer` VALUES (5, 5, 'Hervin Diah Novitasari', '087654789333', 'Jl. Imam Bonjol No.6, Gayungan, Sidoarjo', 'Un-Cover', 'Chat');
INSERT INTO `customer` VALUES (6, 6, 'Muhammad Imam Tohari', '081675444321', 'Jl. Garuda No.5, Sedati, Sidoarjo', 'Q&A', 'Ketemu');
INSERT INTO `customer` VALUES (7, 7, 'Farisah Al-Miroh', '089997654567', 'Jl. Majapahit No.33, Sidoarjo', 'Ragu-Ragu', 'Chat');
INSERT INTO `customer` VALUES (8, 8, 'Faizah Nur Kumala', '087654789666', 'Jl. Sepat. No.3 Bangil, Pasuruan', 'Q&A', 'Ketemu');
INSERT INTO `customer` VALUES (9, 1, 'Yoga Nur Pratama', '083451567890', 'Ds. Melian No.5, Gempol, Pasuruan', 'Ragu-Ragu', 'Chat');
INSERT INTO `customer` VALUES (10, 2, 'Annisa Fitria Hinggis', '089765789543', 'Ds. Carat No.8, Gempol, Pasuruan', 'Q&A', 'Ketemu');
INSERT INTO `customer` VALUES (11, 3, 'Theresia Pao', '089765120987', 'Jl. Pahlawan No.50 Surabaya', 'Un-Cover', 'Chat');

-- ----------------------------
-- Table structure for karyawan
-- ----------------------------
DROP TABLE IF EXISTS `karyawan`;
CREATE TABLE `karyawan`  (
  `id_perusahaan` int NULL DEFAULT NULL,
  `id_cabang` int NULL DEFAULT NULL,
  `nip` int NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `alamat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`nip`) USING BTREE,
  INDEX `id_perusahaan`(`id_perusahaan` ASC) USING BTREE,
  INDEX `id_cabang`(`id_cabang` ASC) USING BTREE,
  CONSTRAINT `karyawan_ibfk_1` FOREIGN KEY (`id_perusahaan`) REFERENCES `perusahaan` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `karyawan_ibfk_2` FOREIGN KEY (`id_cabang`) REFERENCES `cabang` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of karyawan
-- ----------------------------
INSERT INTO `karyawan` VALUES (1, NULL, 1, 'Tofani Syaifullah', 'Ds. Kejapanan N0. 08, Gempol, Pasuruan');
INSERT INTO `karyawan` VALUES (NULL, 1, 2, 'Putra Angga Reksa', 'Ds. Pandean No.1, Gempol, Pasuruan');
INSERT INTO `karyawan` VALUES (2, NULL, 3, 'Muhammad Fitra Gemilang', 'Perumtas 3 Blok A4, Tulangan, Sidoarjo');
INSERT INTO `karyawan` VALUES (NULL, 2, 4, 'Adam Putra Eriyanto', 'Ds. Mojorejo  No.5, Pungging, Mojokerto');
INSERT INTO `karyawan` VALUES (1, NULL, 5, 'Ahmad Eko Effendi', 'Ds. Curahmojo No.4, Pungging, Mojokerto');
INSERT INTO `karyawan` VALUES (NULL, 1, 6, 'Achmad Zainy Andhi Pratama', 'Ds. Carat No.5, Gempol, Pasuruan');
INSERT INTO `karyawan` VALUES (2, NULL, 7, 'Burhanuddin', 'Jl. Cucut No.3, Bangil, Pasuruan');
INSERT INTO `karyawan` VALUES (NULL, 2, 8, 'Egi Ibnu Pranowo', 'Jl. Raya Bengok, Beji, Pasuruan');

-- ----------------------------
-- Table structure for perusahaan
-- ----------------------------
DROP TABLE IF EXISTS `perusahaan`;
CREATE TABLE `perusahaan`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `nama__perusahaan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `alamat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of perusahaan
-- ----------------------------
INSERT INTO `perusahaan` VALUES (1, 'PT. Narasinga Wiratama', 'Jl. Tongkol No.3 Bangil, Pasuruan');
INSERT INTO `perusahaan` VALUES (2, 'PT. Tirta Semesta Buana', 'Jl. Veteran No.50 Wonoayu, Sidoarjo');

-- ----------------------------
-- Table structure for sales
-- ----------------------------
DROP TABLE IF EXISTS `sales`;
CREATE TABLE `sales`  (
  `id_sales` int NOT NULL AUTO_INCREMENT,
  `nip_karyawan` int NULL DEFAULT NULL,
  `level` enum('1','2','3') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id_sales`) USING BTREE,
  INDEX `nip_karyawan`(`nip_karyawan` ASC) USING BTREE,
  CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`nip_karyawan`) REFERENCES `karyawan` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sales
-- ----------------------------
INSERT INTO `sales` VALUES (1, 1, '1');
INSERT INTO `sales` VALUES (2, 2, '1');
INSERT INTO `sales` VALUES (3, 3, '2');
INSERT INTO `sales` VALUES (4, 4, '2');
INSERT INTO `sales` VALUES (5, 5, '3');
INSERT INTO `sales` VALUES (6, 6, '3');
INSERT INTO `sales` VALUES (7, 7, '1');
INSERT INTO `sales` VALUES (8, 8, '1');

SET FOREIGN_KEY_CHECKS = 1;
