-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- 主机： 127.0.0.1:3306
-- 生成日期： 2021-01-03 14:03:35
-- 服务器版本： 5.7.24
-- PHP 版本： 7.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `party_api`
--

-- --------------------------------------------------------

--
-- 表的结构 `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `uuid` varchar(36) NOT NULL COMMENT '全球唯一标识符',
  `admin_name` varchar(32) NOT NULL DEFAULT '' COMMENT '管理员账号',
  `admin_pass` char(32) NOT NULL DEFAULT '' COMMENT '管理员密码',
  `admin_email` varchar(50) NOT NULL DEFAULT '' COMMENT '管理员电子邮箱',
  `admin_phone` char(11) NOT NULL DEFAULT '' COMMENT '手机号',
  `avatar` varchar(200) NOT NULL DEFAULT 'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif',
  `role` tinyint(4) NOT NULL DEFAULT '5' COMMENT '权限等级',
  `logintime` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '登陆时间',
  `loginip` bigint(20) NOT NULL DEFAULT '0' COMMENT '登陆IP',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建的时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改的时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_adminname_adminpass` (`admin_name`,`admin_pass`) USING BTREE,
  UNIQUE KEY `admin_adminname_adminemail` (`admin_name`,`admin_email`) USING BTREE,
  UNIQUE KEY `admin_adminname_adminphone` (`admin_name`,`admin_phone`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='管理员表';

-- --------------------------------------------------------

--
-- 表的结构 `bulletin`
--

DROP TABLE IF EXISTS `bulletin`;
CREATE TABLE IF NOT EXISTS `bulletin` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `level` tinyint(4) NOT NULL DEFAULT '0' COMMENT '级别:1为红色,2为橙色,3为黄色,4为白色',
  `title` varchar(30) NOT NULL DEFAULT '' COMMENT '标题',
  `content` varchar(500) NOT NULL DEFAULT '' COMMENT '内容',
  `target_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '通知类型:1为特定用户,2为多个用户,3为用户群体(职务),4为全部',
  `create_number` bigint(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT '发布者学工号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `cancel_time` datetime DEFAULT NULL COMMENT '撤回标记',
  `delete_time` datetime DEFAULT NULL COMMENT '软删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='通告表';

--
-- 转存表中的数据 `bulletin`
--

INSERT INTO `bulletin` (`id`, `level`, `title`, `content`, `target_type`, `create_number`, `create_time`, `update_time`, `cancel_time`, `delete_time`) VALUES
(1, 2, '测试1', '测试1', 4, 1001, '2021-01-03 21:57:27', '2021-01-03 21:57:27', NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `bulletin_read`
--

DROP TABLE IF EXISTS `bulletin_read`;
CREATE TABLE IF NOT EXISTS `bulletin_read` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `bulletin_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '通告ID',
  `target_number` bigint(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT '阅读人员学工号',
  `read_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `delete_time` datetime DEFAULT NULL COMMENT '软删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='通告阅读状态表';

--
-- 转存表中的数据 `bulletin_read`
--

INSERT INTO `bulletin_read` (`id`, `bulletin_id`, `target_number`, `read_time`, `update_time`, `delete_time`) VALUES
(1, 1, 1001, '2021-01-03 21:57:46', '2021-01-03 21:57:46', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `bulletin_target`
--

DROP TABLE IF EXISTS `bulletin_target`;
CREATE TABLE IF NOT EXISTS `bulletin_target` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `bulletin_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '通告ID',
  `target_person` varchar(30) NOT NULL DEFAULT '' COMMENT '接收方标识',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `delete_time` datetime DEFAULT NULL COMMENT '软删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='通告目标表';

-- --------------------------------------------------------

--
-- 表的结构 `download_file`
--

DROP TABLE IF EXISTS `download_file`;
CREATE TABLE IF NOT EXISTS `download_file` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uploader_number` bigint(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT '上传者',
  `file_category` tinyint(4) NOT NULL DEFAULT '0' COMMENT '类别:1为发展党员第一阶段...5为第五阶段,6为其他',
  `file_name` varchar(100) NOT NULL DEFAULT '0' COMMENT '文件名',
  `file_path` varchar(100) NOT NULL DEFAULT '' COMMENT '文件地址',
  `file_remarks` varchar(50) NOT NULL DEFAULT '' COMMENT '文件备注',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建的时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '资料修改的时间',
  `delete_time` datetime DEFAULT NULL COMMENT '软删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='下载文件表';

--
-- 转存表中的数据 `download_file`
--

INSERT INTO `download_file` (`id`, `uploader_number`, `file_category`, `file_name`, `file_path`, `file_remarks`, `create_time`, `update_time`, `delete_time`) VALUES
(1, 1001, 1, '党员档案材料清单.doc', 'index_file/1/党员档案材料清单.doc', '测试1', '2021-01-03 21:56:33', '2021-01-03 21:56:33', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `join_apply`
--

DROP TABLE IF EXISTS `join_apply`;
CREATE TABLE IF NOT EXISTS `join_apply` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `number` bigint(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT '学工号',
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

--
-- 转存表中的数据 `join_apply`
--

INSERT INTO `join_apply` (`id`, `number`, `step`, `review_status`, `reviewer`, `remarks`, `create_time`, `update_time`, `delete_time`) VALUES
(1, 2017107216, 1, 2, '20170001', '', '2021-01-03 21:17:55', '2021-01-03 21:24:46', NULL),
(2, 2017107201, 1, 2, '20170001', '', '2021-01-03 21:47:00', '2021-01-03 21:47:52', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `login_record`
--

DROP TABLE IF EXISTS `login_record`;
CREATE TABLE IF NOT EXISTS `login_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) NOT NULL DEFAULT '' COMMENT '账户全球唯一标识符',
  `login_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '登录时间',
  `login_ip` varchar(30) NOT NULL DEFAULT '0' COMMENT '登录IP',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建的时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改的时间',
  PRIMARY KEY (`id`),
  KEY `idx_uuid` (`uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='登录记录表';

--
-- 转存表中的数据 `login_record`
--

INSERT INTO `login_record` (`id`, `uuid`, `login_time`, `login_ip`, `create_time`, `update_time`) VALUES
(1, '1001', 1609677786, 'localhost:8081', '2021-01-03 20:43:06', '2021-01-03 20:43:06'),
(2, '1001', 1609677866, 'localhost:8081', '2021-01-03 20:44:26', '2021-01-03 20:44:26'),
(3, '20170001', 1609679310, 'localhost:8081', '2021-01-03 21:08:30', '2021-01-03 21:08:30'),
(4, '20170002', 1609679452, 'localhost:8081', '2021-01-03 21:10:52', '2021-01-03 21:10:52'),
(5, '2017107216', 1609679541, 'localhost:8081', '2021-01-03 21:12:21', '2021-01-03 21:12:21'),
(6, '2017107228', 1609679623, 'localhost:8081', '2021-01-03 21:13:43', '2021-01-03 21:13:43'),
(7, '1001', 1609679724, 'localhost:8081', '2021-01-03 21:15:24', '2021-01-03 21:15:24'),
(8, '2017107216', 1609679820, 'localhost:8081', '2021-01-03 21:17:00', '2021-01-03 21:17:00'),
(9, '20170001', 1609680135, 'localhost:8081', '2021-01-03 21:22:15', '2021-01-03 21:22:15'),
(10, '20170002', 1609680828, 'localhost:8081', '2021-01-03 21:33:48', '2021-01-03 21:33:48'),
(11, '2017107201', 1609681581, 'localhost:8081', '2021-01-03 21:46:21', '2021-01-03 21:46:21'),
(12, '20170001', 1609681645, 'localhost:8081', '2021-01-03 21:47:25', '2021-01-03 21:47:25');

-- --------------------------------------------------------

--
-- 表的结构 `material`
--

DROP TABLE IF EXISTS `material`;
CREATE TABLE IF NOT EXISTS `material` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `number` bigint(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT '学工号',
  `category` tinyint(4) NOT NULL DEFAULT '0' COMMENT '类别:1为党的基本知识01,2为积极分子考核02,3为发展对象考核成绩03,4为入党申请书',
  `serial_number` varchar(10) NOT NULL DEFAULT '0' COMMENT '编号',
  `score` char(3) NOT NULL DEFAULT '0' COMMENT '分数',
  `remarks` varchar(200) NOT NULL DEFAULT '' COMMENT '备注',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建的时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改的时间',
  `delete_time` datetime DEFAULT NULL COMMENT '软删除标记',
  PRIMARY KEY (`id`),
  KEY `idx_number` (`number`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='入党资料表';

--
-- 转存表中的数据 `material`
--

INSERT INTO `material` (`id`, `number`, `category`, `serial_number`, `score`, `remarks`, `create_time`, `update_time`, `delete_time`) VALUES
(1, 2017107228, 1, '2021070101', '67', '', '2021-01-03 21:00:13', '2021-01-03 21:00:13', NULL),
(3, 2017107228, 3, '0', '56', '', '2021-01-03 21:00:13', '2021-01-03 21:00:13', NULL),
(4, 2017107228, 2, '2021070201', '67', '', '2021-01-03 21:03:33', '2021-01-03 21:03:33', NULL),
(5, 2017107216, 4, '', '', 'application/2017107216-入党申请书.docx', '2021-01-03 21:17:55', '2021-01-03 21:17:55', NULL),
(6, 2017107201, 4, '', '', 'application/2017107201-入党申请书.docx', '2021-01-03 21:47:00', '2021-01-03 21:47:00', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `person`
--

DROP TABLE IF EXISTS `person`;
CREATE TABLE IF NOT EXISTS `person` (
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
  `native_place` varchar(100) NOT NULL DEFAULT '' COMMENT '籍贯',
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='人员信息表';

--
-- 转存表中的数据 `person`
--

INSERT INTO `person` (`id`, `number`, `faculty`, `major`, `grade`, `class`, `name`, `sex`, `political_status`, `party_branch`, `nation`, `native_place`, `id_card`, `education`, `post`, `phone_number`, `email`, `role`, `active_state`, `remarks`, `create_time`, `update_time`, `delete_time`) VALUES
(6, 1001, '07', '计算机科学与技术', '2017', '1', 'admin', 2, 2, '0', '汉', '', '411625199710067971', '本科', '学生', '13117684283', '2777167691@qq.com', 3, 1, '', '2020-11-09 23:22:58', '2021-01-03 20:42:52', NULL),
(7, 20170001, '07', '计算机科学与技术', '0', '0', '张三', 1, 4, '0', '汉', '云南省玉溪市澄江县', '411625199710067971', '研究生', '教师', '13117684283', '2777167691@qq.com', 4, 1, '', '2021-01-03 20:57:24', '2021-01-03 21:23:12', NULL),
(8, 20170002, '05', '物理学', '0', '0', '李四', 1, 4, '0', '汉', '河池学院', '411625199710067971', '研究生', '教师', '13117684283', '2777167691@qq.com', 4, 1, '', '2021-01-03 20:57:24', '2021-01-03 21:27:52', NULL),
(9, 2017107216, '05', '物理学', '2017', '1', '罗曼', 2, 2, '051', '汉', '云南省玉溪市澄江县', '411625199710067971', '本科', '学生', '13117684283', '2777167691@qq.com', 8, 1, '', '2021-01-03 20:57:24', '2021-01-03 21:36:16', NULL),
(10, 2017107228, '07', '计算机科学与技术', '2017', '2', '邢晨浩', 1, 3, '0', '汉', '河南省周口市郸城县', '411625199710067971', '本科', '学生', '13117684283', '2777167691@qq.com', 8, 1, '', '2021-01-03 20:57:24', '2021-01-03 21:13:34', NULL),
(11, 2017107201, '07', '网络工程', '2017', '1', '袁子翊', 1, 4, '071', '汉', '云南省玉溪市澄江县', '411625199710067971', '本科', '学生', '13117684283', '2777167691@qq.com', 6, 1, '', '2021-01-03 21:39:23', '2021-01-03 21:47:00', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `person_account`
--

DROP TABLE IF EXISTS `person_account`;
CREATE TABLE IF NOT EXISTS `person_account` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `number` bigint(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT '学工号',
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

--
-- 转存表中的数据 `person_account`
--

INSERT INTO `person_account` (`id`, `number`, `profile`, `password`, `id_photo`, `create_time`, `update_time`, `delete_time`) VALUES
(1, 1001, '申请入党人员', '1001', '/avatar/avatar_def4.png', '2021-01-03 20:42:52', '2021-01-03 20:44:14', NULL),
(2, 20170001, '申请入党人员', '1001', '/avatar/avatar_def4.png', '2021-01-03 21:08:25', '2021-01-03 21:22:09', NULL),
(3, 20170002, '申请入党人员', '1001', '/avatar/avatar_def4.png', '2021-01-03 21:10:28', '2021-01-03 21:10:28', NULL),
(4, 2017107216, '申请入党人员', '1001', '/avatar/avatar_def4.png', '2021-01-03 21:12:01', '2021-01-03 21:12:01', NULL),
(5, 2017107228, '申请入党人员', '1001', '/avatar/avatar_def4.png', '2021-01-03 21:13:35', '2021-01-03 21:13:35', NULL),
(6, 2017107201, '申请入党人员', '1001', '/avatar/avatar_def4.png', '2021-01-03 21:46:09', '2021-01-03 21:46:09', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `person_temp`
--

DROP TABLE IF EXISTS `person_temp`;
CREATE TABLE IF NOT EXISTS `person_temp` (
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
  `native_place` varchar(10) NOT NULL DEFAULT '' COMMENT '籍贯',
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='人员信息表';

-- --------------------------------------------------------

--
-- 表的结构 `recruit_party_member`
--

DROP TABLE IF EXISTS `recruit_party_member`;
CREATE TABLE IF NOT EXISTS `recruit_party_member` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `number` bigint(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT '学工号',
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

--
-- 转存表中的数据 `recruit_party_member`
--

INSERT INTO `recruit_party_member` (`id`, `number`, `stage`, `stage_time`, `contacts`, `introducer`, `remarks`, `create_time`, `update_time`, `delete_time`) VALUES
(1, 2017107216, 1, '2021-01-03 21:24:45', '', '', '', '2021-01-03 21:17:55', '2021-01-03 21:24:46', NULL),
(2, 2017107216, 2, '2021-04-03 21:24:45', '', '', '', '2021-01-03 21:17:55', '2021-01-03 21:24:46', NULL),
(3, 2017107201, 1, '2021-01-03 21:47:52', '', '', '', '2021-01-03 21:47:00', '2021-01-03 21:47:52', NULL),
(4, 2017107201, 2, '2021-04-03 21:47:52', '', '', '', '2021-01-03 21:47:00', '2021-01-03 21:47:52', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `temp_code`
--

DROP TABLE IF EXISTS `temp_code`;
CREATE TABLE IF NOT EXISTS `temp_code` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `uuid` varchar(36) NOT NULL DEFAULT '' COMMENT '账户全球唯一标识符',
  `code` varchar(20) NOT NULL DEFAULT '' COMMENT '验证码',
  `msg` varchar(32) NOT NULL DEFAULT '' COMMENT '备注信息',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建的时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='存储验证码临时表';

--
-- 转存表中的数据 `temp_code`
--

INSERT INTO `temp_code` (`id`, `uuid`, `code`, `msg`, `create_time`) VALUES
(1, '1001', '1609677739263613', '验证码', '2021-01-03 20:42:19'),
(2, '20170001', '1609679288710276', '验证码', '2021-01-03 21:08:08'),
(3, '20170002', '1609679403423661', '验证码', '2021-01-03 21:10:03'),
(4, '2017107216', '1609679498184362', '验证码', '2021-01-03 21:11:38'),
(5, '2017107228', '1609679591595428', '验证码', '2021-01-03 21:13:11'),
(6, '2017107201', '1609681545556933', '验证码', '2021-01-03 21:45:45');

-- --------------------------------------------------------

--
-- 表的结构 `transfer`
--

DROP TABLE IF EXISTS `transfer`;
CREATE TABLE IF NOT EXISTS `transfer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `number` bigint(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT '发起人学工号',
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

--
-- 转存表中的数据 `transfer`
--

INSERT INTO `transfer` (`id`, `number`, `contacts_phone`, `reason`, `leave_faculty`, `leave_major`, `leave_organization`, `receive_faculty`, `receive_major`, `receive_organization`, `review_steps`, `review_status`, `out_low_reviewer`, `in_low_reviewer`, `high_reviewer`, `remarks`, `create_time`, `update_time`, `delete_time`) VALUES
(2, 2017107216, '13117684283', 1, '07', '计算机科学与技术', '071', '05', '物理学', '051', 4, 2, '20170001', '20170002', '1001', '测试1', '2021-01-03 21:27:07', '2021-01-03 21:27:07', NULL);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
