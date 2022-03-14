-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        8.0.27 - MySQL Community Server - GPL
-- 服务器OS:                        Win64
-- HeidiSQL 版本:                  10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for xueshengguanli
DROP DATABASE IF EXISTS `xueshengguanli`;
CREATE DATABASE IF NOT EXISTS `xueshengguanli` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `xueshengguanli`;

-- Dumping structure for table xueshengguanli.t_admin
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE IF NOT EXISTS `t_admin` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(40) NOT NULL,
  `nickname` varchar(20) DEFAULT NULL COMMENT '管理员昵称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table xueshengguanli.t_admin: ~0 rows (大约)
/*!40000 ALTER TABLE `t_admin` DISABLE KEYS */;
REPLACE INTO `t_admin` (`id`, `username`, `password`, `nickname`) VALUES
	(1, 'admin', '21232F297A57A5A743894A0E4A801FC3', '管理员');
/*!40000 ALTER TABLE `t_admin` ENABLE KEYS */;

-- Dumping structure for table xueshengguanli.t_auth
DROP TABLE IF EXISTS `t_auth`;
CREATE TABLE IF NOT EXISTS `t_auth` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `url` varchar(255) NOT NULL COMMENT '系统后台接口',
  `admin_auth` tinyint NOT NULL DEFAULT '1',
  `teacher_auth` tinyint NOT NULL DEFAULT '0',
  `student_auth` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table xueshengguanli.t_auth: ~19 rows (大约)
/*!40000 ALTER TABLE `t_auth` DISABLE KEYS */;
REPLACE INTO `t_auth` (`id`, `name`, `url`, `admin_auth`, `teacher_auth`, `student_auth`) VALUES
	(10, '主界面', '/main/', 1, 1, 1),
	(11, '学生信息管理', '/student/', 1, 0, 0),
	(12, '教师信息管理', '/teacher/', 1, 0, 0),
	(13, '课程信息管理', '/course/', 1, 0, 0),
	(14, '系统权限', '/auth/', 1, 0, 0),
	(15, '公告管理', '/notice/', 1, 0, 0),
	(16, '查看公告', '/notice/look', 1, 1, 1),
	(17, '公告列表', '/notice/list', 1, 1, 1),
	(18, '教师课程', '/course/getMyCourse', 1, 1, 0),
	(19, '可选课程列表', '/course/choiceList', 1, 0, 1),
	(20, '结束课程', '/course/complete', 1, 1, 0),
	(21, '学生列表', '/student/stulist', 1, 1, 0),
	(22, '录入成绩', '/score/update', 1, 1, 0),
	(23, '学生选课', '/score/choiceCourse', 1, 0, 1),
	(24, '取消选课', '/score/delete', 1, 0, 1),
	(26, '查看成绩', '/score/stuScore', 1, 0, 1),
	(27, '密码管理', '/pswd/', 1, 1, 1),
	(28, '基本课程管理', '/basecourse/', 1, 0, 0),
	(29, '成绩报表', '/score/', 1, 1, 0);
/*!40000 ALTER TABLE `t_auth` ENABLE KEYS */;

-- Dumping structure for table xueshengguanli.t_base_course
DROP TABLE IF EXISTS `t_base_course`;
CREATE TABLE IF NOT EXISTS `t_base_course` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '课程id',
  `name` varchar(100) NOT NULL COMMENT '课程名',
  `synopsis` varchar(255) DEFAULT NULL COMMENT '课程简介',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table xueshengguanli.t_base_course: ~6 rows (大约)
