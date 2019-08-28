/*
SQLyog Ultimate v12.08 (64 bit)
MySQL - 5.7.27 : Database - zrtec-gw
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`zrtec-gw` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `zrtec-gw`;

/*Table structure for table `my_demo` */

DROP TABLE IF EXISTS `my_demo`;

CREATE TABLE `my_demo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(20) NOT NULL COMMENT '姓名',
  `age` int(11) DEFAULT NULL COMMENT '年龄',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='demo表';

/*Data for the table `my_demo` */

insert  into `my_demo`(`id`,`name`,`age`,`remark`) values (8,'马六',12,'..'),(9,'马六',12,'..');

/*Table structure for table `pf_notice` */

DROP TABLE IF EXISTS `pf_notice`;

CREATE TABLE `pf_notice` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `title` varchar(50) NOT NULL COMMENT '标题',
  `type` int(11) DEFAULT NULL COMMENT '类型',
  `content` varchar(500) NOT NULL COMMENT '内容',
  `publish_time` datetime NOT NULL COMMENT '发布时间',
  `creater` bigint(20) NOT NULL COMMENT '创建人ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='通知表';

/*Data for the table `pf_notice` */

/*Table structure for table `qrtz_blob_triggers` */

DROP TABLE IF EXISTS `qrtz_blob_triggers`;

CREATE TABLE `qrtz_blob_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_blob_triggers` */

/*Table structure for table `qrtz_calendars` */

DROP TABLE IF EXISTS `qrtz_calendars`;

CREATE TABLE `qrtz_calendars` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(200) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_calendars` */

/*Table structure for table `qrtz_cron_triggers` */

DROP TABLE IF EXISTS `qrtz_cron_triggers`;

CREATE TABLE `qrtz_cron_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `CRON_EXPRESSION` varchar(120) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_cron_triggers` */

/*Table structure for table `qrtz_fired_triggers` */

DROP TABLE IF EXISTS `qrtz_fired_triggers`;

