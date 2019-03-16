-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        5.7.25-log - MySQL Community Server (GPL)
-- 服务器操作系统:                      Win32
-- HeidiSQL 版本:                  9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- 导出 answer 的数据库结构
CREATE DATABASE IF NOT EXISTS `answer` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `answer`;

-- 导出  表 answer.answer_user 结构
CREATE TABLE IF NOT EXISTS `answer_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `open_id` varchar(100) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `union_id` varchar(100) DEFAULT NULL,
  `nick_name` varchar(200) DEFAULT NULL,
  `head` varchar(500) DEFAULT NULL,
  `grade` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `empirical_value` int(11) DEFAULT NULL,
  `coin` float DEFAULT NULL,
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- 正在导出表  answer.answer_user 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `answer_user` DISABLE KEYS */;
INSERT INTO `answer_user` (`id`, `open_id`, `phone`, `union_id`, `nick_name`, `head`, `grade`, `status`, `empirical_value`, `coin`, `create_time`) VALUES
	(1, NULL, '15001167619', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `answer_user` ENABLE KEYS */;

-- 导出  表 answer.exam_question 结构
CREATE TABLE IF NOT EXISTS `exam_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '试题类型',
  `question` varchar(100) NOT NULL COMMENT '试题内容',
  `time_limit` int(11) NOT NULL DEFAULT '10' COMMENT '限时  以 s 为 单位 ',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '试题状态 0 正常 1 停用',
  `answer_content` varchar(2000) DEFAULT NULL COMMENT '答案  [{"isRight":0,"content":"这是错误答案"},{"isRight":0,"content":"这是错答案"},{"isRight":1,"content":"这是正确答案"},{"isRight":0,"content":"这是错误答案"}]',
  `analyze` varchar(2000) DEFAULT NULL COMMENT '题目解析',
  `level` int(11) NOT NULL DEFAULT '0' COMMENT '难度 0 初级 1 中级 2 高级',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='试题表';

-- 正在导出表  answer.exam_question 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `exam_question` DISABLE KEYS */;
INSERT INTO `exam_question` (`id`, `type`, `question`, `time_limit`, `status`, `answer_content`, `analyze`, `level`, `create_time`) VALUES
	(1, 1, 'dd', 10, 0, 'dfff', 'dwsd', 0, '2019-03-16 14:35:14');
/*!40000 ALTER TABLE `exam_question` ENABLE KEYS */;

-- 导出  表 answer.qrtz_blob_triggers 结构
CREATE TABLE IF NOT EXISTS `qrtz_blob_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `blob_data` blob,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  answer.qrtz_blob_triggers 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `qrtz_blob_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_blob_triggers` ENABLE KEYS */;

-- 导出  表 answer.qrtz_calendars 结构
CREATE TABLE IF NOT EXISTS `qrtz_calendars` (
  `sched_name` varchar(120) NOT NULL,
  `calendar_name` varchar(200) NOT NULL,
  `calendar` blob NOT NULL,
  PRIMARY KEY (`sched_name`,`calendar_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  answer.qrtz_calendars 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `qrtz_calendars` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_calendars` ENABLE KEYS */;

-- 导出  表 answer.qrtz_cron_triggers 结构
CREATE TABLE IF NOT EXISTS `qrtz_cron_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `cron_expression` varchar(200) NOT NULL,
  `time_zone_id` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  answer.qrtz_cron_triggers 的数据：~2 rows (大约)
/*!40000 ALTER TABLE `qrtz_cron_triggers` DISABLE KEYS */;
INSERT INTO `qrtz_cron_triggers` (`sched_name`, `trigger_name`, `trigger_group`, `cron_expression`, `time_zone_id`) VALUES
	('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', '0/10 * * * * ?', 'Asia/Shanghai'),
	('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', '0/20 * * * * ?', 'Asia/Shanghai');
/*!40000 ALTER TABLE `qrtz_cron_triggers` ENABLE KEYS */;

-- 导出  表 answer.qrtz_fired_triggers 结构
CREATE TABLE IF NOT EXISTS `qrtz_fired_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `entry_id` varchar(95) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `instance_name` varchar(200) NOT NULL,
  `fired_time` bigint(13) NOT NULL,
  `sched_time` bigint(13) NOT NULL,
  `priority` int(11) NOT NULL,
  `state` varchar(16) NOT NULL,
  `job_name` varchar(200) DEFAULT NULL,
  `job_group` varchar(200) DEFAULT NULL,
  `is_nonconcurrent` varchar(1) DEFAULT NULL,
  `requests_recovery` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  answer.qrtz_fired_triggers 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `qrtz_fired_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_fired_triggers` ENABLE KEYS */;

-- 导出  表 answer.qrtz_job_details 结构
CREATE TABLE IF NOT EXISTS `qrtz_job_details` (
  `sched_name` varchar(120) NOT NULL,
  `job_name` varchar(200) NOT NULL,
  `job_group` varchar(200) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `job_class_name` varchar(250) NOT NULL,
  `is_durable` varchar(1) NOT NULL,
  `is_nonconcurrent` varchar(1) NOT NULL,
  `is_update_data` varchar(1) NOT NULL,
  `requests_recovery` varchar(1) NOT NULL,
  `job_data` blob,
  PRIMARY KEY (`sched_name`,`job_name`,`job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  answer.qrtz_job_details 的数据：~2 rows (大约)
/*!40000 ALTER TABLE `qrtz_job_details` DISABLE KEYS */;
INSERT INTO `qrtz_job_details` (`sched_name`, `job_name`, `job_group`, `description`, `job_class_name`, `is_durable`, `is_nonconcurrent`, `is_update_data`, `requests_recovery`, `job_data`) VALUES
	('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', _binary 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61703FE8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D6170133F3F760A3F00025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC13F603F000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200094C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000A6D6574686F644E616D6571007E00094C000C6D6574686F64506172616D7371007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A3F4B59741903000078707708000001622C3FE078707400007070707400013174000E302F3130202A202A202A202A203F740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E697A0E58F82EFBC897372000E6A6176612E6C616E672E4C6F6E673B8BE490CC3F3F00014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC3F0B94E03F00007870000000000000000174000672795461736B74000A72794E6F506172616D7374000074000133740001317800),
	('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', _binary 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61703FE8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D6170133F3F760A3F00025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC13F603F000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200094C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000A6D6574686F644E616D6571007E00094C000C6D6574686F64506172616D7371007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A3F4B59741903000078707708000001622C3FE078707400007070707400013174000E302F3230202A202A202A202A203F740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E69C89E58F82EFBC897372000E6A6176612E6C616E672E4C6F6E673B8BE490CC3F3F00014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC3F0B94E03F00007870000000000000000274000672795461736B7400087279506172616D73740002727974000133740001317800);
