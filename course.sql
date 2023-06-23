/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80017
 Source Host           : localhost:3306
 Source Schema         : course

 Target Server Type    : MySQL
 Target Server Version : 80017
 File Encoding         : 65001

 Date: 24/12/2021 22:57:16
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for app_course
-- ----------------------------
DROP TABLE IF EXISTS `app_course`;
CREATE TABLE `app_course`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `address` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `term` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `app_course_teacher_id_88818860_fk_app_teacher_id`(`teacher_id`) USING BTREE,
  CONSTRAINT `app_course_teacher_id_88818860_fk_app_teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `app_teacher` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_course
-- ----------------------------
INSERT INTO `app_course` VALUES (1, 'python', 'YFJ0103', 1, 1);
INSERT INTO `app_course` VALUES (2, '计算机网络', '12401', 2, 1);
INSERT INTO `app_course` VALUES (3, '操作系统', '12403', 3, 1);
INSERT INTO `app_course` VALUES (4, '数字图像', '12406', 7, 1);
INSERT INTO `app_course` VALUES (5, 'uml', '12404', 8, 1);
INSERT INTO `app_course` VALUES (6, 'java', '12304', 9, 1);
INSERT INTO `app_course` VALUES (7, 'C++', '21308', 10, 1);
INSERT INTO `app_course` VALUES (8, '就业指导', '12408', 6, 1);
INSERT INTO `app_course` VALUES (9, '数据结构', '12202', 4, 2);
INSERT INTO `app_course` VALUES (10, '数据库', '21302', 5, 2);

-- ----------------------------
-- Table structure for app_courserecord
-- ----------------------------
DROP TABLE IF EXISTS `app_courserecord`;
CREATE TABLE `app_courserecord`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `date` datetime(6) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `app_courserecord_course_id_c0c5151d_fk_app_course_id`(`course_id`) USING BTREE,
  INDEX `app_courserecord_student_id_95d25759_fk_app_student_id`(`student_id`) USING BTREE,
  CONSTRAINT `app_courserecord_course_id_c0c5151d_fk_app_course_id` FOREIGN KEY (`course_id`) REFERENCES `app_course` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `app_courserecord_student_id_95d25759_fk_app_student_id` FOREIGN KEY (`student_id`) REFERENCES `app_student` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_courserecord
-- ----------------------------
INSERT INTO `app_courserecord` VALUES (1, 1, 1, '2021-12-24 21:46:27.489797');
INSERT INTO `app_courserecord` VALUES (6, 1, 2, '2021-12-24 21:46:27.489797');
INSERT INTO `app_courserecord` VALUES (7, 3, 4, '2021-12-24 21:46:27.489797');
INSERT INTO `app_courserecord` VALUES (8, 2, 4, '2021-12-24 21:46:27.489797');
INSERT INTO `app_courserecord` VALUES (9, 1, 1, '2021-12-24 21:46:27.489797');
INSERT INTO `app_courserecord` VALUES (10, 3, 2, '2021-12-24 21:46:27.489797');
INSERT INTO `app_courserecord` VALUES (11, 8, 3, '2021-12-24 21:46:27.489797');
INSERT INTO `app_courserecord` VALUES (12, 4, 9, '2021-12-24 21:46:27.489797');
INSERT INTO `app_courserecord` VALUES (13, 6, 11, '2021-12-24 21:46:27.489797');

-- ----------------------------
-- Table structure for app_student
-- ----------------------------
DROP TABLE IF EXISTS `app_student`;
CREATE TABLE `app_student`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `nickname` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_student
-- ----------------------------
INSERT INTO `app_student` VALUES (1, '1', '6666', '李雨彤');
INSERT INTO `app_student` VALUES (2, '2', '8888', '夏晨枫');
INSERT INTO `app_student` VALUES (3, '3', '1111', '李红');
INSERT INTO `app_student` VALUES (4, '4', '2222', '江国珍');
INSERT INTO `app_student` VALUES (5, '5', '3333', '唐秋卉');
INSERT INTO `app_student` VALUES (6, '6', '4444', '徐妍');
INSERT INTO `app_student` VALUES (7, '7', '5555', '戴菲');
INSERT INTO `app_student` VALUES (8, '8', '7777', '虞杭悦');
INSERT INTO `app_student` VALUES (9, '9', '9999', '易烊千玺');
INSERT INTO `app_student` VALUES (10, '10', '11111', '王源');
INSERT INTO `app_student` VALUES (11, '11', '22222', '王俊凯');

-- ----------------------------
-- Table structure for app_teacher
-- ----------------------------
DROP TABLE IF EXISTS `app_teacher`;
CREATE TABLE `app_teacher`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `nickname` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_teacher
-- ----------------------------
INSERT INTO `app_teacher` VALUES (1, '1', '金春霞');
INSERT INTO `app_teacher` VALUES (2, '2', '金春花');
INSERT INTO `app_teacher` VALUES (3, '3', '陈立青');
INSERT INTO `app_teacher` VALUES (4, '4', '邱军林');
INSERT INTO `app_teacher` VALUES (5, '5', '冯万利');
INSERT INTO `app_teacher` VALUES (6, '6', '杨文杰');
INSERT INTO `app_teacher` VALUES (7, '7', '朱怡');
INSERT INTO `app_teacher` VALUES (8, '8', '王坤德');
INSERT INTO `app_teacher` VALUES (9, '9', '陶志行');
INSERT INTO `app_teacher` VALUES (10, '10', '于永涛');

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq`(`group_id`, `permission_id`) USING BTREE,
  INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id`, `codename`) USING BTREE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 40 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO `auth_permission` VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO `auth_permission` VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (4, 'Can view log entry', 1, 'view_logentry');
INSERT INTO `auth_permission` VALUES (5, 'Can add permission', 2, 'add_permission');
INSERT INTO `auth_permission` VALUES (6, 'Can change permission', 2, 'change_permission');
INSERT INTO `auth_permission` VALUES (7, 'Can delete permission', 2, 'delete_permission');
INSERT INTO `auth_permission` VALUES (8, 'Can view permission', 2, 'view_permission');
INSERT INTO `auth_permission` VALUES (9, 'Can add group', 3, 'add_group');
INSERT INTO `auth_permission` VALUES (10, 'Can change group', 3, 'change_group');
INSERT INTO `auth_permission` VALUES (11, 'Can delete group', 3, 'delete_group');
INSERT INTO `auth_permission` VALUES (12, 'Can view group', 3, 'view_group');
INSERT INTO `auth_permission` VALUES (13, 'Can add user', 4, 'add_user');
INSERT INTO `auth_permission` VALUES (14, 'Can change user', 4, 'change_user');
INSERT INTO `auth_permission` VALUES (15, 'Can delete user', 4, 'delete_user');
INSERT INTO `auth_permission` VALUES (16, 'Can view user', 4, 'view_user');
INSERT INTO `auth_permission` VALUES (17, 'Can add content type', 5, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (18, 'Can change content type', 5, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (19, 'Can delete content type', 5, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (20, 'Can view content type', 5, 'view_contenttype');
INSERT INTO `auth_permission` VALUES (21, 'Can add session', 6, 'add_session');
INSERT INTO `auth_permission` VALUES (22, 'Can change session', 6, 'change_session');
INSERT INTO `auth_permission` VALUES (23, 'Can delete session', 6, 'delete_session');
INSERT INTO `auth_permission` VALUES (24, 'Can view session', 6, 'view_session');
INSERT INTO `auth_permission` VALUES (25, 'Can add 课程管理', 7, 'add_course');
INSERT INTO `auth_permission` VALUES (26, 'Can change 课程管理', 7, 'change_course');
INSERT INTO `auth_permission` VALUES (27, 'Can delete 课程管理', 7, 'delete_course');
INSERT INTO `auth_permission` VALUES (28, 'Can view 课程管理', 7, 'view_course');
INSERT INTO `auth_permission` VALUES (29, 'Can add 学生管理', 8, 'add_student');
INSERT INTO `auth_permission` VALUES (30, 'Can change 学生管理', 8, 'change_student');
INSERT INTO `auth_permission` VALUES (31, 'Can delete 学生管理', 8, 'delete_student');
INSERT INTO `auth_permission` VALUES (32, 'Can view 学生管理', 8, 'view_student');
INSERT INTO `auth_permission` VALUES (33, 'Can add 教师管理', 9, 'add_teacher');
INSERT INTO `auth_permission` VALUES (34, 'Can change 教师管理', 9, 'change_teacher');
INSERT INTO `auth_permission` VALUES (35, 'Can delete 教师管理', 9, 'delete_teacher');
INSERT INTO `auth_permission` VALUES (36, 'Can view 教师管理', 9, 'view_teacher');
INSERT INTO `auth_permission` VALUES (37, 'Can add 选课管理', 10, 'add_courserecord');
INSERT INTO `auth_permission` VALUES (38, 'Can change 选课管理', 10, 'change_courserecord');
INSERT INTO `auth_permission` VALUES (39, 'Can delete 选课管理', 10, 'delete_courserecord');
INSERT INTO `auth_permission` VALUES (40, 'Can view 选课管理', 10, 'view_courserecord');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_login` datetime(6) NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `first_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES (1, 'pbkdf2_sha256$260000$gaHIP0h4ixWLEbTJpp0zx2$JvAgzDYxXbK++s5V3cl7lvK+q03rCMBCU9wyGcp0zt4=', '2021-12-24 22:51:27.176127', 1, 'admin', '', '', '', 1, 1, '2021-12-20 08:38:30.350038');

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_groups_user_id_group_id_94350c0c_uniq`(`user_id`, `group_id`) USING BTREE,
  INDEX `auth_user_groups_group_id_97559544_fk_auth_group_id`(`group_id`) USING BTREE,
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq`(`user_id`, `permission_id`) USING BTREE,
  INDEX `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `object_repr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co`(`content_type_id`) USING BTREE,
  INDEX `django_admin_log_user_id_c564eba6_fk_auth_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 41 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
INSERT INTO `django_admin_log` VALUES (1, '2021-12-20 08:46:06.509921', '1', '李雨彤', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (2, '2021-12-20 08:47:43.401187', '1', '金春霞', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (3, '2021-12-20 08:48:19.159738', '1', 'python', 1, '[{\"added\": {}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (4, '2021-12-23 10:56:14.393132', '2', '夏晨枫', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (5, '2021-12-23 10:56:26.981247', '3', '李红', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (6, '2021-12-23 10:57:06.462272', '2', '金春花', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (7, '2021-12-23 10:57:42.771594', '2', '计算机网络', 1, '[{\"added\": {}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (8, '2021-12-23 20:55:12.788301', '4', '江国珍', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (9, '2021-12-23 21:06:41.004566', '5', '唐秋卉', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (10, '2021-12-23 21:16:20.471392', '3', '陈立青', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (11, '2021-12-23 21:25:20.769922', '3', '操作系统', 1, '[{\"added\": {}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (12, '2021-12-23 21:45:05.003937', '7', '7', 1, '[{\"added\": {}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (13, '2021-12-23 21:45:14.323134', '7', '7', 2, '[]', 10, 1);
INSERT INTO `django_admin_log` VALUES (14, '2021-12-23 21:45:19.777350', '7', '7', 2, '[{\"changed\": {\"fields\": [\"\\u8bfe\\u7a0b\"]}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (15, '2021-12-24 14:46:16.596964', '4', '邱军林', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (16, '2021-12-24 14:46:28.275318', '5', '冯万利', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (17, '2021-12-24 14:46:42.608219', '6', '杨文杰', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (18, '2021-12-24 14:47:46.611094', '7', '朱怡', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (19, '2021-12-24 14:48:00.062904', '8', '王坤德', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (20, '2021-12-24 14:48:45.970018', '9', '陶志行', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (21, '2021-12-24 14:49:03.850603', '10', '于永涛', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (22, '2021-12-24 14:50:16.451336', '6', '徐妍', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (23, '2021-12-24 14:50:32.675590', '7', '戴菲', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (24, '2021-12-24 14:50:56.869993', '8', '虞杭悦', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (25, '2021-12-24 14:51:15.236666', '9', '易烊千玺', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (26, '2021-12-24 14:51:29.403526', '10', '王源', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (27, '2021-12-24 14:51:40.776845', '11', '王俊凯', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (28, '2021-12-24 14:52:08.679774', '4', '数字图像', 1, '[{\"added\": {}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (29, '2021-12-24 14:52:23.675815', '5', 'uml', 1, '[{\"added\": {}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (30, '2021-12-24 14:52:37.967718', '6', 'java', 1, '[{\"added\": {}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (31, '2021-12-24 14:52:58.742041', '7', 'C++', 1, '[{\"added\": {}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (32, '2021-12-24 14:53:27.864917', '8', '就业指导', 1, '[{\"added\": {}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (33, '2021-12-24 14:54:00.144508', '9', '数据结构', 1, '[{\"added\": {}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (34, '2021-12-24 14:54:30.233594', '10', '数据库', 1, '[{\"added\": {}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (35, '2021-12-24 14:55:13.620478', '8', '8', 1, '[{\"added\": {}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (36, '2021-12-24 14:55:25.297860', '9', '9', 1, '[{\"added\": {}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (37, '2021-12-24 14:55:37.928449', '10', '10', 1, '[{\"added\": {}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (38, '2021-12-24 14:55:46.051095', '11', '11', 1, '[{\"added\": {}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (39, '2021-12-24 14:56:07.487440', '12', '12', 1, '[{\"added\": {}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (40, '2021-12-24 14:56:20.697136', '13', '13', 1, '[{\"added\": {}}]', 10, 1);

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label`, `model`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (7, 'app', 'course');
INSERT INTO `django_content_type` VALUES (10, 'app', 'courserecord');
INSERT INTO `django_content_type` VALUES (8, 'app', 'student');
INSERT INTO `django_content_type` VALUES (9, 'app', 'teacher');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (4, 'auth', 'user');
INSERT INTO `django_content_type` VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (6, 'sessions', 'session');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2021-12-20 08:38:12.874792');
INSERT INTO `django_migrations` VALUES (2, 'auth', '0001_initial', '2021-12-20 08:38:13.853824');
INSERT INTO `django_migrations` VALUES (3, 'admin', '0001_initial', '2021-12-20 08:38:14.111069');
INSERT INTO `django_migrations` VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2021-12-20 08:38:14.137076');
INSERT INTO `django_migrations` VALUES (5, 'admin', '0003_logentry_add_action_flag_choices', '2021-12-20 08:38:14.165079');
INSERT INTO `django_migrations` VALUES (6, 'app', '0001_initial', '2021-12-20 08:38:14.597180');
INSERT INTO `django_migrations` VALUES (7, 'app', '0002_auto_20211216_0914', '2021-12-20 08:38:14.707205');
INSERT INTO `django_migrations` VALUES (8, 'contenttypes', '0002_remove_content_type_name', '2021-12-20 08:38:14.895245');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0002_alter_permission_name_max_length', '2021-12-20 08:38:14.999269');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0003_alter_user_email_max_length', '2021-12-20 08:38:15.111301');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0004_alter_user_username_opts', '2021-12-20 08:38:15.130305');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0005_alter_user_last_login_null', '2021-12-20 08:38:15.224327');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0006_require_contenttypes_0002', '2021-12-20 08:38:15.230348');
INSERT INTO `django_migrations` VALUES (14, 'auth', '0007_alter_validators_add_error_messages', '2021-12-20 08:38:15.252337');
INSERT INTO `django_migrations` VALUES (15, 'auth', '0008_alter_user_username_max_length', '2021-12-20 08:38:15.374360');
INSERT INTO `django_migrations` VALUES (16, 'auth', '0009_alter_user_last_name_max_length', '2021-12-20 08:38:15.482388');
INSERT INTO `django_migrations` VALUES (17, 'auth', '0010_alter_group_name_max_length', '2021-12-20 08:38:15.586413');
INSERT INTO `django_migrations` VALUES (18, 'auth', '0011_update_proxy_permissions', '2021-12-20 08:38:15.613414');
INSERT INTO `django_migrations` VALUES (19, 'auth', '0012_alter_user_first_name_max_length', '2021-12-20 08:38:15.727440');
INSERT INTO `django_migrations` VALUES (20, 'sessions', '0001_initial', '2021-12-20 08:38:15.801457');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_expire_date_a5c62663`(`expire_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('e67axvqj5ry6d5d0l3nmjyf82pi76tp8', '.eJxVjMsOwiAQRf-FtSHQgWFw6b7fQHiMUjU0Ke3K-O_apAvd3nPOfYkQt7WGrfMSpiLOQovT75ZifnDbQbnHdptlntu6TEnuijxol-Nc-Hk53L-DGnv91mTQoU0mMxrQ1nvQBktyHgiZFF0HVIDgiPNgU7Gook8RIZM32WkQ7w-nFjZz:1n0lup:ZvMfopkj0VMK9qXJSa5rJy4aTTVKsf4IB7wxT2QbtyM', '2022-01-07 22:51:27.183130');

SET FOREIGN_KEY_CHECKS = 1;