/*!40000 ALTER TABLE `t_base_course` DISABLE KEYS */;
REPLACE INTO `t_base_course` (`id`, `name`, `synopsis`) VALUES
	(1, 'C语言', '本课程介绍计算机结构化程序设计的思想、方法和技巧；C语言的基本知识和概念；Ｃ语言丰富的运算符和数据类型，以及C语言的结构控制语句；在本课程中，函数的概念和指针的使用是课程重点和难点。'),
	(2, '数据结构与算法', '数据结构是计算机科学的一门非常重要的专业基础课，内容丰富，涉及面广，我校计算机专业的本科主干基础课程，也是非计算机类本科生和研究生学习计算机的选修课。'),
	(3, '操作系统', '操作系统是计算机科学与技术领域中最为活跃的学科之一,因而操作系统课程也自然是该专业的一门核心的专业基础课。操作系统课程内容综合了基础理论教学、课程实践教学、最新技术追踪等多项内容。'),
	(4, '计算机网络', '计算机网络是计算机专业学生必修的一门专业基础课和核心课程，它是后续课程《计算机系统安全》、《网络管理技术》、《TCP/IP与网络互联》等理论课程，以及《网络课程设计》等实践教学环节的先行课。'),
	(5, '软件工程', '该课程主要介绍软件工程的基本概念、原理和典型的技术方法。该课程的主要目的是通过教学，使学生了解工程学原理在软件开发中的应用，对计算机科学专业和信息工程专业学生理解软件开发过程和软件工程学具有重要意义。'),
	(6, 'Linux入门', 'Linux是适用于多种平台的计算机操作系统，也是免费的非商品化的操作系统。本课程以Redhat Linux系统为基础，试图对Linux系统一个简洁而全面的介绍，使学生在较短时间内对该操作系统有个大概的了解。'),
	(134, '语文', '讲解文言文、古诗词'),
	(135, '数学', ''),
	(136, '英语', '');
/*!40000 ALTER TABLE `t_base_course` ENABLE KEYS */;

