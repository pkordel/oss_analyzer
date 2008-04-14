-- MySQL dump 10.10
--
-- Host: localhost    Database: tsunami_production
-- ------------------------------------------------------
-- Server version	5.0.22

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
-- Table structure for table `components`
--

DROP TABLE IF EXISTS `components`;
CREATE TABLE `components` (
  `id` int(11) NOT NULL auto_increment,
  `product_id` int(11) default NULL,
  `sys_config_id` int(11) default NULL,
  `quantity` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Dumping data for table `components`
--


/*!40000 ALTER TABLE `components` DISABLE KEYS */;
LOCK TABLES `components` WRITE;
INSERT INTO `components` VALUES (1,1,1,3),(2,2,1,3),(3,1,2,6),(4,2,2,5),(5,7,2,2),(6,8,2,2),(7,17,2,14),(8,19,2,14),(9,6,3,2),(10,17,3,1),(11,1,4,2),(12,2,4,2),(13,7,4,2),(14,8,4,2),(15,16,4,8),(16,19,4,8);
UNLOCK TABLES;
/*!40000 ALTER TABLE `components` ENABLE KEYS */;

--
-- Table structure for table `mappings`
--

DROP TABLE IF EXISTS `mappings`;
CREATE TABLE `mappings` (
  `id` int(11) NOT NULL auto_increment,
  `source_id` int(11) default NULL,
  `destination_id` int(11) default NULL,
  `migration_cost` int(11) default '0',
  `name` varchar(255) collate utf8_swedish_ci default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Dumping data for table `mappings`
--


/*!40000 ALTER TABLE `mappings` DISABLE KEYS */;
LOCK TABLES `mappings` WRITE;
INSERT INTO `mappings` VALUES (1,1,3,3000,NULL),(2,2,4,3000,NULL),(3,1,22,3000,NULL),(4,16,12,3000,NULL),(5,17,12,3000,NULL),(6,9,21,3000,NULL),(7,20,11,3000,NULL),(8,2,11,3000,NULL),(9,8,10,3000,NULL),(10,19,23,3000,NULL),(11,18,23,3000,NULL),(12,24,23,3000,NULL);
UNLOCK TABLES;
/*!40000 ALTER TABLE `mappings` ENABLE KEYS */;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `id` int(11) NOT NULL auto_increment,
  `type` varchar(255) collate utf8_swedish_ci default NULL,
  `name` varchar(255) collate utf8_swedish_ci default NULL,
  `manufacturer` varchar(255) collate utf8_swedish_ci default NULL,
  `license` int(11) default NULL,
  `support` int(11) default NULL,
  `oss` tinyint(1) default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Dumping data for table `products`
--


/*!40000 ALTER TABLE `products` DISABLE KEYS */;
LOCK TABLES `products` WRITE;
INSERT INTO `products` VALUES (1,'Hardware','Sun Fire V890','Sun',600000,14000,0),(2,'Os','Solaris 10','Sun',6000,10000,0),(3,'Hardware','x86','Dell',0,0,1),(4,'Os','Fedora','Linux',0,0,1),(5,'Hardware','Sun Fire T2000','Sun',150000,14000,0),(6,'Hardware','Sun Fire V240','Sun',50000,14000,0),(7,'Hardware','Sun Fire V490','Sun',240000,14000,0),(8,'Os','Solaris 9','Sun',6000,10000,0),(9,'Hardware','Sun Fire 4600','Sun',250000,14000,0),(10,'Os','RHEL4','Red Hat',0,7000,1),(11,'Os','RHEL5','Red Hat',0,7000,1),(12,'Database','MySQL','MySQL',0,30000,1),(13,'Database','PgSQL','PgSQL',0,30000,0),(14,'Database','EnterpriseDB','EnterpriseDB',0,30000,1),(15,'Os','Debian','Linux',0,0,1),(16,'Database','Oracle 10g','Oracle',130000,30000,0),(17,'Database','Oracle 9i','Oracle',130000,30000,0),(18,'Middleware','Weblogic 8','Bea',130000,30000,0),(19,'Middleware','Weblogic 9','Bea',130000,30000,0),(20,'Os','HP-UX','HP',0,14000,0),(21,'Hardware','DL380 G5','HP',19000,8000,1),(22,'Hardware','ML370','HP',100000,8000,1),(23,'Middleware','JBoss','Red Hat',0,10000,1),(24,'Middleware','Oracle 10gAS','Oracle',130000,30000,0);
UNLOCK TABLES;
/*!40000 ALTER TABLE `products` ENABLE KEYS */;

--
-- Table structure for table `schema_info`
--

DROP TABLE IF EXISTS `schema_info`;
CREATE TABLE `schema_info` (
  `version` int(11) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Dumping data for table `schema_info`
--


/*!40000 ALTER TABLE `schema_info` DISABLE KEYS */;
LOCK TABLES `schema_info` WRITE;
INSERT INTO `schema_info` VALUES (15);
UNLOCK TABLES;
/*!40000 ALTER TABLE `schema_info` ENABLE KEYS */;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions` (
  `id` int(11) NOT NULL auto_increment,
  `session_id` varchar(255) collate utf8_swedish_ci default NULL,
  `data` text collate utf8_swedish_ci,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`),
  KEY `index_sessions_on_session_id` (`session_id`),
  KEY `index_sessions_on_updated_at` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Dumping data for table `sessions`
--


/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
LOCK TABLES `sessions` WRITE;
INSERT INTO `sessions` VALUES (1,'0a4df9da5b547d697825cd0adac15ae5','BAh7BzoOcmV0dXJuX3RvIg0vc3lzdGVtcyIKZmxhc2hJQzonQWN0aW9uQ29u\ndHJvbGxlcjo6Rmxhc2g6OkZsYXNoSGFzaHsABjoKQHVzZWR7AA==\n','2007-12-05 12:34:52'),(2,'24130af7cd05ff041b967eefaa99d34a','BAh7BzoOcmV0dXJuX3RvIhgvcHJvZHVjdHM/b3NzPWZhbHNlIgpmbGFzaElD\nOidBY3Rpb25Db250cm9sbGVyOjpGbGFzaDo6Rmxhc2hIYXNoewAGOgpAdXNl\nZHsA\n','2007-12-06 13:14:40'),(3,'7d84dc4d8e2352bcc2dd07738cf74c01','BAh7CDoOcmV0dXJuX3RvMDoJdXNlcmkKIgpmbGFzaElDOidBY3Rpb25Db250\ncm9sbGVyOjpGbGFzaDo6Rmxhc2hIYXNoewAGOgpAdXNlZHsA\n','2007-12-06 09:49:25'),(5,'ad69e2aca933a931e9692e88f43ee3f7','BAh7CDoOcmV0dXJuX3RvMDoJdXNlcmkLIgpmbGFzaElDOidBY3Rpb25Db250\ncm9sbGVyOjpGbGFzaDo6Rmxhc2hIYXNoewAGOgpAdXNlZHsA\n','2007-12-07 10:48:08'),(6,'abffbcb409fdabc0b42ec467ca2acf0f','BAh7CDoOcmV0dXJuX3RvMCIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6\nRmxhc2g6OkZsYXNoSGFzaHsABjoKQHVzZWR7ADoJdXNlcmkK\n','2007-12-06 12:25:45'),(8,'e7d7d39887816482b8116d03b593ff07','BAh7BzoOcmV0dXJuX3RvMCIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6\nRmxhc2g6OkZsYXNoSGFzaHsGOgtub3RpY2UwBjoKQHVzZWR7BjsHVA==\n','2007-12-07 08:59:33'),(9,'3e476c55b961cf1d666e29e79e85f5bc','BAh7CDoOcmV0dXJuX3RvMCIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6\nRmxhc2g6OkZsYXNoSGFzaHsGOgtub3RpY2UwBjoKQHVzZWR7BjsHVDoJdXNl\ncmkK\n','2007-12-07 10:34:25'),(11,'07c05b91cac2fb33cea5ff2c547688cd','BAh7CDoJdXNlcmkKOg5yZXR1cm5fdG8wIgpmbGFzaElDOidBY3Rpb25Db250\ncm9sbGVyOjpGbGFzaDo6Rmxhc2hIYXNoewAGOgpAdXNlZHsA\n','2008-01-14 14:00:54'),(12,'c2ca7147514d874f9c7211ce43c0fb0b','BAh7CDoJdXNlcmkKIgpmbGFzaElDOidBY3Rpb25Db250cm9sbGVyOjpGbGFz\naDo6Rmxhc2hIYXNoewAGOgpAdXNlZHsAOg5yZXR1cm5fdG8w\n','2008-01-14 13:04:51'),(13,'58a7e8faaf32273024e6db6bfb5f7190','BAh7CDoJdXNlcjA6DnJldHVybl90byIOL21hcHBpbmdzIgpmbGFzaElDOidB\nY3Rpb25Db250cm9sbGVyOjpGbGFzaDo6Rmxhc2hIYXNoewAGOgpAdXNlZHsA\n','2008-01-15 15:11:27'),(15,'21fe9f4a8aafa8593a5ebfdb8d721b20','BAh7ByIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo\nSGFzaHsGOgtub3RpY2UwBjoKQHVzZWR7BjsGVDoOcmV0dXJuX3RvMA==\n','2008-01-15 15:46:23'),(17,'e1988fadb5bb4b9c99df40f0a2d1c7f8','BAh7ByIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo\nSGFzaHsGOgtub3RpY2UwBjoKQHVzZWR7BjsGVDoOcmV0dXJuX3RvMA==\n','2008-01-16 15:38:41');
UNLOCK TABLES;
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;

--
-- Table structure for table `sys_configs`
--

DROP TABLE IF EXISTS `sys_configs`;
CREATE TABLE `sys_configs` (
  `id` int(11) NOT NULL auto_increment,
  `system_id` int(11) default NULL,
  `name` varchar(255) collate utf8_swedish_ci default NULL,
  `description` text collate utf8_swedish_ci,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Dumping data for table `sys_configs`
--


/*!40000 ALTER TABLE `sys_configs` DISABLE KEYS */;
LOCK TABLES `sys_configs` WRITE;
INSERT INTO `sys_configs` VALUES (1,1,'Hardware test Configuration',NULL),(2,2,'Monolithic Production Configuration',NULL),(3,3,'Tiny production Configuration',NULL),(4,4,'Medium Production Configuration',NULL);
UNLOCK TABLES;
/*!40000 ALTER TABLE `sys_configs` ENABLE KEYS */;

--
-- Table structure for table `systems`
--

DROP TABLE IF EXISTS `systems`;
CREATE TABLE `systems` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) collate utf8_swedish_ci default NULL,
  `description` text collate utf8_swedish_ci,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `user_id` int(11) default NULL,
  `status` int(11) default '0',
  `system_type` varchar(255) collate utf8_swedish_ci default NULL,
  `sla` varchar(255) collate utf8_swedish_ci default NULL,
  `internal` varchar(255) collate utf8_swedish_ci default NULL,
  `user_count` int(11) default NULL,
  `eol` datetime default NULL,
  `sys_admin_name` varchar(255) collate utf8_swedish_ci default NULL,
  `sys_admin_phone` varchar(255) collate utf8_swedish_ci default NULL,
  `sys_admin_email` varchar(255) collate utf8_swedish_ci default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Dumping data for table `systems`
--


/*!40000 ALTER TABLE `systems` DISABLE KEYS */;
LOCK TABLES `systems` WRITE;
INSERT INTO `systems` VALUES (1,'Hardware test','dfbaqdaq','2007-12-06 09:37:08','2007-12-06 09:37:08',5,25,'Custom','99.99','internal',1000000,'2008-12-06 00:00:00','Fred','555-555-5555','vnafgsn'),(2,'Monolithic Production','Common monolithic production system for TeliaSonera Sweden P&P. Makes black blocks out of yellow mush.','2007-12-06 14:07:19','2007-12-06 14:09:11',6,25,'Custom','99.9','internal',300,'2011-12-06 00:00:00','Magnus Glantz','070-2119922','magnus.glantz@teliasonera.com'),(3,'Tiny production','Tiny production system for TeliaSonera Finland P&P. Makes small sticks out of debree.','2007-12-06 14:12:33','2007-12-06 14:12:33',6,25,'Standard','99.9','internal',15,'2008-12-06 00:00:00','Magnus Glantz','070-2119922','magnus.glantz@teliasonera.com'),(4,'Medium Production','Medium production system for TeliaSonera Denmark P&P. Creates binding materials for mobile services.','2007-12-06 14:46:04','2007-12-06 14:48:42',6,25,'Standard','99.9','external',5000,'2007-12-06 00:00:00','Magnus Glantz','070-2119922','magnus.glantz@teliasonera.com');
UNLOCK TABLES;
/*!40000 ALTER TABLE `systems` ENABLE KEYS */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL auto_increment,
  `login` varchar(255) collate utf8_swedish_ci default NULL,
  `email` varchar(255) collate utf8_swedish_ci default NULL,
  `crypted_password` varchar(40) collate utf8_swedish_ci default NULL,
  `salt` varchar(40) collate utf8_swedish_ci default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `remember_token` varchar(255) collate utf8_swedish_ci default NULL,
  `remember_token_expires_at` datetime default NULL,
  `role` varchar(255) collate utf8_swedish_ci default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Dumping data for table `users`
--


/*!40000 ALTER TABLE `users` DISABLE KEYS */;
LOCK TABLES `users` WRITE;
INSERT INTO `users` VALUES (1,'admin','admin@example.com','cf713b0976f6a88545459b776f154f7950747df5','684e341634f2648049fab7d3b1b6b85c5e9b52ba','2007-12-05 12:34:17','2007-12-05 12:34:17',NULL,NULL,'owner'),(2,'owner','owner@example.com','87c1a386b63860b42600ebf6788df85e9fe6c98a','524be27d674c7de80d85c39b36d595e8879d17f3','2007-12-05 12:34:17','2007-12-05 12:34:17',NULL,NULL,'owner'),(3,'sourcing','sourcing@example.com','0877c4b4df5797c9500342a0fc50267a74dba606','76644475b5ce6157d9d11192d6681f6fd1a008f4','2007-12-05 12:34:17','2007-12-05 12:34:17',NULL,NULL,'owner'),(4,'manager','manager@example.com','c620d21c25d8cf152150c89184140395271d4263','50fa2f6f70d7a8dec501630e7d46d6aec5c507b5','2007-12-05 12:34:17','2007-12-05 12:34:17',NULL,NULL,'owner'),(5,'peter','pkordel@gmail.com','862a861cf959f466271153d1f66bc63b16aba03d','02a7fd7687acd43a918d7e23b3650e05f12ddb24','2007-12-06 09:21:48','2008-01-16 15:38:41',NULL,NULL,'owner'),(6,'magl40','magnus.glantz@teliasonera.com','7b6aef78100f49f472945aebab38a1418c25f735','1b3a054f50b9d8ad8887bfd960d125a72d7471f2','2007-12-06 10:26:33','2007-12-06 10:26:33',NULL,NULL,'owner');
UNLOCK TABLES;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