CREATE TABLE `qrtz_fired_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(200) DEFAULT NULL,
  `JOB_GROUP` varchar(200) DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`),
  KEY `IDX_QRTZ_FT_TRIG_INST_NAME` (`SCHED_NAME`,`INSTANCE_NAME`),
  KEY `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY` (`SCHED_NAME`,`INSTANCE_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_FT_J_G` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_T_G` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_FT_TG` (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_fired_triggers` */

/*Table structure for table `qrtz_job_details` */

DROP TABLE IF EXISTS `qrtz_job_details`;

CREATE TABLE `qrtz_job_details` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` varchar(1) NOT NULL,
  `IS_NONCONCURRENT` varchar(1) NOT NULL,
  `IS_UPDATE_DATA` varchar(1) NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_J_REQ_RECOVERY` (`SCHED_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_J_GRP` (`SCHED_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_job_details` */

/*Table structure for table `qrtz_locks` */

DROP TABLE IF EXISTS `qrtz_locks`;

CREATE TABLE `qrtz_locks` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_locks` */

insert  into `qrtz_locks`(`SCHED_NAME`,`LOCK_NAME`) values ('SyScheduler','STATE_ACCESS'),('SyScheduler','TRIGGER_ACCESS');

/*Table structure for table `qrtz_paused_trigger_grps` */

DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;

CREATE TABLE `qrtz_paused_trigger_grps` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_paused_trigger_grps` */

/*Table structure for table `qrtz_scheduler_state` */

DROP TABLE IF EXISTS `qrtz_scheduler_state`;

CREATE TABLE `qrtz_scheduler_state` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_scheduler_state` */

insert  into `qrtz_scheduler_state`(`SCHED_NAME`,`INSTANCE_NAME`,`LAST_CHECKIN_TIME`,`CHECKIN_INTERVAL`) values ('SyScheduler','DESKTOP-6D4PA2M1566963793186',1566964443216,15000);

/*Table structure for table `qrtz_simple_triggers` */

DROP TABLE IF EXISTS `qrtz_simple_triggers`;

CREATE TABLE `qrtz_simple_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_simple_triggers` */

/*Table structure for table `qrtz_simprop_triggers` */

DROP TABLE IF EXISTS `qrtz_simprop_triggers`;

CREATE TABLE `qrtz_simprop_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `STR_PROP_1` varchar(512) DEFAULT NULL,
  `STR_PROP_2` varchar(512) DEFAULT NULL,
  `STR_PROP_3` varchar(512) DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_simprop_triggers` */

/*Table structure for table `qrtz_triggers` */

DROP TABLE IF EXISTS `qrtz_triggers`;

CREATE TABLE `qrtz_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_J` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_C` (`SCHED_NAME`,`CALENDAR_NAME`),
  KEY `IDX_QRTZ_T_G` (`SCHED_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_STATE` (`SCHED_NAME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_STATE` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_G_STATE` (`SCHED_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NEXT_FIRE_TIME` (`SCHED_NAME`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST` (`SCHED_NAME`,`TRIGGER_STATE`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_triggers` */

/*Table structure for table `schedule_job` */

DROP TABLE IF EXISTS `schedule_job`;

CREATE TABLE `schedule_job` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `bean_name` varchar(200) NOT NULL COMMENT 'spring bean名称',
  `method_name` varchar(200) NOT NULL COMMENT '方法名',
  `params` varchar(500) DEFAULT NULL COMMENT '参数',
  `cron_expression` varchar(50) NOT NULL COMMENT 'cron表达式',
  `status` tinyint(4) NOT NULL COMMENT '任务状态  0：正常  1：暂停',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `schedule_job` */

/*Table structure for table `schedule_job_log` */

DROP TABLE IF EXISTS `schedule_job_log`;

CREATE TABLE `schedule_job_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `job_id` bigint(20) NOT NULL,
  `bean_name` varchar(200) NOT NULL COMMENT 'spring bean名称',
  `method_name` varchar(200) NOT NULL COMMENT '方法名',
  `params` varchar(500) DEFAULT NULL COMMENT '参数',
  `status` tinyint(4) NOT NULL COMMENT '任务状态    0：成功    1：失败',
  `error` varchar(500) DEFAULT NULL COMMENT '错误信息',
  `times` int(11) DEFAULT NULL COMMENT '耗时(单位：毫秒)',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `schedule_job_log` */

/*Table structure for table `sys_config` */

DROP TABLE IF EXISTS `sys_config`;

CREATE TABLE `sys_config` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `code` varchar(50) NOT NULL COMMENT '配置编码',
  `value` varchar(500) NOT NULL COMMENT '值',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_config` */

/*Table structure for table `sys_dept` */

DROP TABLE IF EXISTS `sys_dept`;

CREATE TABLE `sys_dept` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `parent_id` bigint(20) NOT NULL COMMENT '上级部门ID，一级部门为0',
  `name` varchar(30) NOT NULL COMMENT '部门名称',
  `order_num` int(11) NOT NULL DEFAULT '1' COMMENT '排序',
  `del_flag` int(11) DEFAULT NULL COMMENT '逻辑删除-1已删除，0正常',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='部门表';

/*Data for the table `sys_dept` */

/*Table structure for table `sys_dictionary` */

DROP TABLE IF EXISTS `sys_dictionary`;

CREATE TABLE `sys_dictionary` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `pid` bigint(20) DEFAULT NULL COMMENT '父ID',
  `dict_type` varchar(50) NOT NULL COMMENT '父名称',
  `dict_name` varchar(50) NOT NULL COMMENT '中文名称',
  `dict_value` varchar(500) NOT NULL COMMENT '字典编码',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `sort_no` tinyint(4) NOT NULL DEFAULT '0' COMMENT '排序编号',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_dictionary` */

/*Table structure for table `sys_file` */

DROP TABLE IF EXISTS `sys_file`;

CREATE TABLE `sys_file` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `type` varchar(50) NOT NULL COMMENT '文件类型',
  `file_name` varchar(200) NOT NULL COMMENT '文件名称',
  `base64_file` blob COMMENT '文件Base64字符串',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `sys_file` */

insert  into `sys_file`(`id`,`type`,`file_name`,`base64_file`,`create_time`) values (1,'userLogo','QQ截图20190828105218.png','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','2019-08-28 10:53:41');

/*Table structure for table `sys_log` */

DROP TABLE IF EXISTS `sys_log`;

CREATE TABLE `sys_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志ID',
  `username` varchar(30) DEFAULT NULL COMMENT '账户',
  `operation` varchar(100) NOT NULL COMMENT '操作人',
  `method` varchar(100) NOT NULL COMMENT '方法',
  `params` varchar(1000) DEFAULT NULL COMMENT '参数',
  `time` bigint(20) DEFAULT NULL COMMENT '执行时长',
  `ip` varchar(20) DEFAULT NULL COMMENT 'ip地址',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='日志表';

/*Data for the table `sys_log` */

insert  into `sys_log`(`id`,`username`,`operation`,`method`,`params`,`time`,`ip`,`create_date`) values (1,NULL,'Demo方法test执行','com.zrtec.api.module.demo.controller.DemoController.test()',NULL,7064,'0:0:0:0:0:0:0:1','2019-08-27 20:20:00'),(2,NULL,'Demo方法test执行','com.zrtec.api.module.demo.controller.DemoController.test()',NULL,19,'0:0:0:0:0:0:0:1','2019-08-27 21:15:24');

/*Table structure for table `sys_menu` */

DROP TABLE IF EXISTS `sys_menu`;

CREATE TABLE `sys_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(10) NOT NULL,
  `url` varchar(200) DEFAULT NULL,
  `perms` varchar(200) DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `type` int(1) NOT NULL DEFAULT '0' COMMENT '类型',
  `icon` varchar(200) NOT NULL DEFAULT '' COMMENT '菜单图标',
  `component` varchar(50) DEFAULT NULL COMMENT '组件-对应router-view的name和router的conponent',
  `order_num` int(11) NOT NULL DEFAULT '1' COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='菜单表';

/*Data for the table `sys_menu` */

insert  into `sys_menu`(`id`,`parent_id`,`name`,`url`,`perms`,`type`,`icon`,`component`,`order_num`) values (1,NULL,'系统管理','string','string',0,'el-icon-setting',NULL,1),(3,1,'用户管理','/user',NULL,0,'myfontfamily myicon-user','user',1),(4,1,'菜单管理','/menu',NULL,0,'myfontfamily myicon-main','navmenu',1),(20,1,'角色管理','/role',NULL,0,'myfontfamily myicon-role-setting','role',1),(21,1,'配置管理','/config',NULL,0,'myfontfamily myicon-params','config',1),(22,1,'字典管理','/dictionary',NULL,0,'myfontfamily myicon-dictionary','dictionary',1),(23,1,'定时任务','/schedule',NULL,0,'myfontfamily myicon-task','schedule',1),(24,1,'接口管理','/api',NULL,0,'myfontfamily myicon-jiekou','apiManage',1),(25,1,'SQL监控','/sql',NULL,0,'myfontfamily myicon-sql-manage','sqlManage',1),(26,1,'echarts','/echarts',NULL,0,'myfontfamily myicon-baobiao','echarts',1),(27,NULL,'主页','/main',NULL,0,'myfontfamily myicon-main','main',0);

/*Table structure for table `sys_role` */

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(20) NOT NULL COMMENT '角色名称',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='角色表';

/*Data for the table `sys_role` */

insert  into `sys_role`(`id`,`role_name`,`dept_id`,`remark`,`create_time`) values (11,'管理员',NULL,'管理员','2018-12-06 14:49:34'),(12,'sdfsa',NULL,'11','2018-12-06 17:11:14');

/*Table structure for table `sys_role_dept` */

DROP TABLE IF EXISTS `sys_role_dept`;

CREATE TABLE `sys_role_dept` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='角色部门关联表';

/*Data for the table `sys_role_dept` */

/*Table structure for table `sys_role_menu` */

DROP TABLE IF EXISTS `sys_role_menu`;

CREATE TABLE `sys_role_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `UK_SYS_ROLE_MENU_ROLE_ID_MENU_ID` (`role_id`,`menu_id`) COMMENT '联合唯一索引',
  KEY `FK_SYS_ROLE_MENU_MENU_ID` (`menu_id`),
  CONSTRAINT `FK_SYS_ROLE_MENU_MENU_ID` FOREIGN KEY (`menu_id`) REFERENCES `sys_menu` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `FK_SYS_ROLE_MENU_ROLE_ID` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='角色菜单关联表';

/*Data for the table `sys_role_menu` */

insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (11,11,1),(10,11,3),(12,11,4),(7,12,4);

/*Table structure for table `sys_user` */

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `name` varchar(30) DEFAULT NULL COMMENT '姓名',
  `username` varchar(30) NOT NULL COMMENT '账户',
  `password` varchar(64) NOT NULL COMMENT '密码',
  `salt` varchar(4) NOT NULL COMMENT '盐',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(20) DEFAULT NULL COMMENT '移动电话',
  `avatar` varchar(200) DEFAULT NULL COMMENT '头像图片',
  `status` int(2) DEFAULT NULL COMMENT '状态  0：禁用   1：正常',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门id',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `U_SYS_USER_USERNAME` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `sys_user` */

insert  into `sys_user`(`id`,`name`,`username`,`password`,`salt`,`email`,`mobile`,`avatar`,`status`,`dept_id`,`create_time`) values (1,'超级管理员','admin','5dd99385d984d1cc15fa4aea02bbddabafe4b7ea7ff8f30028dc2abb147f3fc5','FPTS','wenlongfei_person@163.com','18877779999','https://raw.githubusercontent.com/taylorchen709/markdown-images/master/vueadmin/user.png',1,NULL,'2018-10-15 14:22:43'),(6,'张三','zhangsan','f6062e283d73f2729121229cfc0c0fedca0bbe0c4558dc9859a59595ebaf479a','7rAF','a@b.c','17589652354',NULL,1,NULL,'2018-11-02 20:46:35'),(11,'温龙飞','wenlf','2104d23aa72e48249da6c065af89d63c19f0aa555af4e007fa952d21ea583403','ljD0',NULL,'17600287268',NULL,1,NULL,'2018-12-04 17:14:26'),(12,'sdfasdf','123','e256fc9cd178384c7c64b20fd34ca51b2df33bc8d7b8e4c03cdd84a9cd2d4a25','hvmd','123@123.com','18525896633',NULL,1,NULL,'2019-08-28 10:50:03');

/*Table structure for table `sys_user_role` */

DROP TABLE IF EXISTS `sys_user_role`;

CREATE TABLE `sys_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_SYS_USER_ROLE_USER_ID` (`user_id`),
  KEY `FK_SYS_USER_ROLE_ROLE_ID` (`role_id`),
  CONSTRAINT `FK_SYS_USER_ROLE_ROLE_ID` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_SYS_USER_ROLE_USER_ID` FOREIGN KEY (`user_id`) REFERENCES `sys_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户角色关联表';

/*Data for the table `sys_user_role` */

insert  into `sys_user_role`(`id`,`user_id`,`role_id`) values (1,12,11);

/*Table structure for table `sys_user_token` */

DROP TABLE IF EXISTS `sys_user_token`;

CREATE TABLE `sys_user_token` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `token` varchar(64) NOT NULL COMMENT 'token',
  `expire_time` datetime NOT NULL COMMENT '过期时间',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `U_SYS_USER_TOKEN_USER_ID` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `sys_user_token` */

insert  into `sys_user_token`(`id`,`user_id`,`token`,`expire_time`,`update_time`) values (1,3,'bc9c98e6ac11f093cafb96c79e34f4ba','2018-10-16 17:13:27','2018-10-15 17:13:44'),(2,1,'2b2d1e719c6ab63bb1e35230c61d32b5','2019-08-29 11:43:35','2019-08-28 11:43:35'),(3,6,'c07b0fc3a62e504339c8cb3206aa023e','2018-11-12 12:35:13','2018-11-11 12:35:13');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