-- Dumping structure for table xueshengguanli.t_course
DROP TABLE IF EXISTS `t_course`;
CREATE TABLE IF NOT EXISTS `t_course` (
  `id` int NOT NULL AUTO_INCREMENT,
  `start_date` date DEFAULT NULL COMMENT '开设日期',
  `end_date` date DEFAULT NULL COMMENT '结束日期',
  `class_hour` smallint DEFAULT NULL COMMENT '总课时',
  `test_mode` varchar(255) DEFAULT NULL COMMENT '考核方式',
  `student_num` int DEFAULT NULL,
  `choice_num` int DEFAULT '0',
  `complete` int NOT NULL DEFAULT '0' COMMENT '是否是完成的课程',
  `t_id` varchar(255) NOT NULL COMMENT '外键-教师号',
  `base_course_id` int NOT NULL COMMENT '外键-课程号',
  PRIMARY KEY (`id`),
  KEY `teacher_course` (`t_id`),
  KEY `course` (`base_course_id`),
  CONSTRAINT `course` FOREIGN KEY (`base_course_id`) REFERENCES `t_base_course` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `teacher_course` FOREIGN KEY (`t_id`) REFERENCES `t_teacher` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table xueshengguanli.t_course: ~6 rows (大约)
/*!40000 ALTER TABLE `t_course` DISABLE KEYS */;
REPLACE INTO `t_course` (`id`, `start_date`, `end_date`, `class_hour`, `test_mode`, `student_num`, `choice_num`, `complete`, `t_id`, `base_course_id`) VALUES
	(32, '2022-03-23', '2022-04-14', 1, '1', 11, 1, 1, '10001', 1),
	(33, '2022-03-23', '2022-04-14', 1, '1', 11, 1, 1, '10001', 3),
	(34, '2022-03-23', '2022-04-14', 1, '1', 11, 7, 0, '10001', 5),
	(35, '2022-03-23', '2022-04-14', 1, '1', 11, 7, 0, '10001', 1),
	(36, '2022-03-24', '2022-04-14', 1, '1', 11, 1, 1, '10001', 3),
	(37, '2022-03-23', '2022-04-14', 1, '1', 11, 1, 1, '10001', 2),
	(38, '2022-03-31', '2022-04-28', 1, '闭卷', 31, 7, 0, '10001', 134),
	(39, '2022-03-31', '2022-04-28', 1, '闭卷', 31, 7, 0, '10001', 135);
/*!40000 ALTER TABLE `t_course` ENABLE KEYS */;

-- Dumping structure for table xueshengguanli.t_notice
DROP TABLE IF EXISTS `t_notice`;
CREATE TABLE IF NOT EXISTS `t_notice` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `author` varchar(30) NOT NULL,
  `content` varchar(1000) NOT NULL,
  `auth` int NOT NULL DEFAULT '3',
  `date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table xueshengguanli.t_notice: ~3 rows (大约)
/*!40000 ALTER TABLE `t_notice` DISABLE KEYS */;
REPLACE INTO `t_notice` (`id`, `title`, `author`, `content`, `auth`, `date`) VALUES
	(7, '全体教师开会通知', '管理员', '<p><b>管理员可见公告-测试</b></p>', 2, '2022-01-11'),
	(10, '寒假放假通知', '管理员', '', 1, '2022-01-11'),
	(11, '关于中秋节放假通知', '管理员', '', 1, '2022-01-11'),
	(12, '1', 'tbm', '<img src="/images/.jpg1646469749344" alt="undefined">', 1, '2022-03-05');
/*!40000 ALTER TABLE `t_notice` ENABLE KEYS */;

-- Dumping structure for table xueshengguanli.t_score
DROP TABLE IF EXISTS `t_score`;
CREATE TABLE IF NOT EXISTS `t_score` (
  `id` int NOT NULL AUTO_INCREMENT,
  `score` int NOT NULL DEFAULT '0' COMMENT '考试成绩',
  `result` varchar(255) NOT NULL DEFAULT '' COMMENT '考察结果',
  `c_id` int NOT NULL COMMENT '外键-课程id',
  `s_id` varchar(255) NOT NULL COMMENT '外键-学号',
  PRIMARY KEY (`id`),
  KEY `score_stu` (`s_id`),
  KEY `score_course` (`c_id`),
  CONSTRAINT `score_course` FOREIGN KEY (`c_id`) REFERENCES `t_course` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `score_stu` FOREIGN KEY (`s_id`) REFERENCES `t_student` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table xueshengguanli.t_score: ~6 rows (大约)
/*!40000 ALTER TABLE `t_score` DISABLE KEYS */;
REPLACE INTO `t_score` (`id`, `score`, `result`, `c_id`, `s_id`) VALUES
	(37, 120, '', 32, '201125010174'),
	(38, 20, '', 33, '201125010174'),
	(39, 90, '', 34, '201125010174'),
	(40, 100, '', 35, '201125010174'),
	(41, 90, '', 36, '201125010174'),
	(42, 0, '', 37, '201125010174'),
	(43, 0, '', 38, '201125010174'),
	(44, 0, '', 39, '201125010174'),
	(45, 0, '', 34, '201125010175'),
	(46, 0, '', 35, '201125010175'),
	(47, 0, '', 38, '201125010175'),
	(48, 0, '', 39, '201125010175'),
	(49, 0, '', 34, '201125010176'),
	(50, 0, '', 35, '201125010176'),
	(51, 0, '', 38, '201125010176'),
	(52, 0, '', 39, '201125010176'),
	(53, 0, '', 34, '201125010177'),
	(54, 0, '', 35, '201125010177'),
	(55, 0, '', 38, '201125010177'),
	(56, 0, '', 39, '201125010177'),
	(57, 0, '', 34, '201125010178'),
	(58, 0, '', 35, '201125010178'),
	(59, 0, '', 38, '201125010178'),
	(60, 0, '', 39, '201125010178'),
	(61, 0, '', 34, '201125010179'),
	(62, 0, '', 35, '201125010179'),
	(63, 0, '', 38, '201125010179'),
	(64, 0, '', 39, '201125010179'),
	(65, 0, '', 34, '201125010180'),
	(66, 0, '', 35, '201125010180'),
	(67, 0, '', 38, '201125010180'),
	(68, 0, '', 39, '201125010180');
/*!40000 ALTER TABLE `t_score` ENABLE KEYS */;

-- Dumping structure for table xueshengguanli.t_student
DROP TABLE IF EXISTS `t_student`;
CREATE TABLE IF NOT EXISTS `t_student` (
  `id` varchar(20) NOT NULL COMMENT '学号',
  `password` varchar(50) NOT NULL,
  `name` varchar(20) NOT NULL,
  `sex` varchar(10) NOT NULL COMMENT '性别',
  `admission_date` date NOT NULL COMMENT '入学日期',
  `major` varchar(50) NOT NULL COMMENT '专业',
  `grade` varchar(50) NOT NULL COMMENT '班级',
  `education` varchar(20) NOT NULL COMMENT '学历',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table xueshengguanli.t_student: ~11 rows (大约)
/*!40000 ALTER TABLE `t_student` DISABLE KEYS */;
REPLACE INTO `t_student` (`id`, `password`, `name`, `sex`, `admission_date`, `major`, `grade`, `education`) VALUES
	('201125010174', 'E10ADC3949BA59ABBE56E057F20F883E', '滕冰梅', '男', '2022-03-01', '计算机科学与技术', '2班', '专科'),
	('201125010175', 'E10ADC3949BA59ABBE56E057F20F883E', '彭兰', '女', '2020-09-01', '计算机科学与技术', '2班', '专科'),
	('201125010176', 'E10ADC3949BA59ABBE56E057F20F883E', '巫沁堃', '男', '2020-09-01', '计算机科学与技术', '2班', '本科'),
	('201125010177', 'E10ADC3949BA59ABBE56E057F20F883E', '方林', '女', '2020-09-01', '计算机科学与技术', '2班', '本科'),
	('201125010178', 'E10ADC3949BA59ABBE56E057F20F883E', '张健', '男', '2020-09-01', '计算机科学与技术', '2班', '专科'),
	('201125010179', 'E10ADC3949BA59ABBE56E057F20F883E', '刘方云', '女', '2020-09-01', '计算机科学与技术', '2班', '专科'),
	('201125010180', 'E10ADC3949BA59ABBE56E057F20F883E', '陈越', '男', '2020-09-01', '计算机科学与技术', '1班', '本科'),
	('201125010181', 'E10ADC3949BA59ABBE56E057F20F883E', '雍朝宇', '女', '2020-09-01', '计算机科学与技术', '1班', '本科'),
	('201125010182', 'CDFB1269C94C32668A79187AAE1C21DE', '梁晨', '男', '2015-09-07', '计算机科学与技术', '1班', '专科'),
	('201125010183', 'A0ABDC06C285B29A240543B49F12C77F', '王彬桦', '女', '2015-09-07', '计算机科学与技术', '1班', '专科'),
	('201125010184', 'E10ADC3949BA59ABBE56E057F20F883E', '李大炜', '男', '2020-09-01', '计算机科学与技术', '2班', '本科'),
	('201125010185', 'E10ADC3949BA59ABBE56E057F20F883E', '周艺晟', '男', '2022-03-01', '计算机科学与技术', '1班', '本科'),
	('201125010186', 'E10ADC3949BA59ABBE56E057F20F883E', '刘晓峰', '男', '2022-03-01', '计算机科学与技术', '1班', '本科'),
	('201125010187', 'E10ADC3949BA59ABBE56E057F20F883E', '张民', '男', '2022-03-01', '计算机科学与技术', '1班', '本科');
/*!40000 ALTER TABLE `t_student` ENABLE KEYS */;

-- Dumping structure for table xueshengguanli.t_teacher
DROP TABLE IF EXISTS `t_teacher`;
CREATE TABLE IF NOT EXISTS `t_teacher` (
  `id` varchar(20) NOT NULL COMMENT '教师职工号',
  `password` varchar(50) NOT NULL,
  `name` varchar(20) NOT NULL,
  `synopsis` varchar(255) DEFAULT NULL COMMENT '简介',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table xueshengguanli.t_teacher: ~11 rows (大约)
/*!40000 ALTER TABLE `t_teacher` DISABLE KEYS */;
REPLACE INTO `t_teacher` (`id`, `password`, `name`, `synopsis`) VALUES
	('10001', 'E10ADC3949BA59ABBE56E057F20F883E', '教师1', '1916年至1927年任北京大学校长，革新北大，开“学术”与“自由”之风；1920年至1930年，蔡元培同时兼任中法大学校长。他早年参加反清朝帝制的斗争，民国初年主持制定了中国近代高等教育的第一个法令——《大学令'),
	('10002', 'E10ADC3949BA59ABBE56E057F20F883E', '教师2', NULL),
	('10003', 'E10ADC3949BA59ABBE56E057F20F883E', '教师3', NULL),
	('10004', 'E10ADC3949BA59ABBE56E057F20F883E', '教师4', NULL),
	('10005', 'E10ADC3949BA59ABBE56E057F20F883E', '教师5', NULL),
	('10006', 'E10ADC3949BA59ABBE56E057F20F883E', '教师6', NULL),
	('10007', 'E10ADC3949BA59ABBE56E057F20F883E', '教师7', NULL),
	('10008', 'E10ADC3949BA59ABBE56E057F20F883E', '教师8', NULL),
	('10009', 'E10ADC3949BA59ABBE56E057F20F883E', '教师9', NULL),
	('10010', 'E10ADC3949BA59ABBE56E057F20F883E', '教师10', NULL);
/*!40000 ALTER TABLE `t_teacher` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
