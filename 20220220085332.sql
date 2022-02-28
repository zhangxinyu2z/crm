/*
MySQL Backup
Database: crm
Backup Time: 2022-02-23 19:24:13
*/

SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `crm`.`attendance`;
DROP TABLE IF EXISTS `crm`.`calendar`;
DROP TABLE IF EXISTS `crm`.`checkin`;
DROP TABLE IF EXISTS `crm`.`clew`;
DROP TABLE IF EXISTS `crm`.`contract`;
DROP TABLE IF EXISTS `crm`.`customer`;
DROP TABLE IF EXISTS `crm`.`customerdevplan`;
DROP TABLE IF EXISTS `crm`.`customertransfer`;
DROP TABLE IF EXISTS `crm`.`department`;
DROP TABLE IF EXISTS `crm`.`employee`;
DROP TABLE IF EXISTS `crm`.`employee_role`;
DROP TABLE IF EXISTS `crm`.`guarantee`;
DROP TABLE IF EXISTS `crm`.`guaranteeitem`;
DROP TABLE IF EXISTS `crm`.`know`;
DROP TABLE IF EXISTS `crm`.`knowledgemenu`;
DROP TABLE IF EXISTS `crm`.`log`;
DROP TABLE IF EXISTS `crm`.`menu`;
DROP TABLE IF EXISTS `crm`.`networkdisk`;
DROP TABLE IF EXISTS `crm`.`orderbill`;
DROP TABLE IF EXISTS `crm`.`permission`;
DROP TABLE IF EXISTS `crm`.`role`;
DROP TABLE IF EXISTS `crm`.`role_permission`;
DROP TABLE IF EXISTS `crm`.`salary`;
DROP TABLE IF EXISTS `crm`.`systemdictionary`;
DROP TABLE IF EXISTS `crm`.`systemdictionaryitem`;
DROP TABLE IF EXISTS `crm`.`task`;
DROP TABLE IF EXISTS `crm`.`vacate`;
CREATE TABLE `attendance` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `employee_id` bigint(20) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `signinday` varchar(20) DEFAULT NULL,
  `lateday` varchar(20) DEFAULT NULL,
  `earlyday` varchar(20) DEFAULT NULL,
  `vacateday` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
