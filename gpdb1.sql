-- MySQL dump 10.13  Distrib 5.7.21, for Win64 (x86_64)
--
-- Host: localhost    Database: gpdb
-- ------------------------------------------------------
-- Server version	5.7.21

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
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account` (
  `acct_num` int(11) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `build_information`
--

DROP TABLE IF EXISTS `build_information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `build_information` (
  `code` char(2) NOT NULL COMMENT '编号',
  `name` varchar(50) DEFAULT NULL COMMENT '教学楼名称',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='教学楼信息表（build_information）';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `build_information`
--

LOCK TABLES `build_information` WRITE;
/*!40000 ALTER TABLE `build_information` DISABLE KEYS */;
INSERT INTO `build_information` VALUES ('A1','第一教学楼'),('A2','第二教学楼'),('A3','第三教学楼'),('A4','第四教学楼'),('A5','综合教学楼'),('A6','光电信息与计算机工程学院大楼'),('A7','演讲厅'),('A8','健身房'),('B1','环境与建筑学院大楼'),('B2','能源与动力学院大楼'),('B3','机械学院大楼'),('BH','大礼堂'),('MH','音乐堂'),('SH','小礼堂'),('SW','游泳池');
/*!40000 ALTER TABLE `build_information` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_information`
--

DROP TABLE IF EXISTS `course_information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_information` (
  `courseID` char(10) NOT NULL COMMENT '课程代号：10字符固定长度',
  `courseName` varchar(100) NOT NULL COMMENT '课程名称',
  `courseTeacher` char(10) DEFAULT NULL COMMENT '代课老师：此处为教师唯一编号(UniqueClientID)。外键于教师信息表',
  `publishDate` varchar(30) DEFAULT NULL,
  `startDate` varchar(30) DEFAULT NULL,
  `endDate` varchar(30) DEFAULT NULL,
  `venue` varchar(60) DEFAULT NULL COMMENT '例如：综合教学楼405教室;格式：综合教学楼（405教室）',
  `period` varchar(50) DEFAULT NULL COMMENT '例如：该学期内每周三15:00-17:00;格式：周三（15:00-17:00）',
  `examID` char(10) DEFAULT NULL COMMENT '外键于考试信息表',
  `chosen` int(11) DEFAULT NULL COMMENT '历史选课人数',
  `collected` int(11) DEFAULT NULL COMMENT '被收藏次数',
  `courseInfo` varchar(256) DEFAULT NULL COMMENT '注意：不超过128字符的介绍',
  `detailInfo` varchar(2048) DEFAULT NULL COMMENT '注意：超过128个字符的介绍，但不超过2500个字符，有初值（NULL）',
  `subTag` varchar(50) DEFAULT NULL COMMENT '二级学科名称不超过25个字符（字节）',
  PRIMARY KEY (`courseID`),
  KEY `courseTeacher_idx` (`courseTeacher`),
  CONSTRAINT `courseTeacher` FOREIGN KEY (`courseTeacher`) REFERENCES `teacher_information` (`uniqueClientID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='课程信息表（course_information）';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_information`
--

LOCK TABLES `course_information` WRITE;
/*!40000 ALTER TABLE `course_information` DISABLE KEYS */;
INSERT INTO `course_information` VALUES ('CAXX000001','马克思主义概论','UT00000001','2018-02-02','2018-03-20','2018-06-20','综合教学楼（704）','星期一上午一二节',NULL,NULL,NULL,NULL,NULL,''),('CAXX000002','毛泽东思想与社会主义概论',NULL,NULL,NULL,NULL,'第一教学楼（205）',NULL,'EAXX000004',NULL,NULL,NULL,NULL,NULL),('CBXX000001','经济学原理','UT00000003','','2018/05/07 10:00','2018/08/17 19:00','第一教学楼（205）',NULL,'EBXX000001',NULL,NULL,'',NULL,''),('CBXX000002','工商管理基础','UT00000003','','2018/05/07 10:00','2018/08/16 20:00',NULL,NULL,'EBXX000002',NULL,NULL,'',NULL,''),('CCXX000001','诉讼法概论','UT00000003','','2018/05/07 10:00','2018/08/16 20:00','第一教学楼（205）',NULL,'ECXX000001',NULL,NULL,'',NULL,''),('CCXX000002','民法概论','UT00000003','','2018/05/07 10:00','2018/08/16 20:00','第一教学楼（205）',NULL,'ECXX000002',NULL,NULL,'',NULL,''),('CEXX000001','唐朝历史','UT00000003','','2018/05/07 10:00','2018/08/16 20:00','第一教学楼（205）',NULL,'EEXX000001',NULL,NULL,'',NULL,''),('CIXX000001','农学概论','UT00000003','','2018/01/31 11:00','2018/08/16 20:00','第一教学楼（205）',NULL,'EIXX000001',NULL,NULL,'',NULL,''),('CLXX000001','管理的艺术','UT00000003','','2018/05/07 10:00','2018/08/16 20:00','第一教学楼（205）',NULL,'ELXX000001',NULL,NULL,'',NULL,'');
/*!40000 ALTER TABLE `course_information` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = gbk */ ;
/*!50003 SET character_set_results = gbk */ ;
/*!50003 SET collation_connection  = gbk_chinese_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger courseID_tr
before insert on course_information
for each row
insert into exam_information(examID) values(new.examID) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `exam_information`
--

DROP TABLE IF EXISTS `exam_information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exam_information` (
  `examID` char(10) NOT NULL COMMENT '考试代号：10字符固定长度',
  `courseID` char(10) DEFAULT NULL COMMENT '课程代号：10字符固定长度，通过此字段可以获取课程名称（外键于课程信息表）',
  `examDate` varchar(30) DEFAULT NULL COMMENT '例如：2017-11-12 11:30:00(yymmdd-hhmmss)',
  `examDuration` varchar(5) DEFAULT '1',
  `examVenue` varchar(10) DEFAULT NULL COMMENT '格式：同上课地点（venue）',
  `examType` varchar(15) DEFAULT '闭卷' COMMENT '格式：开卷/闭卷',
  PRIMARY KEY (`examID`),
  KEY `courseID_idx` (`courseID`),
  KEY `examVenue_idx` (`examVenue`),
  CONSTRAINT `courseID` FOREIGN KEY (`courseID`) REFERENCES `course_information` (`courseID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='考试信息表（exam_information）';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_information`
--

LOCK TABLES `exam_information` WRITE;
/*!40000 ALTER TABLE `exam_information` DISABLE KEYS */;
INSERT INTO `exam_information` VALUES ('EAXX000001','CAXX000001','2018-10-15 15:00:00','2.5',NULL,'开卷'),('EAXX000002',NULL,NULL,'1',NULL,'闭卷'),('EAXX000003',NULL,NULL,'2',NULL,'闭卷'),('EAXX000004',NULL,NULL,'1',NULL,'闭卷'),('EBXX000001',NULL,NULL,'1',NULL,'闭卷'),('EBXX000002','CBXX000002','2018/05/16 19:00','1','ROOMA10305','??'),('ECXX000001',NULL,NULL,'1',NULL,'闭卷'),('ECXX000002',NULL,NULL,'1',NULL,'闭卷'),('EEXX000001','CEXX000001','2018/08/17 18:00','1','ROOMA50704','??'),('EIXX000001','CIXX000001','2018/05/16 19:00','1','ROOMA50704','??'),('ELXX000001','CLXX000001','2018/05/16 19:00','1','ROOMA10305','??');
/*!40000 ALTER TABLE `exam_information` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_examine`
--

DROP TABLE IF EXISTS `login_examine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login_examine` (
  `uniqueClientID` char(10) NOT NULL COMMENT '此处编号唯一标识一个用户，即用户的用户名和密码不能同时一致，包括教师和学生，以及管理员',
  `username` varchar(50) NOT NULL COMMENT '此处的用户名即为登录名，不同于用户姓名',
  `password` varchar(1024) NOT NULL COMMENT '此处的密码（长度小于50byte）经过函数加密，存储方式为：密文（长度小于1024byte）',
  `registryDate` varchar(30) DEFAULT '2018-01-01 12:00:00',
  `registryType` enum('S','T','A') NOT NULL DEFAULT 'S' COMMENT '注册类型：学生（''Student''）/教师（''Teacher''）/管理员（''Admin''），不区分大小写。',
  PRIMARY KEY (`uniqueClientID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='登陆验证表（login_examine）';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_examine`
--

LOCK TABLES `login_examine` WRITE;
/*!40000 ALTER TABLE `login_examine` DISABLE KEYS */;
INSERT INTO `login_examine` VALUES ('UA00000001','zhangwang@126.com','123456','2018-01-01 12:00:00','A'),('US00000001','wangqifan1996@126.com','123456','2018-01-01 12:00:00','S'),('US00000002','liminqi@126.com','123456','2018-03-24 09:15:50','S'),('US00000003','wangyongjian@126.com','123456','2018-03-24 09:16:11','S'),('US00000004','happy@email.com','654321','2018-03-24 11:02:25','S'),('UT00000001','miaojunpei1995@qq.com','123456','2018-01-01 12:00:00','T'),('UT00000002','happy@email.com','654321','2018-03-19 20:14:52','T'),('UT00000003','busybuzzy@email.com','123456','2018-03-19 20:20:22','T'),('UT00000004','jiangxiaohui@outlook.com','123456','2018-03-24 09:15:00','T');
/*!40000 ALTER TABLE `login_examine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room_information`
--

DROP TABLE IF EXISTS `room_information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `room_information` (
  `roomID` char(10) NOT NULL COMMENT '教室代号',
  `roomName` varchar(60) DEFAULT NULL COMMENT '例如：综合教学楼405教室;格式：综合教学楼（405教室）',
  `roomTag` varchar(35) DEFAULT NULL COMMENT '例如：豫园/世博园/森林公园',
  `roomBuilding` char(2) DEFAULT NULL COMMENT '所属建筑；例如：综合楼/第一教学楼/第二教学楼/申二教',
  `roomCapacity` smallint(6) DEFAULT NULL COMMENT '可容人数：不超过999人',
  PRIMARY KEY (`roomID`),
  KEY `roomBuilding_idx` (`roomBuilding`),
  CONSTRAINT `roomBuilding` FOREIGN KEY (`roomBuilding`) REFERENCES `build_information` (`code`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='教室信息表（room_information）';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room_information`
--

LOCK TABLES `room_information` WRITE;
/*!40000 ALTER TABLE `room_information` DISABLE KEYS */;
INSERT INTO `room_information` VALUES ('ROOMA10305','第一教学楼（305）','一教305','A1',60),('ROOMA10306','第一教学楼（306）','一教306','A1',60),('ROOMA20110','第二教学楼（110）','二教110','A2',80),('ROOMA20306','第二教学楼（306）','二教306','A2',60),('ROOMA30210','第三教学楼（210）','三教210','A3',80),('ROOMA50704','综合教学楼（704）','','A5',60),('ROOMA61009','光电信息与计算机工程学院大楼（1009）','光电大楼1009','A6',100),('ROOMA80000','健身房',NULL,'A8',60),('ROOMBH0100','大礼堂一楼',NULL,'BH',300),('ROOMBH0300','大礼堂三楼',NULL,'BH',150),('ROOMMH0200','音乐堂二楼',NULL,'MH',20),('ROOMSW0000','游泳池',NULL,'SW',30);
/*!40000 ALTER TABLE `room_information` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roomuse_information`
--

DROP TABLE IF EXISTS `roomuse_information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roomuse_information` (
  `roomID` char(10) NOT NULL COMMENT '外键于教室信息表',
  `type` enum('C','E') DEFAULT 'C' COMMENT '考试占用或上课占用（E代表考试，C代表上课）',
  `occupier` char(10) DEFAULT NULL COMMENT '此处为占用教师ID号码',
  `dayperiod` enum('AA','AB','AC','AD','AE','AF','CA','CB','CC','CD','CE','CF','DA','DB','DC','DD','DE','DF','EA','EB','EC','ED','EE','EF','FA','FB','FC','FD','FE','FF','GA','GB','GC','GD','GE','GF') DEFAULT NULL COMMENT '该字段为结合字段（由weekday和period结合），表示方法见页面备注事项。'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='教室使用表（roomuse_information）';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roomuse_information`
--

LOCK TABLES `roomuse_information` WRITE;
/*!40000 ALTER TABLE `roomuse_information` DISABLE KEYS */;
/*!40000 ALTER TABLE `roomuse_information` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_information`
--

DROP TABLE IF EXISTS `student_information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_information` (
  `uniqueClientID` char(10) NOT NULL COMMENT '此处唯一编号唯一标识一个用户，即用户的用户名和密码不能同时一致',
  `name` varchar(30) NOT NULL COMMENT '此处姓名并非唯一（不要求唯一性）',
  `gender` enum('M','F','U') NOT NULL DEFAULT 'U' COMMENT '性别：男（''Male''）/女（''Female''）/未知（''Unknown'')',
  `age` smallint(6) DEFAULT NULL COMMENT '年龄：使用smallint类型，不同于tinyint或者int',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱：不超过50个字符（字节）',
  `wechat` varchar(50) DEFAULT NULL COMMENT '微信：不超过50个字符（字节）',
  `qqNumber` varchar(12) DEFAULT NULL COMMENT '腾讯：不超过12个字符（字节）',
  `phone` varchar(30) DEFAULT NULL COMMENT '手机：不超过30个字符（字节）',
  `university` varchar(100) DEFAULT NULL COMMENT '学校：不超过100个字符（字节）',
  `college` varchar(100) DEFAULT NULL COMMENT '学院：不超过100个字符（字节）',
  `major` varchar(100) DEFAULT NULL COMMENT '专业：不超过100个字符（字节）',
  `position` enum('B','M','D') DEFAULT NULL COMMENT '学位：本科（B）/硕士研究生（M）/博士研究生（D）',
  `grade` enum('FR','SO','JU','SE') DEFAULT NULL COMMENT '年级：一年级（Freshman）/二年级（Sophomore）/三年级（Junior）/四年级（Senior）',
  `cardNo` varchar(20) DEFAULT NULL COMMENT '学生卡上的号码',
  `cardPass` varchar(1024) DEFAULT NULL COMMENT '此处的密码经过函数加密，存储方式为：密文',
  KEY `uniqueClientID_idx` (`uniqueClientID`),
  CONSTRAINT `uniqueClientIDs` FOREIGN KEY (`uniqueClientID`) REFERENCES `login_examine` (`uniqueClientID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='学生信息表（student_information）';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_information`
--

LOCK TABLES `student_information` WRITE;
/*!40000 ALTER TABLE `student_information` DISABLE KEYS */;
INSERT INTO `student_information` VALUES ('US00000001','王启帆','M',22,'wangqifan1996@126.com','EricWong1996','1318272348','15316831783','上海理工大学','光电信息与计算机工程学院','计算机科学与技术','B','SE','1318272348',NULL),('US00000002','李旻琦','M',20,'liminqi@anothermail.com','','','','上海理工大学','','','B','SE','',''),('US00000003','王永健','M',22,'wangyongjian@anothermail.com','','','','上海理工大学','','','B','SE','',''),('US00000004','冯凯鑫','M',32,'happy@anothermail.com','','','','上海理工大学','','','B','SE','','');
/*!40000 ALTER TABLE `student_information` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject_category`
--

DROP TABLE IF EXISTS `subject_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subject_category` (
  `code` char(2) NOT NULL COMMENT 'CA,CB,CC,CD,CE,...,CM（共十三个学科门类代号）',
  `name` varchar(20) DEFAULT NULL COMMENT '哲学，...，法学共十三个',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='学科门类表（subject_category）';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject_category`
--

LOCK TABLES `subject_category` WRITE;
/*!40000 ALTER TABLE `subject_category` DISABLE KEYS */;
INSERT INTO `subject_category` VALUES ('CA','哲学'),('CB','经济学'),('CC','法学'),('CD','教育学'),('CE','文学'),('CF','历史学'),('CG','理学'),('CH','工学'),('CI','农学'),('CJ','医学'),('CK','军事学'),('CL','管理学'),('CM','艺术学');
/*!40000 ALTER TABLE `subject_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher_information`
--

DROP TABLE IF EXISTS `teacher_information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teacher_information` (
  `uniqueClientID` char(10) NOT NULL COMMENT '此处唯一编号唯一标识一个用户，即用户的用户名和密码不能同时一致',
  `name` varchar(30) NOT NULL COMMENT '此处姓名并非唯一（不要求唯一性）',
  `gender` enum('M','F','U') NOT NULL DEFAULT 'U' COMMENT '性别：男（''Male''）/女（''Female''）/未知（''Unknown'')',
  `age` smallint(6) DEFAULT NULL COMMENT '年龄：使用smallint类型，不同于tinyint或者int',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱：不超过50个字符（字节）',
  `wechat` varchar(50) DEFAULT NULL COMMENT '微信：不超过50个字符（字节）',
  `qqNumber` varchar(12) DEFAULT NULL COMMENT '腾讯：不超过12个字符（字节）',
  `phone` varchar(30) DEFAULT NULL COMMENT '手机：不超过30个字符（字节）',
  `university` varchar(100) DEFAULT NULL COMMENT '学校：不超过100个字符（字节）',
  `college` varchar(100) DEFAULT NULL COMMENT '学院：不超过100个字符（字节）',
  `major` varchar(100) DEFAULT NULL COMMENT '专业：不超过100个字符（字节）',
  `courses` varchar(125) DEFAULT NULL COMMENT '表示方法：JSON格式{''courseID1'',''courseID2'',...}',
  `workNo` varchar(20) DEFAULT NULL COMMENT '学生卡上的号码',
  `workPass` varchar(1024) DEFAULT NULL COMMENT '此处的密码经过函数加密，存储方式为：密文',
  KEY `uniqueClientID_idx` (`uniqueClientID`),
  CONSTRAINT `uniqueClientIDt` FOREIGN KEY (`uniqueClientID`) REFERENCES `login_examine` (`uniqueClientID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='教师信息表（teacher_information）';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher_information`
--

LOCK TABLES `teacher_information` WRITE;
/*!40000 ALTER TABLE `teacher_information` DISABLE KEYS */;
INSERT INTO `teacher_information` VALUES ('UT00000001','庙军培','M',23,'miaojunpei1995@qq.com',NULL,NULL,NULL,'北京邮电大学',NULL,NULL,NULL,NULL,NULL),('UT00000002','李凯馨','F',27,'happy@anothermail.com','','','','Nottingham University','','','','',''),('UT00000003','巴则则','M',29,'busybuzzy@anothermail.com','','','','Harvard University','','','','',''),('UT00000004','江小辉','M',40,'jiangxianghui@anothermail.com','','','','北京大学','','','','','');
/*!40000 ALTER TABLE `teacher_information` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-03-26 17:21:59
