/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 100422
 Source Host           : localhost:3306
 Source Schema         : db_project

 Target Server Type    : MySQL
 Target Server Version : 100422
 File Encoding         : 65001

 Date: 20/04/2025 15:24:43
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cache
-- ----------------------------
DROP TABLE IF EXISTS `cache`;
CREATE TABLE `cache`  (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cache_locks
-- ----------------------------
DROP TABLE IF EXISTS `cache_locks`;
CREATE TABLE `cache_locks`  (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp(0) NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `failed_jobs_uuid_unique`(`uuid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for job_batches
-- ----------------------------
DROP TABLE IF EXISTS `job_batches`;
CREATE TABLE `job_batches`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for jobs
-- ----------------------------
DROP TABLE IF EXISTS `jobs`;
CREATE TABLE `jobs`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `jobs_queue_index`(`queue`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mbranchs
-- ----------------------------
DROP TABLE IF EXISTS `mbranchs`;
CREATE TABLE `mbranchs`  (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `ncompanyid` int(3) NOT NULL,
  `ccode` varchar(75) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `cname` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `cdescription` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `cphone` varchar(75) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `cemail` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `caddress` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `clocation` varchar(55) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `cbranch_manager` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cbranch_supervisor` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ccreate_by` int(11) DEFAULT NULL,
  `cupdate_by` int(11) DEFAULT NULL,
  `created_at` timestamp(0) NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp(0) NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(0),
  `cstatus` smallint(1) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mbranchs
-- ----------------------------
INSERT INTO `mbranchs` VALUES (1, 1, '101', 'Serpong - Tangerang', 'Cabang Pembantu Tangerang', '123456789', 'sms@gmail.com', 'Summarecon Mal Lt. 3, Jl. Boulevard Raya Gading Serpong', 'Serpong', 'Daeng', 'Akbar', 1, 1, '2025-03-15 16:19:20', '2025-03-17 01:42:56', 0);
INSERT INTO `mbranchs` VALUES (5, 1, '101', 'Urip - Makassar', 'Cabang Pelaksana Makassar', '123456789', 'mks@gmail.com', 'Jl. Urip Sumiharjo Makassar', 'Makassar', '-', '-', 1, 1, '2025-03-17 01:36:11', '2025-03-17 01:40:52', 1);

-- ----------------------------
-- Table structure for mclients
-- ----------------------------
DROP TABLE IF EXISTS `mclients`;
CREATE TABLE `mclients`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ccontact_person` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `cemail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `cphone` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `caddress` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `ccreate_by` int(11) DEFAULT NULL,
  `cupdate_by` int(11) DEFAULT NULL,
  `created_at` timestamp(0) NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp(0) NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(0),
  `cstatus` smallint(1) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `cemail`(`cemail`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mclients
-- ----------------------------
INSERT INTO `mclients` VALUES (3, 'PT Telkomsel Indonesia', 'Erwing', 'bts@gmail.com', '123456789', 'Jakarta', 1, 1, '2025-03-26 08:02:16', '2025-04-08 09:44:46', 1);
INSERT INTO `mclients` VALUES (4, 'Makassar International Airport', 'Akbar', 't@gmail.com', '1234567890', 'Makassar', 1, 1, '2025-03-26 08:02:52', '2025-04-08 09:45:44', 1);

-- ----------------------------
-- Table structure for mcompanies
-- ----------------------------
DROP TABLE IF EXISTS `mcompanies`;
CREATE TABLE `mcompanies`  (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `cname` varchar(75) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `cdescription` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `cowner` varchar(75) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `cemail` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `caddress` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `clocation` varchar(55) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `chotline` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `cwebsite` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `cstatus` tinyint(1) NOT NULL DEFAULT 1,
  `cimage` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `cfacebook` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ctwitter` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cinstagram` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `clinkedin` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ccreate_by` int(11) DEFAULT NULL,
  `cupdate_by` int(11) DEFAULT NULL,
  `created_at` timestamp(0) NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp(0) NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mcompanies
-- ----------------------------
INSERT INTO `mcompanies` VALUES (1, 'PT Ewaku Trans Utama', 'Perusahaan Telekomunikasi', 'Erwin Saputra', 'daeng.akbar@gmail.com', 'Jl. Aeropala Makassar Ruko Zambrud No 5', 'Makassar', '082190763270', 'www.ewaku.co.id', 1, 'kouCMj2dvSH3js51JYzF1mEKosmOktp8TtVYQ094.jpg', NULL, NULL, NULL, NULL, NULL, 1, '2025-03-13 02:24:31', '2025-03-16 06:46:00');
INSERT INTO `mcompanies` VALUES (2, 'PT Anuan', '', '', '', '', NULL, '', '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-04-16 17:07:28', '2025-04-16 17:07:28');
INSERT INTO `mcompanies` VALUES (3, 'PT Testing', '', '', '', '', NULL, '', '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-04-16 17:23:05', '2025-04-16 17:23:05');

-- ----------------------------
-- Table structure for memployees
-- ----------------------------
DROP TABLE IF EXISTS `memployees`;
CREATE TABLE `memployees`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nbranch_id` int(11) DEFAULT NULL,
  `cname` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `caddress` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `cphone` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `cemail` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `cposition` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `cnip` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `cexpertise` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `cimage` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `cstatus` smallint(1) NOT NULL,
  `cplace_birth` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `ddate_Birth` date DEFAULT NULL,
  `ccreate_by` int(11) DEFAULT NULL,
  `cupdate_by` int(11) DEFAULT NULL,
  `created_at` timestamp(0) NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp(0) NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of memployees
-- ----------------------------
INSERT INTO `memployees` VALUES (1, NULL, 'Dr. Andi Surahman Batara', 'Jakarta', '082190763270', 'daeng.akbar@gmail.com', '04.Wakil Dekan III', '0924038101', 'Programmer', 'n66chrpVOcXWw8TA7cFWlKMDSafF1tJSGQTbQfkE.jpg', 1, 'Makassar', '1977-10-24', 1, NULL, '2025-03-23 20:42:37', '2025-03-23 14:31:30');
INSERT INTO `memployees` VALUES (2, NULL, 'Dr. dr. H. Muh. Khidri Alwi, M.Kes', NULL, NULL, NULL, '05.Wakil Dekan IV', '0919068402', NULL, 'no-people.png', 0, NULL, NULL, NULL, NULL, '2023-04-15 23:27:53', '2025-03-23 20:42:42');
INSERT INTO `memployees` VALUES (3, NULL, 'Wa Ode Sri Asnaniar,,S.Kep.,Ns.,M.Kes., M.Kep', NULL, NULL, NULL, '11.Ketua Prodi Ilmu Keperawatan', '0924068402', NULL, 'no-people.png', 0, NULL, NULL, NULL, NULL, '2025-03-23 20:42:38', '2024-10-29 09:59:45');
INSERT INTO `memployees` VALUES (4, NULL, 'Yusrah Taqiyah, S.Kep., Ns., M.Kes., M.Kep', NULL, NULL, NULL, '12.Sekretaris Prodi Ilmu Keperawatan', '0903098601', NULL, 'no-people.png', 0, NULL, NULL, NULL, NULL, '2025-03-23 20:42:39', '2024-10-29 10:04:35');
INSERT INTO `memployees` VALUES (5, NULL, 'Sudarman, S.Kep.,Ns.,M.Kes.,M.Kep', NULL, NULL, NULL, '13.Ketua Prodi Profesi Ners', NULL, NULL, 'no-people.png', 0, NULL, NULL, NULL, NULL, '2023-04-20 23:56:53', '2024-10-29 10:13:06');

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '0001_01_01_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (2, '0001_01_01_000001_create_cache_table', 1);
INSERT INTO `migrations` VALUES (3, '0001_01_01_000002_create_jobs_table', 1);
INSERT INTO `migrations` VALUES (4, '2016_08_03_072729_create_provinces_table', 2);
INSERT INTO `migrations` VALUES (5, '2016_08_03_072750_create_cities_table', 2);
INSERT INTO `migrations` VALUES (6, '2016_08_03_072804_create_districts_table', 2);
INSERT INTO `migrations` VALUES (7, '2016_08_03_072819_create_villages_table', 2);

-- ----------------------------
-- Table structure for mproject_details
-- ----------------------------
DROP TABLE IF EXISTS `mproject_details`;
CREATE TABLE `mproject_details`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nproject_id` int(11) NOT NULL,
  `cname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `cdescription` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `dstart_date` date DEFAULT NULL,
  `dend_date` date DEFAULT NULL,
  `cstatus` enum('Planned','Progress','Completed') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'Planned',
  `ccreate_by` int(11) DEFAULT NULL,
  `cupdate_by` int(11) DEFAULT NULL,
  `created_at` timestamp(0) NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp(0) NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mproject_details
-- ----------------------------
INSERT INTO `mproject_details` VALUES (1, 0, 'Project Audit BTS', 'Audit BTS Di Wilayah Sulawesi', '2025-03-01', '2025-03-22', 'Progress', 1, NULL, '2025-03-22 14:29:40', '2025-03-26 15:03:13');
INSERT INTO `mproject_details` VALUES (3, 0, 'Transportasi Bandara', 'Project Pengadaan Kendaraan Transportasi', '2025-03-23', '2025-03-25', 'Progress', 1, NULL, '2025-03-25 08:00:42', '2025-03-26 15:03:14');

-- ----------------------------
-- Table structure for mprojects
-- ----------------------------
DROP TABLE IF EXISTS `mprojects`;
CREATE TABLE `mprojects`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `cdescription` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `caddress` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `dstart_date` date DEFAULT NULL,
  `dend_date` date DEFAULT NULL,
  `cstatus` enum('Planned','Progress','Completed') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'Planned',
  `nclient_id` int(11) DEFAULT NULL,
  `ccreate_by` int(11) DEFAULT NULL,
  `cupdate_by` int(11) DEFAULT NULL,
  `created_at` timestamp(0) NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp(0) NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(0),
  `cimage` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `nclient_id`(`nclient_id`) USING BTREE,
  CONSTRAINT `mprojects_ibfk_1` FOREIGN KEY (`nclient_id`) REFERENCES `mclients` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mprojects
-- ----------------------------
INSERT INTO `mprojects` VALUES (1, 'Project Audit BTS', 'Audit BTS Di Wilayah Sulawesi', 'Makassar', '2025-03-01', '2025-03-22', 'Progress', 3, 1, NULL, '2025-03-22 14:29:40', '2025-03-26 15:03:13', NULL);
INSERT INTO `mprojects` VALUES (3, 'Transportasi Bandara', 'Project Pengadaan Kendaraan Transportasi', 'Bandara Makassar', '2025-03-23', '2025-03-25', 'Progress', 4, 1, 1, '2025-03-25 08:00:42', '2025-04-08 09:45:56', NULL);

-- ----------------------------
-- Table structure for mroles
-- ----------------------------
DROP TABLE IF EXISTS `mroles`;
CREATE TABLE `mroles`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `cname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_at` timestamp(0) NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `jobs_queue_index`(`cname`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mroles
-- ----------------------------
INSERT INTO `mroles` VALUES (1, 'Developer', '2025-03-25 09:11:57');
INSERT INTO `mroles` VALUES (2, 'Designer', '2025-03-25 09:12:14');
INSERT INTO `mroles` VALUES (3, 'Tester', '2025-03-25 09:12:25');

-- ----------------------------
-- Table structure for msettings
-- ----------------------------
DROP TABLE IF EXISTS `msettings`;
CREATE TABLE `msettings`  (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `cname` varchar(75) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `cmotto` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `cdescription` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `cowner` varchar(75) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `cemail` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `caddress` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `clocation` varchar(55) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `chotline` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `cwebsite` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `capi_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `cskin` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `cstatus` tinyint(1) NOT NULL DEFAULT 1,
  `cserver_status` tinyint(1) NOT NULL DEFAULT 1,
  `cimage` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `cicon` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `cfacebook` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ctwitter` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cinstagram` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `clinkedin` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ccreate_by` int(11) DEFAULT NULL,
  `cupdate_by` int(11) DEFAULT NULL,
  `created_at` timestamp(0) NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp(0) NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of msettings
-- ----------------------------
INSERT INTO `msettings` VALUES (1, 'Aplikasi Audit Project', 'Semua Pekerjaan Harus Dengan Kejujuran', 'Sistem Untuk Audit Pekerjaan Jasa', 'PT. Ewaku Trans Utama', 'daeng.akbar@gmail.com', 'Jalan Urip Sumohardjo Km. 5, Makassar 90231', 'Jakarta - Makassar', '+62 821 9076 4370', 'www.ewaku.com', NULL, 'skin-green-light', 1, 1, '1717840260-6664298415c78.png', '1728859349-670c4cd5a871e.svg', 'https://www.facebook.com', 'https://x.com', 'https://www.instagram.com', 'https://www.linkedin.com', NULL, 0, '2025-02-15 17:44:15', '2025-03-05 15:19:05');

-- ----------------------------
-- Table structure for mteam_members
-- ----------------------------
DROP TABLE IF EXISTS `mteam_members`;
CREATE TABLE `mteam_members`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nemployee_id` int(11) NOT NULL,
  `nproject_id` int(11) NOT NULL,
  `crole` enum('Developer','Designer','Tester') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `cstatus` int(1) DEFAULT 1,
  `ccreate_by` int(11) DEFAULT NULL,
  `cupdate_by` int(11) DEFAULT NULL,
  `created_at` timestamp(0) NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp(0) NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `nproject_id`(`nproject_id`) USING BTREE,
  INDEX `mteam_members_ibfk_1`(`nemployee_id`) USING BTREE,
  CONSTRAINT `mteam_members_ibfk_1` FOREIGN KEY (`nemployee_id`) REFERENCES `memployees` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `mteam_members_ibfk_2` FOREIGN KEY (`nproject_id`) REFERENCES `mprojects` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mteam_members
-- ----------------------------
INSERT INTO `mteam_members` VALUES (7, 1, 1, 'Developer', 1, 1, 1, '2025-03-26 08:27:34', '2025-03-26 15:10:52');
INSERT INTO `mteam_members` VALUES (8, 4, 3, 'Developer', 1, 1, 1, '2025-03-26 08:27:43', '2025-03-26 15:45:57');

-- ----------------------------
-- Table structure for muser_logs
-- ----------------------------
DROP TABLE IF EXISTS `muser_logs`;
CREATE TABLE `muser_logs`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nuser_id` int(11) NOT NULL,
  `cbefore` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cafter` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `curl` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cip_address` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp(0) NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of muser_logs
-- ----------------------------
INSERT INTO `muser_logs` VALUES (1, 1, '{\"id\":8,\"nemployee_id\":3,\"nproject_id\":1,\"crole\":\"Developer\",\"cstatus\":0,\"ccreate_by\":1,\"cupdate_by\":1,\"created_at\":\"2025-03-26 08:27:43\",\"updated_at\":\"2025-03-26 15:22:23\"}', '{\"nemployee_id\":3,\"nproject_id\":1,\"crole\":\"Developer\",\"cstatus\":0,\"cupdate_by\":1}', '/livewire/update', 'http://127.0.0.1:8000', '2025-03-26 15:39:21', '2025-03-26 15:39:21');
INSERT INTO `muser_logs` VALUES (2, 1, '{\"id\":8,\"nemployee_id\":5,\"nproject_id\":1,\"crole\":\"Developer\",\"cstatus\":0,\"ccreate_by\":1,\"cupdate_by\":1,\"created_at\":\"2025-03-26 08:27:43\",\"updated_at\":\"2025-03-26 15:40:31\"}', '{\"nemployee_id\":\"5\",\"nproject_id\":1,\"crole\":\"Developer\",\"cstatus\":0,\"cupdate_by\":1}', '/livewire/update', 'http://127.0.0.1:8000', '2025-03-26 15:40:32', '2025-03-26 15:40:32');
INSERT INTO `muser_logs` VALUES (3, 1, '{\"id\":8,\"nemployee_id\":5,\"nproject_id\":1,\"crole\":\"Developer\",\"cstatus\":0,\"ccreate_by\":1,\"cupdate_by\":1,\"created_at\":\"2025-03-26 08:27:43\",\"updated_at\":\"2025-03-26 15:40:31\"}', '{\"nemployee_id\":\"4\",\"nproject_id\":\"3\",\"crole\":\"Developer\",\"cstatus\":\"1\",\"cupdate_by\":1}', '/livewire/update', 'http://127.0.0.1:8000', '2025-03-26 15:45:57', '2025-03-26 15:45:57');

-- ----------------------------
-- Table structure for musers
-- ----------------------------
DROP TABLE IF EXISTS `musers`;
CREATE TABLE `musers`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `role` enum('admin','project_manager','team_member','client') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp(0) NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp(0) NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(0),
  `dlast_login` datetime(0) DEFAULT NULL,
  `cip_static` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cstatus` int(1) DEFAULT 1,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ccreateby` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cupdateby` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `email`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of musers
-- ----------------------------
INSERT INTO `musers` VALUES (1, 'Test User', 'test@example.com', '$2y$12$T3Ysogsjp8ENVOQbWzaAleWWYHvu08DkzbAZNjIGyart/Q35Cjefe', 'admin', '2025-03-26 15:21:05', '2025-03-26 15:21:23', NULL, NULL, 1, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for password_reset_tokens
-- ----------------------------
DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE `password_reset_tokens`  (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) DEFAULT NULL,
  PRIMARY KEY (`email`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for personal_access_tokens
-- ----------------------------
DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp(0) DEFAULT NULL,
  `expires_at` timestamp(0) DEFAULT NULL,
  `created_at` timestamp(0) DEFAULT NULL,
  `updated_at` timestamp(0) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `personal_access_tokens_token_unique`(`token`) USING BTREE,
  INDEX `personal_access_tokens_tokenable_type_tokenable_id_index`(`tokenable_type`, `tokenable_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for posts
-- ----------------------------
DROP TABLE IF EXISTS `posts`;
CREATE TABLE `posts`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) DEFAULT NULL,
  `updated_at` timestamp(0) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of posts
-- ----------------------------
INSERT INTO `posts` VALUES (1, 'LpQiIJLDCMFuZjoIEXaIwp1ybz0NWOllmS8W5Xo9.jpg', 'Cincing White Gold', 'Post Cincing White Gold', '2025-02-15 20:50:08', '2025-02-16 14:14:18');
INSERT INTO `posts` VALUES (2, 'gD8h9WqgotR5yqrl1slHatYjUged6qRTkblN6uMz.jpg', 'Testing', 'php artisan storage:link', '2025-02-16 08:17:18', '2025-02-16 14:13:49');
INSERT INTO `posts` VALUES (3, '7hRMXq8YxReMmUxIcryzOBzePPsd1qRrJbjiuA94.jpg', 'Modem', 'Modem Orbit Telkomsel', '2025-02-27 10:19:09', '2025-02-27 10:19:09');

-- ----------------------------
-- Table structure for sessions
-- ----------------------------
DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sessions_user_id_index`(`user_id`) USING BTREE,
  INDEX `sessions_last_activity_index`(`last_activity`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sessions
-- ----------------------------
INSERT INTO `sessions` VALUES ('4diWAXnFzKLEjHjL4yHV91IlxSqwUGngud6DtGck', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:137.0) Gecko/20100101 Firefox/137.0', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiU2V5ME0yZFFpYVM4RndReEtKc1VURm9IZndHaFIyVTVTTHJnSDExaiI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjY2OiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvc3RvcmFnZS9zZXR0aW5nLzE3MTc4NDAyNjAtNjY2NDI5ODQxNWM3OC5wbmciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO30=', 1744264917);
INSERT INTO `sessions` VALUES ('dI3SdN9a8AkA8zSrU4Qr5bMA7IuKo8oRBrg81fBf', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:136.0) Gecko/20100101 Firefox/136.0', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiTmJ5MzhNWHpLaW1vYjF6UTBPZUZQQm9IZlNMS0dTenN1RFhpcnlmSCI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjM0OiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvdGFza3MvZWRpdC8xIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTt9', 1744084554);
INSERT INTO `sessions` VALUES ('IeinGZL2Wpb8sHC243ei2FI5KeOr22GQPp4BmHpq', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:136.0) Gecko/20100101 Firefox/136.0', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiVE9icDgyZ2pRcTdJNWhOa1pQcmQwelRoWmVwTE91VzAwRFUxSnRvNCI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjM3OiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvcHJvamVjdHMvZWRpdC8zIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTt9', 1744109539);

-- ----------------------------
-- Table structure for tactivity_logs
-- ----------------------------
DROP TABLE IF EXISTS `tactivity_logs`;
CREATE TABLE `tactivity_logs`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nuser_id` int(11) NOT NULL,
  `ctype` enum('insert','update','delete') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `caction` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `curl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `cip_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp(0) NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp(0) NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `nuser_id`(`nuser_id`) USING BTREE,
  CONSTRAINT `nuser_id` FOREIGN KEY (`nuser_id`) REFERENCES `musers` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tactivity_logs
-- ----------------------------
INSERT INTO `tactivity_logs` VALUES (1, 1, 'delete', '{ \"id\" : 6,\n	\"nemployee_id\" : 1,\n	\"nproject_id\" : 3,\n	\"crole\" : \"Developer\",\n	\"cstatus\" : 1,\n	\"ccreate_by\" : 1,\n	\"cupdate_by\" : NULL,\n	\"created_at\" : \"2025-03-26 08:08:08\",\n	\"updated_at\" : \"2025-03-26 08:08:08\" }', '/ livewire / UPDATE', 'http :// 127.0.0.1 : 8000', '2025-03-26 08:00:00', '2025-03-26 08:00:00');
INSERT INTO `tactivity_logs` VALUES (2, 1, 'delete', '{\"id\":6,\"nemployee_id\":1,\"nproject_id\":3,\"crole\":\"Developer\",\"cstatus\":1,\"ccreate_by\":1,\"cupdate_by\":null,\"created_at\":\"2025-03-26 08:08:08\",\"updated_at\":\"2025-03-26 08:08:08\"}', '/livewire/update', 'http://127.0.0.1:8000', '2025-03-26 08:22:36', '2025-03-26 08:22:36');

-- ----------------------------
-- Table structure for taudit_images
-- ----------------------------
DROP TABLE IF EXISTS `taudit_images`;
CREATE TABLE `taudit_images`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `naudit_id` int(11) NOT NULL,
  `cphoto_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `cdescription` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `ccreate_by` int(11) DEFAULT NULL,
  `cupdate_by` int(11) DEFAULT NULL,
  `created_at` timestamp(0) NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp(0) NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `naudit_id`(`naudit_id`) USING BTREE,
  CONSTRAINT `taudit_images_ibfk_1` FOREIGN KEY (`naudit_id`) REFERENCES `taudits` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for taudits
-- ----------------------------
DROP TABLE IF EXISTS `taudits`;
CREATE TABLE `taudits`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nproject_id` int(11) NOT NULL,
  `nauditor_id` int(11) NOT NULL,
  `daudit_date` date NOT NULL,
  `cfindings` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `cstatus` enum('pending','reviewed','resolved') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'pending',
  `ccreate_by` int(11) DEFAULT NULL,
  `cupdate_by` int(11) DEFAULT NULL,
  `created_at` timestamp(0) NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp(0) NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `nproject_id`(`nproject_id`) USING BTREE,
  INDEX `nauditor_id`(`nauditor_id`) USING BTREE,
  CONSTRAINT `taudits_ibfk_1` FOREIGN KEY (`nproject_id`) REFERENCES `mprojects` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `taudits_ibfk_2` FOREIGN KEY (`nauditor_id`) REFERENCES `musers` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tcomments
-- ----------------------------
DROP TABLE IF EXISTS `tcomments`;
CREATE TABLE `tcomments`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ntask_id` int(11) NOT NULL,
  `nuser_id` int(11) NOT NULL,
  `ccontent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ccreate_by` int(11) DEFAULT NULL,
  `cupdate_by` int(11) DEFAULT NULL,
  `created_at` timestamp(0) NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp(0) NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ntask_id`(`ntask_id`) USING BTREE,
  INDEX `nuser_id`(`nuser_id`) USING BTREE,
  CONSTRAINT `tcomments_ibfk_1` FOREIGN KEY (`ntask_id`) REFERENCES `ttasks` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `tcomments_ibfk_2` FOREIGN KEY (`nuser_id`) REFERENCES `musers` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for texpense_approvals
-- ----------------------------
DROP TABLE IF EXISTS `texpense_approvals`;
CREATE TABLE `texpense_approvals`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nexpense_request_id` int(11) NOT NULL,
  `napprover_id` int(11) NOT NULL,
  `cdecision` enum('approved','rejected') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `cnotes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `ccreate_by` int(11) DEFAULT NULL,
  `cupdate_by` int(11) DEFAULT NULL,
  `created_at` timestamp(0) NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp(0) NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `nexpense_request_id`(`nexpense_request_id`) USING BTREE,
  INDEX `napprover_id`(`napprover_id`) USING BTREE,
  CONSTRAINT `texpense_approvals_ibfk_1` FOREIGN KEY (`nexpense_request_id`) REFERENCES `texpense_requests` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `texpense_approvals_ibfk_2` FOREIGN KEY (`napprover_id`) REFERENCES `musers` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for texpense_requests
-- ----------------------------
DROP TABLE IF EXISTS `texpense_requests`;
CREATE TABLE `texpense_requests`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `naudit_id` int(11) NOT NULL,
  `nrequester_id` int(11) NOT NULL,
  `namount` decimal(10, 2) NOT NULL,
  `cdescription` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `cstatus` enum('pending','approved','rejected') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'pending',
  `ccreate_by` int(11) DEFAULT NULL,
  `cupdate_by` int(11) DEFAULT NULL,
  `created_at` timestamp(0) NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp(0) NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `naudit_id`(`naudit_id`) USING BTREE,
  INDEX `nrequester_id`(`nrequester_id`) USING BTREE,
  CONSTRAINT `texpense_requests_ibfk_1` FOREIGN KEY (`naudit_id`) REFERENCES `taudits` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `texpense_requests_ibfk_2` FOREIGN KEY (`nrequester_id`) REFERENCES `musers` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tfiles
-- ----------------------------
DROP TABLE IF EXISTS `tfiles`;
CREATE TABLE `tfiles`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nproject_id` int(11) DEFAULT NULL,
  `ntask_id` int(11) DEFAULT NULL,
  `nuploaded_by` int(11) NOT NULL,
  `cfile_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `cfile_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ccreate_by` int(11) DEFAULT NULL,
  `cupdate_by` int(11) DEFAULT NULL,
  `created_at` timestamp(0) NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp(0) NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `nproject_id`(`nproject_id`) USING BTREE,
  INDEX `ntask_id`(`ntask_id`) USING BTREE,
  INDEX `nuploaded_by`(`nuploaded_by`) USING BTREE,
  CONSTRAINT `tfiles_ibfk_1` FOREIGN KEY (`nproject_id`) REFERENCES `mprojects` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `tfiles_ibfk_2` FOREIGN KEY (`ntask_id`) REFERENCES `ttasks` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `tfiles_ibfk_3` FOREIGN KEY (`nuploaded_by`) REFERENCES `musers` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tnotifications
-- ----------------------------
DROP TABLE IF EXISTS `tnotifications`;
CREATE TABLE `tnotifications`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nuser_id` int(11) NOT NULL,
  `cmessage` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_read` tinyint(1) DEFAULT 0,
  `ccreate_by` int(11) DEFAULT NULL,
  `cupdate_by` int(11) DEFAULT NULL,
  `created_at` timestamp(0) NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp(0) NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `nuser_id`(`nuser_id`) USING BTREE,
  CONSTRAINT `tnotifications_ibfk_1` FOREIGN KEY (`nuser_id`) REFERENCES `musers` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ttasks
-- ----------------------------
DROP TABLE IF EXISTS `ttasks`;
CREATE TABLE `ttasks`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nproject_id` int(11) NOT NULL,
  `cname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `cdescription` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `nassigned_to` int(11) DEFAULT NULL,
  `cstatus` enum('todo','progress','done') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'todo',
  `cpriority` enum('low','medium','high') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'medium',
  `ddue_date` date DEFAULT NULL,
  `ccreate_by` int(11) DEFAULT NULL,
  `cupdate_by` int(11) DEFAULT NULL,
  `created_at` timestamp(0) NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp(0) NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `nproject_id`(`nproject_id`) USING BTREE,
  INDEX `ttasks_ibfk_2`(`nassigned_to`) USING BTREE,
  CONSTRAINT `ttasks_ibfk_1` FOREIGN KEY (`nproject_id`) REFERENCES `mprojects` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `ttasks_ibfk_2` FOREIGN KEY (`nassigned_to`) REFERENCES `memployees` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ttasks
-- ----------------------------
INSERT INTO `ttasks` VALUES (1, 3, 'Audit Lokasi BTS', 'Pengecekan Tower Makassar', 3, 'progress', 'high', '2025-03-17', 1, 1, '2025-03-27 11:35:17', '2025-04-08 03:54:38');

-- ----------------------------
-- Table structure for tuser_main_menu
-- ----------------------------
DROP TABLE IF EXISTS `tuser_main_menu`;
CREATE TABLE `tuser_main_menu`  (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `cid_user` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '',
  `cid_menu` int(11) DEFAULT NULL,
  `cname_menu` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `cnotes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cclass` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `cicon` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `clink` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nparent` int(3) DEFAULT NULL,
  `cactive` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `ccreateby` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '',
  `cupdateby` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '',
  `created_at` datetime(0) DEFAULT NULL,
  `updated_at` datetime(0) DEFAULT NULL,
  `nmodul` int(1) DEFAULT 1 COMMENT '1 : web , 2 : admin',
  PRIMARY KEY (`cid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 54 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tuser_main_menu
-- ----------------------------
INSERT INTO `tuser_main_menu` VALUES (1, '2', 100, 'Admin', NULL, '#', '#', '#', 10, 'y', 'daeng akbar', '', NULL, NULL, 1);
INSERT INTO `tuser_main_menu` VALUES (2, '2', 110, 'Dashboard', NULL, '#', 'mdi mdi-speedometer', 'dashboards', 100, 'y', 'daeng akbar', '', '2024-10-26 04:44:12', NULL, 1);
INSERT INTO `tuser_main_menu` VALUES (3, '2', 120, 'Kategori', NULL, '#', 'mdi mdi-form-dropdown', '#', 100, 'y', 'daeng akbar', '', '2024-10-26 04:44:12', NULL, 1);
INSERT INTO `tuser_main_menu` VALUES (4, '2', 130, 'Profile', NULL, '#', 'mdi mdi-book-account', '#', 100, 'y', 'daeng akbar', '', '2024-10-26 04:44:13', NULL, 1);
INSERT INTO `tuser_main_menu` VALUES (5, '2', 140, 'Akademik', NULL, '#', 'mdi mdi-book-education', 'education.index', 100, 'y', 'daeng akbar', '', '2024-10-26 04:44:13', NULL, 1);
INSERT INTO `tuser_main_menu` VALUES (6, '2', 150, 'Penelitian', NULL, '#', 'mdi mdi-flask-off-outline', '#', 100, 'y', 'daeng akbar', '', '2024-10-26 04:44:13', NULL, 1);
INSERT INTO `tuser_main_menu` VALUES (7, '2', 160, 'Pengabdian', NULL, '#', 'mdi mdi-book-open', 'service.index', 100, 'y', 'daeng akbar', '', '2024-10-26 04:44:13', NULL, 1);
INSERT INTO `tuser_main_menu` VALUES (8, '2', 170, 'Fasilitas', NULL, '#', 'mdi mdi-treasure-chest', 'facility.index', 100, 'y', 'daeng akbar', '', '2024-10-26 04:44:13', NULL, 1);
INSERT INTO `tuser_main_menu` VALUES (9, '2', 180, 'Informasi', NULL, '#', 'mdi mdi-surround-sound', '#', 100, 'y', 'daeng akbar', '', '2024-10-26 04:44:13', NULL, 1);
INSERT INTO `tuser_main_menu` VALUES (10, '2', 200, 'Pengguna Admin', NULL, '#', 'mdi mdi-account-group-outline', '#', 100, 'y', 'daeng akbar', '', '2024-10-26 04:44:13', NULL, 1);
INSERT INTO `tuser_main_menu` VALUES (11, '2', 210, 'Pendukung', NULL, '#', 'mdi mdi-tools', '#', 100, 'y', 'daeng akbar', '', '2024-10-26 04:44:13', NULL, 1);
INSERT INTO `tuser_main_menu` VALUES (12, '2', 101, 'Website', NULL, '#', '#', '#', 10, 'y', 'daeng akbar', '', NULL, NULL, 1);
INSERT INTO `tuser_main_menu` VALUES (13, '2', 220, 'Pengguna Website', NULL, '#', 'mdi mdi-account-group-outline', '#', 101, 'y', 'daeng akbar', '', '2024-10-26 04:44:15', NULL, 1);
INSERT INTO `tuser_main_menu` VALUES (14, '2', 230, 'Sivitas Pengguna', NULL, '#', 'mdi mdi-account-outline', '#', 101, 'y', 'daeng akbar', '', '2024-10-26 04:44:16', NULL, 1);

-- ----------------------------
-- Table structure for tuser_sub_menu
-- ----------------------------
DROP TABLE IF EXISTS `tuser_sub_menu`;
CREATE TABLE `tuser_sub_menu`  (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `cid_user` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `cid_menu` int(11) DEFAULT NULL,
  `cname_menu` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `cclass` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `cicon` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `clink` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nparent` int(3) DEFAULT NULL,
  `cactive` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'y',
  `nadd` int(1) DEFAULT 1,
  `nedit` int(1) DEFAULT 1,
  `ndel` int(1) DEFAULT 1,
  `ccreateby` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '',
  `cupdateby` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '',
  `dcreated_at` datetime(0) DEFAULT NULL,
  `dupdated_at` datetime(0) DEFAULT NULL,
  `nmodul` int(1) DEFAULT 1 COMMENT '1 : web , 2 : admin',
  PRIMARY KEY (`cid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 108 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tuser_sub_menu
-- ----------------------------
INSERT INTO `tuser_sub_menu` VALUES (1, '2', 120, 'Tipe Kategori', '#', NULL, 'categorytype.index', 120, 'y', 1, 1, 1, 'daeng akbar', '', '2024-10-26 04:44:12', NULL, 1);
INSERT INTO `tuser_sub_menu` VALUES (2, '2', 121, 'Profile', '#', NULL, 'category.index', 120, 'y', 1, 1, 1, 'daeng akbar', '', '2024-10-26 04:44:12', NULL, 1);
INSERT INTO `tuser_sub_menu` VALUES (3, '2', 122, 'Sivitas', '#', NULL, 'categorystaff.index', 120, 'y', 1, 1, 1, 'daeng akbar', '', '2024-10-26 04:44:12', NULL, 1);
INSERT INTO `tuser_sub_menu` VALUES (4, '2', 123, 'Pengabdian', '#', NULL, 'categoryservice.index', 120, 'y', 1, 1, 1, 'daeng akbar', '', '2024-10-26 04:44:12', NULL, 1);
INSERT INTO `tuser_sub_menu` VALUES (5, '2', 124, 'Pendidikan', '#', NULL, 'categoryeduc.index', 120, 'y', 1, 1, 1, 'daeng akbar', '', '2024-10-26 04:44:12', NULL, 1);
INSERT INTO `tuser_sub_menu` VALUES (6, '2', 125, 'Fasilitas', '#', NULL, 'categoryfacility.index', 120, 'y', 1, 1, 1, 'daeng akbar', '', '2024-10-26 04:44:12', NULL, 1);
INSERT INTO `tuser_sub_menu` VALUES (7, '2', 126, 'Blog / Berita', '#', NULL, 'categoryblog.index', 120, 'y', 1, 1, 1, 'daeng akbar', '', '2024-10-26 04:44:12', NULL, 1);
INSERT INTO `tuser_sub_menu` VALUES (8, '2', 127, 'Informasi', '#', NULL, 'categoryinfo.index', 120, 'y', 1, 1, 1, 'daeng akbar', '', '2024-10-26 04:44:12', NULL, 1);
INSERT INTO `tuser_sub_menu` VALUES (9, '2', 128, 'Download', '#', NULL, 'categorydownload.index', 120, 'y', 1, 1, 1, 'daeng akbar', '', '2024-10-26 04:44:12', NULL, 1);
INSERT INTO `tuser_sub_menu` VALUES (10, '2', 129, 'Pengguna', '#', NULL, 'categoryuser.index', 120, 'y', 1, 1, 1, 'daeng akbar', '', '2024-10-26 04:44:13', NULL, 1);
INSERT INTO `tuser_sub_menu` VALUES (11, '2', 130, 'Fakultas', '#', NULL, 'profile.index', 130, 'y', 1, 1, 1, 'daeng akbar', '', '2024-10-26 04:44:13', NULL, 1);
INSERT INTO `tuser_sub_menu` VALUES (12, '2', 131, 'Manajemen', '#', NULL, 'structure.index', 130, 'y', 1, 1, 1, 'daeng akbar', '', '2024-10-26 04:44:13', NULL, 1);
INSERT INTO `tuser_sub_menu` VALUES (13, '2', 141, 'Publikasi Dosen', '#', NULL, 'research.index', 150, 'y', 1, 1, 1, 'daeng akbar', '', '2024-10-26 04:44:13', NULL, 1);
INSERT INTO `tuser_sub_menu` VALUES (14, '2', 142, 'Jurnal Penelitian', '#', NULL, 'journal.index', 150, 'y', 1, 1, 1, 'daeng akbar', '', '2024-10-26 04:44:13', NULL, 1);
INSERT INTO `tuser_sub_menu` VALUES (15, '2', 143, 'Hibah Penelitian', '#', NULL, 'grant.index', 150, 'y', 1, 1, 1, 'daeng akbar', '', '2024-10-26 04:44:13', NULL, 1);
INSERT INTO `tuser_sub_menu` VALUES (16, '2', 180, 'Informasi', '#', 'mdi mdi-surround-sound', 'information.index', 180, 'y', 1, 1, 1, 'daeng akbar', '', '2024-10-26 04:44:13', NULL, 1);
INSERT INTO `tuser_sub_menu` VALUES (17, '2', 181, 'Berita', '#', 'mdi mdi-blogger', 'news.index', 180, 'y', 1, 1, 1, 'daeng akbar', '', '2024-10-26 04:44:13', NULL, 1);
INSERT INTO `tuser_sub_menu` VALUES (18, '2', 182, 'Download', '#', 'mdi mdi-cloud-download', 'download.index', 180, 'y', 1, 1, 1, 'daeng akbar', '', '2024-10-26 04:44:13', NULL, 1);
INSERT INTO `tuser_sub_menu` VALUES (19, '2', 200, 'User Admin', '#', NULL, 'appuser.index', 200, 'y', 1, 1, 1, 'daeng akbar', '', '2024-10-26 04:44:13', NULL, 1);
INSERT INTO `tuser_sub_menu` VALUES (20, '2', 201, 'Menu Previlage', '#', NULL, 'previlage.index', 200, 'y', 1, 1, 1, 'daeng akbar', '', '2024-10-26 04:44:13', NULL, 1);
INSERT INTO `tuser_sub_menu` VALUES (21, '2', 210, 'Profile Aplikasi', '#', NULL, 'appinfo.index', 210, 'y', 1, 1, 1, 'daeng akbar', '', '2024-10-26 04:44:13', NULL, 1);
INSERT INTO `tuser_sub_menu` VALUES (22, '2', 211, 'Menu Sistem', '#', NULL, 'mainmenu.index', 210, 'y', 1, 1, 1, 'daeng akbar', '', '2024-10-26 04:44:13', NULL, 1);
INSERT INTO `tuser_sub_menu` VALUES (23, '2', 220, 'Pengguna Baru', '#', NULL, 'webuserapp.index', 220, 'y', 1, 1, 1, 'daeng akbar', '', '2024-10-26 04:44:16', NULL, 1);
INSERT INTO `tuser_sub_menu` VALUES (24, '2', 221, 'Pengguna Ditolak', '#', NULL, 'webuserejt.index', 220, 'y', 1, 1, 1, 'daeng akbar', '', '2024-10-26 04:44:16', NULL, 1);
INSERT INTO `tuser_sub_menu` VALUES (25, '2', 222, 'Pengguna Website', '#', NULL, 'webuser.index', 220, 'y', 1, 1, 1, 'daeng akbar', '', '2024-10-26 04:44:16', NULL, 1);
INSERT INTO `tuser_sub_menu` VALUES (26, '2', 230, 'Dosen Kesmas', '#', NULL, 'webusersvsp.index', 230, 'y', 1, 1, 1, 'daeng akbar', '', '2024-10-26 04:44:16', NULL, 1);
INSERT INTO `tuser_sub_menu` VALUES (27, '2', 231, 'Dosen Keperawatan', '#', NULL, 'webusersvsd.index', 230, 'y', 1, 1, 1, 'daeng akbar', '', '2024-10-26 04:44:16', NULL, 1);
INSERT INTO `tuser_sub_menu` VALUES (28, '2', 232, 'Dosen Kebidanan', '#', NULL, 'webusersvsdk.index', 230, 'y', 1, 1, 1, 'daeng akbar', '', '2024-10-26 04:44:16', NULL, 1);
INSERT INTO `tuser_sub_menu` VALUES (29, '2', 233, 'Dosen Ners', '#', NULL, 'webusersvsdn.index', 230, 'y', 1, 1, 1, 'daeng akbar', '', '2024-10-26 04:44:16', NULL, 1);
INSERT INTO `tuser_sub_menu` VALUES (30, '2', 234, 'Karyawan', '#', NULL, 'webusersvsk.index', 230, 'y', 1, 1, 1, 'daeng akbar', '', '2024-10-26 04:44:16', NULL, 1);
INSERT INTO `tuser_sub_menu` VALUES (31, '2', 235, 'Mahasiswa', '#', NULL, 'webusersvsm.index', 230, 'y', 1, 1, 1, 'daeng akbar', '', '2024-10-26 04:44:16', NULL, 1);
INSERT INTO `tuser_sub_menu` VALUES (32, '2', 236, 'Alumni', '#', NULL, 'webusersvsa.index', 230, 'y', 1, 1, 1, 'daeng akbar', '', '2024-10-26 04:44:16', NULL, 1);
INSERT INTO `tuser_sub_menu` VALUES (107, '2', 183, 'Kuesioner', '#', 'mdi mdi-link', 'download.index', 180, 'y', 1, 1, 1, 'daeng akbar', '', NULL, NULL, 1);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp(0) DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp(0) DEFAULT NULL,
  `updated_at` timestamp(0) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'Test User', 'test@example.com', '2025-02-11 14:33:39', '$2y$12$T3Ysogsjp8ENVOQbWzaAleWWYHvu08DkzbAZNjIGyart/Q35Cjefe', 'TgjAWtUstz', '2025-02-11 14:33:39', '2025-02-11 14:34:40');

SET FOREIGN_KEY_CHECKS = 1;
