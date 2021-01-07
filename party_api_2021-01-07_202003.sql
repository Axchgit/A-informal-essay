-- MySQL dump 10.13  Distrib 5.7.24, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: party_api
-- ------------------------------------------------------
-- Server version	5.7.24

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `uuid` varchar(36) NOT NULL COMMENT '全球唯一标识符',
  `admin_name` varchar(32) NOT NULL DEFAULT '' COMMENT '管理员账号',
  `admin_pass` char(32) NOT NULL DEFAULT '' COMMENT '管理员密码',
  `admin_email` varchar(50) NOT NULL DEFAULT '' COMMENT '管理员电子邮箱',
  `admin_phone` char(11) NOT NULL DEFAULT '' COMMENT '手机号',
  `avatar` varchar(200) NOT NULL DEFAULT 'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif',
  `role` tinyint(4) NOT NULL DEFAULT '5' COMMENT '权限等级',
  `logintime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登陆时间',
  `loginip` bigint(20) NOT NULL DEFAULT '0' COMMENT '登陆IP',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建的时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改的时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_adminname_adminpass` (`admin_name`,`admin_pass`) USING BTREE,
  UNIQUE KEY `admin_adminname_adminemail` (`admin_name`,`admin_email`) USING BTREE,
  UNIQUE KEY `admin_adminname_adminphone` (`admin_name`,`admin_phone`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='管理员表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bulletin`
--

DROP TABLE IF EXISTS `bulletin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bulletin` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `level` tinyint(4) NOT NULL DEFAULT '0' COMMENT '级别:1为红色,2为橙色,3为黄色,4为白色',
  `title` varchar(30) NOT NULL DEFAULT '' COMMENT '标题',
  `content` varchar(500) NOT NULL DEFAULT '' COMMENT '内容',
  `target_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '通知类型:1为特定用户,2为多个用户,3为用户群体(职务),4为全部',
  `create_number` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '发布者学工号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `cancel_time` datetime DEFAULT NULL COMMENT '撤回标记',
  `delete_time` datetime DEFAULT NULL COMMENT '软删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='通告表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bulletin`
--

LOCK TABLES `bulletin` WRITE;
/*!40000 ALTER TABLE `bulletin` DISABLE KEYS */;
INSERT INTO `bulletin` VALUES (1,2,'测试1','测试1',4,1001,'2021-01-03 21:57:27','2021-01-03 21:57:27',NULL,NULL);
/*!40000 ALTER TABLE `bulletin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bulletin_read`
--

DROP TABLE IF EXISTS `bulletin_read`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bulletin_read` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `bulletin_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '通告ID',
  `target_number` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '阅读人员学工号',
  `read_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `delete_time` datetime DEFAULT NULL COMMENT '软删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='通告阅读状态表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bulletin_read`
--

LOCK TABLES `bulletin_read` WRITE;
/*!40000 ALTER TABLE `bulletin_read` DISABLE KEYS */;
INSERT INTO `bulletin_read` VALUES (1,1,1001,'2021-01-03 21:57:46','2021-01-03 21:57:46',NULL),(2,1,2017107216,'2021-01-07 18:08:18','2021-01-07 18:08:18',NULL);
/*!40000 ALTER TABLE `bulletin_read` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bulletin_target`
--

DROP TABLE IF EXISTS `bulletin_target`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bulletin_target` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `bulletin_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '通告ID',
  `target_person` varchar(30) NOT NULL DEFAULT '' COMMENT '接收方标识',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `delete_time` datetime DEFAULT NULL COMMENT '软删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='通告目标表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bulletin_target`
--

LOCK TABLES `bulletin_target` WRITE;
/*!40000 ALTER TABLE `bulletin_target` DISABLE KEYS */;
/*!40000 ALTER TABLE `bulletin_target` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `download_file`
--

DROP TABLE IF EXISTS `download_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `download_file` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uploader_number` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '上传者',
  `file_category` tinyint(4) NOT NULL DEFAULT '0' COMMENT '类别:1为发展党员第一阶段...5为第五阶段,6为其他',
  `file_name` varchar(100) NOT NULL DEFAULT '0' COMMENT '文件名',
  `file_path` varchar(100) NOT NULL DEFAULT '' COMMENT '文件地址',
  `file_remarks` varchar(50) NOT NULL DEFAULT '' COMMENT '文件备注',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建的时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '资料修改的时间',
  `delete_time` datetime DEFAULT NULL COMMENT '软删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='下载文件表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `download_file`
--

LOCK TABLES `download_file` WRITE;
/*!40000 ALTER TABLE `download_file` DISABLE KEYS */;
INSERT INTO `download_file` VALUES (1,1001,1,'党员档案材料清单.doc','index_file/1/党员档案材料清单.doc','测试1','2021-01-03 21:56:33','2021-01-03 21:56:33',NULL);
/*!40000 ALTER TABLE `download_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `join_apply`
--

DROP TABLE IF EXISTS `join_apply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `join_apply` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `number` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '学工号',
  `step` tinyint(4) NOT NULL DEFAULT '0' COMMENT '步骤:1为申请入党,2为申请成为积极分子,3为申请成为发展对象,4为申请成为预备党员,5为申请成为正式党员',
  `review_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '审核状态:1为正在审核,2为审核通过,3为未通过,4为提交给下一级审核',
  `reviewer` varchar(36) NOT NULL DEFAULT '' COMMENT '审核人员',
  `remarks` varchar(50) NOT NULL DEFAULT '' COMMENT '备注',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建的时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '资料修改的时间',
  `delete_time` datetime DEFAULT NULL COMMENT '软删除标记',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_number_step` (`number`,`step`),
  KEY `idx_number` (`number`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='入党申请表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `join_apply`
--

LOCK TABLES `join_apply` WRITE;
/*!40000 ALTER TABLE `join_apply` DISABLE KEYS */;
INSERT INTO `join_apply` VALUES (1,2017107216,1,2,'20170001','','2021-01-03 21:17:55','2021-01-03 21:24:46',NULL),(2,2017107201,1,2,'20170001','','2021-01-03 21:47:00','2021-01-03 21:47:52',NULL);
/*!40000 ALTER TABLE `join_apply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_record`
--

DROP TABLE IF EXISTS `login_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) NOT NULL DEFAULT '' COMMENT '账户全球唯一标识符',
  `login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登录时间',
  `login_ip` varchar(30) NOT NULL DEFAULT '0' COMMENT '登录IP',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建的时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改的时间',
  PRIMARY KEY (`id`),
  KEY `idx_uuid` (`uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COMMENT='登录记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_record`
--

LOCK TABLES `login_record` WRITE;
/*!40000 ALTER TABLE `login_record` DISABLE KEYS */;
INSERT INTO `login_record` VALUES (1,'1001',1609677786,'localhost:8081','2021-01-03 20:43:06','2021-01-03 20:43:06'),(2,'1001',1609677866,'localhost:8081','2021-01-03 20:44:26','2021-01-03 20:44:26'),(3,'20170001',1609679310,'localhost:8081','2021-01-03 21:08:30','2021-01-03 21:08:30'),(4,'20170002',1609679452,'localhost:8081','2021-01-03 21:10:52','2021-01-03 21:10:52'),(5,'2017107216',1609679541,'localhost:8081','2021-01-03 21:12:21','2021-01-03 21:12:21'),(6,'2017107228',1609679623,'localhost:8081','2021-01-03 21:13:43','2021-01-03 21:13:43'),(7,'1001',1609679724,'localhost:8081','2021-01-03 21:15:24','2021-01-03 21:15:24'),(8,'2017107216',1609679820,'localhost:8081','2021-01-03 21:17:00','2021-01-03 21:17:00'),(9,'20170001',1609680135,'localhost:8081','2021-01-03 21:22:15','2021-01-03 21:22:15'),(10,'20170002',1609680828,'localhost:8081','2021-01-03 21:33:48','2021-01-03 21:33:48'),(11,'2017107201',1609681581,'localhost:8081','2021-01-03 21:46:21','2021-01-03 21:46:21'),(12,'20170001',1609681645,'localhost:8081','2021-01-03 21:47:25','2021-01-03 21:47:25'),(13,'1001',1609831022,'localhost:8081','2021-01-05 15:17:02','2021-01-05 15:17:02'),(14,'1001',1609832676,'localhost:8081','2021-01-05 15:44:36','2021-01-05 15:44:36'),(15,'2017107201',1609832981,'localhost:8081','2021-01-05 15:49:41','2021-01-05 15:49:41'),(16,'20170001',1609833024,'localhost:8081','2021-01-05 15:50:24','2021-01-05 15:50:24'),(17,'1001',1610013549,'localhost:8081','2021-01-07 17:59:09','2021-01-07 17:59:09'),(18,'2017107216',1610013986,'localhost:8081','2021-01-07 18:06:26','2021-01-07 18:06:26'),(19,'1001',1610019945,'localhost:8081','2021-01-07 19:45:45','2021-01-07 19:45:45'),(20,'2017107228',1610020323,'localhost:8081','2021-01-07 19:52:03','2021-01-07 19:52:03'),(21,'2017107216',1610020362,'localhost:8081','2021-01-07 19:52:42','2021-01-07 19:52:42'),(22,'1001',1610020382,'localhost:8081','2021-01-07 19:53:02','2021-01-07 19:53:02'),(23,'1001',1610020419,'localhost:8081','2021-01-07 19:53:39','2021-01-07 19:53:39'),(24,'1001',1610020459,'localhost:8081','2021-01-07 19:54:19','2021-01-07 19:54:19'),(25,'1001',1610020472,'localhost:8081','2021-01-07 19:54:32','2021-01-07 19:54:32'),(26,'1001',1610020488,'localhost:8081','2021-01-07 19:54:48','2021-01-07 19:54:48');
/*!40000 ALTER TABLE `login_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `material`
--

DROP TABLE IF EXISTS `material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `material` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `number` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '学工号',
  `category` tinyint(4) NOT NULL DEFAULT '0' COMMENT '类别:1为党的基本知识01,2为积极分子考核02,3为发展对象考核成绩03,4为入党申请书',
  `serial_number` varchar(10) NOT NULL DEFAULT '0' COMMENT '编号',
  `score` char(3) NOT NULL DEFAULT '0' COMMENT '分数',
  `remarks` varchar(200) NOT NULL DEFAULT '' COMMENT '备注',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建的时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改的时间',
  `delete_time` datetime DEFAULT NULL COMMENT '软删除标记',
  PRIMARY KEY (`id`),
  KEY `idx_number` (`number`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='入党资料表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `material`
--

LOCK TABLES `material` WRITE;
/*!40000 ALTER TABLE `material` DISABLE KEYS */;
INSERT INTO `material` VALUES (5,2017107216,4,'','','application/2017107216-入党申请书.docx','2021-01-03 21:17:55','2021-01-03 21:17:55',NULL),(6,2017107201,4,'','','application/2017107201-入党申请书.docx','2021-01-03 21:47:00','2021-01-03 21:47:00',NULL),(7,2017107216,1,'2021050101','67','','2021-01-07 17:59:54','2021-01-07 17:59:54',NULL);
/*!40000 ALTER TABLE `material` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `number` bigint(20) NOT NULL DEFAULT '0' COMMENT '学工号',
  `faculty` char(2) NOT NULL DEFAULT '' COMMENT '学院代码',
  `major` varchar(30) NOT NULL DEFAULT '' COMMENT '专业',
  `grade` varchar(10) NOT NULL DEFAULT '' COMMENT '年级',
  `class` varchar(10) NOT NULL DEFAULT '' COMMENT '班级',
  `name` varchar(15) NOT NULL DEFAULT '' COMMENT '姓名',
  `sex` tinyint(4) NOT NULL DEFAULT '0' COMMENT '性别：1为男性，2为女性',
  `political_status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '政治面貌:1为群众,2为共青团员,3为预备党员,4为正式党员',
  `party_branch` char(3) NOT NULL DEFAULT '0' COMMENT '所在党支部',
  `nation` varchar(15) NOT NULL DEFAULT '' COMMENT '民族',
  `native_place` varchar(300) NOT NULL DEFAULT '' COMMENT '籍贯',
  `id_card` varchar(18) NOT NULL DEFAULT '' COMMENT '身份证号',
  `education` varchar(10) NOT NULL DEFAULT '' COMMENT '学历',
  `post` varchar(30) NOT NULL DEFAULT '' COMMENT '职务',
  `phone_number` char(11) NOT NULL DEFAULT '' COMMENT '手机号',
  `email` varchar(50) NOT NULL DEFAULT '' COMMENT '邮箱',
  `role` tinyint(4) NOT NULL DEFAULT '9' COMMENT '权限等级',
  `active_state` tinyint(4) NOT NULL DEFAULT '0' COMMENT '账户激活状态：0为未激活，1为已激活',
  `remarks` varchar(10) NOT NULL DEFAULT '' COMMENT '备注',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建的时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '资料修改的时间',
  `delete_time` datetime DEFAULT NULL COMMENT '软删除标记',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_number` (`number`),
  KEY `idx_create_time` (`create_time`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='人员信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` VALUES (6,1001,'07','计算机科学与技术','2017','1','admin',2,2,'0','汉','','411625199710067971','本科','学生','13117684283','2777167691@qq.com',3,1,'','2020-11-09 23:22:58','2021-01-03 20:42:52',NULL),(7,20170001,'07','计算机科学与技术','0','0','张三',1,4,'0','汉','云南省玉溪市澄江县','411625199710067971','研究生','教师','13117684283','2777167691@qq.com',4,1,'','2021-01-03 20:57:24','2021-01-03 21:23:12',NULL),(8,20170002,'05','物理学','0','0','李四',1,4,'0','汉','河池学院','411625199710067971','研究生','教师','13117684283','2777167691@qq.com',4,1,'','2021-01-03 20:57:24','2021-01-03 21:27:52',NULL),(9,2017107216,'05','物理学','2017','1','罗曼',2,2,'051','汉','云南省玉溪市澄江县','411625199710067971','本科','学生','13117684283','2777167691@qq.com',8,1,'','2021-01-03 20:57:24','2021-01-03 21:36:16',NULL),(10,2017107228,'07','计算机科学与技术','2017','2','邢晨浩',1,3,'0','汉','河南省周口市郸城县','411625199710067971','本科','学生','13117684283','2777167691@qq.com',8,1,'','2021-01-03 20:57:24','2021-01-03 21:13:34',NULL),(11,2017107201,'07','网络工程','2017','1','袁子翊',1,4,'071','汉','云南省玉溪市澄江县','411625199710067971','本科','学生','13117684283','2777167691@qq.com',6,1,'','2021-01-03 21:39:23','2021-01-03 21:47:00',NULL);
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person_account`
--

DROP TABLE IF EXISTS `person_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person_account` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `number` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '学工号',
  `profile` varchar(300) DEFAULT '申请入党人员' COMMENT '个人介绍',
  `password` varchar(32) NOT NULL DEFAULT '' COMMENT '登录密码',
  `id_photo` varchar(500) NOT NULL DEFAULT '/avatar/avatar_def4.png' COMMENT '头像',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建的时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '资料修改的时间',
  `delete_time` datetime DEFAULT NULL COMMENT '软删除标记',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_number` (`number`),
  KEY `idx_number` (`number`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='人员账户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person_account`
--

LOCK TABLES `person_account` WRITE;
/*!40000 ALTER TABLE `person_account` DISABLE KEYS */;
INSERT INTO `person_account` VALUES (1,1001,'申请入党人员','1001','/avatar/avatar_def4.png','2021-01-03 20:42:52','2021-01-03 20:44:14',NULL),(2,20170001,'申请入党人员','1001','/avatar/avatar_def4.png','2021-01-03 21:08:25','2021-01-03 21:22:09',NULL),(3,20170002,'申请入党人员','1001','/avatar/avatar_def4.png','2021-01-03 21:10:28','2021-01-03 21:10:28',NULL),(4,2017107216,'申请入党人员','1001','/avatar/avatar_def4.png','2021-01-03 21:12:01','2021-01-03 21:12:01',NULL),(5,2017107228,'申请入党人员','1001','/avatar/avatar_def4.png','2021-01-03 21:13:35','2021-01-03 21:13:35',NULL),(6,2017107201,'申请入党人员','1001','/avatar/avatar_def4.png','2021-01-03 21:46:09','2021-01-03 21:46:09',NULL);
/*!40000 ALTER TABLE `person_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person_temp`
--

DROP TABLE IF EXISTS `person_temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person_temp` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `number` bigint(20) NOT NULL DEFAULT '0' COMMENT '学工号',
  `faculty` char(2) NOT NULL DEFAULT '' COMMENT '学院代码',
  `major` varchar(30) NOT NULL DEFAULT '' COMMENT '专业',
  `grade` varchar(10) NOT NULL DEFAULT '' COMMENT '年级',
  `class` varchar(10) NOT NULL DEFAULT '' COMMENT '班级',
  `name` varchar(15) NOT NULL DEFAULT '' COMMENT '姓名',
  `sex` tinyint(4) NOT NULL DEFAULT '0' COMMENT '性别：1为男性，2为女性',
  `political_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '政治面貌:1为群众,2为共青团员,3为苗子,4为积极分子,5为发展对象,6为预备党员,7为正式党员',
  `party_branch` char(3) NOT NULL DEFAULT '0' COMMENT '所在党支部',
  `nation` varchar(15) NOT NULL DEFAULT '' COMMENT '民族',
  `native_place` varchar(300) NOT NULL DEFAULT '' COMMENT '籍贯',
  `id_card` varchar(18) NOT NULL DEFAULT '' COMMENT '身份证号',
  `education` varchar(10) NOT NULL DEFAULT '' COMMENT '学历',
  `post` varchar(30) NOT NULL DEFAULT '' COMMENT '职务',
  `phone_number` char(11) NOT NULL DEFAULT '' COMMENT '手机号',
  `email` varchar(50) NOT NULL DEFAULT '' COMMENT '邮箱',
  `role` tinyint(4) NOT NULL DEFAULT '5' COMMENT '权限等级',
  `active_state` tinyint(4) NOT NULL DEFAULT '0' COMMENT '账户激活状态：0为未激活，1为已激活',
  `remarks` varchar(10) NOT NULL DEFAULT '' COMMENT '备注',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建的时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '资料修改的时间',
  `delete_time` datetime DEFAULT NULL COMMENT '软删除标记',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_number` (`number`),
  KEY `idx_create_time` (`create_time`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 COMMENT='人员信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person_temp`
--

LOCK TABLES `person_temp` WRITE;
/*!40000 ALTER TABLE `person_temp` DISABLE KEYS */;
/*!40000 ALTER TABLE `person_temp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recruit_party_member`
--

DROP TABLE IF EXISTS `recruit_party_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recruit_party_member` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `number` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '学工号',
  `stage` tinyint(4) NOT NULL DEFAULT '0' COMMENT '成长阶段:1为申请入党,2为推优育苗,3为团组织推优,4为积极分子,5为发展对象,6为预备党员,7为预备党委审批,8为正式党员,9为正式党委审批',
  `stage_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '成长阶段阶段时间',
  `contacts` varchar(30) NOT NULL DEFAULT '' COMMENT '培养联系人',
  `introducer` varchar(30) NOT NULL DEFAULT '' COMMENT '入党介绍人',
  `remarks` varchar(50) NOT NULL DEFAULT '' COMMENT '备注',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建的时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '资料修改的时间',
  `delete_time` datetime DEFAULT NULL COMMENT '软删除标记',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_number_stage` (`number`,`stage`),
  KEY `idx_number` (`number`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='发展党员信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recruit_party_member`
--

LOCK TABLES `recruit_party_member` WRITE;
/*!40000 ALTER TABLE `recruit_party_member` DISABLE KEYS */;
INSERT INTO `recruit_party_member` VALUES (1,2017107216,1,'2021-01-03 21:24:45','','','','2021-01-03 21:17:55','2021-01-03 21:24:46',NULL),(2,2017107216,2,'2021-04-03 21:24:45','','','','2021-01-03 21:17:55','2021-01-03 21:24:46',NULL),(3,2017107201,1,'2021-01-03 21:47:52','','','','2021-01-03 21:47:00','2021-01-03 21:47:52',NULL),(4,2017107201,2,'2021-01-01 21:47:52','','','','2021-01-03 21:47:00','2021-01-03 21:47:52',NULL);
/*!40000 ALTER TABLE `recruit_party_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `temp_code`
--

DROP TABLE IF EXISTS `temp_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temp_code` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `uuid` varchar(36) NOT NULL DEFAULT '' COMMENT '账户全球唯一标识符',
  `code` varchar(20) NOT NULL DEFAULT '' COMMENT '验证码',
  `msg` varchar(32) NOT NULL DEFAULT '' COMMENT '备注信息',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建的时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='存储验证码临时表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `temp_code`
--

LOCK TABLES `temp_code` WRITE;
/*!40000 ALTER TABLE `temp_code` DISABLE KEYS */;
INSERT INTO `temp_code` VALUES (2,'20170001','1609679288710276','验证码','2021-01-03 21:08:08'),(3,'20170002','1609679403423661','验证码','2021-01-03 21:10:03'),(4,'2017107216','1609679498184362','验证码','2021-01-03 21:11:38'),(5,'2017107228','1609679591595428','验证码','2021-01-03 21:13:11'),(6,'2017107201','1609681545556933','验证码','2021-01-03 21:45:45'),(9,'1001','1610020463932126','验证码','2021-01-07 19:54:24');
/*!40000 ALTER TABLE `temp_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transfer`
--

DROP TABLE IF EXISTS `transfer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transfer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `number` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '发起人学工号',
  `contacts_phone` char(11) NOT NULL DEFAULT '' COMMENT '常用联系人手机号',
  `reason` tinyint(4) NOT NULL DEFAULT '0' COMMENT '原因:1为转专业,2为分配错误修正,3为其他',
  `leave_faculty` char(3) NOT NULL DEFAULT '0' COMMENT '转出学院',
  `leave_major` varchar(30) NOT NULL DEFAULT '' COMMENT '转出专业',
  `leave_organization` char(3) NOT NULL DEFAULT '0' COMMENT '转出党支部',
  `receive_faculty` char(3) NOT NULL DEFAULT '0' COMMENT '接收学院',
  `receive_major` varchar(30) NOT NULL DEFAULT '' COMMENT '转入专业',
  `receive_organization` char(3) NOT NULL DEFAULT '0' COMMENT '接收党支部',
  `review_steps` tinyint(4) NOT NULL DEFAULT '1' COMMENT '审核步骤:1为转出院级管理员审核,2为转入院级管理员审核,3为校级管理员审核,4为成功',
  `review_status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '审核状态:1为正在审核,2为审核通过,3为未通过',
  `out_low_reviewer` varchar(36) NOT NULL DEFAULT '' COMMENT '院级审核人员',
  `in_low_reviewer` varchar(36) NOT NULL DEFAULT '' COMMENT '院级审核人员',
  `high_reviewer` varchar(36) NOT NULL DEFAULT '' COMMENT '校级审核人员',
  `remarks` varchar(50) NOT NULL DEFAULT '' COMMENT '备注',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建的时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改的时间',
  `delete_time` datetime DEFAULT NULL COMMENT '软删除标记',
  PRIMARY KEY (`id`),
  KEY `idx_number` (`number`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='组织关系转接表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transfer`
--

LOCK TABLES `transfer` WRITE;
/*!40000 ALTER TABLE `transfer` DISABLE KEYS */;
INSERT INTO `transfer` VALUES (2,2017107216,'13117684283',1,'07','计算机科学与技术','071','05','物理学','051',4,2,'20170001','20170002','1001','测试1','2021-01-03 21:27:07','2021-01-03 21:27:07',NULL);
/*!40000 ALTER TABLE `transfer` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-01-07 20:20:04
