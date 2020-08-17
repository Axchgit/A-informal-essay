
truncate table 你的表名   
CREATE TABLE staff (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL default '0' COMMENT '用户id',
  `username` varchar(45) NOT NULL default '' COMMENT '真实姓名',
  `email` varchar(30) NOT NULL default '' COMMENT '用户邮箱',
  `nickname` varchar(45) NOT NULL default '' COMMENT '昵称',
  `avatar` int(11) NOT NULL default '0' COMMENT '头像',
  `birthday` date NOT NULL default '0000-00-00' COMMENT '生日',
  `sex` tinyint(4) not null DEFAULT '0' COMMENT '性别',
  `short_introduce` varchar(150) not null DEFAULT '' COMMENT '一句话介绍自己，最多50个汉字',
  `user_resume` varchar(200) NOT NULL default '' COMMENT '用户提交的简历存放地址',
  `user_register_ip` int NOT NULL COMMENT '用户注册时的源ip',
  `create_time` datetime NOT NULL default current_timestamp COMMENT '用户记录创建的时间',
  `update_time` datetime default current_timestamp on update current_timestamp NOT NULL COMMENT '用户资料修改的时间',
  `user_review_status` tinyint NOT NULL default '1' COMMENT '用户资料审核状态，1为通过，2为审核中，3为未通过，4为还未提交审核',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_user_id` (`user_id`),
  KEY `idx_username`(`username`),
  KEY `idx_create_time`(`create_time`,`user_review_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='网站用户基本信息';

CREATE TABLE `staff_login` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `work_num` bigint(10) NOT NULL default '0' COMMENT '工号',
  `nickname` varchar(45) NOT NULL default '' COMMENT '昵称',
  `password` varchar(30) NOT NULL default '' COMMENT '登录密码',
  `avatar` varchar(200) NOT NULL default '0' COMMENT '头像图片存放地址',
  `short_introduce` varchar(150) not null DEFAULT '' COMMENT '一句话介绍自己，最多50个汉字',
  `user_register_ip` int NOT NULL COMMENT '用户注册时的源ip',
  `user_review_status` tinyint NOT NULL default '1' COMMENT '账户激活状态，1为已激活，2为未激活',
  `create_time` datetime NOT NULL default current_timestamp COMMENT '用户记录创建的时间',
  `update_time` datetime default current_timestamp on update current_timestamp NOT NULL COMMENT '用户资料修改的时间',
  `delete_time` datetime default null COMMENT '软删除标记',
  PRIMARY KEY (`id`),
  KEY `idx_username`(`username`),
  KEY `idx_create_time`(`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='员工登录信息';

CREATE TABLE `admin` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `real_name` varchar(20) NOT NULL default '' COMMENT '姓名',
  `password` char(32) NOT NULL default '' COMMENT '登录密码',
  `phone_number` char(11) NOT NULL default '' COMMENT '手机号',
  `email` varchar(30) NOT NULL default '' COMMENT '邮箱',
  -- `register_ip` varchar(30) NOT NULL default '' COMMENT '用户注册时的源ip',
  `login_ip` varchar(30) NOT NULL default '' COMMENT '登录ip',
  `account_status` tinyint NOT NULL default '1' COMMENT '账户状态，1为启用，2为禁用',
  `permission` tinyint NOT NULL default '1' COMMENT '账户权限等级',
  `create_time` datetime NOT NULL default current_timestamp COMMENT '创建时间',
  `update_time` datetime default current_timestamp on update current_timestamp NOT NULL COMMENT '资料修改时间',
  `delete_time` datetime default null COMMENT '软删除标记',
  PRIMARY KEY (`id`),
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='管理员表';



CREATE TABLE IF NOT EXISTS `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键Id',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '修改时间',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `age` int(11) DEFAULT NULL COMMENT '年龄',
  `address` varchar(255) DEFAULT NULL COMMENT '地址',
  PRIMARY KEY (`id`),
  KEY `idx_com1` (`name`,`age`,`address`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';


CREATE TABLE staff (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `work_num` bigint(20) NOT NULL default '0' COMMENT '工号',
  `real_name` varchar(45) NOT NULL default '' COMMENT '真实姓名',
  `email` varchar(30) NOT NULL default '' COMMENT '用户邮箱',
  -- `nickname` varchar(45) NOT NULL default '' COMMENT '昵称',
  `avatar` varchar(200) NOT NULL default '' COMMENT '证件照存放地址',
  `id_card` varchar(18) NOT NULL default '' COMMENT '身份证',
  `bank_card` varchar(18) NOT NULL default '' COMMENT '银行卡',
  `birthday` date NOT NULL COMMENT '生日',
  `sex` tinyint(4) not null DEFAULT '0' COMMENT '性别：1为男性，2为女性',
  `create_time` datetime NOT NULL default current_timestamp COMMENT '用户记录创建的时间',
  `update_time` datetime default current_timestamp on update current_timestamp NOT NULL COMMENT '用户资料修改的时间',
  `delete_time` datetime default null COMMENT '软删除标记'
  `user_review_status` tinyint NOT NULL default '1' COMMENT '用户资料审核状态，1为通过，2为审核中，3为未通过，4为还未提交审核',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_work_num` (`work_num`),
  KEY `idx_staff_name`(`staff_name`),
  KEY `idx_create_time`(`create_time`,`user_review_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='员工信息表';


CREATE TABLE goods_temp (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `goods_id` bigint(20) NOT NULL default '0' COMMENT '商品id',
  `goods_name` varchar(200) NOT NULL default '' COMMENT '商品名称',
  `order_number` varchar(50) NOT NULL default '' COMMENT '订单号',
  `payment_time` varchar(50) NOT NULL default '' COMMENT '支付时间',  
  `shop_id` bigint(20) NOT NULL default '0' COMMENT '店铺id',
  `leader_nickname` varchar(45) NOT NULL default '' COMMENT '招商团长昵称',
  `leader_duoid` bigint(20) NOT NULL default '0' COMMENT '招商duoid',
  `salesman_nickname` varchar(45) NOT NULL default '' COMMENT '推手昵称',
  `salesman_duoid` bigint(20) NOT NULL default '0' COMMENT '推手duoid',
  `order_status` varchar(20) NOT NULL default '' COMMENT '订单状态',
  `order_amount` bigint(20) NOT NULL default '0' COMMENT '订单金额',
  `salesman_commission` int(5) NOT NULL default '0' COMMENT '推手佣金',
  `leader_commission` int(5) NOT NULL default '0' COMMENT '招商佣金',
  `leader_income` int(10) NOT NULL default '0' COMMENT '招商收入',
  `create_time` datetime NOT NULL default current_timestamp COMMENT '记录创建的时间',
  `update_time` datetime default current_timestamp on update current_timestamp NOT NULL COMMENT '修改的时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_goods_id` (`goods_id`),
  KEY `idx_goods_id`(`goods_id`),
  KEY `idx_create_time`(`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='推广商品明细临时表';


CREATE TABLE staff (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `work_num` varchar(5) NOT NULL default '0' COMMENT '工号',
  `order_number` varchar(50) NOT NULL default '' COMMENT '订单号',
  `create_time` datetime NOT NULL default current_timestamp COMMENT '记录创建的时间',
  `update_time` datetime default current_timestamp on update current_timestamp NOT NULL COMMENT '修改的时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_order_number` (`order_number`),
  KEY `idx_work_num`(`work_num`),
  KEY `idx_order_number`(`order_number`),
  KEY `idx_create_time`(`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='员工业绩表';



/***********************ep_api******************/



CREATE TABLE IF NOT EXISTS `admin`(
	`id` INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID',
	`uuid` VARCHAR(36) NOT NULL DEFAULT '' COMMENT '全球唯一标识符',
	`admin_name` VARCHAR(32) NOT NULL DEFAULT '' COMMENT '管理员账号',
	`admin_pass` CHAR(32) NOT NULL DEFAULT '' COMMENT '管理员密码',
	`admin_email` VARCHAR(50) NOT NULL DEFAULT '' COMMENT '管理员电子邮箱',
  `admin_phone` char(11) NOT NULL default '' COMMENT '手机号',
  `rule` tinyint NOT NULL default '5' COMMENT '权限等级',
	`logintime'` INT UNSIGNED NOT NULL DEFAULT '0' COMMENT '登陆时间',
	`loginip` BIGINT NOT NULL DEFAULT '0' COMMENT '登陆IP',
  `create_time` datetime NOT NULL default current_timestamp COMMENT '记录创建的时间',
  `update_time` datetime default current_timestamp on update current_timestamp NOT NULL COMMENT '修改的时间',
	PRIMARY KEY(`id`),
	UNIQUE admin_adminname_adminpass(`admin_name`,`admin_pass`),
	UNIQUE admin_adminname_adminemail(`admin_name`,`admin_email`),
	UNIQUE admin_adminname_adminphone(`admin_name`,`admin_phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='管理员表';


CREATE TABLE IF NOT EXISTS `temp_code`(
	`id` INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID',
	`uuid` VARCHAR(36) NOT NULL DEFAULT '' COMMENT '账户全球唯一标识符',
  `code` varchar(10) NOT NULL default '' COMMENT '验证码',
	`msg` VARCHAR(32) NOT NULL DEFAULT '' COMMENT '备注信息',
  `create_time` datetime NOT NULL default current_timestamp COMMENT '记录创建的时间',
	PRIMARY KEY(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='存储验证码临时表';



CREATE TABLE IF NOT EXISTS employee (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
	`uuid` VARCHAR(36) NOT NULL DEFAULT '' COMMENT '账户全球唯一标识符',
  `work_num` bigint(20) NOT NULL default '0' COMMENT '工号',
  `real_name` varchar(45) NOT NULL default '' COMMENT '真实姓名',
  `email` varchar(30) NOT NULL default '' COMMENT '用户邮箱',
  -- `nickname` varchaid_photor(45) NOT NULL default '' COMMENT '昵称',
  `id_photo` varchar(200) NOT NULL default '' COMMENT '证件照存放地址',
  `id_card` varchar(18) NOT NULL default '' COMMENT '身份证号',
  `bank_card` varchar(18) NOT NULL default '' COMMENT '银行卡',
  `birthday` date NOT NULL COMMENT '生日',
  `sex` tinyint(4) not null DEFAULT '0' COMMENT '性别：1为男性，2为女性',
  `rule` tinyint NOT NULL default '5' COMMENT '权限等级',
	`logintime` INT UNSIGNED NOT NULL DEFAULT '0' COMMENT '登陆时间',
	`loginip` BIGINT NOT NULL DEFAULT '0' COMMENT '登陆IP',
  `create_time` datetime NOT NULL default current_timestamp COMMENT '用户记录创建的时间',
  `update_time` datetime default current_timestamp on update current_timestamp NOT NULL COMMENT '用户资料修改的时间',
  `delete_time` datetime default null COMMENT '软删除标记'
  `user_review_status` tinyint NOT NULL default '1' COMMENT '用户资料审核状态，1为通过，2为审核中，3为未通过，4为还未提交审核',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_work_num` (`work_num`),
  KEY `idx_uuid`(`uuid`),
  KEY `idx_create_time`(`create_time`,`user_review_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='员工信息表';
插入示例
INSERT INTO `employee` (`id`, `uuid`, `work_num`, `real_name`, `email`, `id_photo`, `id_card`, `bank_card`, `birthday`, `sex`, `rule`, `logintime`, `loginip`, `create_time`, `update_time`, `delete_time`, `user_review_status`) VALUES (NULL, 'E6AE433A-0810-F991-FDCF-50E7ED5F36F4', '20190008', '盖伦', 'gailun@qq.com', 'dfd', 'fsdf', 'fsdf', '2020-08-17', '0', '5', '0', '0', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL, '1');
