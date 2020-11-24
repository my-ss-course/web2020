-- phpMyAdmin SQL Dump
-- version 4.4.10
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2020-11-24 13:56:14
-- 服务器版本： 5.7.12
-- PHP Version: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `web2020`
--

-- --------------------------------------------------------

--
-- 表的结构 `web2020_admin`
--

CREATE TABLE IF NOT EXISTS `web2020_admin` (
  `id` mediumint(6) unsigned NOT NULL,
  `username` varchar(20) NOT NULL DEFAULT '',
  `password` varchar(32) NOT NULL DEFAULT '',
  `encrypt` varchar(6) NOT NULL DEFAULT '',
  `lastloginip` int(10) NOT NULL DEFAULT '0',
  `lastlogintime` int(10) unsigned NOT NULL DEFAULT '0',
  `email` varchar(40) NOT NULL DEFAULT '',
  `mobile` varchar(11) NOT NULL DEFAULT '',
  `realname` varchar(50) NOT NULL DEFAULT '',
  `openid` varchar(255) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效(2:无效,1:有效)',
  `updatetime` int(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `web2020_admin`
--

INSERT INTO `web2020_admin` (`id`, `username`, `password`, `encrypt`, `lastloginip`, `lastlogintime`, `email`, `mobile`, `realname`, `openid`, `status`, `updatetime`) VALUES
(1, 'admin', '1b0f51062fbe0ec6693dc392a419f5cc', '', 0, 1606209790, '', '', '', '', 1, 1477623198),
(2, 'admin2', '1b0f51062fbe0ec6693dc392a419f5cc', '', 0, 1606219481, '', '', '', '', 1, 1477624790),
(3, 'houqin', '1b0f51062fbe0ec6693dc392a419f5cc', '', 0, 1606221290, '', '', '', '', 1, 1477625400),
(4, 'sushe', '1b0f51062fbe0ec6693dc392a419f5cc', '', 0, 1606221359, '', '', '', '', 1, 1479969550);

-- --------------------------------------------------------

--
-- 表的结构 `web2020_admin_group`
--

CREATE TABLE IF NOT EXISTS `web2020_admin_group` (
  `id` tinyint(3) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text,
  `rules` varchar(500) NOT NULL DEFAULT '' COMMENT '用户组拥有的规则id，多个规则 , 隔开',
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `web2020_admin_group`
--

INSERT INTO `web2020_admin_group` (`id`, `name`, `description`, `rules`, `listorder`, `updatetime`) VALUES
(1, '系统管理员', '管理系统基本配置', '', 0, 1477622552),
(2, '后勤管理员', '管理宿舍楼可用状态等', '32,31,33,34,35', 0, 1476067479),
(3, '宿舍管理员', '分配宿舍', '31,33,34,35', 0, 1479969527),
(4, '校领导', '查询统计功能', '', 0, 1479969527);

-- --------------------------------------------------------

--
-- 表的结构 `web2020_admin_group_access`
--

CREATE TABLE IF NOT EXISTS `web2020_admin_group_access` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `group_id` mediumint(8) unsigned NOT NULL COMMENT '用户组id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `web2020_admin_group_access`
--

INSERT INTO `web2020_admin_group_access` (`uid`, `group_id`) VALUES
(2, 1),
(3, 2),
(3, 3),
(4, 3);

-- --------------------------------------------------------

--
-- 表的结构 `web2020_admin_log`
--

CREATE TABLE IF NOT EXISTS `web2020_admin_log` (
  `id` int(10) unsigned NOT NULL,
  `m` varchar(15) NOT NULL,
  `c` varchar(20) NOT NULL,
  `a` varchar(20) NOT NULL,
  `querystring` varchar(255) NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(20) NOT NULL,
  `ip` int(10) NOT NULL,
  `time` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `web2020_admin_log`
--

INSERT INTO `web2020_admin_log` (`id`, `m`, `c`, `a`, `querystring`, `userid`, `username`, `ip`, `time`) VALUES
(1, 'admin', 'Room', 'checkin', '', 4, 'sushe', 0, 1606221593),
(2, 'admin', 'Room', 'checkin', '', 4, 'sushe', 0, 1606221594),
(3, 'admin', 'Room', 'checkin', '', 4, 'sushe', 0, 1606221595),
(4, 'admin', 'Room', 'checkin', '', 4, 'sushe', 0, 1606221621),
(5, 'admin', 'Room', 'checkout', '', 4, 'sushe', 0, 1606221622),
(6, 'admin', 'Room', 'checkin', '', 4, 'sushe', 0, 1606221623),
(7, 'admin', 'Room', 'checkin', '', 4, 'sushe', 0, 1606221627),
(8, 'admin', 'Room', 'checkout', '', 4, 'sushe', 0, 1606221627),
(9, 'admin', 'Room', 'checkout', '', 4, 'sushe', 0, 1606221635);

-- --------------------------------------------------------

--
-- 表的结构 `web2020_dorm_bed`
--

CREATE TABLE IF NOT EXISTS `web2020_dorm_bed` (
  `id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL COMMENT 'room表的id',
  `bedNo` varchar(100) NOT NULL COMMENT '床位编号',
  `is_distributed` int(11) NOT NULL COMMENT '是否已分配',
  `student_id` int(11) NOT NULL COMMENT '学生表student的id',
  `status` int(11) NOT NULL COMMENT '是否可用,1为可用，0为不可用',
  `comments` varchar(500) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `web2020_dorm_bed`
--

INSERT INTO `web2020_dorm_bed` (`id`, `room_id`, `bedNo`, `is_distributed`, `student_id`, `status`, `comments`) VALUES
(1, 1, '1号', 1, 1, 1, '');

-- --------------------------------------------------------

--
-- 表的结构 `web2020_dorm_building`
--

CREATE TABLE IF NOT EXISTS `web2020_dorm_building` (
  `id` int(11) NOT NULL,
  `buildingNo` varchar(50) NOT NULL COMMENT '宿舍楼号',
  `buildingName` varchar(200) NOT NULL COMMENT '楼名称',
  `status` int(11) NOT NULL COMMENT '是否有效，0-不可见，1-有效'
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `web2020_dorm_building`
--

INSERT INTO `web2020_dorm_building` (`id`, `buildingNo`, `buildingName`, `status`) VALUES
(1, '5', '5号楼', 1),
(2, '8', '8号楼', 1),
(3, '9', '9号楼', 1),
(4, '10', '10号楼', 0),
(5, '13', '13号楼', 1),
(6, '14', '14号楼', 1);

-- --------------------------------------------------------

--
-- 表的结构 `web2020_dorm_room`
--

CREATE TABLE IF NOT EXISTS `web2020_dorm_room` (
  `id` int(11) NOT NULL,
  `building_id` int(11) NOT NULL COMMENT '楼id,对应building表的id主键',
  `gender` int(11) NOT NULL COMMENT '性别: 1男，0女',
  `roomName` varchar(100) NOT NULL COMMENT '宿舍名称',
  `floor` varchar(100) NOT NULL COMMENT '楼层/单元',
  `status` int(11) NOT NULL COMMENT '可分配状态，1可分配，0不可分配',
  `emptyBedNum` int(11) NOT NULL COMMENT '空床数',
  `totalBenNum` int(11) NOT NULL COMMENT '总床位数'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `web2020_dorm_room`
--

INSERT INTO `web2020_dorm_room` (`id`, `building_id`, `gender`, `roomName`, `floor`, `status`, `emptyBedNum`, `totalBenNum`) VALUES
(1, 1, 1, '5101', '5号楼1楼', 1, 0, 4);

-- --------------------------------------------------------

--
-- 表的结构 `web2020_menu`
--

CREATE TABLE IF NOT EXISTS `web2020_menu` (
  `id` smallint(6) unsigned NOT NULL,
  `name` char(40) NOT NULL DEFAULT '',
  `parentid` smallint(6) DEFAULT '0',
  `icon` varchar(20) NOT NULL DEFAULT '',
  `c` varchar(20) DEFAULT NULL,
  `a` varchar(20) DEFAULT NULL,
  `data` varchar(50) NOT NULL DEFAULT '',
  `tip` varchar(255) NOT NULL DEFAULT '' COMMENT '提示',
  `group` varchar(50) DEFAULT '' COMMENT '分组',
  `listorder` smallint(6) unsigned NOT NULL DEFAULT '999',
  `display` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否显示(1:显示,2:不显示)',
  `updatetime` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `web2020_menu`
--

INSERT INTO `web2020_menu` (`id`, `name`, `parentid`, `icon`, `c`, `a`, `data`, `tip`, `group`, `listorder`, `display`, `updatetime`) VALUES
(1, '管理设置(系统管理员)', 0, 'xe6a3', 'Admin', 'admin', '', '', '', 1, 1, 1476175413),
(2, '用户管理', 1, '', 'Admin', 'index', '', '', '', 0, 1, 1476175413),
(3, '详情', 2, '', 'Admin', 'info', '', '', '', 0, 2, 1476175413),
(4, '添加', 2, '', 'Admin', 'add', '', '', '', 0, 2, 1476175413),
(5, '修改', 2, '', 'Admin', 'edit', '', '', '', 0, 2, 1476175413),
(6, '删除', 2, '', 'Admin', 'del', '', '', '', 0, 2, 1476175413),
(7, '分组管理', 1, '', 'Group', 'index', '', '', '', 0, 1, 1476175413),
(8, '详情', 7, '', 'Group', 'info', '', '', '', 0, 2, 1476175413),
(9, '添加', 7, '', 'Group', 'add', '', '', '', 0, 2, 1476175413),
(10, '修改', 7, '', 'Group', 'edit', '', '', '', 0, 2, 1476175413),
(11, '删除', 7, '', 'Group', 'del', '', '', '', 0, 2, 1476175413),
(12, '菜单管理', 18, '', 'Menu', 'index', '', '', '', 0, 1, 1476175413),
(13, '查看', 12, '', 'Menu', 'info', '', '', '', 0, 2, 1476175413),
(14, '添加', 12, '', 'Menu', 'add', '', '', '', 0, 2, 1476175413),
(15, '修改', 12, '', 'Menu', 'edit', '', '', '', 0, 2, 1476175413),
(16, '删除', 12, '', 'Menu', 'del', '', '', '', 0, 2, 1476175413),
(18, '系统设置（系统管理员）', 0, 'xe6a3', 'Menu', 'index', '', '', '', 2, 1, 1476175413),
(22, '权限设置', 2, '', 'Group', 'rule', '', '', '', 999, 2, 1476175413),
(23, '个人设置', 0, 'xe761', 'Admin', 'public_edit_info', '', '', '', 4, 1, 1476175413),
(27, '日志管理', 18, '', 'Log', 'index', '', '', '', 999, 1, 1476175413),
(31, '系统首页', 0, 'xe761', 'Index', 'index', '', '', '', 0, 1, 1476175413),
(32, '后勤管理（后勤管理员）', 0, 'xe6a3', 'Building', 'index', '', '', '', 2, 1, 1476175413),
(33, '宿舍管理（宿舍管理员）', 0, 'xe6a3', 'Room', 'index', '', '', '', 2, 1, 1476175413),
(34, '入住', 33, '', 'Room', 'checkin', '', '', '', 2, 1, 1476175413),
(35, '退宿', 33, '', 'Room', 'checkout', '', '', '', 2, 1, 1476175413);

-- --------------------------------------------------------

--
-- 表的结构 `web2020_student`
--

CREATE TABLE IF NOT EXISTS `web2020_student` (
  `id` int(11) NOT NULL,
  `studentNo` varchar(50) NOT NULL COMMENT ' 学号',
  `studentName` varchar(100) NOT NULL COMMENT '姓名',
  `gender` int(11) NOT NULL COMMENT '性别 0女，1男',
  `code` varchar(10) NOT NULL COMMENT '随机校验码',
  `year` int(11) NOT NULL COMMENT '入学年月',
  `roomstatus` int(11) NOT NULL DEFAULT '0' COMMENT '目前宿舍状态',
  `keystatus` int(11) NOT NULL DEFAULT '0' COMMENT '钥匙状态',
  `onlinestatus` int(11) NOT NULL DEFAULT '0' COMMENT '是否可以在线选，1可以，0不可以'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `web2020_student`
--

INSERT INTO `web2020_student` (`id`, `studentNo`, `studentName`, `gender`, `code`, `year`, `roomstatus`, `keystatus`, `onlinestatus`) VALUES
(1, '1000000101', '张三', 1, '123456', 2020, 0, 0, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `web2020_admin`
--
ALTER TABLE `web2020_admin`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `web2020_admin_group`
--
ALTER TABLE `web2020_admin_group`
  ADD PRIMARY KEY (`id`),
  ADD KEY `listorder` (`listorder`);

--
-- Indexes for table `web2020_admin_group_access`
--
ALTER TABLE `web2020_admin_group_access`
  ADD UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `group_id` (`group_id`);

--
-- Indexes for table `web2020_admin_log`
--
ALTER TABLE `web2020_admin_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `web2020_dorm_bed`
--
ALTER TABLE `web2020_dorm_bed`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `web2020_dorm_building`
--
ALTER TABLE `web2020_dorm_building`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `web2020_dorm_room`
--
ALTER TABLE `web2020_dorm_room`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `web2020_menu`
--
ALTER TABLE `web2020_menu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `listorder` (`listorder`),
  ADD KEY `parentid` (`parentid`);

--
-- Indexes for table `web2020_student`
--
ALTER TABLE `web2020_student`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `web2020_admin`
--
ALTER TABLE `web2020_admin`
  MODIFY `id` mediumint(6) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `web2020_admin_group`
--
ALTER TABLE `web2020_admin_group`
  MODIFY `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `web2020_admin_log`
--
ALTER TABLE `web2020_admin_log`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `web2020_dorm_bed`
--
ALTER TABLE `web2020_dorm_bed`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `web2020_dorm_building`
--
ALTER TABLE `web2020_dorm_building`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `web2020_dorm_room`
--
ALTER TABLE `web2020_dorm_room`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `web2020_menu`
--
ALTER TABLE `web2020_menu`
  MODIFY `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=36;
--
-- AUTO_INCREMENT for table `web2020_student`
--
ALTER TABLE `web2020_student`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