/*!40000 ALTER TABLE `qrtz_job_details` ENABLE KEYS */;

-- 导出  表 answer.qrtz_locks 结构
CREATE TABLE IF NOT EXISTS `qrtz_locks` (
  `sched_name` varchar(120) NOT NULL,
  `lock_name` varchar(40) NOT NULL,
  PRIMARY KEY (`sched_name`,`lock_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  answer.qrtz_locks 的数据：~2 rows (大约)
/*!40000 ALTER TABLE `qrtz_locks` DISABLE KEYS */;
INSERT INTO `qrtz_locks` (`sched_name`, `lock_name`) VALUES
	('RuoyiScheduler', 'STATE_ACCESS'),
	('RuoyiScheduler', 'TRIGGER_ACCESS');
/*!40000 ALTER TABLE `qrtz_locks` ENABLE KEYS */;

-- 导出  表 answer.qrtz_paused_trigger_grps 结构
CREATE TABLE IF NOT EXISTS `qrtz_paused_trigger_grps` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  PRIMARY KEY (`sched_name`,`trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  answer.qrtz_paused_trigger_grps 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `qrtz_paused_trigger_grps` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_paused_trigger_grps` ENABLE KEYS */;

-- 导出  表 answer.qrtz_scheduler_state 结构
CREATE TABLE IF NOT EXISTS `qrtz_scheduler_state` (
  `sched_name` varchar(120) NOT NULL,
  `instance_name` varchar(200) NOT NULL,
  `last_checkin_time` bigint(13) NOT NULL,
  `checkin_interval` bigint(13) NOT NULL,
  PRIMARY KEY (`sched_name`,`instance_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  answer.qrtz_scheduler_state 的数据：~1 rows (大约)
/*!40000 ALTER TABLE `qrtz_scheduler_state` DISABLE KEYS */;
INSERT INTO `qrtz_scheduler_state` (`sched_name`, `instance_name`, `last_checkin_time`, `checkin_interval`) VALUES
	('RuoyiScheduler', 'WINDOWS-HRVEP1I1552726561457', 1552726598682, 15000);
/*!40000 ALTER TABLE `qrtz_scheduler_state` ENABLE KEYS */;

-- 导出  表 answer.qrtz_simple_triggers 结构
CREATE TABLE IF NOT EXISTS `qrtz_simple_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `repeat_count` bigint(7) NOT NULL,
  `repeat_interval` bigint(12) NOT NULL,
  `times_triggered` bigint(10) NOT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  answer.qrtz_simple_triggers 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `qrtz_simple_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_simple_triggers` ENABLE KEYS */;

-- 导出  表 answer.qrtz_simprop_triggers 结构
CREATE TABLE IF NOT EXISTS `qrtz_simprop_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `str_prop_1` varchar(512) DEFAULT NULL,
  `str_prop_2` varchar(512) DEFAULT NULL,
  `str_prop_3` varchar(512) DEFAULT NULL,
  `int_prop_1` int(11) DEFAULT NULL,
  `int_prop_2` int(11) DEFAULT NULL,
  `long_prop_1` bigint(20) DEFAULT NULL,
  `long_prop_2` bigint(20) DEFAULT NULL,
  `dec_prop_1` decimal(13,4) DEFAULT NULL,
  `dec_prop_2` decimal(13,4) DEFAULT NULL,
  `bool_prop_1` varchar(1) DEFAULT NULL,
  `bool_prop_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  answer.qrtz_simprop_triggers 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `qrtz_simprop_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_simprop_triggers` ENABLE KEYS */;

-- 导出  表 answer.qrtz_triggers 结构
CREATE TABLE IF NOT EXISTS `qrtz_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `job_name` varchar(200) NOT NULL,
  `job_group` varchar(200) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `next_fire_time` bigint(13) DEFAULT NULL,
  `prev_fire_time` bigint(13) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `trigger_state` varchar(16) NOT NULL,
  `trigger_type` varchar(8) NOT NULL,
  `start_time` bigint(13) NOT NULL,
  `end_time` bigint(13) DEFAULT NULL,
  `calendar_name` varchar(200) DEFAULT NULL,
  `misfire_instr` smallint(2) DEFAULT NULL,
  `job_data` blob,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  KEY `sched_name` (`sched_name`,`job_name`,`job_group`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  answer.qrtz_triggers 的数据：~2 rows (大约)
/*!40000 ALTER TABLE `qrtz_triggers` DISABLE KEYS */;
INSERT INTO `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`, `job_name`, `job_group`, `description`, `next_fire_time`, `prev_fire_time`, `priority`, `trigger_state`, `trigger_type`, `start_time`, `end_time`, `calendar_name`, `misfire_instr`, `job_data`) VALUES
	('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 1552726570000, -1, 5, 'PAUSED', 'CRON', 1552726561000, 0, NULL, 2, _binary ''),
	('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 1552726580000, -1, 5, 'PAUSED', 'CRON', 1552726561000, 0, NULL, 2, _binary '');
/*!40000 ALTER TABLE `qrtz_triggers` ENABLE KEYS */;

-- 导出  表 answer.sys_config 结构
CREATE TABLE IF NOT EXISTS `sys_config` (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(100) DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8 COMMENT='参数配置表';

-- 正在导出表  answer.sys_config 的数据：~2 rows (大约)
/*!40000 ALTER TABLE `sys_config` DISABLE KEYS */;
INSERT INTO `sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
	(1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow'),
	(2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '初始化密码 123456');
/*!40000 ALTER TABLE `sys_config` ENABLE KEYS */;

-- 导出  表 answer.sys_dept 结构
CREATE TABLE IF NOT EXISTS `sys_dept` (
  `dept_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` int(11) DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `status` char(1) DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=utf8 COMMENT='部门表';

-- 正在导出表  answer.sys_dept 的数据：~10 rows (大约)
/*!40000 ALTER TABLE `sys_dept` DISABLE KEYS */;
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES
	(100, 0, '0', '若依科技', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00'),
	(101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00'),
	(102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00'),
	(103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00'),
	(104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00'),
	(105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00'),
	(106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00'),
	(107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00'),
	(108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00'),
	(109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
/*!40000 ALTER TABLE `sys_dept` ENABLE KEYS */;

-- 导出  表 answer.sys_dict_data 结构
CREATE TABLE IF NOT EXISTS `sys_dict_data` (
  `dict_code` int(11) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8 COMMENT='字典数据表';

-- 正在导出表  answer.sys_dict_data 的数据：~31 rows (大约)
/*!40000 ALTER TABLE `sys_dict_data` DISABLE KEYS */;
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
	(1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别男'),
	(2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别女'),
	(3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别未知'),
	(4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '显示菜单'),
	(5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '隐藏菜单'),
	(6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态'),
	(7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态'),
	(8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态'),
	(9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态'),
	(10, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统默认是'),
	(11, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统默认否'),
	(12, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知'),
	(13, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '公告'),
	(14, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态'),
	(15, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '关闭状态'),
	(16, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '新增操作'),
	(17, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '修改操作'),
	(18, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '删除操作'),
	(19, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '授权操作'),
	(20, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '导出操作'),
	(21, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '导入操作'),
	(22, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '强退操作'),
	(23, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '生成操作'),
	(24, 8, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '清空操作'),
	(25, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态'),
	(26, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态'),
	(100, 1, '试题类型一', '1', 'exam_question_type', NULL, NULL, 'Y', '0', 'admin', '2019-03-16 13:45:27', '', NULL, NULL),
	(101, 2, '试题类型二', '2', 'exam_question_type', NULL, NULL, 'Y', '0', 'admin', '2019-03-16 13:45:43', '', NULL, NULL),
	(102, 1, '初级', '0', 'exam_question_level', NULL, NULL, 'Y', '0', 'admin', '2019-03-16 13:47:06', '', NULL, NULL),
	(103, 2, '中级', '1', 'exam_question_level', NULL, NULL, 'Y', '0', 'admin', '2019-03-16 13:47:18', '', NULL, NULL),
	(104, 3, '高级', '2', 'exam_question_level', NULL, NULL, 'Y', '0', 'admin', '2019-03-16 13:47:29', '', NULL, NULL);
/*!40000 ALTER TABLE `sys_dict_data` ENABLE KEYS */;

-- 导出  表 answer.sys_dict_type 结构
CREATE TABLE IF NOT EXISTS `sys_dict_type` (
  `dict_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8 COMMENT='字典类型表';

-- 正在导出表  answer.sys_dict_type 的数据：~9 rows (大约)
/*!40000 ALTER TABLE `sys_dict_type` DISABLE KEYS */;
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
	(1, '用户性别', 'sys_user_sex', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '用户性别列表'),
	(2, '菜单状态', 'sys_show_hide', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '菜单状态列表'),
	(3, '系统开关', 'sys_normal_disable', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统开关列表'),
	(4, '任务状态', 'sys_job_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '任务状态列表'),
	(5, '系统是否', 'sys_yes_no', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统是否列表'),
	(6, '通知类型', 'sys_notice_type', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知类型列表'),
	(7, '通知状态', 'sys_notice_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知状态列表'),
	(8, '操作类型', 'sys_oper_type', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '操作类型列表'),
	(9, '系统状态', 'sys_common_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '登录状态列表'),
	(100, '考试类型', 'exam_question_type', '0', 'admin', '2019-03-16 13:43:42', '', NULL, '考试类型'),
	(101, '试题难度', 'exam_question_level', '0', 'admin', '2019-03-16 13:46:39', '', NULL, NULL);
/*!40000 ALTER TABLE `sys_dict_type` ENABLE KEYS */;

-- 导出  表 answer.sys_job 结构
CREATE TABLE IF NOT EXISTS `sys_job` (
  `job_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL DEFAULT '' COMMENT '任务组名',
  `method_name` varchar(500) DEFAULT '' COMMENT '任务方法',
  `method_params` varchar(50) DEFAULT NULL COMMENT '方法参数',
  `cron_expression` varchar(255) DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8 COMMENT='定时任务调度表';

-- 正在导出表  answer.sys_job 的数据：~2 rows (大约)
/*!40000 ALTER TABLE `sys_job` DISABLE KEYS */;
INSERT INTO `sys_job` (`job_id`, `job_name`, `job_group`, `method_name`, `method_params`, `cron_expression`, `misfire_policy`, `concurrent`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
	(1, 'ryTask', '系统默认（无参）', 'ryNoParams', '', '0/10 * * * * ?', '3', '1', '1', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(2, 'ryTask', '系统默认（有参）', 'ryParams', 'ry', '0/20 * * * * ?', '3', '1', '1', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
/*!40000 ALTER TABLE `sys_job` ENABLE KEYS */;

-- 导出  表 answer.sys_job_log 结构
CREATE TABLE IF NOT EXISTS `sys_job_log` (
  `job_log_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL COMMENT '任务组名',
  `method_name` varchar(500) DEFAULT NULL COMMENT '任务方法',
  `method_params` varchar(50) DEFAULT NULL COMMENT '方法参数',
  `job_message` varchar(500) DEFAULT NULL COMMENT '日志信息',
  `status` char(1) DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) DEFAULT '' COMMENT '异常信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='定时任务调度日志表';

-- 正在导出表  answer.sys_job_log 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `sys_job_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_job_log` ENABLE KEYS */;

-- 导出  表 answer.sys_logininfor 结构
CREATE TABLE IF NOT EXISTS `sys_logininfor` (
  `info_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `login_name` varchar(50) DEFAULT '' COMMENT '登录账号',
  `ipaddr` varchar(50) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` char(1) DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=utf8 COMMENT='系统访问记录';

-- 正在导出表  answer.sys_logininfor 的数据：~25 rows (大约)
/*!40000 ALTER TABLE `sys_logininfor` DISABLE KEYS */;
INSERT INTO `sys_logininfor` (`info_id`, `login_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES
	(100, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-16 12:20:15'),
	(101, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '退出成功', '2019-03-16 12:26:38'),
	(102, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-16 12:27:57'),
	(103, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-16 13:08:31'),
	(104, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-16 13:18:06'),
	(105, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-16 13:22:30'),
	(106, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-16 13:42:45'),
	(107, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-16 13:51:38'),
	(108, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-16 14:02:15'),
	(109, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-16 14:06:49'),
	(110, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-16 14:17:23'),
	(111, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-16 14:19:10'),
	(112, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-16 14:24:20'),
	(113, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-16 14:32:06'),
	(114, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-16 14:38:20'),
	(115, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-16 14:40:27'),
	(116, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-16 14:44:21'),
	(117, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-16 14:53:16'),
	(118, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-16 14:53:30'),
	(119, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-16 14:56:06'),
	(120, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-16 15:01:08'),
	(121, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-16 15:03:54'),
	(122, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-16 15:09:31'),
	(123, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-16 15:11:45'),
	(124, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-16 15:13:19'),
	(125, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-16 15:17:56'),
	(126, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-16 15:26:05'),
	(127, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-16 15:30:28'),
	(128, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-16 16:56:27');
/*!40000 ALTER TABLE `sys_logininfor` ENABLE KEYS */;

-- 导出  表 answer.sys_menu 结构
CREATE TABLE IF NOT EXISTS `sys_menu` (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
  `parent_id` int(11) DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `url` varchar(200) DEFAULT '#' COMMENT '请求地址',
  `menu_type` char(1) DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `perms` varchar(100) DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2005 DEFAULT CHARSET=utf8 COMMENT='菜单权限表';

-- 正在导出表  answer.sys_menu 的数据：~79 rows (大约)
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `menu_type`, `visible`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
	(1, '系统管理', 0, 1, '#', 'M', '0', '', 'fa fa-gear', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统管理目录'),
	(2, '系统监控', 0, 2, '#', 'M', '0', '', 'fa fa-video-camera', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统监控目录'),
	(3, '系统工具', 0, 3, '#', 'M', '0', '', 'fa fa-bars', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统工具目录'),
	(4, '试题管理', 0, 4, '#', 'M', '0', '', 'fa fa-bars', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '试题管理目录'),
	(100, '用户管理', 1, 1, '/system/user', 'C', '0', 'system:user:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '用户管理菜单'),
	(101, '角色管理', 1, 2, '/system/role', 'C', '0', 'system:role:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '角色管理菜单'),
	(102, '菜单管理', 1, 3, '/system/menu', 'C', '0', 'system:menu:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '菜单管理菜单'),
	(103, '部门管理', 1, 4, '/system/dept', 'C', '0', 'system:dept:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '部门管理菜单'),
	(104, '岗位管理', 1, 5, '/system/post', 'C', '0', 'system:post:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '岗位管理菜单'),
	(105, '字典管理', 1, 6, '/system/dict', 'C', '0', 'system:dict:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '字典管理菜单'),
	(106, '参数设置', 1, 7, '/system/config', 'C', '0', 'system:config:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '参数设置菜单'),
	(107, '通知公告', 1, 8, '/system/notice', 'C', '0', 'system:notice:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知公告菜单'),
	(108, '日志管理', 1, 9, '#', 'M', '0', '', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '日志管理菜单'),
	(109, '在线用户', 2, 1, '/monitor/online', 'C', '0', 'monitor:online:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '在线用户菜单'),
	(110, '定时任务', 2, 2, '/monitor/job', 'C', '0', 'monitor:job:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '定时任务菜单'),
	(111, '数据监控', 2, 3, '/monitor/data', 'C', '0', 'monitor:data:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '数据监控菜单'),
	(112, '服务监控', 2, 3, '/monitor/server', 'C', '0', 'monitor:server:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '服务监控菜单'),
	(113, '表单构建', 3, 1, '/tool/build', 'C', '0', 'tool:build:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '表单构建菜单'),
	(114, '代码生成', 3, 2, '/tool/gen', 'C', '0', 'tool:gen:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '代码生成菜单'),
	(115, '系统接口', 3, 3, '/tool/swagger', 'C', '0', 'tool:swagger:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统接口菜单'),
	(500, '操作日志', 108, 1, '/monitor/operlog', 'C', '0', 'monitor:operlog:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '操作日志菜单'),
	(501, '登录日志', 108, 2, '/monitor/logininfor', 'C', '0', 'monitor:logininfor:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '登录日志菜单'),
	(1000, '用户查询', 100, 1, '#', 'F', '0', 'system:user:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(1001, '用户新增', 100, 2, '#', 'F', '0', 'system:user:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(1002, '用户修改', 100, 3, '#', 'F', '0', 'system:user:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(1003, '用户删除', 100, 4, '#', 'F', '0', 'system:user:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(1004, '用户导出', 100, 5, '#', 'F', '0', 'system:user:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(1005, '用户导入', 100, 6, '#', 'F', '0', 'system:user:import', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(1006, '重置密码', 100, 7, '#', 'F', '0', 'system:user:resetPwd', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(1007, '角色查询', 101, 1, '#', 'F', '0', 'system:role:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(1008, '角色新增', 101, 2, '#', 'F', '0', 'system:role:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(1009, '角色修改', 101, 3, '#', 'F', '0', 'system:role:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(1010, '角色删除', 101, 4, '#', 'F', '0', 'system:role:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(1011, '角色导出', 101, 5, '#', 'F', '0', 'system:role:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(1012, '菜单查询', 102, 1, '#', 'F', '0', 'system:menu:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(1013, '菜单新增', 102, 2, '#', 'F', '0', 'system:menu:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(1014, '菜单修改', 102, 3, '#', 'F', '0', 'system:menu:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(1015, '菜单删除', 102, 4, '#', 'F', '0', 'system:menu:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(1016, '部门查询', 103, 1, '#', 'F', '0', 'system:dept:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(1017, '部门新增', 103, 2, '#', 'F', '0', 'system:dept:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(1018, '部门修改', 103, 3, '#', 'F', '0', 'system:dept:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(1019, '部门删除', 103, 4, '#', 'F', '0', 'system:dept:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(1020, '岗位查询', 104, 1, '#', 'F', '0', 'system:post:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(1021, '岗位新增', 104, 2, '#', 'F', '0', 'system:post:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(1022, '岗位修改', 104, 3, '#', 'F', '0', 'system:post:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(1023, '岗位删除', 104, 4, '#', 'F', '0', 'system:post:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(1024, '岗位导出', 104, 5, '#', 'F', '0', 'system:post:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(1025, '字典查询', 105, 1, '#', 'F', '0', 'system:dict:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(1026, '字典新增', 105, 2, '#', 'F', '0', 'system:dict:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(1027, '字典修改', 105, 3, '#', 'F', '0', 'system:dict:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(1028, '字典删除', 105, 4, '#', 'F', '0', 'system:dict:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(1029, '字典导出', 105, 5, '#', 'F', '0', 'system:dict:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(1030, '参数查询', 106, 1, '#', 'F', '0', 'system:config:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(1031, '参数新增', 106, 2, '#', 'F', '0', 'system:config:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(1032, '参数修改', 106, 3, '#', 'F', '0', 'system:config:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(1033, '参数删除', 106, 4, '#', 'F', '0', 'system:config:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(1034, '参数导出', 106, 5, '#', 'F', '0', 'system:config:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(1035, '公告查询', 107, 1, '#', 'F', '0', 'system:notice:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(1036, '公告新增', 107, 2, '#', 'F', '0', 'system:notice:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(1037, '公告修改', 107, 3, '#', 'F', '0', 'system:notice:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(1038, '公告删除', 107, 4, '#', 'F', '0', 'system:notice:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(1039, '操作查询', 500, 1, '#', 'F', '0', 'monitor:operlog:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(1040, '操作删除', 500, 2, '#', 'F', '0', 'monitor:operlog:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(1041, '详细信息', 500, 3, '#', 'F', '0', 'monitor:operlog:detail', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(1042, '日志导出', 500, 4, '#', 'F', '0', 'monitor:operlog:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(1043, '登录查询', 501, 1, '#', 'F', '0', 'monitor:logininfor:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(1044, '登录删除', 501, 2, '#', 'F', '0', 'monitor:logininfor:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(1045, '日志导出', 501, 3, '#', 'F', '0', 'monitor:logininfor:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(1046, '在线查询', 109, 1, '#', 'F', '0', 'monitor:online:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(1047, '批量强退', 109, 2, '#', 'F', '0', 'monitor:online:batchForceLogout', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(1048, '单条强退', 109, 3, '#', 'F', '0', 'monitor:online:forceLogout', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(1049, '任务查询', 110, 1, '#', 'F', '0', 'monitor:job:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(1050, '任务新增', 110, 2, '#', 'F', '0', 'monitor:job:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(1051, '任务修改', 110, 3, '#', 'F', '0', 'monitor:job:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(1052, '任务删除', 110, 4, '#', 'F', '0', 'monitor:job:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(1053, '状态修改', 110, 5, '#', 'F', '0', 'monitor:job:changeStatus', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(1054, '任务详细', 110, 6, '#', 'F', '0', 'monitor:job:detail', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(1055, '任务导出', 110, 7, '#', 'F', '0', 'monitor:job:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(1056, '生成查询', 114, 1, '#', 'F', '0', 'tool:gen:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(1057, '生成代码', 114, 2, '#', 'F', '0', 'tool:gen:code', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(2000, '试题', 4, 1, '/system/examQuestion', 'C', '0', 'system:examQuestion:view', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '试题菜单'),
	(2001, '试题查询', 2000, 1, '#', 'F', '0', 'system:examQuestion:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', ''),
	(2002, '试题新增', 2000, 2, '#', 'F', '0', 'system:examQuestion:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', ''),
	(2003, '试题修改', 2000, 3, '#', 'F', '0', 'system:examQuestion:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', ''),
	(2004, '试题删除', 2000, 4, '#', 'F', '0', 'system:examQuestion:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;

-- 导出  表 answer.sys_notice 结构
CREATE TABLE IF NOT EXISTS `sys_notice` (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) NOT NULL COMMENT '公告标题',
  `notice_type` char(1) NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` varchar(2000) DEFAULT NULL COMMENT '公告内容',
  `status` char(1) DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='通知公告表';

-- 正在导出表  answer.sys_notice 的数据：~2 rows (大约)
/*!40000 ALTER TABLE `sys_notice` DISABLE KEYS */;
INSERT INTO `sys_notice` (`notice_id`, `notice_title`, `notice_type`, `notice_content`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
	(1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', '新版本内容', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '管理员'),
	(2, '维护通知：2018-07-01 若依系统凌晨维护', '1', '维护内容', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '管理员');
/*!40000 ALTER TABLE `sys_notice` ENABLE KEYS */;

-- 导出  表 answer.sys_oper_log 结构
CREATE TABLE IF NOT EXISTS `sys_oper_log` (
  `oper_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) DEFAULT '' COMMENT '方法名称',
  `operator_type` int(1) DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(50) DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) DEFAULT '' COMMENT '请求参数',
  `status` int(1) DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`)
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8 COMMENT='操作日志记录';

-- 正在导出表  answer.sys_oper_log 的数据：~17 rows (大约)
/*!40000 ALTER TABLE `sys_oper_log` DISABLE KEYS */;
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `status`, `error_msg`, `oper_time`) VALUES
	(100, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.genCode()', 1, 'admin', '研发部门', '/tool/gen/genCode/exam_question', '127.0.0.1', '内网IP', '{ }', 0, NULL, '2019-03-16 12:25:36'),
	(101, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.addSave()', 1, 'admin', '研发部门', '/system/dict/add', '127.0.0.1', '内网IP', '{\r\n  "dictName" : [ "考试类型" ],\r\n  "dictType" : [ "exam_question_type" ],\r\n  "status" : [ "0" ],\r\n  "remark" : [ "考试类型" ]\r\n}', 0, NULL, '2019-03-16 13:43:42'),
	(102, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', 1, 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\r\n  "dictLabel" : [ "试题类型一" ],\r\n  "dictValue" : [ "1" ],\r\n  "dictType" : [ "exam_question_type" ],\r\n  "cssClass" : [ "" ],\r\n  "dictSort" : [ "1" ],\r\n  "listClass" : [ "" ],\r\n  "isDefault" : [ "Y" ],\r\n  "status" : [ "0" ],\r\n  "remark" : [ "" ]\r\n}', 0, NULL, '2019-03-16 13:45:27'),
	(103, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', 1, 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\r\n  "dictLabel" : [ "试题类型二" ],\r\n  "dictValue" : [ "2" ],\r\n  "dictType" : [ "exam_question_type" ],\r\n  "cssClass" : [ "" ],\r\n  "dictSort" : [ "2" ],\r\n  "listClass" : [ "" ],\r\n  "isDefault" : [ "Y" ],\r\n  "status" : [ "0" ],\r\n  "remark" : [ "" ]\r\n}', 0, NULL, '2019-03-16 13:45:43'),
	(104, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.addSave()', 1, 'admin', '研发部门', '/system/dict/add', '127.0.0.1', '内网IP', '{\r\n  "dictName" : [ "试题难度" ],\r\n  "dictType" : [ "exam_question_level" ],\r\n  "status" : [ "0" ],\r\n  "remark" : [ "" ]\r\n}', 0, NULL, '2019-03-16 13:46:39'),
	(105, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', 1, 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\r\n  "dictLabel" : [ "初级" ],\r\n  "dictValue" : [ "0" ],\r\n  "dictType" : [ "exam_question_level" ],\r\n  "cssClass" : [ "" ],\r\n  "dictSort" : [ "1" ],\r\n  "listClass" : [ "" ],\r\n  "isDefault" : [ "Y" ],\r\n  "status" : [ "0" ],\r\n  "remark" : [ "" ]\r\n}', 0, NULL, '2019-03-16 13:47:06'),
	(106, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', 1, 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\r\n  "dictLabel" : [ "中级" ],\r\n  "dictValue" : [ "1" ],\r\n  "dictType" : [ "exam_question_level" ],\r\n  "cssClass" : [ "" ],\r\n  "dictSort" : [ "2" ],\r\n  "listClass" : [ "" ],\r\n  "isDefault" : [ "Y" ],\r\n  "status" : [ "0" ],\r\n  "remark" : [ "" ]\r\n}', 0, NULL, '2019-03-16 13:47:18'),
	(107, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', 1, 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\r\n  "dictLabel" : [ "高级" ],\r\n  "dictValue" : [ "2" ],\r\n  "dictType" : [ "exam_question_level" ],\r\n  "cssClass" : [ "" ],\r\n  "dictSort" : [ "3" ],\r\n  "listClass" : [ "" ],\r\n  "isDefault" : [ "Y" ],\r\n  "status" : [ "0" ],\r\n  "remark" : [ "" ]\r\n}', 0, NULL, '2019-03-16 13:47:29'),
	(108, '试题', 1, 'com.ruoyi.web.controller.system.ExamQuestionController.addSave()', 1, 'admin', '研发部门', '/system/examQuestion/add', '127.0.0.1', '内网IP', '{\r\n  "type" : [ "1" ],\r\n  "level" : [ "0" ],\r\n  "question" : [ "这是试题内容" ],\r\n  "analyze" : [ "这是答案解析" ],\r\n  "timeLimit" : [ "10" ],\r\n  "answerContent" : [ "" ]\r\n}', 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'analyze,\n			level ) \n         values ( 1,\n			\'这是试题内容\',\n			10,\n			\n		\' at line 7\r\n### The error may involve com.ruoyi.system.mapper.ExamQuestionMapper.insertExamQuestion-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into exam_question    ( type,    question,    time_limit,            analyze,    level )           values ( ?,    ?,    ?,            ?,    ? )\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'analyze,\n			level ) \n         values ( 1,\n			\'这是试题内容\',\n			10,\n			\n		\' at line 7\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'analyze,\n			level ) \n         values ( 1,\n			\'这是试题内容\',\n			10,\n			\n		\' at line 7', '2019-03-16 14:08:10'),
	(109, '试题', 1, 'com.ruoyi.web.controller.system.ExamQuestionController.addSave()', 1, 'admin', '研发部门', '/system/examQuestion/add', '127.0.0.1', '内网IP', '{\r\n  "type" : [ "2" ],\r\n  "level" : [ "1" ],\r\n  "question" : [ "试题内容" ],\r\n  "analyze" : [ "题目解析" ],\r\n  "timeLimit" : [ "10" ],\r\n  "answerContent" : [ "" ]\r\n}', 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'analyze,\n			level,\n			create_time ) \n         values ( 2,\n			\'试题内容\',\n			\' at line 7\r\n### The error may involve com.ruoyi.system.mapper.ExamQuestionMapper.insertExamQuestion-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into exam_question    ( type,    question,    time_limit,    status,    answer_content,    analyze,    level,    create_time )           values ( ?,    ?,    ?,    ?,    ?,    ?,    ?,    now() )\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'analyze,\n			level,\n			create_time ) \n         values ( 2,\n			\'试题内容\',\n			\' at line 7\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'analyze,\n			level,\n			create_time ) \n         values ( 2,\n			\'试题内容\',\n			\' at line 7', '2019-03-16 14:17:44'),
	(110, '试题', 1, 'com.ruoyi.web.controller.system.ExamQuestionController.addSave()', 1, 'admin', '研发部门', '/system/examQuestion/add', '127.0.0.1', '内网IP', '{\r\n  "type" : [ "2" ],\r\n  "level" : [ "1" ],\r\n  "question" : [ "111" ],\r\n  "analyze" : [ "222" ],\r\n  "timeLimit" : [ "2" ],\r\n  "answerContent" : [ "" ]\r\n}', 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'analyze,\n			level,\n			create_time ) \n         values ( 2,\n			\'111\',\n			2,\n			nul\' at line 7\r\n### The error may involve com.ruoyi.system.mapper.ExamQuestionMapper.insertExamQuestion-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into exam_question    ( type,    question,    time_limit,    status,    answer_content,    analyze,    level,    create_time )           values ( ?,    ?,    ?,    ?,    ?,    ?,    ?,    now() )\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'analyze,\n			level,\n			create_time ) \n         values ( 2,\n			\'111\',\n			2,\n			nul\' at line 7\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'analyze,\n			level,\n			create_time ) \n         values ( 2,\n			\'111\',\n			2,\n			nul\' at line 7', '2019-03-16 14:19:27'),
	(111, '试题', 1, 'com.ruoyi.web.controller.system.ExamQuestionController.addSave()', 1, 'admin', '研发部门', '/system/examQuestion/add', '127.0.0.1', '内网IP', '{\r\n  "type" : [ "1" ],\r\n  "level" : [ "0" ],\r\n  "question" : [ "这回事" ],\r\n  "analyze" : [ "结婚汇" ],\r\n  "timeLimit" : [ "10" ],\r\n  "answerContent" : [ "" ],\r\n  "status" : [ "0" ]\r\n}', 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'analyze,\n			level,\n			create_time ) \n         values ( 1,\n			\'这回事\',\n			10,\' at line 7\r\n### The error may involve com.ruoyi.system.mapper.ExamQuestionMapper.insertExamQuestion-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into exam_question    ( type,    question,    time_limit,    status,    answer_content,    analyze,    level,    create_time )           values ( ?,    ?,    ?,    ?,    ?,    ?,    ?,    now() )\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'analyze,\n			level,\n			create_time ) \n         values ( 1,\n			\'这回事\',\n			10,\' at line 7\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'analyze,\n			level,\n			create_time ) \n         values ( 1,\n			\'这回事\',\n			10,\' at line 7', '2019-03-16 14:24:39'),
	(112, '试题', 1, 'com.ruoyi.web.controller.system.ExamQuestionController.addSave()', 1, 'admin', '研发部门', '/system/examQuestion/add', '127.0.0.1', '内网IP', '{\r\n  "type" : [ "1" ],\r\n  "level" : [ "0" ],\r\n  "question" : [ "这回事" ],\r\n  "analyze" : [ "结婚汇" ],\r\n  "timeLimit" : [ "10" ],\r\n  "answerContent" : [ "顶顶顶顶" ],\r\n  "status" : [ "0" ]\r\n}', 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'analyze,\n			level,\n			create_time ) \n         values ( 1,\n			\'这回事\',\n			10,\' at line 7\r\n### The error may involve com.ruoyi.system.mapper.ExamQuestionMapper.insertExamQuestion-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into exam_question    ( type,    question,    time_limit,    status,    answer_content,    analyze,    level,    create_time )           values ( ?,    ?,    ?,    ?,    ?,    ?,    ?,    now() )\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'analyze,\n			level,\n			create_time ) \n         values ( 1,\n			\'这回事\',\n			10,\' at line 7\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'analyze,\n			level,\n			create_time ) \n         values ( 1,\n			\'这回事\',\n			10,\' at line 7', '2019-03-16 14:27:42'),
	(113, '试题', 1, 'com.ruoyi.web.controller.system.ExamQuestionController.addSave()', 1, 'admin', '研发部门', '/system/examQuestion/add', '127.0.0.1', '内网IP', '{\r\n  "type" : [ "1" ],\r\n  "level" : [ "0" ],\r\n  "question" : [ "滴滴滴" ],\r\n  "analyze" : [ "给对方" ],\r\n  "timeLimit" : [ "10" ],\r\n  "answerContent" : [ "苟富贵" ],\r\n  "status" : [ "0" ]\r\n}', 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'analyze,\n			level,\n			create_time ) \n         values ( 1,\n			\'滴滴滴\',\n			10,\' at line 7\r\n### The error may involve com.ruoyi.system.mapper.ExamQuestionMapper.insertExamQuestion-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into exam_question    ( type,    question,    time_limit,    status,    answer_content,    analyze,    level,    create_time )           values ( ?,    ?,    ?,    ?,    ?,    ?,    ?,    now() )\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'analyze,\n			level,\n			create_time ) \n         values ( 1,\n			\'滴滴滴\',\n			10,\' at line 7\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'analyze,\n			level,\n			create_time ) \n         values ( 1,\n			\'滴滴滴\',\n			10,\' at line 7', '2019-03-16 14:28:00'),
	(114, '试题', 1, 'com.ruoyi.web.controller.system.ExamQuestionController.addSave()', 1, 'admin', '研发部门', '/system/examQuestion/add', '127.0.0.1', '内网IP', '{\r\n  "type" : [ "1" ],\r\n  "level" : [ "0" ],\r\n  "question" : [ "滴滴滴" ],\r\n  "analyze" : [ "给对方" ],\r\n  "timeLimit" : [ "10" ],\r\n  "answerContent" : [ "苟富贵" ],\r\n  "status" : [ "0" ]\r\n}', 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'analyze,\n			level,\n			create_time ) \n         values ( 1,\n			\'滴滴滴\',\n			10,\' at line 7\r\n### The error may involve com.ruoyi.system.mapper.ExamQuestionMapper.insertExamQuestion-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into exam_question    ( type,    question,    time_limit,    status,    answer_content,    analyze,    level,    create_time )           values ( ?,    ?,    ?,    ?,    ?,    ?,    ?,    now() )\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'analyze,\n			level,\n			create_time ) \n         values ( 1,\n			\'滴滴滴\',\n			10,\' at line 7\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'analyze,\n			level,\n			create_time ) \n         values ( 1,\n			\'滴滴滴\',\n			10,\' at line 7', '2019-03-16 14:28:10'),
	(115, '试题', 1, 'com.ruoyi.web.controller.system.ExamQuestionController.addSave()', 1, 'admin', '研发部门', '/system/examQuestion/add', '127.0.0.1', '内网IP', '{\r\n  "type" : [ "1" ],\r\n  "level" : [ "0" ],\r\n  "question" : [ "对滴" ],\r\n  "analyze" : [ "也都同意" ],\r\n  "timeLimit" : [ "10" ],\r\n  "answerContent" : [ "顶顶顶顶" ],\r\n  "status" : [ "0" ]\r\n}', 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'analyze,\n			level,\n			create_time\n       ) VALUES (\n			1,\n			\'对滴\',\n			10,\n		\' at line 7\r\n### The error may involve com.ruoyi.system.mapper.ExamQuestionMapper.insertExamQuestion-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into exam_question(    type,    question,    time_limit,    status,    answer_content,    analyze,    level,    create_time        ) VALUES (    ?,    ?,    ?,    ?,    ?,    ?,    ?,    now()          )\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'analyze,\n			level,\n			create_time\n       ) VALUES (\n			1,\n			\'对滴\',\n			10,\n		\' at line 7\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'analyze,\n			level,\n			create_time\n       ) VALUES (\n			1,\n			\'对滴\',\n			10,\n		\' at line 7', '2019-03-16 14:32:17'),
	(116, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.changeStatus()', 1, 'admin', '研发部门', '/system/user/changeStatus', '127.0.0.1', '内网IP', '{\r\n  "userId" : [ "2" ],\r\n  "status" : [ "1" ]\r\n}', 0, NULL, '2019-03-16 14:43:59'),
	(117, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.changeStatus()', 1, 'admin', '研发部门', '/system/user/changeStatus', '127.0.0.1', '内网IP', '{\r\n  "userId" : [ "2" ],\r\n  "status" : [ "0" ]\r\n}', 0, NULL, '2019-03-16 14:44:02');
/*!40000 ALTER TABLE `sys_oper_log` ENABLE KEYS */;

-- 导出  表 answer.sys_post 结构
CREATE TABLE IF NOT EXISTS `sys_post` (
  `post_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='岗位信息表';

-- 正在导出表  answer.sys_post 的数据：~4 rows (大约)
/*!40000 ALTER TABLE `sys_post` DISABLE KEYS */;
INSERT INTO `sys_post` (`post_id`, `post_code`, `post_name`, `post_sort`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
	(1, 'ceo', '董事长', 1, '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(2, 'se', '项目经理', 2, '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(3, 'hr', '人力资源', 3, '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(4, 'user', '普通员工', 4, '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
/*!40000 ALTER TABLE `sys_post` ENABLE KEYS */;

-- 导出  表 answer.sys_role 结构
CREATE TABLE IF NOT EXISTS `sys_role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限）',
  `status` char(1) NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8 COMMENT='角色信息表';

-- 正在导出表  answer.sys_role 的数据：~2 rows (大约)
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` (`role_id`, `role_name`, `role_key`, `role_sort`, `data_scope`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
	(1, '管理员', 'admin', 1, '1', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '管理员'),
	(2, '普通角色', 'common', 2, '2', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '普通角色');
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;

-- 导出  表 answer.sys_role_dept 结构
CREATE TABLE IF NOT EXISTS `sys_role_dept` (
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  `dept_id` int(11) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色和部门关联表';

-- 正在导出表  answer.sys_role_dept 的数据：~3 rows (大约)
/*!40000 ALTER TABLE `sys_role_dept` DISABLE KEYS */;
INSERT INTO `sys_role_dept` (`role_id`, `dept_id`) VALUES
	(2, 100),
	(2, 101),
	(2, 105);
/*!40000 ALTER TABLE `sys_role_dept` ENABLE KEYS */;

-- 导出  表 answer.sys_role_menu 结构
CREATE TABLE IF NOT EXISTS `sys_role_menu` (
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  `menu_id` int(11) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色和菜单关联表';

-- 正在导出表  answer.sys_role_menu 的数据：~79 rows (大约)
/*!40000 ALTER TABLE `sys_role_menu` DISABLE KEYS */;
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES
	(2, 1),
	(2, 2),
	(2, 3),
	(2, 100),
	(2, 101),
	(2, 102),
	(2, 103),
	(2, 104),
	(2, 105),
	(2, 106),
	(2, 107),
	(2, 108),
	(2, 109),
	(2, 110),
	(2, 111),
	(2, 112),
	(2, 113),
	(2, 114),
	(2, 115),
	(2, 500),
	(2, 501),
	(2, 1000),
	(2, 1001),
	(2, 1002),
	(2, 1003),
	(2, 1004),
	(2, 1005),
	(2, 1006),
	(2, 1007),
	(2, 1008),
	(2, 1009),
	(2, 1010),
	(2, 1011),
	(2, 1012),
	(2, 1013),
	(2, 1014),
	(2, 1015),
	(2, 1016),
	(2, 1017),
	(2, 1018),
	(2, 1019),
	(2, 1020),
	(2, 1021),
	(2, 1022),
	(2, 1023),
	(2, 1024),
	(2, 1025),
	(2, 1026),
	(2, 1027),
	(2, 1028),
	(2, 1029),
	(2, 1030),
	(2, 1031),
	(2, 1032),
	(2, 1033),
	(2, 1034),
	(2, 1035),
	(2, 1036),
	(2, 1037),
	(2, 1038),
	(2, 1039),
	(2, 1040),
	(2, 1041),
	(2, 1042),
	(2, 1043),
	(2, 1044),
	(2, 1045),
	(2, 1046),
	(2, 1047),
	(2, 1048),
	(2, 1049),
	(2, 1050),
	(2, 1051),
	(2, 1052),
	(2, 1053),
	(2, 1054),
	(2, 1055),
	(2, 1056),
	(2, 1057);
/*!40000 ALTER TABLE `sys_role_menu` ENABLE KEYS */;

-- 导出  表 answer.sys_user 结构
CREATE TABLE IF NOT EXISTS `sys_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` int(11) DEFAULT NULL COMMENT '部门ID',
  `login_name` varchar(30) NOT NULL COMMENT '登录账号',
  `user_name` varchar(30) NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) DEFAULT '' COMMENT '手机号码',
  `sex` char(1) DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) DEFAULT '' COMMENT '头像路径',
  `password` varchar(50) DEFAULT '' COMMENT '密码',
  `salt` varchar(20) DEFAULT '' COMMENT '盐加密',
  `status` char(1) DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(50) DEFAULT '' COMMENT '最后登陆IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登陆时间',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- 正在导出表  answer.sys_user 的数据：~2 rows (大约)
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` (`user_id`, `dept_id`, `login_name`, `user_name`, `user_type`, `email`, `phonenumber`, `sex`, `avatar`, `password`, `salt`, `status`, `del_flag`, `login_ip`, `login_date`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
	(1, 103, 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '', '29c67a30398638269fe600f73a054934', '111111', '0', '0', '127.0.0.1', '2019-03-16 16:56:28', 'admin', '2018-03-16 11:33:00', 'ry', '2019-03-16 16:56:27', '管理员'),
	(2, 105, 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '8e6d98b90472783cc73c17047ddccf36', '222222', '0', '0', '127.0.0.1', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', 'ry', '2019-03-16 14:44:02', '测试员');
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;

-- 导出  表 answer.sys_user_online 结构
CREATE TABLE IF NOT EXISTS `sys_user_online` (
  `sessionId` varchar(50) NOT NULL DEFAULT '' COMMENT '用户会话id',
  `login_name` varchar(50) DEFAULT '' COMMENT '登录账号',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `ipaddr` varchar(50) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` varchar(10) DEFAULT '' COMMENT '在线状态on_line在线off_line离线',
  `start_timestamp` datetime DEFAULT NULL COMMENT 'session创建时间',
  `last_access_time` datetime DEFAULT NULL COMMENT 'session最后访问时间',
  `expire_time` int(5) DEFAULT '0' COMMENT '超时时间，单位为分钟',
  PRIMARY KEY (`sessionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='在线用户记录';

-- 正在导出表  answer.sys_user_online 的数据：~1 rows (大约)
/*!40000 ALTER TABLE `sys_user_online` DISABLE KEYS */;
INSERT INTO `sys_user_online` (`sessionId`, `login_name`, `dept_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `start_timestamp`, `last_access_time`, `expire_time`) VALUES
	('649916fd-55f8-476c-8496-6f0e0a4c6ca8', 'admin', '研发部门', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', 'on_line', '2019-03-16 16:56:25', '2019-03-16 16:56:28', 1800000);
/*!40000 ALTER TABLE `sys_user_online` ENABLE KEYS */;

-- 导出  表 answer.sys_user_post 结构
CREATE TABLE IF NOT EXISTS `sys_user_post` (
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `post_id` int(11) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户与岗位关联表';

-- 正在导出表  answer.sys_user_post 的数据：~2 rows (大约)
/*!40000 ALTER TABLE `sys_user_post` DISABLE KEYS */;
INSERT INTO `sys_user_post` (`user_id`, `post_id`) VALUES
	(1, 1),
	(2, 2);
/*!40000 ALTER TABLE `sys_user_post` ENABLE KEYS */;

-- 导出  表 answer.sys_user_role 结构
CREATE TABLE IF NOT EXISTS `sys_user_role` (
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户和角色关联表';

-- 正在导出表  answer.sys_user_role 的数据：~2 rows (大约)
/*!40000 ALTER TABLE `sys_user_role` DISABLE KEYS */;
INSERT INTO `sys_user_role` (`user_id`, `role_id`) VALUES
	(1, 1),
	(2, 2);
/*!40000 ALTER TABLE `sys_user_role` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