CREATE TABLE `calendar` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  `start` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `allDay` tinyint(2) DEFAULT NULL,
  `color` varchar(20) DEFAULT NULL,
  `className` varchar(50) DEFAULT NULL,
  `textColor` varchar(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
CREATE TABLE `checkin` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userIP` varchar(50) DEFAULT NULL,
  `state` tinyint(2) DEFAULT NULL,
  `signInTime` datetime DEFAULT NULL,
  `signOutTime` datetime DEFAULT NULL,
  `checkTime` datetime DEFAULT NULL,
  `employee_id` bigint(20) DEFAULT NULL,
  `checkman_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
CREATE TABLE `clew` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `inputTime` datetime DEFAULT NULL,
  `state` varchar(20) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `contract` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sn` varchar(50) DEFAULT NULL,
  `signTime` datetime DEFAULT NULL,
  `contractSum` varchar(50) DEFAULT NULL,
  `money` varchar(50) DEFAULT NULL,
  `payTime` datetime DEFAULT NULL,
  `intro` varchar(255) DEFAULT NULL,
  `status` tinyint(2) DEFAULT NULL,
  `file` varchar(100) DEFAULT NULL,
  `modifyTime` datetime DEFAULT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `seller_id` bigint(20) DEFAULT NULL,
  `modifyUser_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
CREATE TABLE `customer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(50) DEFAULT NULL,
  `age` int(10) DEFAULT NULL,
  `gender` tinyint(1) DEFAULT NULL,
  `tel` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `qq` varchar(20) DEFAULT NULL,
  `wechat` varchar(20) DEFAULT NULL,
  `job` varchar(100) DEFAULT NULL COMMENT '职业',
  `salaryLevel` varchar(255) DEFAULT NULL COMMENT '收入水平',
  `customerSource` varchar(500) DEFAULT NULL COMMENT '客户来源，数据字典',
  `inChargeUser_id` bigint(10) DEFAULT NULL COMMENT '负责人',
  `inputUser_id` bigint(10) DEFAULT NULL COMMENT '创建人',
  `inputTime` datetime DEFAULT NULL,
  `status` tinyint(2) DEFAULT NULL COMMENT '-2:流失，-1:开发失败，0:潜在客户，1:正式客户，2:资源池客户',
  `becomeTime` datetime DEFAULT NULL COMMENT '转正时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
CREATE TABLE `customerdevplan` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `planTime` datetime DEFAULT NULL COMMENT '计划时间',
  `planSubject` varchar(50) DEFAULT NULL COMMENT '计划主题',
  `planType` varchar(50) DEFAULT NULL COMMENT '计划实施方式:比如电话,邀约上门',
  `planDetails` varchar(255) DEFAULT NULL COMMENT '计划内容',
  `traceResult` int(4) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `inputTime` datetime DEFAULT NULL,
  `type` int(4) DEFAULT NULL,
  `inputUser_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
CREATE TABLE `customertransfer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `customer_id` bigint(20) DEFAULT NULL COMMENT '移交客户id',
  `transUser_id` bigint(20) DEFAULT NULL COMMENT '移交用户id',
  `transTime` datetime DEFAULT NULL COMMENT '移交时间',
  `oldSeller_id` bigint(20) DEFAULT NULL COMMENT '原负责市场专员',
  `newSeller_id` bigint(20) DEFAULT NULL COMMENT '新负责市场专员',
  `transReason` varchar(255) DEFAULT NULL COMMENT '移交原因',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
CREATE TABLE `department` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sn` varchar(50) DEFAULT NULL COMMENT '部门编号',
  `name` varchar(50) DEFAULT NULL COMMENT '部门名称',
  `manager_id` bigint(20) DEFAULT NULL COMMENT '部门经理',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '上级部门',
  `state` tinyint(1) DEFAULT NULL COMMENT '部门状态0正常 -1停用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
CREATE TABLE `employee` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL COMMENT '员工账号',
  `realname` varchar(50) DEFAULT NULL COMMENT '真实姓名',
  `password` varchar(100) DEFAULT NULL,
  `tel` varchar(13) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门',
  `inputtime` date DEFAULT NULL COMMENT '入职时间',
  `state` tinyint(1) DEFAULT NULL COMMENT '1正常，0离职',
  `admin` tinyint(1) DEFAULT NULL COMMENT '1超级管理员 0普通',
  PRIMARY KEY (`id`),
  KEY `FK_dept` (`dept_id`),
  CONSTRAINT `FK_dept` FOREIGN KEY (`dept_id`) REFERENCES `department` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
CREATE TABLE `employee_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `e_id` bigint(20) DEFAULT NULL,
  `r_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_EMPLOYY_M` (`e_id`),
  KEY ` FK_ROLE_M` (`r_id`),
  CONSTRAINT ` FK_ROLE_M` FOREIGN KEY (`r_id`) REFERENCES `role` (`id`),
  CONSTRAINT `FK_EMPLOYY_M` FOREIGN KEY (`e_id`) REFERENCES `employee` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
CREATE TABLE `guarantee` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sn` varchar(50) DEFAULT NULL,
  `productName` varchar(50) DEFAULT NULL,
  `dueTime` datetime DEFAULT NULL,
  `remark` varchar(100) DEFAULT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
CREATE TABLE `guaranteeitem` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `guaranteeTime` datetime DEFAULT NULL,
  `content` varchar(100) DEFAULT NULL,
  `status` tinyint(2) DEFAULT NULL,
  `cost` int(10) DEFAULT NULL COMMENT '保修费用',
  `guarantee_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
CREATE TABLE `know` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `context` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `knowledgemenu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `text` varchar(255) DEFAULT NULL,
  `state` tinyint(2) DEFAULT NULL,
  `checked` tinyint(2) DEFAULT NULL,
  `attributes` varchar(255) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `opuser_id` bigint(20) DEFAULT NULL,
  `optime` datetime DEFAULT NULL,
  `opip` varchar(255) DEFAULT NULL,
  `function` varchar(255) DEFAULT NULL,
  `params` varchar(10000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3681 DEFAULT CHARSET=utf8;
CREATE TABLE `menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `text` varchar(100) DEFAULT NULL COMMENT '菜单名称',
  `iconCls` varchar(100) DEFAULT NULL COMMENT '菜单图标',
  `checked` tinyint(1) DEFAULT NULL,
  `state` varchar(10) DEFAULT NULL COMMENT '是否展开菜单',
  `attributes` varchar(500) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL COMMENT '当前菜单的父节点',
  `function` varchar(100) DEFAULT NULL COMMENT '用来判断是否有该菜单的访问权限',
  PRIMARY KEY (`id`),
  KEY `FK_PARENT` (`parent_id`),
  CONSTRAINT `FK_PARENT` FOREIGN KEY (`parent_id`) REFERENCES `menu` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
CREATE TABLE `networkdisk` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `path` varchar(50) DEFAULT NULL,
  `dir` tinyint(2) DEFAULT NULL,
  `uploadTime` datetime DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `pub` tinyint(2) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
CREATE TABLE `orderbill` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `signTime` datetime DEFAULT NULL,
  `totalSum` varchar(50) DEFAULT NULL,
  `bargainMoney` varchar(50) DEFAULT NULL,
  `intro` varchar(100) DEFAULT NULL,
  `file` varchar(100) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `modifyTime` datetime DEFAULT NULL,
  `status` tinyint(2) DEFAULT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `seller_id` bigint(20) DEFAULT NULL,
  `modifyUser_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
CREATE TABLE `permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `resource` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8;
CREATE TABLE `role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `sn` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
CREATE TABLE `role_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `r_id` bigint(20) DEFAULT NULL,
  `p_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_PERMISSION` (`p_id`),
  KEY `FK_ROLE` (`r_id`),
  CONSTRAINT `FK_PERMISSION` FOREIGN KEY (`p_id`) REFERENCES `permission` (`id`),
  CONSTRAINT `FK_ROLE` FOREIGN KEY (`r_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8;
CREATE TABLE `salary` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `salary` decimal(10,2) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `employee_id` tinyint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `systemdictionary` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sn` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `intro` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
CREATE TABLE `systemdictionaryitem` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `intro` varchar(500) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `state` tinyint(1) DEFAULT NULL COMMENT '字典明细是否禁用',
  PRIMARY KEY (`id`),
  KEY `FK_SD` (`parent_id`),
  CONSTRAINT `FK_SD` FOREIGN KEY (`parent_id`) REFERENCES `systemdictionary` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
CREATE TABLE `task` (
  `id` tinyint(20) NOT NULL AUTO_INCREMENT,
  `start` datetime DEFAULT NULL,
  `endTime` datetime DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `remark` varchar(50) DEFAULT NULL,
  `mintaskdescribe` varchar(100) DEFAULT NULL,
  `minhandledescribe` varchar(100) DEFAULT NULL,
  `status` tinyint(2) DEFAULT NULL,
  `handleUser` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
CREATE TABLE `vacate` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `begintime` datetime DEFAULT NULL,
  `endtime` datetime DEFAULT NULL,
  `audittime` datetime DEFAULT NULL,
  `employee_id` bigint(20) DEFAULT NULL,
  `audit_id` bigint(20) DEFAULT NULL,
  `state` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
BEGIN;
LOCK TABLES `crm`.`attendance` WRITE;
DELETE FROM `crm`.`attendance`;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `crm`.`calendar` WRITE;
DELETE FROM `crm`.`calendar`;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `crm`.`checkin` WRITE;
DELETE FROM `crm`.`checkin`;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `crm`.`clew` WRITE;
DELETE FROM `crm`.`clew`;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `crm`.`contract` WRITE;
DELETE FROM `crm`.`contract`;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `crm`.`customer` WRITE;
DELETE FROM `crm`.`customer`;
INSERT INTO `crm`.`customer` (`id`,`name`,`age`,`gender`,`tel`,`email`,`qq`,`wechat`,`job`,`salaryLevel`,`customerSource`,`inChargeUser_id`,`inputUser_id`,`inputTime`,`status`,`becomeTime`) VALUES (15, 'test001', 21, 1, '111', '1341@qq.com', '111', '141234', '司机', '4000-8000', '报纸', 26, 26, '2022-02-23 18:24:33', 1, NULL),(16, 'lisi', 42, 1, '412412', '4121@qq.com', '412', '414', '司机', '4000-8000', '报纸', 27, 27, '2022-02-23 18:43:11', 0, NULL),(17, '松江2', 1241, 1, '41412', '2142@qq.com', '4124', '1412', '教师', '4000-8000', '广播', 26, 26, '2022-02-23 18:48:41', 0, NULL);
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `crm`.`customerdevplan` WRITE;
DELETE FROM `crm`.`customerdevplan`;
INSERT INTO `crm`.`customerdevplan` (`id`,`planTime`,`planSubject`,`planType`,`planDetails`,`traceResult`,`remark`,`customer_id`,`inputTime`,`type`,`inputUser_id`) VALUES (3, '2022-02-23 00:00:00', '1111', '电话沟通', '1、341423\r\n2、14214\r\n3、答复', 2, '11', 17, '2022-02-23 18:51:57', 0, 26);
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `crm`.`customertransfer` WRITE;
DELETE FROM `crm`.`customertransfer`;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `crm`.`department` WRITE;
DELETE FROM `crm`.`department`;
INSERT INTO `crm`.`department` (`id`,`sn`,`name`,`manager_id`,`parent_id`,`state`) VALUES (1, '003', '总事办', 16, 4, 1),(2, '001', '财务部', 7, 1, 1),(4, '005', '董事会', NULL, NULL, 1),(7, '007', '人事部', NULL, NULL, 0),(8, '008', '企划部', NULL, NULL, 0),(9, '009', '技术部', NULL, NULL, 0),(10, '010', '销售部', NULL, 4, 1),(11, '011', '采购部', NULL, 1, 1),(12, '012', '客户服务部', NULL, NULL, 1),(13, 'N013', '测试部', 25, 9, 1);
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `crm`.`employee` WRITE;
DELETE FROM `crm`.`employee`;
INSERT INTO `crm`.`employee` (`id`,`username`,`realname`,`password`,`tel`,`email`,`dept_id`,`inputtime`,`state`,`admin`) VALUES (1, 'admin', '超级管理员', 'admin', '17839934031', '780798160@qq.com', 4, '2021-06-16', 1, 1),(26, 'test', 'test', '000000', '13372553124', '24552121@163.com', 10, '2022-02-23', 1, 0),(27, 'test2', 'wangwu', '000000', '1421', '12@qq.com', 10, '2022-02-23', 1, 0),(28, 'tt1', 'zhaoliu', '000000', '1412', '412', 10, '2022-02-23', 1, 0);
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `crm`.`employee_role` WRITE;
DELETE FROM `crm`.`employee_role`;
INSERT INTO `crm`.`employee_role` (`id`,`e_id`,`r_id`) VALUES (3, 26, 6),(4, 27, 6),(5, 28, 9);
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `crm`.`guarantee` WRITE;
DELETE FROM `crm`.`guarantee`;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `crm`.`guaranteeitem` WRITE;
DELETE FROM `crm`.`guaranteeitem`;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `crm`.`know` WRITE;
DELETE FROM `crm`.`know`;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `crm`.`knowledgemenu` WRITE;
DELETE FROM `crm`.`knowledgemenu`;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `crm`.`log` WRITE;
DELETE FROM `crm`.`log`;
INSERT INTO `crm`.`log` (`id`,`opuser_id`,`optime`,`opip`,`function`,`params`) VALUES (3296, NULL, '2022-02-23 17:44:12', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.EmployeeServiceImpl:queryByLogin', '[\"admin\",\"admin\"]'),(3297, 1, '2022-02-23 17:44:12', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.PermissionServiceImpl:queryPermissionByEmpId', '[1]'),(3298, 1, '2022-02-23 17:44:12', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.MenuServiceImpl:queryForMenu', '[]'),(3299, 1, '2022-02-23 17:44:28', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.DepartmentServiceImpl:listTree', '[]'),(3300, 1, '2022-02-23 17:44:28', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.DepartmentServiceImpl:list', '[{\"page\":1,\"rows\":10,\"start\":0}]'),(3301, 1, '2022-02-23 17:44:28', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.EmployeeServiceImpl:listManager', '[]'),(3302, 1, '2022-02-23 17:44:34', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.DepartmentServiceImpl:queryDeptForEmp', '[]'),(3303, 1, '2022-02-23 17:44:34', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.RoleServiceImpl:queryRoleForEmp', '[]'),(3304, 1, '2022-02-23 17:44:34', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.EmployeeServiceImpl:queryByCondition', '[{\"page\":1,\"rows\":10,\"start\":0}]'),(3305, 1, '2022-02-23 17:45:14', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.EmployeeServiceImpl:save', '[{\"id\":26,\"username\":\"test\",\"realname\":\"test\",\"password\":\"000000\",\"tel\":\"13372553124\",\"email\":\"24552121@163.com\",\"dept\":{\"id\":10},\"inputtime\":\"2022-02-23\",\"state\":true,\"admin\":false,\"roleList\":[{\"id\":6}]}]'),(3306, 1, '2022-02-23 17:45:19', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.EmployeeServiceImpl:queryByCondition', '[{\"page\":1,\"rows\":10,\"start\":0}]'),(3307, 1, '2022-02-23 17:47:39', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.DepartmentServiceImpl:queryDeptForEmp', '[]'),(3308, 1, '2022-02-23 17:47:39', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.RoleServiceImpl:queryRoleForEmp', '[]'),(3309, 1, '2022-02-23 17:47:41', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.EmployeeServiceImpl:queryByCondition', '[{\"page\":1,\"rows\":10,\"start\":0}]'),(3310, 1, '2022-02-23 17:47:50', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.EmployeeServiceImpl:queryByCondition', '[{\"page\":1,\"rows\":10,\"start\":0}]'),(3311, 1, '2022-02-23 17:47:54', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.RoleServiceImpl:queryRoleForPage', '[{\"page\":1,\"rows\":10,\"start\":0}]'),(3312, 1, '2022-02-23 17:47:54', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.PermissionServiceImpl:queryByCondition', '[{\"page\":1,\"rows\":10,\"start\":0}]'),(3313, 1, '2022-02-23 17:47:57', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.PermissionServiceImpl:queryPermissionsByRid', '[6]'),(3314, 1, '2022-02-23 17:48:19', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.PermissionServiceImpl:queryByCondition', '[{\"page\":2,\"rows\":10,\"start\":10}]'),(3315, 1, '2022-02-23 17:48:19', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.PermissionServiceImpl:queryByCondition', '[{\"page\":3,\"rows\":10,\"start\":20}]'),(3316, 1, '2022-02-23 17:48:20', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.PermissionServiceImpl:queryByCondition', '[{\"page\":2,\"rows\":10,\"start\":10}]'),(3317, 1, '2022-02-23 17:48:28', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.PermissionServiceImpl:queryByCondition', '[{\"page\":3,\"rows\":10,\"start\":20}]'),(3318, 1, '2022-02-23 17:48:29', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.PermissionServiceImpl:queryByCondition', '[{\"page\":2,\"rows\":10,\"start\":10}]'),(3319, 1, '2022-02-23 17:48:34', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.PermissionServiceImpl:queryByCondition', '[{\"page\":3,\"rows\":10,\"start\":20}]'),(3320, 1, '2022-02-23 17:49:01', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.PermissionServiceImpl:queryByCondition', '[{\"page\":4,\"rows\":10,\"start\":30}]'),(3321, 1, '2022-02-23 17:49:23', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.PermissionServiceImpl:queryByCondition', '[{\"page\":5,\"rows\":10,\"start\":40}]'),(3322, 1, '2022-02-23 17:49:37', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.PermissionServiceImpl:queryByCondition', '[{\"page\":6,\"rows\":10,\"start\":50}]'),(3323, 1, '2022-02-23 17:49:38', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.PermissionServiceImpl:queryByCondition', '[{\"page\":7,\"rows\":10,\"start\":60}]'),(3324, 1, '2022-02-23 17:49:39', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.PermissionServiceImpl:queryByCondition', '[{\"page\":8,\"rows\":10,\"start\":70}]'),(3325, 1, '2022-02-23 17:49:44', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.PermissionServiceImpl:queryByCondition', '[{\"page\":9,\"rows\":10,\"start\":80}]'),(3326, 1, '2022-02-23 17:49:45', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.PermissionServiceImpl:queryByCondition', '[{\"page\":10,\"rows\":10,\"start\":90}]'),(3327, 1, '2022-02-23 17:50:03', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.PermissionServiceImpl:queryByCondition', '[{\"page\":9,\"rows\":10,\"start\":80}]'),(3328, 1, '2022-02-23 17:50:04', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.PermissionServiceImpl:queryByCondition', '[{\"page\":8,\"rows\":10,\"start\":70}]'),(3329, 1, '2022-02-23 17:50:04', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.PermissionServiceImpl:queryByCondition', '[{\"page\":7,\"rows\":10,\"start\":60}]'),(3330, 1, '2022-02-23 17:50:04', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.PermissionServiceImpl:queryByCondition', '[{\"page\":6,\"rows\":10,\"start\":50}]'),(3331, 1, '2022-02-23 17:50:04', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.PermissionServiceImpl:queryByCondition', '[{\"page\":5,\"rows\":10,\"start\":40}]'),(3332, 1, '2022-02-23 17:50:10', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.PermissionServiceImpl:queryByCondition', '[{\"page\":4,\"rows\":10,\"start\":30}]'),(3333, 1, '2022-02-23 17:50:14', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.PermissionServiceImpl:queryByCondition', '[{\"page\":5,\"rows\":10,\"start\":40}]'),(3334, 1, '2022-02-23 17:51:09', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.PermissionServiceImpl:queryByCondition', '[{\"page\":6,\"rows\":10,\"start\":50}]'),(3335, 1, '2022-02-23 17:52:24', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.PermissionServiceImpl:queryByCondition', '[{\"page\":7,\"rows\":10,\"start\":60}]'),(3336, 1, '2022-02-23 17:52:41', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.PermissionServiceImpl:queryByCondition', '[{\"page\":8,\"rows\":10,\"start\":70}]'),(3337, 1, '2022-02-23 17:53:03', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.RoleServiceImpl:modifyRoleInfo', '[{\"id\":6,\"name\":\"市场专员\",\"sn\":\"MS\",\"permissionList\":[{\"id\":23},{\"id\":24},{\"id\":25},{\"id\":26},{\"id\":27},{\"id\":28},{\"id\":29},{\"id\":31},{\"id\":32},{\"id\":33},{\"id\":34},{\"id\":35},{\"id\":36},{\"id\":37},{\"id\":38},{\"id\":40},{\"id\":41},{\"id\":42},{\"id\":43},{\"id\":44},{\"id\":46},{\"id\":47},{\"id\":48},{\"id\":49},{\"id\":50},{\"id\":52},{\"id\":53},{\"id\":56},{\"id\":58},{\"id\":59},{\"id\":60},{\"id\":61},{\"id\":62},{\"id\":63},{\"id\":66},{\"id\":67},{\"id\":69},{\"id\":70},{\"id\":71},{\"id\":72},{\"id\":73},{\"id\":74},{\"id\":77}]}]'),(3338, 1, '2022-02-23 17:53:04', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.RoleServiceImpl:queryRoleForPage', '[{\"page\":1,\"rows\":10,\"start\":0}]'),(3339, NULL, '2022-02-23 17:53:19', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.EmployeeServiceImpl:queryByLogin', '[\"test\",\"666666\"]'),(3340, NULL, '2022-02-23 17:53:37', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.EmployeeServiceImpl:queryByLogin', '[\"test\",\"000000\"]'),(3341, 26, '2022-02-23 17:53:37', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.PermissionServiceImpl:queryPermissionByEmpId', '[26]'),(3342, 26, '2022-02-23 17:53:37', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.MenuServiceImpl:queryForMenu', '[]'),(3343, 26, '2022-02-23 17:53:37', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.PermissionServiceImpl:selectAll', '[]'),(3344, 26, '2022-02-23 17:54:29', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.ContractServiceImpl:queryByCondition', '[{\"page\":1,\"rows\":10,\"start\":0}]'),(3345, 26, '2022-02-23 17:54:29', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.CustomerServiceImpl:selectForOrder', '[]'),(3346, 26, '2022-02-23 17:54:29', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.EmployeeServiceImpl:sellerList', '[]'),(3347, 26, '2022-02-23 17:54:45', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.ISystemDictionaryItemServiceImpl:queryBySn', '[\"plantype\"]'),(3348, 26, '2022-02-23 17:54:45', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.CustomerServiceImpl:queryByCondition', '[{\"userId\":26,\"start\":0}]'),(3349, 26, '2022-02-23 17:54:45', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.CustomerDevPlanServiceImpl:queryPontentialDevPlanByCondition', '[{\"page\":1,\"rows\":10,\"start\":0}]'),(3350, NULL, '2022-02-23 17:56:37', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.EmployeeServiceImpl:queryByLogin', '[\"test\",\"000000\"]'),(3351, 26, '2022-02-23 17:56:37', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.PermissionServiceImpl:queryPermissionByEmpId', '[26]'),(3352, 26, '2022-02-23 17:56:37', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.MenuServiceImpl:queryForMenu', '[]'),(3353, 26, '2022-02-23 17:57:03', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.ISystemDictionaryItemServiceImpl:queryBySn', '[\"job\"]'),(3354, 26, '2022-02-23 17:57:03', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.ISystemDictionaryItemServiceImpl:queryBySn', '[\"salaryLevel\"]'),(3355, 26, '2022-02-23 17:57:03', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.ISystemDictionaryItemServiceImpl:queryBySn', '[\"customerSource\"]'),(3356, 26, '2022-02-23 17:57:03', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.EmployeeServiceImpl:selectByPotential', '[]'),(3357, 26, '2022-02-23 17:57:03', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.CustomerServiceImpl:queryByCondition', '[{\"page\":1,\"rows\":10,\"userId\":26,\"start\":0}]'),(3358, 26, '2022-02-23 17:57:25', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.ISystemDictionaryItemServiceImpl:queryBySn', '[\"salaryLevel\"]'),(3359, 26, '2022-02-23 17:57:25', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.ISystemDictionaryItemServiceImpl:queryBySn', '[\"job\"]'),(3360, 26, '2022-02-23 17:57:26', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.ISystemDictionaryItemServiceImpl:queryBySn', '[\"customerSource\"]'),(3361, 26, '2022-02-23 17:57:26', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.EmployeeServiceImpl:selectByPotential', '[]'),(3362, 26, '2022-02-23 17:57:26', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.CustomerServiceImpl:queryCustomerByCondition', '[{\"page\":1,\"rows\":10,\"start\":0}]'),(3363, NULL, '2022-02-23 17:58:13', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.EmployeeServiceImpl:queryByLogin', '[\"admin\",\"admin\"]'),(3364, 1, '2022-02-23 17:58:13', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.PermissionServiceImpl:queryPermissionByEmpId', '[1]'),(3365, 1, '2022-02-23 17:58:13', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.MenuServiceImpl:queryForMenu', '[]'),(3366, 1, '2022-02-23 17:58:16', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.RoleServiceImpl:queryRoleForPage', '[{\"page\":1,\"rows\":10,\"start\":0}]'),(3367, 1, '2022-02-23 17:58:16', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.PermissionServiceImpl:queryByCondition', '[{\"page\":1,\"rows\":10,\"start\":0}]'),(3368, 1, '2022-02-23 17:58:19', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.PermissionServiceImpl:queryPermissionsByRid', '[6]'),(3369, NULL, '2022-02-23 18:00:36', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.EmployeeServiceImpl:queryByLogin', '[\"test\",\"000000\"]'),(3370, 26, '2022-02-23 18:00:42', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.PermissionServiceImpl:queryPermissionByEmpId', '[26]'),(3371, 26, '2022-02-23 18:03:44', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.MenuServiceImpl:queryForMenu', '[]'),(3372, NULL, '2022-02-23 18:03:56', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.EmployeeServiceImpl:queryByLogin', '[\"test\",\"000000\"]'),(3373, 26, '2022-02-23 18:04:00', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.PermissionServiceImpl:queryPermissionByEmpId', '[26]'),(3374, 26, '2022-02-23 18:04:00', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.MenuServiceImpl:queryForMenu', '[]'),(3375, 26, '2022-02-23 18:04:15', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.ISystemDictionaryItemServiceImpl:queryBySn', '[\"job\"]'),(3376, 26, '2022-02-23 18:04:16', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.ISystemDictionaryItemServiceImpl:queryBySn', '[\"salaryLevel\"]'),(3377, 26, '2022-02-23 18:04:16', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.ISystemDictionaryItemServiceImpl:queryBySn', '[\"customerSource\"]'),(3378, 26, '2022-02-23 18:04:16', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.EmployeeServiceImpl:selectByPotential', '[]'),(3379, 26, '2022-02-23 18:04:16', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.CustomerServiceImpl:queryByCondition', '[{\"page\":1,\"rows\":10,\"userId\":26,\"start\":0}]'),(3380, NULL, '2022-02-23 18:04:34', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.EmployeeServiceImpl:queryByLogin', '[\"test\",\"000000\"]'),(3381, 26, '2022-02-23 18:04:37', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.PermissionServiceImpl:queryPermissionByEmpId', '[26]'),(3382, 26, '2022-02-23 18:04:59', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.MenuServiceImpl:queryForMenu', '[]'),(3383, NULL, '2022-02-23 18:09:11', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.EmployeeServiceImpl:queryByLogin', '[\"test\",\"000000\"]'),(3384, 26, '2022-02-23 18:09:14', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.PermissionServiceImpl:queryPermissionByEmpId', '[26]'),(3385, 26, '2022-02-23 18:09:14', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.MenuServiceImpl:queryForMenu', '[]'),(3386, 26, '2022-02-23 18:09:17', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.ISystemDictionaryItemServiceImpl:queryBySn', '[\"job\"]'),(3387, 26, '2022-02-23 18:09:17', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.ISystemDictionaryItemServiceImpl:queryBySn', '[\"salaryLevel\"]'),(3388, 26, '2022-02-23 18:09:17', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.ISystemDictionaryItemServiceImpl:queryBySn', '[\"customerSource\"]'),(3389, 26, '2022-02-23 18:09:17', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.EmployeeServiceImpl:selectByPotential', '[]'),(3390, 26, '2022-02-23 18:09:18', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.CustomerServiceImpl:queryByCondition', '[{\"page\":1,\"rows\":10,\"userId\":26,\"start\":0}]'),(3391, 26, '2022-02-23 18:09:42', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.ISystemDictionaryItemServiceImpl:queryBySn', '[\"job\"]'),(3392, 26, '2022-02-23 18:09:42', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.ISystemDictionaryItemServiceImpl:queryBySn', '[\"salaryLevel\"]'),(3393, 26, '2022-02-23 18:09:42', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.ISystemDictionaryItemServiceImpl:queryBySn', '[\"customerSource\"]'),(3394, 26, '2022-02-23 18:09:42', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.EmployeeServiceImpl:selectByPotential', '[]'),(3395, 26, '2022-02-23 18:09:42', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.CustomerServiceImpl:queryCustomerByCondition', '[{\"page\":1,\"rows\":10,\"start\":0}]'),(3396, 26, '2022-02-23 18:10:13', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.ISystemDictionaryItemServiceImpl:queryBySn', '[\"customerSource\"]'),(3397, 26, '2022-02-23 18:10:13', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.ISystemDictionaryItemServiceImpl:queryBySn', '[\"salaryLevel\"]'),(3398, 26, '2022-02-23 18:10:13', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.ISystemDictionaryItemServiceImpl:queryBySn', '[\"job\"]'),(3399, 26, '2022-02-23 18:10:13', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.EmployeeServiceImpl:selectByPotential', '[]'),(3400, 26, '2022-02-23 18:10:14', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.CustomerServiceImpl:queryByCondition', '[{\"page\":1,\"rows\":10,\"userId\":26,\"start\":0}]'),(3401, 26, '2022-02-23 18:10:18', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.ISystemDictionaryItemServiceImpl:queryBySn', '[\"job\"]'),(3402, 26, '2022-02-23 18:10:18', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.ISystemDictionaryItemServiceImpl:queryBySn', '[\"salaryLevel\"]'),(3403, 26, '2022-02-23 18:10:18', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.ISystemDictionaryItemServiceImpl:queryBySn', '[\"customerSource\"]'),(3404, 26, '2022-02-23 18:10:18', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.EmployeeServiceImpl:selectByPotential', '[]'),(3405, 26, '2022-02-23 18:10:19', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.CustomerServiceImpl:queryCustomerByCondition', '[{\"page\":1,\"rows\":10,\"start\":0}]'),(3406, 26, '2022-02-23 18:10:22', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.ISystemDictionaryItemServiceImpl:queryBySn', '[\"plantype\"]'),(3407, 26, '2022-02-23 18:10:22', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.CustomerServiceImpl:queryByCondition', '[{\"userId\":26,\"start\":0}]'),(3408, 26, '2022-02-23 18:10:22', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.CustomerDevPlanServiceImpl:queryPontentialDevPlanByCondition', '[{\"page\":1,\"rows\":10,\"start\":0}]'),(3409, 26, '2022-02-23 18:10:28', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.ISystemDictionaryItemServiceImpl:queryBySn', '[\"plantype\"]'),(3410, 26, '2022-02-23 18:10:29', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.CustomerServiceImpl:queryByCondition', '[{\"userId\":26,\"start\":0}]'),(3411, 26, '2022-02-23 18:10:29', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.CustomerDevPlanServiceImpl:queryDevPlanByCondition', '[{\"page\":1,\"rows\":10,\"start\":0}]'),(3412, 26, '2022-02-23 18:10:37', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.ISystemDictionaryItemServiceImpl:queryBySn', '[\"job\"]'),(3413, 26, '2022-02-23 18:10:37', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.ISystemDictionaryItemServiceImpl:queryBySn', '[\"salaryLevel\"]'),(3414, 26, '2022-02-23 18:10:37', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.ISystemDictionaryItemServiceImpl:queryBySn', '[\"customerSource\"]'),(3415, 26, '2022-02-23 18:10:37', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.CustomerServiceImpl:queryResourcePoolByCondition', '[{\"page\":1,\"rows\":10,\"start\":0}]'),(3416, 26, '2022-02-23 18:10:42', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.OrderBillServiceImpl:queryByCondition', '[{\"page\":1,\"rows\":10,\"start\":0}]'),(3417, 26, '2022-02-23 18:10:42', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.CustomerServiceImpl:selectForOrder', '[]'),(3418, 26, '2022-02-23 18:10:42', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.EmployeeServiceImpl:sellerList', '[]'),(3419, 26, '2022-02-23 18:10:45', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.ContractServiceImpl:queryByCondition', '[{\"page\":1,\"rows\":10,\"start\":0}]'),(3420, 26, '2022-02-23 18:10:45', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.CustomerServiceImpl:selectForOrder', '[]'),(3421, 26, '2022-02-23 18:10:46', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.EmployeeServiceImpl:sellerList', '[]'),(3422, 26, '2022-02-23 18:24:34', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.CustomerServiceImpl:save', '[{\"id\":15,\"name\":\"test001\",\"age\":21,\"gender\":1,\"tel\":\"111\",\"email\":\"1341@qq.com\",\"qq\":\"111\",\"wechat\":\"141234\",\"job\":\"司机\",\"salarylevel\":\"4000-8000\",\"customersource\":\"报纸\",\"inputtime\":\"2022-02-23\",\"status\":0,\"inputuser\":{\"id\":26,\"username\":\"test\",\"realname\":\"test\",\"password\":\"000000\",\"tel\":\"13372553124\",\"email\":\"24552121@163.com\",\"inputtime\":\"2022-02-23\",\"state\":true,\"admin\":false},\"inchargeuser\":{\"id\":26,\"username\":\"test\",\"realname\":\"test\",\"password\":\"000000\",\"tel\":\"13372553124\",\"email\":\"24552121@163.com\",\"inputtime\":\"2022-02-23\",\"state\":true,\"admin\":false}}]'),(3423, 26, '2022-02-23 18:24:34', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.CustomerServiceImpl:queryByCondition', '[{\"page\":1,\"rows\":10,\"userId\":26,\"start\":0}]'),(3424, 26, '2022-02-23 18:25:19', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.ISystemDictionaryItemServiceImpl:queryBySn', '[\"job\"]'),(3425, 26, '2022-02-23 18:25:19', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.ISystemDictionaryItemServiceImpl:queryBySn', '[\"salaryLevel\"]'),(3426, 26, '2022-02-23 18:25:19', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.ISystemDictionaryItemServiceImpl:queryBySn', '[\"customerSource\"]'),(3427, 26, '2022-02-23 18:25:20', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.EmployeeServiceImpl:selectByPotential', '[]'),(3428, 26, '2022-02-23 18:25:20', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.CustomerServiceImpl:queryByCondition', '[{\"page\":1,\"rows\":10,\"userId\":26,\"start\":0}]'),(3429, NULL, '2022-02-23 18:33:28', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.EmployeeServiceImpl:queryByLogin', '[\"test\",\"000000\"]'),(3430, 26, '2022-02-23 18:33:32', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.PermissionServiceImpl:queryPermissionByEmpId', '[26]'),(3431, 26, '2022-02-23 18:33:33', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.MenuServiceImpl:queryForMenu', '[]'),(3432, 26, '2022-02-23 18:33:33', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.PermissionServiceImpl:selectAll', '[]'),(3433, 26, '2022-02-23 18:33:37', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.ISystemDictionaryItemServiceImpl:queryBySn', '[\"job\"]'),(3434, 26, '2022-02-23 18:33:37', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.ISystemDictionaryItemServiceImpl:queryBySn', '[\"salaryLevel\"]'),(3435, 26, '2022-02-23 18:33:37', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.ISystemDictionaryItemServiceImpl:queryBySn', '[\"customerSource\"]'),(3436, 26, '2022-02-23 18:33:37', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.EmployeeServiceImpl:selectByPotential', '[]'),(3437, 26, '2022-02-23 18:33:37', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.EmployeeServiceImpl:selectByPotential', '[]'),(3438, 26, '2022-02-23 18:33:37', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.CustomerServiceImpl:queryByCondition', '[{\"page\":1,\"rows\":10,\"userId\":26,\"start\":0}]'),(3439, NULL, '2022-02-23 18:33:59', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.EmployeeServiceImpl:queryByLogin', '[\"admin\",\"admin\"]'),(3440, 1, '2022-02-23 18:34:02', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.PermissionServiceImpl:queryPermissionByEmpId', '[1]'),(3441, 1, '2022-02-23 18:34:02', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.MenuServiceImpl:queryForMenu', '[]'),(3442, 1, '2022-02-23 18:34:05', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.DepartmentServiceImpl:queryDeptForEmp', '[]'),(3443, 1, '2022-02-23 18:34:05', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.RoleServiceImpl:queryRoleForEmp', '[]'),(3444, 1, '2022-02-23 18:34:06', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.EmployeeServiceImpl:queryByCondition', '[{\"page\":1,\"rows\":10,\"start\":0}]'),(3445, 1, '2022-02-23 18:34:35', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.EmployeeServiceImpl:save', '[{\"id\":27,\"username\":\"test2\",\"realname\":\"wangwu\",\"password\":\"000000\",\"tel\":\"1421\",\"email\":\"12@qq.com\",\"dept\":{\"id\":10},\"inputtime\":\"2022-02-23\",\"state\":true,\"admin\":false,\"roleList\":[{\"id\":6}]}]'),(3446, NULL, '2022-02-23 18:34:44', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.EmployeeServiceImpl:queryByLogin', '[\"test\",\"000000\"]'),(3447, 26, '2022-02-23 18:34:46', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.PermissionServiceImpl:queryPermissionByEmpId', '[26]'),(3448, 26, '2022-02-23 18:34:46', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.MenuServiceImpl:queryForMenu', '[]'),(3449, 26, '2022-02-23 18:34:49', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.ISystemDictionaryItemServiceImpl:queryBySn', '[\"job\"]'),(3450, 26, '2022-02-23 18:34:49', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.ISystemDictionaryItemServiceImpl:queryBySn', '[\"salaryLevel\"]'),(3451, 26, '2022-02-23 18:34:49', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.ISystemDictionaryItemServiceImpl:queryBySn', '[\"customerSource\"]'),(3452, 26, '2022-02-23 18:34:50', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.EmployeeServiceImpl:selectByPotential', '[]'),(3453, 26, '2022-02-23 18:34:50', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.EmployeeServiceImpl:selectByPotential', '[]'),(3454, 26, '2022-02-23 18:34:50', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.CustomerServiceImpl:queryByCondition', '[{\"page\":1,\"rows\":10,\"userId\":26,\"start\":0}]'),(3455, NULL, '2022-02-23 18:41:57', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.EmployeeServiceImpl:queryByLogin', '[\"test2\",\"0000000\"]'),(3456, NULL, '2022-02-23 18:41:58', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.EmployeeServiceImpl:queryByLogin', '[\"test2\",\"0000000\"]'),(3457, NULL, '2022-02-23 18:41:59', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.EmployeeServiceImpl:queryByLogin', '[\"test2\",\"0000000\"]'),(3458, NULL, '2022-02-23 18:42:05', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.EmployeeServiceImpl:queryByLogin', '[\"test2\",\"000000\"]'),(3459, 27, '2022-02-23 18:42:07', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.PermissionServiceImpl:queryPermissionByEmpId', '[27]'),(3460, 27, '2022-02-23 18:42:08', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.MenuServiceImpl:queryForMenu', '[]'),(3461, 27, '2022-02-23 18:42:18', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.ISystemDictionaryItemServiceImpl:queryBySn', '[\"job\"]'),(3462, 27, '2022-02-23 18:42:18', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.ISystemDictionaryItemServiceImpl:queryBySn', '[\"salaryLevel\"]'),(3463, 27, '2022-02-23 18:42:18', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.ISystemDictionaryItemServiceImpl:queryBySn', '[\"customerSource\"]'),(3464, 27, '2022-02-23 18:42:18', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.EmployeeServiceImpl:selectByPotential', '[]'),(3465, 27, '2022-02-23 18:42:18', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.EmployeeServiceImpl:selectByPotential', '[]'),(3466, 27, '2022-02-23 18:42:18', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.CustomerServiceImpl:queryByCondition', '[{\"page\":1,\"rows\":10,\"userId\":27,\"start\":0}]'),(3467, 27, '2022-02-23 18:43:11', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.CustomerServiceImpl:save', '[{\"id\":16,\"name\":\"lisi\",\"age\":42,\"gender\":1,\"tel\":\"412412\",\"email\":\"4121@qq.com\",\"qq\":\"412\",\"wechat\":\"414\",\"job\":\"司机\",\"salarylevel\":\"4000-8000\",\"customersource\":\"报纸\",\"inputtime\":\"2022-02-23\",\"status\":0,\"inputuser\":{\"id\":27,\"username\":\"test2\",\"realname\":\"wangwu\",\"password\":\"000000\",\"tel\":\"1421\",\"email\":\"12@qq.com\",\"inputtime\":\"2022-02-23\",\"state\":true,\"admin\":false},\"inchargeuser\":{\"id\":27,\"username\":\"test2\",\"realname\":\"wangwu\",\"password\":\"000000\",\"tel\":\"1421\",\"email\":\"12@qq.com\",\"inputtime\":\"2022-02-23\",\"state\":true,\"admin\":false}}]'),(3468, 27, '2022-02-23 18:43:12', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.CustomerServiceImpl:queryByCondition', '[{\"page\":1,\"rows\":10,\"userId\":27,\"start\":0}]'),(3469, NULL, '2022-02-23 18:43:28', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.EmployeeServiceImpl:queryByLogin', '[\"test\",\"000000\"]'),(3470, 26, '2022-02-23 18:43:31', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.PermissionServiceImpl:queryPermissionByEmpId', '[26]'),(3471, 26, '2022-02-23 18:43:31', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.MenuServiceImpl:queryForMenu', '[]'),(3472, 26, '2022-02-23 18:43:35', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.ISystemDictionaryItemServiceImpl:queryBySn', '[\"job\"]'),(3473, 26, '2022-02-23 18:43:35', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.ISystemDictionaryItemServiceImpl:queryBySn', '[\"salaryLevel\"]'),(3474, 26, '2022-02-23 18:43:35', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.ISystemDictionaryItemServiceImpl:queryBySn', '[\"customerSource\"]'),(3475, 26, '2022-02-23 18:43:35', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.EmployeeServiceImpl:selectByPotential', '[]'),(3476, 26, '2022-02-23 18:43:35', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.EmployeeServiceImpl:selectByPotential', '[]'),(3477, 26, '2022-02-23 18:43:35', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.CustomerServiceImpl:queryCustomerByCondition', '[{\"page\":1,\"rows\":10,\"start\":0}]'),(3478, 26, '2022-02-23 18:43:38', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.ISystemDictionaryItemServiceImpl:queryBySn', '[\"job\"]'),(3479, 26, '2022-02-23 18:43:38', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.ISystemDictionaryItemServiceImpl:queryBySn', '[\"salaryLevel\"]'),(3480, 26, '2022-02-23 18:43:38', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.ISystemDictionaryItemServiceImpl:queryBySn', '[\"customerSource\"]'),(3481, 26, '2022-02-23 18:43:38', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.EmployeeServiceImpl:selectByPotential', '[]'),(3482, 26, '2022-02-23 18:43:38', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.EmployeeServiceImpl:selectByPotential', '[]'),(3483, 26, '2022-02-23 18:43:38', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.CustomerServiceImpl:queryByCondition', '[{\"page\":1,\"rows\":10,\"userId\":26,\"start\":0}]'),(3484, 26, '2022-02-23 18:44:36', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.ISystemDictionaryItemServiceImpl:queryBySn', '[\"job\"]'),(3485, 26, '2022-02-23 18:44:36', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.ISystemDictionaryItemServiceImpl:queryBySn', '[\"salaryLevel\"]'),(3486, 26, '2022-02-23 18:44:36', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.ISystemDictionaryItemServiceImpl:queryBySn', '[\"customerSource\"]'),(3487, 26, '2022-02-23 18:44:36', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.EmployeeServiceImpl:selectByPotential', '[]'),(3488, 26, '2022-02-23 18:44:36', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.EmployeeServiceImpl:selectByPotential', '[]'),(3489, 26, '2022-02-23 18:44:39', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.CustomerServiceImpl:queryByCondition', '[{\"page\":1,\"rows\":10,\"userId\":26,\"start\":0}]'),(3490, 26, '2022-02-23 18:44:48', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.CustomerServiceImpl:queryByCondition', '[{\"page\":1,\"rows\":10,\"userId\":26,\"status\":-1,\"start\":0}]'),(3491, 26, '2022-02-23 18:44:49', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.CustomerServiceImpl:queryByCondition', '[{\"page\":1,\"rows\":10,\"userId\":26,\"status\":0,\"start\":0}]'),(3492, 26, '2022-02-23 18:44:50', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.CustomerServiceImpl:queryByCondition', '[{\"page\":1,\"rows\":10,\"userId\":26,\"start\":0}]'),(3493, 26, '2022-02-23 18:44:52', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.CustomerServiceImpl:queryByCondition', '[{\"page\":1,\"rows\":10,\"userId\":26,\"start\":0}]'),(3494, 26, '2022-02-23 18:44:58', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.CustomerServiceImpl:updateStatusSuccessById', '[15]'),(3495, 26, '2022-02-23 18:44:58', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.CustomerServiceImpl:queryByCondition', '[{\"page\":1,\"rows\":10,\"userId\":26,\"start\":0}]'),(3496, 26, '2022-02-23 18:45:01', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.CustomerServiceImpl:queryByCondition', '[{\"page\":1,\"rows\":10,\"userId\":26,\"start\":0}]'),(3497, 26, '2022-02-23 18:45:07', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.ISystemDictionaryItemServiceImpl:queryBySn', '[\"job\"]'),(3498, 26, '2022-02-23 18:45:07', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.ISystemDictionaryItemServiceImpl:queryBySn', '[\"salaryLevel\"]'),(3499, 26, '2022-02-23 18:45:07', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.ISystemDictionaryItemServiceImpl:queryBySn', '[\"customerSource\"]'),(3500, 26, '2022-02-23 18:45:07', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.EmployeeServiceImpl:selectByPotential', '[]'),(3501, 26, '2022-02-23 18:45:07', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.EmployeeServiceImpl:selectByPotential', '[]'),(3502, 26, '2022-02-23 18:45:07', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.CustomerServiceImpl:queryCustomerByCondition', '[{\"page\":1,\"rows\":10,\"start\":0}]'),(3503, 26, '2022-02-23 18:45:39', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.ISystemDictionaryItemServiceImpl:queryBySn', '[\"job\"]'),(3504, 26, '2022-02-23 18:45:39', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.ISystemDictionaryItemServiceImpl:queryBySn', '[\"salaryLevel\"]'),(3505, 26, '2022-02-23 18:45:39', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.ISystemDictionaryItemServiceImpl:queryBySn', '[\"customerSource\"]'),(3506, 26, '2022-02-23 18:45:39', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.EmployeeServiceImpl:selectByPotential', '[]'),(3507, 26, '2022-02-23 18:45:39', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.EmployeeServiceImpl:selectByPotential', '[]'),(3508, 26, '2022-02-23 18:45:40', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.CustomerServiceImpl:queryCustomerByCondition', '[{\"page\":1,\"rows\":10,\"start\":0}]'),(3509, 26, '2022-02-23 18:46:20', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.CustomerServiceImpl:queryCustomerByCondition', '[{\"page\":1,\"rows\":10,\"status\":-2,\"start\":0}]'),(3510, 26, '2022-02-23 18:46:22', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.CustomerServiceImpl:queryCustomerByCondition', '[{\"page\":1,\"rows\":10,\"status\":1,\"start\":0}]'),(3511, 26, '2022-02-23 18:46:26', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.CustomerServiceImpl:queryCustomerByCondition', '[{\"page\":1,\"rows\":10,\"start\":0}]'),(3512, 26, '2022-02-23 18:46:27', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.CustomerServiceImpl:queryCustomerByCondition', '[{\"page\":1,\"rows\":10,\"start\":0}]'),(3513, 26, '2022-02-23 18:46:29', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.CustomerServiceImpl:moveToResourcePool', '[26,15]'),(3514, 26, '2022-02-23 18:46:30', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.CustomerServiceImpl:queryCustomerByCondition', '[{\"page\":1,\"rows\":10,\"start\":0}]'),(3515, 26, '2022-02-23 18:46:31', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.CustomerServiceImpl:queryCustomerByCondition', '[{\"page\":1,\"rows\":10,\"start\":0}]'),(3516, 26, '2022-02-23 18:46:34', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.ISystemDictionaryItemServiceImpl:queryBySn', '[\"job\"]'),(3517, 26, '2022-02-23 18:46:34', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.ISystemDictionaryItemServiceImpl:queryBySn', '[\"salaryLevel\"]'),(3518, 26, '2022-02-23 18:46:34', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.ISystemDictionaryItemServiceImpl:queryBySn', '[\"customerSource\"]'),(3519, 26, '2022-02-23 18:46:34', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.CustomerServiceImpl:queryResourcePoolByCondition', '[{\"page\":1,\"rows\":10,\"start\":0}]'),(3520, 26, '2022-02-23 18:46:35', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.CustomerServiceImpl:queryResourcePoolByCondition', '[{\"page\":1,\"rows\":10,\"start\":0}]'),(3521, 26, '2022-02-23 18:46:55', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.CustomerServiceImpl:queryResourcePoolByCondition', '[{\"page\":1,\"rows\":10,\"start\":0}]'),(3522, NULL, '2022-02-23 18:47:27', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.EmployeeServiceImpl:queryByLogin', '[\"test\",\"000000\"]'),(3523, 26, '2022-02-23 18:47:29', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.PermissionServiceImpl:queryPermissionByEmpId', '[26]'),(3524, 26, '2022-02-23 18:47:29', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.MenuServiceImpl:queryForMenu', '[]'),(3525, 26, '2022-02-23 18:47:33', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.ISystemDictionaryItemServiceImpl:queryBySn', '[\"job\"]'),(3526, 26, '2022-02-23 18:47:33', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.ISystemDictionaryItemServiceImpl:queryBySn', '[\"salaryLevel\"]'),(3527, 26, '2022-02-23 18:47:33', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.ISystemDictionaryItemServiceImpl:queryBySn', '[\"customerSource\"]'),(3528, 26, '2022-02-23 18:47:33', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.EmployeeServiceImpl:selectByPotential', '[]'),(3529, 26, '2022-02-23 18:47:33', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.EmployeeServiceImpl:selectByPotential', '[]'),(3530, 26, '2022-02-23 18:47:33', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.CustomerServiceImpl:queryCustomerByCondition', '[{\"page\":1,\"rows\":10,\"start\":0}]'),(3531, 26, '2022-02-23 18:47:35', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.ISystemDictionaryItemServiceImpl:queryBySn', '[\"job\"]'),(3532, 26, '2022-02-23 18:47:36', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.ISystemDictionaryItemServiceImpl:queryBySn', '[\"salaryLevel\"]'),(3533, 26, '2022-02-23 18:47:36', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.ISystemDictionaryItemServiceImpl:queryBySn', '[\"customerSource\"]'),(3534, 26, '2022-02-23 18:47:36', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.CustomerServiceImpl:queryResourcePoolByCondition', '[{\"page\":1,\"rows\":10,\"start\":0}]'),(3535, 26, '2022-02-23 18:47:38', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.CustomerServiceImpl:customerAdmit', '[26,15]'),(3536, 26, '2022-02-23 18:47:38', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.CustomerServiceImpl:queryResourcePoolByCondition', '[{\"page\":1,\"rows\":10,\"start\":0}]'),(3537, 26, '2022-02-23 18:47:40', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.CustomerServiceImpl:queryResourcePoolByCondition', '[{\"page\":1,\"rows\":10,\"start\":0}]'),(3538, 26, '2022-02-23 18:47:44', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.CustomerServiceImpl:queryCustomerByCondition', '[{\"page\":1,\"rows\":10,\"start\":0}]'),(3539, 26, '2022-02-23 18:47:48', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.ISystemDictionaryItemServiceImpl:queryBySn', '[\"plantype\"]'),(3540, 26, '2022-02-23 18:47:48', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.CustomerServiceImpl:queryByCondition', '[{\"userId\":26,\"start\":0}]'),(3541, 26, '2022-02-23 18:47:48', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.CustomerDevPlanServiceImpl:queryPontentialDevPlanByCondition', '[{\"page\":1,\"rows\":10,\"userId\":26,\"start\":0}]'),(3542, 26, '2022-02-23 18:47:50', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.ISystemDictionaryItemServiceImpl:queryBySn', '[\"job\"]'),(3543, 26, '2022-02-23 18:47:50', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.ISystemDictionaryItemServiceImpl:queryBySn', '[\"salaryLevel\"]'),(3544, 26, '2022-02-23 18:47:50', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.ISystemDictionaryItemServiceImpl:queryBySn', '[\"customerSource\"]'),(3545, 26, '2022-02-23 18:47:50', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.EmployeeServiceImpl:selectByPotential', '[]'),(3546, 26, '2022-02-23 18:47:50', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.EmployeeServiceImpl:selectByPotential', '[]'),(3547, 26, '2022-02-23 18:47:51', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.CustomerServiceImpl:queryByCondition', '[{\"page\":1,\"rows\":10,\"userId\":26,\"start\":0}]'),(3548, 26, '2022-02-23 18:48:41', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.CustomerServiceImpl:save', '[{\"id\":17,\"name\":\"松江2\",\"age\":1241,\"gender\":1,\"tel\":\"41412\",\"email\":\"2142@qq.com\",\"qq\":\"4124\",\"wechat\":\"1412\",\"job\":\"教师\",\"salarylevel\":\"4000-8000\",\"customersource\":\"广播\",\"inputtime\":\"2022-02-23\",\"status\":0,\"inputuser\":{\"id\":26,\"username\":\"test\",\"realname\":\"test\",\"password\":\"000000\",\"tel\":\"13372553124\",\"email\":\"24552121@163.com\",\"inputtime\":\"2022-02-23\",\"state\":true,\"admin\":false},\"inchargeuser\":{\"id\":26,\"username\":\"test\",\"realname\":\"test\",\"password\":\"000000\",\"tel\":\"13372553124\",\"email\":\"24552121@163.com\",\"inputtime\":\"2022-02-23\",\"state\":true,\"admin\":false}}]'),(3549, 26, '2022-02-23 18:48:41', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.CustomerServiceImpl:queryByCondition', '[{\"page\":1,\"rows\":10,\"userId\":26,\"start\":0}]'),(3550, 26, '2022-02-23 18:48:44', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.CustomerDevPlanServiceImpl:queryPontentialDevPlanByCondition', '[{\"page\":1,\"rows\":10,\"userId\":26,\"start\":0}]'),(3551, 26, '2022-02-23 18:48:47', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.CustomerServiceImpl:queryByCondition', '[{\"page\":1,\"rows\":10,\"userId\":26,\"start\":0}]'),(3552, 26, '2022-02-23 18:48:49', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.CustomerDevPlanServiceImpl:queryPontentialDevPlanByCondition', '[{\"page\":1,\"rows\":10,\"userId\":26,\"start\":0}]'),(3553, 26, '2022-02-23 18:48:49', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.CustomerDevPlanServiceImpl:queryPontentialDevPlanByCondition', '[{\"page\":1,\"rows\":10,\"userId\":26,\"start\":0}]'),(3554, 26, '2022-02-23 18:48:52', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.ISystemDictionaryItemServiceImpl:queryBySn', '[\"plantype\"]'),(3555, 26, '2022-02-23 18:48:52', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.CustomerServiceImpl:queryByCondition', '[{\"userId\":26,\"start\":0}]'),(3556, 26, '2022-02-23 18:48:52', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.CustomerDevPlanServiceImpl:queryDevPlanByCondition', '[{\"page\":1,\"rows\":10,\"userId\":26,\"start\":0}]'),(3557, 26, '2022-02-23 18:48:53', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.ISystemDictionaryItemServiceImpl:queryBySn', '[\"plantype\"]'),(3558, 26, '2022-02-23 18:48:54', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.CustomerDevPlanServiceImpl:queryPontentialDevPlanByCondition', '[{\"page\":1,\"rows\":10,\"userId\":26,\"start\":0}]'),(3559, 26, '2022-02-23 18:48:54', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.CustomerServiceImpl:queryByCondition', '[{\"userId\":26,\"start\":0}]'),(3560, 26, '2022-02-23 18:48:56', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.CustomerDevPlanServiceImpl:queryPontentialDevPlanByCondition', '[{\"page\":1,\"rows\":10,\"userId\":26,\"start\":0}]'),(3561, 26, '2022-02-23 18:49:00', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.ISystemDictionaryItemServiceImpl:queryBySn', '[\"plantype\"]'),(3562, 26, '2022-02-23 18:49:00', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.CustomerServiceImpl:queryByCondition', '[{\"userId\":26,\"start\":0}]'),(3563, 26, '2022-02-23 18:49:00', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.CustomerDevPlanServiceImpl:queryDevPlanByCondition', '[{\"page\":1,\"rows\":10,\"userId\":26,\"start\":0}]'),(3564, 26, '2022-02-23 18:49:06', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.ISystemDictionaryItemServiceImpl:queryBySn', '[\"job\"]'),(3565, 26, '2022-02-23 18:49:08', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.CustomerServiceImpl:queryCustomerByCondition', '[{\"page\":1,\"rows\":10,\"start\":0}]'),(3566, 26, '2022-02-23 18:49:08', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.ISystemDictionaryItemServiceImpl:queryBySn', '[\"salaryLevel\"]'),(3567, 26, '2022-02-23 18:49:08', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.EmployeeServiceImpl:selectByPotential', '[]'),(3568, 26, '2022-02-23 18:49:09', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.EmployeeServiceImpl:selectByPotential', '[]'),(3569, 26, '2022-02-23 18:49:09', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.ISystemDictionaryItemServiceImpl:queryBySn', '[\"customerSource\"]'),(3570, 26, '2022-02-23 18:49:09', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.ISystemDictionaryItemServiceImpl:queryBySn', '[\"plantype\"]'),(3571, 26, '2022-02-23 18:49:10', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.CustomerServiceImpl:queryByCondition', '[{\"userId\":26,\"start\":0}]'),(3572, 26, '2022-02-23 18:49:10', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.CustomerDevPlanServiceImpl:queryPontentialDevPlanByCondition', '[{\"page\":1,\"rows\":10,\"userId\":26,\"start\":0}]'),(3573, 26, '2022-02-23 18:49:13', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.CustomerDevPlanServiceImpl:queryPontentialDevPlanByCondition', '[{\"page\":1,\"rows\":10,\"userId\":26,\"start\":0}]'),(3574, 26, '2022-02-23 18:49:24', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.CustomerDevPlanServiceImpl:queryPontentialDevPlanByCondition', '[{\"page\":1,\"rows\":10,\"userId\":26,\"start\":0}]'),(3575, 26, '2022-02-23 18:50:43', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.CustomerServiceImpl:queryByCondition', '[{\"page\":1,\"rows\":10,\"userId\":26,\"start\":0}]'),(3576, 26, '2022-02-23 18:50:44', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.CustomerServiceImpl:queryByCondition', '[{\"page\":1,\"rows\":10,\"userId\":26,\"start\":0}]'),(3577, 26, '2022-02-23 18:51:57', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.CustomerDevPlanServiceImpl:save', '[{\"id\":3,\"plantime\":\"2022-02-23\",\"plansubject\":\"1111\",\"plantype\":\"电话沟通\",\"plandetails\":\"1、341423\\r\\n2、14214\\r\\n3、答复\",\"remark\":\"11\",\"customer\":{\"id\":17},\"inputuser\":{\"id\":26,\"username\":\"test\",\"realname\":\"test\",\"password\":\"000000\",\"tel\":\"13372553124\",\"email\":\"24552121@163.com\",\"inputtime\":\"2022-02-23\",\"state\":true,\"admin\":false},\"inputtime\":\"2022-02-23\",\"type\":0}]'),(3578, 26, '2022-02-23 18:51:57', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.CustomerDevPlanServiceImpl:queryPontentialDevPlanByCondition', '[{\"page\":1,\"rows\":10,\"userId\":26,\"start\":0}]'),(3579, 26, '2022-02-23 18:52:04', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.CustomerDevPlanServiceImpl:update', '[{\"id\":3,\"plantime\":\"2022-02-23\",\"plansubject\":\"1111\",\"plantype\":\"电话沟通\",\"plandetails\":\"1、341423\\r\\n2、14214\\r\\n3、答复\",\"traceresult\":2,\"remark\":\"11\",\"customer\":{\"id\":17}}]'),(3580, 26, '2022-02-23 18:52:05', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.CustomerDevPlanServiceImpl:queryPontentialDevPlanByCondition', '[{\"page\":1,\"rows\":10,\"userId\":26,\"start\":0}]'),(3581, 26, '2022-02-23 18:52:09', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.CustomerDevPlanServiceImpl:queryPontentialDevPlanByCondition', '[{\"page\":1,\"rows\":10,\"userId\":26,\"start\":0}]'),(3582, 26, '2022-02-23 18:52:45', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.CustomerServiceImpl:queryCustomerByCondition', '[{\"page\":1,\"rows\":10,\"start\":0}]'),(3583, 26, '2022-02-23 18:52:49', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.ISystemDictionaryItemServiceImpl:queryBySn', '[\"plantype\"]'),(3584, 26, '2022-02-23 18:52:50', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.CustomerServiceImpl:queryByCondition', '[{\"userId\":26,\"start\":0}]'),(3585, 26, '2022-02-23 18:52:50', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.CustomerDevPlanServiceImpl:queryDevPlanByCondition', '[{\"page\":1,\"rows\":10,\"userId\":26,\"start\":0}]'),(3586, 26, '2022-02-23 18:53:22', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.ISystemDictionaryItemServiceImpl:queryBySn', '[\"plantype\"]'),(3587, 26, '2022-02-23 18:53:23', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.CustomerServiceImpl:queryByCondition', '[{\"userId\":26,\"start\":0}]'),(3588, 26, '2022-02-23 18:53:23', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.CustomerDevPlanServiceImpl:queryDevPlanByCondition', '[{\"page\":1,\"rows\":10,\"userId\":26,\"start\":0}]'),(3589, 26, '2022-02-23 18:53:28', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.CustomerServiceImpl:queryResourcePoolByCondition', '[{\"page\":1,\"rows\":10,\"start\":0}]'),(3590, 26, '2022-02-23 18:53:31', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.OrderBillServiceImpl:queryByCondition', '[{\"page\":1,\"rows\":10,\"start\":0}]'),(3591, 26, '2022-02-23 18:53:31', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.CustomerServiceImpl:selectForOrder', '[]'),(3592, 26, '2022-02-23 18:53:31', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.EmployeeServiceImpl:sellerList', '[]'),(3593, 26, '2022-02-23 18:53:57', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.CustomerServiceImpl:selectForOrder', '[]'),(3594, 26, '2022-02-23 18:53:57', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.ContractServiceImpl:queryByCondition', '[{\"page\":1,\"rows\":10,\"start\":0}]'),(3595, 26, '2022-02-23 18:53:57', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.EmployeeServiceImpl:sellerList', '[]'),(3596, 26, '2022-02-23 18:55:06', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.OrderBillServiceImpl:insert', '[{\"id\":4,\"signtime\":\"2022-02-23\",\"customer\":{\"id\":15},\"seller\":{\"id\":26},\"totalsum\":\"20000\",\"bargainmoney\":\"2000\",\"intro\":\"412\",\"file\":\"/upload/fa0e04ef-3505-43fc-a0f9-38f4f8516865.octet-stream\",\"createtime\":\"2022-02-23\",\"status\":0}]'),(3597, 26, '2022-02-23 18:55:06', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.OrderBillServiceImpl:queryByCondition', '[{\"page\":1,\"rows\":10,\"start\":0}]'),(3598, NULL, '2022-02-23 18:55:11', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.EmployeeServiceImpl:queryByLogin', '[\"admin\",\"admin\"]'),(3599, 1, '2022-02-23 18:55:15', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.PermissionServiceImpl:queryPermissionByEmpId', '[1]'),(3600, 1, '2022-02-23 18:55:15', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.MenuServiceImpl:queryForMenu', '[]'),(3601, 1, '2022-02-23 18:55:18', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.DepartmentServiceImpl:queryDeptForEmp', '[]'),(3602, 1, '2022-02-23 18:55:18', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.RoleServiceImpl:queryRoleForEmp', '[]'),(3603, 1, '2022-02-23 18:55:19', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.EmployeeServiceImpl:queryByCondition', '[{\"page\":1,\"rows\":10,\"start\":0}]'),(3604, 1, '2022-02-23 18:55:51', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.EmployeeServiceImpl:save', '[{\"id\":28,\"username\":\"tt1\",\"realname\":\"zhaoliu\",\"password\":\"000000\",\"tel\":\"1412\",\"email\":\"412\",\"dept\":{\"id\":10},\"inputtime\":\"2022-02-23\",\"state\":true,\"admin\":false,\"roleList\":[{\"id\":9}]}]'),(3605, 1, '2022-02-23 18:55:55', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.DepartmentServiceImpl:listTree', '[]'),(3606, 1, '2022-02-23 18:55:55', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.DepartmentServiceImpl:list', '[{\"page\":1,\"rows\":10,\"start\":0}]'),(3607, 1, '2022-02-23 18:55:55', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.EmployeeServiceImpl:listManager', '[]'),(3608, 1, '2022-02-23 18:55:56', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.RoleServiceImpl:queryRoleForPage', '[{\"page\":1,\"rows\":10,\"start\":0}]'),(3609, 1, '2022-02-23 18:55:56', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.PermissionServiceImpl:queryByCondition', '[{\"page\":1,\"rows\":10,\"start\":0}]'),(3610, 1, '2022-02-23 18:55:58', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.PermissionServiceImpl:queryPermissionsByRid', '[9]'),(3611, 1, '2022-02-23 18:56:02', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.PermissionServiceImpl:queryByCondition', '[{\"page\":2,\"rows\":10,\"start\":10}]'),(3612, 1, '2022-02-23 18:56:06', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.PermissionServiceImpl:queryByCondition', '[{\"page\":3,\"rows\":10,\"start\":20}]'),(3613, 1, '2022-02-23 18:56:15', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.PermissionServiceImpl:queryByCondition', '[{\"page\":4,\"rows\":10,\"start\":30}]'),(3614, 1, '2022-02-23 18:56:45', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.PermissionServiceImpl:queryByCondition', '[{\"page\":5,\"rows\":10,\"start\":40}]'),(3615, 1, '2022-02-23 18:56:48', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.PermissionServiceImpl:queryByCondition', '[{\"page\":6,\"rows\":10,\"start\":50}]'),(3616, 1, '2022-02-23 18:57:04', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.RoleServiceImpl:modifyRoleInfo', '[{\"id\":9,\"name\":\"销售主管\",\"sn\":\"XRZG\",\"permissionList\":[{\"id\":22},{\"id\":30},{\"id\":39},{\"id\":45},{\"id\":51}]}]'),(3617, 1, '2022-02-23 18:57:05', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.RoleServiceImpl:queryRoleForPage', '[{\"page\":1,\"rows\":10,\"start\":0}]'),(3618, 1, '2022-02-23 18:57:07', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.PermissionServiceImpl:queryPermissionsByRid', '[6]'),(3619, 1, '2022-02-23 18:58:11', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.PermissionServiceImpl:queryPermissionsByRid', '[6]'),(3620, 1, '2022-02-23 18:58:35', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.RoleServiceImpl:modifyRoleInfo', '[{\"id\":6,\"name\":\"市场专员\",\"sn\":\"MS\",\"permissionList\":[{\"id\":23},{\"id\":24},{\"id\":25},{\"id\":26},{\"id\":27},{\"id\":28},{\"id\":29},{\"id\":31},{\"id\":32},{\"id\":33},{\"id\":34},{\"id\":35},{\"id\":36},{\"id\":37},{\"id\":38},{\"id\":40},{\"id\":41},{\"id\":42},{\"id\":43},{\"id\":44},{\"id\":46},{\"id\":47},{\"id\":48},{\"id\":49},{\"id\":50},{\"id\":52},{\"id\":53},{\"id\":56}]}]'),(3621, 1, '2022-02-23 18:58:36', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.RoleServiceImpl:queryRoleForPage', '[{\"page\":1,\"rows\":10,\"start\":0}]'),(3622, 1, '2022-02-23 18:58:44', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.EmployeeServiceImpl:queryRoleIdsByEmpId', '[1]'),(3623, 1, '2022-02-23 18:58:47', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.EmployeeServiceImpl:update', '[{\"id\":1,\"username\":\"admin\",\"realname\":\"超级管理员\",\"tel\":\"17839934031\",\"email\":\"780798160@qq.com\",\"dept\":{\"id\":4}}]'),(3624, 1, '2022-02-23 18:58:53', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.EmployeeServiceImpl:queryByCondition', '[{\"page\":1,\"rows\":10,\"start\":0}]'),(3625, NULL, '2022-02-23 18:59:03', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.EmployeeServiceImpl:queryByLogin', '[\"tt1\",\"000000\"]'),(3626, 28, '2022-02-23 18:59:06', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.PermissionServiceImpl:queryPermissionByEmpId', '[28]'),(3627, 28, '2022-02-23 18:59:06', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.MenuServiceImpl:queryForMenu', '[]'),(3628, NULL, '2022-02-23 19:03:58', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.EmployeeServiceImpl:queryByLogin', '[\"tt1\",\"000000\"]'),(3629, 28, '2022-02-23 19:04:01', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.PermissionServiceImpl:queryPermissionByEmpId', '[28]'),(3630, 28, '2022-02-23 19:04:01', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.MenuServiceImpl:queryForMenu', '[]'),(3631, 28, '2022-02-23 19:04:04', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.PermissionServiceImpl:selectAll', '[]'),(3632, 28, '2022-02-23 19:04:36', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.EmployeeServiceImpl:selectByPotential', '[]'),(3633, 28, '2022-02-23 19:04:36', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.EmployeeServiceImpl:selectByPotential', '[]'),(3634, 28, '2022-02-23 19:04:36', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.ISystemDictionaryItemServiceImpl:queryBySn', '[\"job\"]'),(3635, 28, '2022-02-23 19:04:36', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.ISystemDictionaryItemServiceImpl:queryBySn', '[\"salaryLevel\"]'),(3636, 28, '2022-02-23 19:04:36', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.ISystemDictionaryItemServiceImpl:queryBySn', '[\"customerSource\"]'),(3637, 28, '2022-02-23 19:04:36', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.CustomerServiceImpl:queryByCondition', '[{\"page\":1,\"rows\":10,\"start\":0}]'),(3638, 28, '2022-02-23 19:05:01', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.ISystemDictionaryItemServiceImpl:queryBySn', '[\"job\"]'),(3639, 28, '2022-02-23 19:05:01', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.ISystemDictionaryItemServiceImpl:queryBySn', '[\"salaryLevel\"]'),(3640, 28, '2022-02-23 19:05:01', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.ISystemDictionaryItemServiceImpl:queryBySn', '[\"customerSource\"]'),(3641, 28, '2022-02-23 19:05:01', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.EmployeeServiceImpl:selectByPotential', '[]'),(3642, 28, '2022-02-23 19:05:01', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.EmployeeServiceImpl:selectByPotential', '[]'),(3643, 28, '2022-02-23 19:05:02', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.CustomerServiceImpl:queryCustomerByCondition', '[{\"page\":1,\"rows\":10,\"start\":0}]'),(3644, 28, '2022-02-23 19:05:05', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.ISystemDictionaryItemServiceImpl:queryBySn', '[\"plantype\"]'),(3645, 28, '2022-02-23 19:05:05', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.CustomerServiceImpl:queryByCondition', '[{\"start\":0}]'),(3646, 28, '2022-02-23 19:05:05', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.CustomerDevPlanServiceImpl:queryPontentialDevPlanByCondition', '[{\"page\":1,\"rows\":10,\"start\":0}]'),(3647, 28, '2022-02-23 19:05:08', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.ISystemDictionaryItemServiceImpl:queryBySn', '[\"plantype\"]'),(3648, 28, '2022-02-23 19:05:08', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.CustomerServiceImpl:queryByCondition', '[{\"start\":0}]'),(3649, 28, '2022-02-23 19:05:08', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.CustomerDevPlanServiceImpl:queryDevPlanByCondition', '[{\"page\":1,\"rows\":10,\"start\":0}]'),(3650, 28, '2022-02-23 19:05:10', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.ISystemDictionaryItemServiceImpl:queryBySn', '[\"job\"]'),(3651, 28, '2022-02-23 19:05:10', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.ISystemDictionaryItemServiceImpl:queryBySn', '[\"salaryLevel\"]'),(3652, 28, '2022-02-23 19:05:10', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.ISystemDictionaryItemServiceImpl:queryBySn', '[\"customerSource\"]'),(3653, 28, '2022-02-23 19:05:10', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.CustomerServiceImpl:queryResourcePoolByCondition', '[{\"page\":1,\"rows\":10,\"start\":0}]'),(3654, NULL, '2022-02-23 19:09:39', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.EmployeeServiceImpl:queryByLogin', '[\"admin\",\"admin\"]'),(3655, 1, '2022-02-23 19:09:44', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.PermissionServiceImpl:queryPermissionByEmpId', '[1]'),(3656, 1, '2022-02-23 19:09:44', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.MenuServiceImpl:queryForMenu', '[]'),(3657, 1, '2022-02-23 19:09:48', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.PermissionServiceImpl:queryByCondition', '[{\"page\":1,\"rows\":10,\"start\":0}]'),(3658, 1, '2022-02-23 19:09:48', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.RoleServiceImpl:queryRoleForPage', '[{\"page\":1,\"rows\":10,\"start\":0}]'),(3659, 1, '2022-02-23 19:09:52', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.PermissionServiceImpl:queryPermissionsByRid', '[9]'),(3660, 1, '2022-02-23 19:09:55', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.PermissionServiceImpl:queryByCondition', '[{\"page\":2,\"rows\":10,\"start\":10}]'),(3661, 1, '2022-02-23 19:09:55', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.PermissionServiceImpl:queryByCondition', '[{\"page\":3,\"rows\":10,\"start\":20}]'),(3662, 1, '2022-02-23 19:09:55', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.PermissionServiceImpl:queryByCondition', '[{\"page\":4,\"rows\":10,\"start\":30}]'),(3663, 1, '2022-02-23 19:09:55', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.PermissionServiceImpl:queryByCondition', '[{\"page\":5,\"rows\":10,\"start\":40}]'),(3664, 1, '2022-02-23 19:09:56', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.PermissionServiceImpl:queryByCondition', '[{\"page\":6,\"rows\":10,\"start\":50}]'),(3665, 1, '2022-02-23 19:09:56', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.PermissionServiceImpl:queryByCondition', '[{\"page\":7,\"rows\":10,\"start\":60}]'),(3666, 1, '2022-02-23 19:09:56', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.PermissionServiceImpl:queryByCondition', '[{\"page\":8,\"rows\":10,\"start\":70}]'),(3667, 1, '2022-02-23 19:09:57', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.PermissionServiceImpl:queryByCondition', '[{\"page\":9,\"rows\":10,\"start\":80}]'),(3668, 1, '2022-02-23 19:09:57', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.PermissionServiceImpl:queryByCondition', '[{\"page\":10,\"rows\":10,\"start\":90}]'),(3669, 1, '2022-02-23 19:09:57', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.PermissionServiceImpl:queryByCondition', '[{\"page\":11,\"rows\":10,\"start\":100}]'),(3670, 1, '2022-02-23 19:09:57', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.PermissionServiceImpl:queryByCondition', '[{\"page\":12,\"rows\":10,\"start\":110}]'),(3671, 1, '2022-02-23 19:10:01', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.RoleServiceImpl:modifyRoleInfo', '[{\"id\":9,\"name\":\"销售主管\",\"sn\":\"XRZG\",\"permissionList\":[{\"id\":22},{\"id\":30},{\"id\":39},{\"id\":45},{\"id\":51},{\"id\":113}]}]'),(3672, 1, '2022-02-23 19:10:02', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.RoleServiceImpl:queryRoleForPage', '[{\"page\":1,\"rows\":10,\"start\":0}]'),(3673, 1, '2022-02-23 19:10:04', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.PermissionServiceImpl:queryPermissionsByRid', '[9]'),(3674, 1, '2022-02-23 19:10:10', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.PermissionServiceImpl:queryPermissionsByRid', '[6]'),(3675, NULL, '2022-02-23 19:10:20', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.EmployeeServiceImpl:queryByLogin', '[\"tt1\",\"000000\"]'),(3676, 28, '2022-02-23 19:10:20', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.PermissionServiceImpl:queryPermissionByEmpId', '[28]'),(3677, 28, '2022-02-23 19:10:20', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.MenuServiceImpl:queryForMenu', '[]'),(3678, 28, '2022-02-23 19:10:24', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.CustomerTransferServiceImpl:queryByCondition', '[{\"page\":1,\"rows\":10,\"start\":0}]'),(3679, 28, '2022-02-23 19:10:24', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.EmployeeServiceImpl:selectByInCharge', '[]'),(3680, 28, '2022-02-23 19:10:24', '0:0:0:0:0:0:0:1', 'cn.xy.crm.service.impl.CustomerServiceImpl:queryCustomerByCondition', '[{\"start\":0}]');
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `crm`.`menu` WRITE;
DELETE FROM `crm`.`menu`;
INSERT INTO `crm`.`menu` (`id`,`text`,`iconCls`,`checked`,`state`,`attributes`,`parent_id`,`function`) VALUES (1, '系统管理', NULL, NULL, NULL, NULL, NULL, NULL),(2, '员工管理', NULL, NULL, NULL, '{\"url\":\"/employee\"}', 1, 'cn.xy.crm.web.controller.EmployeeController:index'),(3, '角色管理', NULL, NULL, NULL, '{\"url\":\"/role\"}', 1, 'cn.xy.crm.web.controller.RoleController:index'),(4, '部门管理', NULL, NULL, NULL, '{\"url\":\"/department\"}', 1, 'cn.xy.crm.web.controller.DepartmentController:index'),(5, '数据字典', NULL, NULL, NULL, '{\"url\":\"/systemDictionary\"}', NULL, 'cn.xy.crm.web.controller.SystemDictionaryController:index'),(6, '任务模块', NULL, NULL, NULL, NULL, NULL, NULL),(7, '今日任务', NULL, NULL, NULL, '{\"url\":\"/task\"}', 6, 'cn.xy.crm.web.controller.TaskController:index'),(8, '网盘', NULL, NULL, NULL, '{\"url\":\"/netdisk\"}', 6, 'cn.xy.crm.web.controller.NetworkDiskController:index'),(9, '知识库', NULL, NULL, NULL, '{\"url\":\"/knowledge\"}', 6, 'cn.xy.crm.web.controller.KnowledgeController:index'),(10, '客户线索', NULL, NULL, NULL, '{\"url\":\"/clew\"}', 6, 'cn.xy.crm.web.controller.ClewController:index'),(11, '日历', NULL, NULL, NULL, '{\"url\":\"/calendar\"}', 6, 'cn.xy.crm.web.controller.CalendarController:index'),(12, '营销管理', NULL, NULL, NULL, NULL, NULL, NULL),(13, '潜在客户管理', NULL, NULL, NULL, '{\"url\":\"/potentialCustomer\"}', 12, 'cn.xy.crm.web.controller.PotentialCustomerController:index'),(14, '客户信息管理', NULL, NULL, NULL, '{\"url\":\"/customer\"}', 12, 'cn.xy.crm.web.controller.CustomerController:index'),(15, '客户移交记录', NULL, NULL, NULL, '{\"url\":\"/customerTransfer\"}', 12, 'cn.xy.crm.web.controller.CustomerTransferController:index'),(16, '潜在客户开发计划', NULL, NULL, NULL, '{\"url\":\"/potentialCustomerDevPlan\"}', 12, 'cn.xy.crm.web.controller.PontentialCustomerDevPlanController:index'),(17, '正式客户开发计划', NULL, NULL, NULL, '{\"url\":\"/customerDevPlan\"}', 12, 'cn.xy.crm.web.controller.CustomerDevPlanController:index'),(18, '客户资源池', NULL, NULL, NULL, '{\"url\":\"/customerResourcePool\"}', 12, 'cn.xy.crm.web.controller.CustomerResourcePoolController:index'),(19, '订单合同管理', NULL, NULL, NULL, NULL, NULL, NULL),(20, '订单管理', NULL, NULL, NULL, '{\"url\":\"/orderBill\"}', 19, 'cn.xy.crm.web.controller.OrderBillController:index'),(21, '合同管理', NULL, NULL, NULL, '{\"url\":\"/contract\"}', 19, 'cn.xy.crm.web.controller.ContractController:index'),(22, '售后管理', NULL, NULL, NULL, NULL, NULL, NULL),(23, '保修', NULL, NULL, NULL, '{\"url\":\"/guarantee\"}', 22, 'cn.xy.crm.web.controller.GuaranteeController:index'),(24, '报表管理', NULL, NULL, NULL, NULL, NULL, NULL),(25, '销售报表', NULL, NULL, NULL, '{\"url\":\"/contractmm\"}', 25, 'cn.xy.crm.web.controller.ContractChartController:index'),(26, '考勤管理', NULL, NULL, NULL, NULL, NULL, NULL),(27, '考勤签到', NULL, NULL, NULL, '{\"url\":\"/checkIn\"}', 26, 'cn.xy.crm.web.controller.CheckInController:index'),(28, '考勤记录', NULL, NULL, NULL, '{\"url\":\"/attendance\"}', 26, 'cn.xy.crm.web.controller.AttendanceController:index'),(29, '请假管理', NULL, NULL, NULL, '{\"url\":\"/vacate\"}', 26, 'cn.xy.crm.web.controller.VacateController:index'),(30, '工资管理', NULL, NULL, NULL, NULL, NULL, NULL),(31, '员工工资', NULL, NULL, NULL, '{\"url\":\"/salary\"}', 30, 'cn.xy.crm.web.controller.SalaryController:index'),(33, '客户移交记录', NULL, NULL, NULL, '{\"url\":\"/customerTransfer\"}', 12, 'cn.xy.crm.web.controller.CustomerTransferController:index');
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `crm`.`networkdisk` WRITE;
DELETE FROM `crm`.`networkdisk`;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `crm`.`orderbill` WRITE;
DELETE FROM `crm`.`orderbill`;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `crm`.`permission` WRITE;
DELETE FROM `crm`.`permission`;
INSERT INTO `crm`.`permission` (`id`,`name`,`resource`) VALUES (1, '员工ALL', 'cn.xy.crm.web.controller.EmployeeController:ALL'),(2, '员工主页', 'cn.xy.crm.web.controller.EmployeeController:index'),(3, '员工列表', 'cn.xy.crm.web.controller.EmployeeController:list'),(4, '员工新增', 'cn.xy.crm.web.controller.EmployeeController:save'),(5, '员工编辑', 'cn.xy.crm.web.controller.EmployeeController:update'),(6, '员工离职', 'cn.xy.crm.web.controller.EmployeeController:delete'),(7, '角色ALL', 'cn.xy.crm.web.controller.RoleController:ALL'),(8, '角色ALL', 'cn.xy.crm.web.controller.RoleController:index'),(9, '角色列表', 'cn.xy.crm.web.controller.RoleController:list'),(10, '角色新增', 'cn.xy.crm.web.controller.RoleController:save'),(11, '角色编辑', 'cn.xy.crm.web.controller.RoleController:edit'),(12, '角色删除', 'cn.xy.crm.web.controller.RoleController:delete'),(13, '任务模块ALL', 'cn.xy.crm.web.controller.TaskController:ALL'),(14, '任务模块主页', 'cn.xy.crm.web.controller.TaskController:index'),(15, '任务列表', 'cn.xy.crm.web.controller.TaskController:list'),(16, '分配任务', 'cn.xy.crm.web.controller.TaskController:save'),(17, '编辑任务', 'cn.xy.crm.web.controller.TaskController:update'),(18, '删除任务', 'cn.xy.crm.web.controller.TaskController:delete'),(19, '标记任务完成', 'cn.xy.crm.web.controller.TaskController:complete'),(20, '标记任务失败', 'cn.xy.crm.web.controller.TaskController:lose'),(21, '添加任务描述', 'cn.xy.crm.web.controller.TaskController:addDescribe'),(22, '潜在客户ALL', 'cn.xy.crm.web.controller.PotentialCustomerController:ALL'),(23, '潜在客户主页', 'cn.xy.crm.web.controller.PotentialCustomerController:index'),(24, '潜在客户列表', 'cn.xy.crm.web.controller.PotentialCustomerController:list'),(25, '潜在客户新增', 'cn.xy.crm.web.controller.PotentialCustomerController:save'),(26, '潜在客户编辑', 'cn.xy.crm.web.controller.PotentialCustomerController:update'),(27, '潜在客户移交', 'cn.xy.crm.web.controller.PotentialCustomerController:updateInCharge'),(28, '潜在客户开发失败', 'cn.xy.crm.web.controller.PotentialCustomerController:developFailed'),(29, '潜在客户转正', 'cn.xy.crm.web.controller.PotentialCustomerController:become'),(30, '客户ALL', 'cn.xy.crm.web.controller.CustomerController:ALL'),(31, '客户主页', 'cn.xy.crm.web.controller.CustomerController:index'),(32, '客户列表', 'cn.xy.crm.web.controller.CustomerController:list'),(33, '客户新增', 'cn.xy.crm.web.controller.CustomerController:save'),(34, '客户编辑', 'cn.xy.crm.web.controller.CustomerController:update'),(35, '客户移交', 'cn.xy.crm.web.controller.CustomerController:updateInCharge'),(36, '客户提交资源池', 'cn.xy.crm.web.controller.CustomerController:moveToResourcePool'),(37, '客户流失', 'cn.xy.crm.web.controller.CustomerController:customerLost'),(38, '客户信息导出', 'cn.xy.crm.web.controller.CustomerController:export'),(39, '潜在客户开发计划ALL', 'cn.xy.crm.web.controller.PontentialCustomerDevPlanController:ALL'),(40, '潜在客户开发计划主页', 'cn.xy.crm.web.controller.PontentialCustomerDevPlanController:index'),(41, '潜在客户开发计划列表', 'cn.xy.crm.web.controller.PontentialCustomerDevPlanController:list'),(42, '潜在客户开发计划增加', 'cn.xy.crm.web.controller.PontentialCustomerDevPlanController:save'),(43, '潜在客户开发计划编辑', 'cn.xy.crm.web.controller.PontentialCustomerDevPlanController:update'),(44, '潜在客户开发计划删除', 'cn.xy.crm.web.controller.PontentialCustomerDevPlanController:delete'),(45, '正式客户开发计划ALL', 'cn.xy.crm.web.controller.CustomerDevPlanController:ALL'),(46, '正式客户开发计划主页', 'cn.xy.crm.web.controller.CustomerDevPlanController:index'),(47, '正式客户开发计划列表', 'cn.xy.crm.web.controller.CustomerDevPlanController:list'),(48, '正式客户开发计划增加', 'cn.xy.crm.web.controller.CustomerDevPlanController:save'),(49, '正式客户开发计划编辑', 'cn.xy.crm.web.controller.CustomerDevPlanController:update'),(50, '正式客户开发计划删除', 'cn.xy.crm.web.controller.CustomerDevPlanController:delete'),(51, '客户资源池ALL', 'cn.xy.crm.web.controller.CustomerResourcePoolController:ALL'),(52, '客户资源池主页', 'cn.xy.crm.web.controller.CustomerResourcePoolController:index'),(53, '客户资源池列表', 'cn.xy.crm.web.controller.CustomerResourcePoolController:list'),(54, '客户资源池客户增加', 'cn.xy.crm.web.controller.CustomerResourcePoolController:save'),(55, '客户资源池客户编辑', 'cn.xy.crm.web.controller.CustomerResourcePoolController:update'),(56, '客户资源池客户吸纳', 'cn.xy.crm.web.controller.CustomerResourcePoolController:admit'),(57, '订单管理ALL', 'cn.xy.crm.web.controller.OrderBillController:ALL'),(58, '订单管理主页', 'cn.xy.crm.web.controller.OrderBillController:index'),(59, '订单列表', 'cn.xy.crm.web.controller.OrderBillController:list'),(60, '订单新增', 'cn.xy.crm.web.controller.OrderBillController:save'),(61, '订单编辑', 'cn.xy.crm.web.controller.OrderBillController:update'),(62, '订单删除', 'cn.xy.crm.web.controller.OrderBillController:delete'),(63, '订单本人审核', 'cn.xy.crm.web.controller.OrderBillController:checked'),(64, '订单部门审核', 'cn.xy.crm.web.controller.OrderBillController:'),(65, '订单财务审核', 'cn.xy.crm.web.controller.OrderBillController:'),(66, '订单拒绝审核', 'cn.xy.crm.web.controller.OrderBillController:noChecked'),(67, '生成合同', 'cn.xy.crm.web.controller.OrderBillController:doContract'),(68, '合同管理ALL', 'cn.xy.crm.web.controller.ContractController:ALL'),(69, '合同管理主页', 'cn.xy.crm.web.controller.ContractController:index'),(70, '合同列表', 'cn.xy.crm.web.controller.ContractController:list'),(71, '合同新增', 'cn.xy.crm.web.controller.ContractController:save'),(72, '合同编辑', 'cn.xy.crm.web.controller.ContractController:update'),(73, '合同删除', 'cn.xy.crm.web.controller.ContractController:delete'),(74, '合同本人审核', 'cn.xy.crm.web.controller.ContractController:checked'),(75, '合同部门审核', 'cn.xy.crm.web.controller.ContractController:'),(76, '合同财务审核', 'cn.xy.crm.web.controller.ContractController:'),(77, '合同拒绝审核', 'cn.xy.crm.web.controller.ContractController:noChecked'),(78, '生成维修单', 'cn.xy.crm.web.controller.ContractController:doContract'),(79, '保修管理ALL', 'cn.xy.crm.web.controller.GuaranteeController:ALL'),(80, '保修单主页', 'cn.xy.crm.web.controller.GuaranteeController:index'),(81, '保修单列表', 'cn.xy.crm.web.controller.GuaranteeController:list'),(82, '保修单编辑', 'cn.xy.crm.web.controller.GuaranteeController:update'),(83, '保修单删除', 'cn.xy.crm.web.controller.GuaranteeController:delete'),(84, '保修单延保', 'cn.xy.crm.web.controller.GuaranteeController:keep'),(85, '保修单明细列表', 'cn.xy.crm.web.controller.GuaranteeController:itemList'),(86, '保修单明细新增', 'cn.xy.crm.web.controller.GuaranteeController:itemSave'),(87, '保修单明细编辑', 'cn.xy.crm.web.controller.GuaranteeController:itemUpdate'),(88, '保修单明细删除', 'cn.xy.crm.web.controller.GuaranteeController:itemDelete'),(89, '考勤签到ALL', 'cn.xy.crm.web.controller.CheckInController:ALL'),(90, '考勤签到主页', 'cn.xy.crm.web.controller.CheckInController:index'),(91, '考勤签到列表', 'cn.xy.crm.web.controller.CheckInController:list'),(92, '考勤签到', 'cn.xy.crm.web.controller.CheckInController:signIn'),(93, '考勤签退', 'cn.xy.crm.web.controller.CheckInController:signOut'),(94, '考勤签到补签', 'cn.xy.crm.web.controller.CheckInController:addCheckIn'),(95, '考勤记录ALL', 'cn.xy.crm.web.controller.AttendanceController:ALL'),(96, '考勤记录主页', 'cn.xy.crm.web.controller.AttendanceController:index'),(97, '考勤记录列表', 'cn.xy.crm.web.controller.AttendanceController:list'),(98, '考勤记录新增', 'cn.xy.crm.web.controller.AttendanceController:save'),(99, '考勤记录编辑', 'cn.xy.crm.web.controller.AttendanceController:update'),(100, '考勤记录删除', 'cn.xy.crm.web.controller.AttendanceController:delete'),(101, '考勤记录导入', 'cn.xy.crm.web.controller.AttendanceController:updateAttendance'),(102, '请假管理ALL', 'cn.xy.crm.web.controller.VacateController:ALL'),(103, '请假管理主页', 'cn.xy.crm.web.controller.VacateController:index'),(104, '请假管理列表', 'cn.xy.crm.web.controller.VacateController:list'),(105, '请假记录新增', 'cn.xy.crm.web.controller.VacateController:save'),(106, '请假记录编辑', 'cn.xy.crm.web.controller.VacateController:update'),(107, '请假记录删除', 'cn.xy.crm.web.controller.VacateController:delete'),(108, '请假记录审核', 'cn.xy.crm.web.controller.VacateController:audit'),(109, '员工工资ALL', 'cn.xy.crm.web.controller.SalaryController:ALL'),(110, '员工工资主页', 'cn.xy.crm.web.controller.SalaryController:index'),(111, '员工工资列表', 'cn.xy.crm.web.controller.SalaryController:list'),(112, '员工工资导入', 'cn.xy.crm.web.controller.SalaryController:upload'),(113, '客户移交记录ALL', 'cn.xy.crm.web.controller.CustomerTransferController:ALL'),(114, '客户移交记录主页', 'cn.xy.crm.web.controller.CustomerTransferController:index'),(115, '客户移交记录列表', 'cn.xy.crm.web.controller.CustomerTransferController:list'),(116, '客户移交新增', 'cn.xy.crm.web.controller.CustomerTransferController:save');
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `crm`.`role` WRITE;
DELETE FROM `crm`.`role`;
INSERT INTO `crm`.`role` (`id`,`name`,`sn`) VALUES (1, '人事专员', 'HR'),(6, '市场专员', 'MS'),(9, '销售主管', 'XRZG');
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `crm`.`role_permission` WRITE;
DELETE FROM `crm`.`role_permission`;
INSERT INTO `crm`.`role_permission` (`id`,`r_id`,`p_id`) VALUES (49, 6, 23),(50, 6, 24),(51, 6, 25),(52, 6, 26),(53, 6, 27),(54, 6, 28),(55, 6, 29),(56, 6, 31),(57, 6, 32),(58, 6, 33),(59, 6, 34),(60, 6, 35),(61, 6, 36),(62, 6, 37),(63, 6, 38),(64, 6, 40),(65, 6, 41),(66, 6, 42),(67, 6, 43),(68, 6, 44),(69, 6, 46),(70, 6, 47),(71, 6, 48),(72, 6, 49),(73, 6, 50),(74, 6, 52),(75, 6, 53),(76, 6, 56),(77, 9, 22),(78, 9, 30),(79, 9, 39),(80, 9, 45),(81, 9, 51),(82, 9, 113);
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `crm`.`salary` WRITE;
DELETE FROM `crm`.`salary`;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `crm`.`systemdictionary` WRITE;
DELETE FROM `crm`.`systemdictionary`;
INSERT INTO `crm`.`systemdictionary` (`id`,`sn`,`name`,`intro`) VALUES (1, 'job', '职业', NULL),(2, 'salarylevel', '收入水平(月)', NULL),(3, 'customersource', '客户来源', NULL),(4, 'plantype', '实施方式', NULL);
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `crm`.`systemdictionaryitem` WRITE;
DELETE FROM `crm`.`systemdictionaryitem`;
INSERT INTO `crm`.`systemdictionaryitem` (`id`,`name`,`intro`,`parent_id`,`state`) VALUES (1, '司机', '', 1, 0),(2, '教师', '', 1, 0),(3, '程序员', '', 1, 0),(4, '清洁工', '', 1, 0),(5, '白领', '', 1, 0),(6, '歌手', '', 1, 0),(7, '演员', '', 1, 0),(8, '公知', '', 1, 0),(9, '银行职工', '', 1, 0),(10, '农名工', '', 1, 1),(13, '学徒', '', 1, 1),(14, '化妆师', '', 1, 0),(23, '4000以下', '', 2, 0),(24, '4000-8000', '', 2, 0),(25, '8000-12000', '', 2, 0),(26, '12000以上', '', 2, 0),(28, '报纸', '', 3, 0),(29, '电台', '', 3, 0),(30, '广播', '', 3, 0),(31, '微博', '', 3, 0),(32, '厨师', '', 1, 0),(33, '电话沟通', '', 4, 0),(34, '邀约上门', '', 4, 0);
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `crm`.`task` WRITE;
DELETE FROM `crm`.`task`;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `crm`.`vacate` WRITE;
DELETE FROM `crm`.`vacate`;
UNLOCK TABLES;
COMMIT;
