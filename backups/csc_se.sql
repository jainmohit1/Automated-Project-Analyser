-- MySQL dump 10.13  Distrib 5.7.25, for Linux (x86_64)
--
-- Host: localhost    Database: csc_se
-- ------------------------------------------------------
-- Server version	5.7.25-0ubuntu0.16.04.2

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
-- Table structure for table `duplicate_info`
--

DROP TABLE IF EXISTS `duplicate_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `duplicate_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number_of_duplicate_lines` int(11) NOT NULL DEFAULT '0',
  `percentage_of_duplicate_lines` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `duplicate_info`
--

LOCK TABLES `duplicate_info` WRITE;
/*!40000 ALTER TABLE `duplicate_info` DISABLE KEYS */;
INSERT INTO `duplicate_info` VALUES (8,0,0,'2019-04-20 17:41:47','2019-04-20 17:41:47');
/*!40000 ALTER TABLE `duplicate_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `error_code_details`
--

DROP TABLE IF EXISTS `error_code_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `error_code_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id of the table',
  `error_code` varchar(45) COLLATE utf8_unicode_ci NOT NULL COMMENT 'error code as mentioned in PyLint Library.',
  `error_code_description` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'error code description of the error code in PyLint Library.',
  `error_category` varchar(45) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Error code category. Should be either of these 4:  Convention, Refactor, Error, Warning ',
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `error_code_UNIQUE` (`error_code`)
) ENGINE=InnoDB AUTO_INCREMENT=162 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `error_code_details`
--

LOCK TABLES `error_code_details` WRITE;
/*!40000 ALTER TABLE `error_code_details` DISABLE KEYS */;
INSERT INTO `error_code_details` VALUES (1,'C0102',' Black listed name \"%s\"','Convention','2019-04-16 20:23:29','2019-04-16 20:23:29'),(2,'C0103',' Invalid %s name \"%s\"','Convention','2019-04-16 20:23:29','2019-04-16 20:23:29'),(3,'C0111',' Missing %s docstring','Convention','2019-04-16 20:23:29','2019-04-16 20:23:29'),(4,'C0112',' Empty %s docstring','Convention','2019-04-16 20:23:29','2019-04-16 20:23:29'),(5,'C0121',' Missing required attribute \"%s\"','Convention','2019-04-16 20:23:29','2019-04-16 20:23:29'),(6,'C0202',' Class method %s should have cls as first argument','Convention','2019-04-16 20:23:29','2019-04-16 20:23:29'),(7,'C0203',' Metaclass method %s should have mcs as first argument','Convention','2019-04-16 20:23:29','2019-04-16 20:23:29'),(8,'C0204',' Metaclass class method %s should have %s as first argument','Convention','2019-04-16 20:23:29','2019-04-16 20:23:29'),(9,'C0301',' Line too long (%s/%s)','Convention','2019-04-16 20:23:29','2019-04-16 20:23:29'),(10,'C0302',' Too many lines in module (%s)','Convention','2019-04-16 20:23:29','2019-04-16 20:23:29'),(11,'C0303',' Trailing whitespace','Convention','2019-04-16 20:23:29','2019-04-16 20:23:29'),(12,'C0304',' Final newline missing','Convention','2019-04-16 20:23:29','2019-04-16 20:23:29'),(13,'C0321',' More than one statement on a single line','Convention','2019-04-16 20:23:29','2019-04-16 20:23:29'),(14,'C0322',' Old: Operator not preceded by a space','Convention','2019-04-16 20:23:29','2019-04-16 20:23:29'),(15,'C0323',' Old: Operator not followed by a space','Convention','2019-04-16 20:23:29','2019-04-16 20:23:29'),(16,'C0324',' Old: Comma not followed by a space','Convention','2019-04-16 20:23:29','2019-04-16 20:23:29'),(17,'C0325',' Unnecessary parens after %r keyword','Convention','2019-04-16 20:23:29','2019-04-16 20:23:29'),(18,'C0326',' %s space %s %s %s\n%s','Convention','2019-04-16 20:23:29','2019-04-16 20:23:29'),(19,'C1001',' Old-style class defined.','Convention','2019-04-16 20:23:29','2019-04-16 20:23:29'),(20,'E0001',' (syntax error raised for a module; message varies)','Error','2019-04-16 20:23:29','2019-04-16 20:23:29'),(21,'E0011',' Unrecognized file option %r','Error','2019-04-16 20:23:29','2019-04-16 20:23:29'),(22,'E0012',' Bad option value %r','Error','2019-04-16 20:23:29','2019-04-16 20:23:29'),(23,'E0100',' __init__ method is a generator','Error','2019-04-16 20:23:29','2019-04-16 20:23:29'),(24,'E0101',' Explicit return in __init__','Error','2019-04-16 20:23:29','2019-04-16 20:23:29'),(25,'E0102',' %s already defined line %s','Error','2019-04-16 20:23:29','2019-04-16 20:23:29'),(26,'E0103',' %r not properly in loop','Error','2019-04-16 20:23:29','2019-04-16 20:23:29'),(27,'E0104',' Return outside function','Error','2019-04-16 20:23:29','2019-04-16 20:23:29'),(28,'E0105',' Yield outside function','Error','2019-04-16 20:23:29','2019-04-16 20:23:29'),(29,'E0106',' Return with argument inside generator','Error','2019-04-16 20:23:29','2019-04-16 20:23:29'),(30,'E0107',' Use of the non-existent %s operator','Error','2019-04-16 20:23:29','2019-04-16 20:23:29'),(31,'E0108',' Duplicate argument name %s in function definition','Error','2019-04-16 20:23:29','2019-04-16 20:23:29'),(32,'E0202',' An attribute affected in %s line %s hide this method','Error','2019-04-16 20:23:29','2019-04-16 20:23:29'),(33,'E0203',' Access to member %r before its definition line %s','Error','2019-04-16 20:23:29','2019-04-16 20:23:29'),(34,'E0211',' Method has no argument','Error','2019-04-16 20:23:29','2019-04-16 20:23:29'),(35,'E0213',' Method should have \"self\" as first argument','Error','2019-04-16 20:23:29','2019-04-16 20:23:29'),(36,'E0221',' Interface resolved to %s is not a class','Error','2019-04-16 20:23:29','2019-04-16 20:23:29'),(37,'E0222',' Missing method %r from %s interface','Error','2019-04-16 20:23:29','2019-04-16 20:23:29'),(38,'E0235',' __exit__ must accept 3 arguments','Error','2019-04-16 20:23:29','2019-04-16 20:23:29'),(39,'E0501',' Old: Non ascii characters found but no encoding specified (PEP 263)','Error','2019-04-16 20:23:29','2019-04-16 20:23:29'),(40,'E0502',' Old: Wrong encoding specified (%s)','Error','2019-04-16 20:23:29','2019-04-16 20:23:29'),(41,'E0503',' Old: Unknown encoding specified (%s)','Error','2019-04-16 20:23:29','2019-04-16 20:23:29'),(42,'E0601',' Using variable %r before assignment','Error','2019-04-16 20:23:29','2019-04-16 20:23:29'),(43,'E0602',' Undefined variable %r','Error','2019-04-16 20:23:29','2019-04-16 20:23:29'),(44,'E0603',' Undefined variable name %r in __all__','Error','2019-04-16 20:23:29','2019-04-16 20:23:29'),(45,'E0604',' Invalid object %r in __all__, must contain only strings','Error','2019-04-16 20:23:29','2019-04-16 20:23:29'),(46,'E0611',' No name %r in module %r','Error','2019-04-16 20:23:29','2019-04-16 20:23:29'),(47,'E0701',' Bad except clauses order (%s)','Error','2019-04-16 20:23:29','2019-04-16 20:23:29'),(48,'E0702',' Raising %s while only classes, instances or string are allowed','Error','2019-04-16 20:23:29','2019-04-16 20:23:29'),(49,'E0710',' Raising a new style class which doesn\'t inherit from BaseException','Error','2019-04-16 20:23:29','2019-04-16 20:23:29'),(50,'E0711',' NotImplemented raised - should raise NotImplementedError','Error','2019-04-16 20:23:29','2019-04-16 20:23:29'),(51,'E0712',' Catching an exception which doesn\'t inherit from BaseException','Error','2019-04-16 20:23:29','2019-04-16 20:23:29'),(52,'E1001',' Use of __slots__ on an old style class','Error','2019-04-16 20:23:29','2019-04-16 20:23:29'),(53,'E1002',' Use of super on an old style class','Error','2019-04-16 20:23:29','2019-04-16 20:23:29'),(54,'E1003',' Bad first argument %r given to super()','Error','2019-04-16 20:23:29','2019-04-16 20:23:29'),(55,'E1004',' Missing argument to super()','Error','2019-04-16 20:23:29','2019-04-16 20:23:29'),(56,'E1101',' %s %r has no %r member','Error','2019-04-16 20:23:29','2019-04-16 20:23:29'),(57,'E1102',' %s is not callable','Error','2019-04-16 20:23:29','2019-04-16 20:23:29'),(58,'E1103',' %s %r has no %r member (but some types could not be inferred)','Error','2019-04-16 20:23:29','2019-04-16 20:23:29'),(59,'E1111',' Assigning to function call which doesn\'t return','Error','2019-04-16 20:23:29','2019-04-16 20:23:29'),(60,'E1120',' No value passed for parameter %s in function call','Error','2019-04-16 20:23:29','2019-04-16 20:23:29'),(61,'E1121',' Too many positional arguments for function call','Error','2019-04-16 20:23:29','2019-04-16 20:23:29'),(62,'E1122',' Old: Duplicate keyword argument %r in function call','Error','2019-04-16 20:23:29','2019-04-16 20:23:29'),(63,'E1123',' Passing unexpected keyword argument %r in function call','Error','2019-04-16 20:23:29','2019-04-16 20:23:29'),(64,'E1124',' Parameter %r passed as both positional and keyword argument','Error','2019-04-16 20:23:29','2019-04-16 20:23:29'),(65,'E1125',' Old: Missing mandatory keyword argument %r','Error','2019-04-16 20:23:29','2019-04-16 20:23:29'),(66,'E1200',' Unsupported logging format character %r (%#02x) at index %d','Error','2019-04-16 20:23:29','2019-04-16 20:23:29'),(67,'E1201',' Logging format string ends in middle of conversion specifier','Error','2019-04-16 20:23:29','2019-04-16 20:23:29'),(68,'E1205',' Too many arguments for logging format string','Error','2019-04-16 20:23:29','2019-04-16 20:23:29'),(69,'E1206',' Not enough arguments for logging format string','Error','2019-04-16 20:23:29','2019-04-16 20:23:29'),(70,'E1300',' Unsupported format character %r (%#02x) at index %d','Error','2019-04-16 20:23:29','2019-04-16 20:23:29'),(71,'E1301',' Format string ends in middle of conversion specifier','Error','2019-04-16 20:23:29','2019-04-16 20:23:29'),(72,'E1302',' Mixing named and unnamed conversion specifiers in format string','Error','2019-04-16 20:23:29','2019-04-16 20:23:29'),(73,'E1303',' Expected mapping for format string, not %s','Error','2019-04-16 20:23:29','2019-04-16 20:23:29'),(74,'E1304',' Missing key %r in format string dictionary','Error','2019-04-16 20:23:29','2019-04-16 20:23:29'),(75,'E1305',' Too many arguments for format string','Error','2019-04-16 20:23:29','2019-04-16 20:23:29'),(76,'E1306',' Not enough arguments for format string','Error','2019-04-16 20:23:29','2019-04-16 20:23:29'),(77,'E1310',' Suspicious argument in %s.%s call','Error','2019-04-16 20:23:29','2019-04-16 20:23:29'),(78,'R0201',' Method could be a function','Refactor','2019-04-16 20:23:29','2019-04-16 20:23:29'),(79,'R0401',' Cyclic import (%s)','Refactor','2019-04-16 20:23:29','2019-04-16 20:23:29'),(80,'R0801',' Similar lines in %s files','Refactor','2019-04-16 20:23:29','2019-04-16 20:23:29'),(81,'R0901',' Too many ancestors (%s/%s)','Refactor','2019-04-16 20:23:29','2019-04-16 20:23:29'),(82,'R0902',' Too many instance attributes (%s/%s)','Refactor','2019-04-16 20:23:29','2019-04-16 20:23:29'),(83,'R0903',' Too few public methods (%s/%s)','Refactor','2019-04-16 20:23:29','2019-04-16 20:23:29'),(84,'R0904',' Too many public methods (%s/%s)','Refactor','2019-04-16 20:23:29','2019-04-16 20:23:29'),(85,'R0911',' Too many return statements (%s/%s)','Refactor','2019-04-16 20:23:29','2019-04-16 20:23:29'),(86,'R0912',' Too many branches (%s/%s)','Refactor','2019-04-16 20:23:29','2019-04-16 20:23:29'),(87,'R0913',' Too many arguments (%s/%s)','Refactor','2019-04-16 20:23:29','2019-04-16 20:23:29'),(88,'R0914',' Too many local variables (%s/%s)','Refactor','2019-04-16 20:23:29','2019-04-16 20:23:29'),(89,'R0915',' Too many statements (%s/%s)','Refactor','2019-04-16 20:23:29','2019-04-16 20:23:29'),(90,'R0921',' Abstract class not referenced','Refactor','2019-04-16 20:23:29','2019-04-16 20:23:29'),(91,'R0922',' Abstract class is only referenced %s times','Refactor','2019-04-16 20:23:29','2019-04-16 20:23:29'),(92,'R0923',' Interface not implemented','Refactor','2019-04-16 20:23:29','2019-04-16 20:23:29'),(93,'W0101',' Unreachable code','Warning','2019-04-16 20:23:29','2019-04-16 20:23:29'),(94,'W0102',' Dangerous default value %s as argument','Warning','2019-04-16 20:23:29','2019-04-16 20:23:29'),(95,'W0104',' Statement seems to have no effect','Warning','2019-04-16 20:23:29','2019-04-16 20:23:29'),(96,'W0105',' String statement has no effect','Warning','2019-04-16 20:23:29','2019-04-16 20:23:29'),(97,'W0106',' Expression \"%s\" is assigned to nothing','Warning','2019-04-16 20:23:29','2019-04-16 20:23:29'),(98,'W0107',' Unnecessary pass statement','Warning','2019-04-16 20:23:29','2019-04-16 20:23:29'),(99,'W0108',' Lambda may not be necessary','Warning','2019-04-16 20:23:29','2019-04-16 20:23:29'),(100,'W0109',' Duplicate key %r in dictionary','Warning','2019-04-16 20:23:29','2019-04-16 20:23:29'),(101,'W0110',' map/filter on lambda could be replaced by comprehension','Warning','2019-04-16 20:23:29','2019-04-16 20:23:29'),(102,'W0120',' Else clause on loop without a break statement','Warning','2019-04-16 20:23:29','2019-04-16 20:23:29'),(103,'W0121',' Use raise ErrorClass(args) instead of raise ErrorClass, args.','Warning','2019-04-16 20:23:29','2019-04-16 20:23:29'),(104,'W0122',' Use of exec','Warning','2019-04-16 20:23:29','2019-04-16 20:23:29'),(105,'W0141',' Used builtin function %r','Warning','2019-04-16 20:23:29','2019-04-16 20:23:29'),(106,'W0142',' Used * or ** magic','Warning','2019-04-16 20:23:29','2019-04-16 20:23:29'),(107,'W0150',' %s statement in finally block may swallow exception','Warning','2019-04-16 20:23:29','2019-04-16 20:23:29'),(108,'W0199',' Assert called on a 2-uple. Did you mean \'assert x,y\'?','Warning','2019-04-16 20:23:29','2019-04-16 20:23:29'),(109,'W0201',' Attribute %r defined outside __init__','Warning','2019-04-16 20:23:29','2019-04-16 20:23:29'),(110,'W0211',' Static method with %r as first argument','Warning','2019-04-16 20:23:29','2019-04-16 20:23:29'),(111,'W0212',' Access to a protected member %s of a client class','Warning','2019-04-16 20:23:29','2019-04-16 20:23:29'),(112,'W0221',' Arguments number differs from %s method','Warning','2019-04-16 20:23:29','2019-04-16 20:23:29'),(113,'W0222',' Signature differs from %s method','Warning','2019-04-16 20:23:29','2019-04-16 20:23:29'),(114,'W0223',' Method %r is abstract in class %r but is not overridden','Warning','2019-04-16 20:23:29','2019-04-16 20:23:29'),(115,'W0231',' __init__ method from base class %r is not called','Warning','2019-04-16 20:23:29','2019-04-16 20:23:29'),(116,'W0232',' Class has no __init__ method','Warning','2019-04-16 20:23:29','2019-04-16 20:23:29'),(117,'W0233',' __init__ method from a non direct base class %r is called','Warning','2019-04-16 20:23:29','2019-04-16 20:23:29'),(118,'W0234',' iter returns non-iterator','Warning','2019-04-16 20:23:29','2019-04-16 20:23:29'),(119,'W0301',' Unnecessary semicolon','Warning','2019-04-16 20:23:29','2019-04-16 20:23:29'),(120,'W0311',' Bad indentation. Found %s %s, expected %s','Warning','2019-04-16 20:23:29','2019-04-16 20:23:29'),(121,'W0312',' Found indentation with %ss instead of %ss','Warning','2019-04-16 20:23:29','2019-04-16 20:23:29'),(122,'W0331',' Use of the <> operator','Warning','2019-04-16 20:23:29','2019-04-16 20:23:29'),(123,'W0332',' Use of \"l\" as long integer identifier','Warning','2019-04-16 20:23:29','2019-04-16 20:23:29'),(124,'W0333',' Use of the `` operator','Warning','2019-04-16 20:23:29','2019-04-16 20:23:29'),(125,'W0401',' Wildcard import %s','Warning','2019-04-16 20:23:29','2019-04-16 20:23:29'),(126,'W0402',' Uses of a deprecated module %r','Warning','2019-04-16 20:23:29','2019-04-16 20:23:29'),(127,'W0403',' Relative import %r, should be %r','Warning','2019-04-16 20:23:29','2019-04-16 20:23:29'),(128,'W0404',' Reimport %r (imported line %s)','Warning','2019-04-16 20:23:29','2019-04-16 20:23:29'),(129,'W0406',' Module import itself','Warning','2019-04-16 20:23:29','2019-04-16 20:23:29'),(130,'W0410',' __future__ import is not the first non docstring statement','Warning','2019-04-16 20:23:29','2019-04-16 20:23:29'),(131,'W0511',' (warning notes in code comments; message varies)','Warning','2019-04-16 20:23:29','2019-04-16 20:23:29'),(132,'W0512',' Cannot decode using encoding \"%s\", unexpected byte at position %d','Warning','2019-04-16 20:23:29','2019-04-16 20:23:29'),(133,'W0601',' Global variable %r undefined at the module level','Warning','2019-04-16 20:23:29','2019-04-16 20:23:29'),(134,'W0602',' Using global for %r but no assigment is done','Warning','2019-04-16 20:23:29','2019-04-16 20:23:29'),(135,'W0603',' Using the global statement','Warning','2019-04-16 20:23:29','2019-04-16 20:23:29'),(136,'W0604',' Using the global statement at the module level','Warning','2019-04-16 20:23:29','2019-04-16 20:23:29'),(137,'W0611',' Unused import %s','Warning','2019-04-16 20:23:29','2019-04-16 20:23:29'),(138,'W0612',' Unused variable %r','Warning','2019-04-16 20:23:29','2019-04-16 20:23:29'),(139,'W0613',' Unused argument %r','Warning','2019-04-16 20:23:29','2019-04-16 20:23:29'),(140,'W0614',' Unused import %s from wildcard import','Warning','2019-04-16 20:23:29','2019-04-16 20:23:29'),(141,'W0621',' Redefining name %r from outer scope (line %s)','Warning','2019-04-16 20:23:29','2019-04-16 20:23:29'),(142,'W0622',' Redefining built-in %r','Warning','2019-04-16 20:23:29','2019-04-16 20:23:29'),(143,'W0623',' Redefining name %r from %s in exception handler','Warning','2019-04-16 20:23:29','2019-04-16 20:23:29'),(144,'W0631',' Using possibly undefined loop variable %r','Warning','2019-04-16 20:23:29','2019-04-16 20:23:29'),(145,'W0632',' Possible unbalanced tuple unpacking with sequence%s','Warning','2019-04-16 20:23:29','2019-04-16 20:23:29'),(146,'W0633',' Attempting to unpack a non-sequence%s','Warning','2019-04-16 20:23:29','2019-04-16 20:23:29'),(147,'W0701',' Raising a string exception','Warning','2019-04-16 20:23:29','2019-04-16 20:23:29'),(148,'W0702',' No exception type(s) specified','Warning','2019-04-16 20:23:29','2019-04-16 20:23:29'),(149,'W0703',' Catching too general exception %s','Warning','2019-04-16 20:23:29','2019-04-16 20:23:29'),(150,'W0704',' Except doesn\'t do anything','Warning','2019-04-16 20:23:29','2019-04-16 20:23:29'),(151,'W0710',' Exception doesn\'t inherit from standard \"Exception\" class','Warning','2019-04-16 20:23:29','2019-04-16 20:23:29'),(152,'W0711',' Exception to catch is the result of a binary \"%s\" operation','Warning','2019-04-16 20:23:29','2019-04-16 20:23:29'),(153,'W0712',' Implicit unpacking of exceptions is not supported in Python 3','Warning','2019-04-16 20:23:29','2019-04-16 20:23:29'),(154,'W1001',' Use of \"property\" on an old style class','Warning','2019-04-16 20:23:29','2019-04-16 20:23:29'),(155,'W1111',' Assigning to function call which only returns None','Warning','2019-04-16 20:23:29','2019-04-16 20:23:29'),(156,'W1201',' Specify string format arguments as logging function parameters','Warning','2019-04-16 20:23:29','2019-04-16 20:23:29'),(157,'W1300',' Format string dictionary key should be a string, not %s','Warning','2019-04-16 20:23:29','2019-04-16 20:23:29'),(158,'W1301',' Unused key %r in format string dictionary','Warning','2019-04-16 20:23:29','2019-04-16 20:23:29'),(159,'W1401',' Anomalous backslash in string','Warning','2019-04-16 20:23:29','2019-04-16 20:23:29'),(160,'W1402',' Anomalous Unicode escape in byte string','Warning','2019-04-16 20:23:29','2019-04-16 20:23:29'),(161,'W1501',' \"%s\" is not a valid mode for open.','Warning','2019-04-16 20:23:29','2019-04-16 20:23:29');
/*!40000 ALTER TABLE `error_code_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `error_info`
--

DROP TABLE IF EXISTS `error_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `error_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `error_code_detail_id` int(11) DEFAULT NULL,
  `file_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `error_code_detail_id_idx` (`error_code_detail_id`),
  KEY `file_id_idx` (`file_id`),
  CONSTRAINT `error_code_detail_id` FOREIGN KEY (`error_code_detail_id`) REFERENCES `error_code_details` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `file_id` FOREIGN KEY (`file_id`) REFERENCES `file_info` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=332 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `error_info`
--

LOCK TABLES `error_info` WRITE;
/*!40000 ALTER TABLE `error_info` DISABLE KEYS */;
INSERT INTO `error_info` VALUES (310,50,39,'2019-04-20 17:41:48','2019-04-20 17:41:48'),(311,50,39,'2019-04-20 17:41:48','2019-04-20 17:41:48'),(312,50,39,'2019-04-20 17:41:48','2019-04-20 17:41:48'),(313,50,39,'2019-04-20 17:41:48','2019-04-20 17:41:48'),(314,50,39,'2019-04-20 17:41:49','2019-04-20 17:41:49'),(315,50,39,'2019-04-20 17:41:49','2019-04-20 17:41:49'),(316,50,39,'2019-04-20 17:41:49','2019-04-20 17:41:49'),(317,50,39,'2019-04-20 17:41:49','2019-04-20 17:41:49'),(318,50,39,'2019-04-20 17:41:49','2019-04-20 17:41:49'),(319,50,39,'2019-04-20 17:41:49','2019-04-20 17:41:49'),(320,50,40,'2019-04-20 17:41:50','2019-04-20 17:41:50'),(321,50,40,'2019-04-20 17:41:50','2019-04-20 17:41:50'),(322,50,40,'2019-04-20 17:41:50','2019-04-20 17:41:50'),(323,50,40,'2019-04-20 17:41:50','2019-04-20 17:41:50'),(324,50,40,'2019-04-20 17:41:50','2019-04-20 17:41:50'),(325,50,40,'2019-04-20 17:41:50','2019-04-20 17:41:50'),(326,50,40,'2019-04-20 17:41:50','2019-04-20 17:41:50'),(327,50,40,'2019-04-20 17:41:50','2019-04-20 17:41:50'),(328,50,40,'2019-04-20 17:41:50','2019-04-20 17:41:50'),(329,50,40,'2019-04-20 17:41:50','2019-04-20 17:41:50'),(330,50,40,'2019-04-20 17:41:50','2019-04-20 17:41:50'),(331,50,40,'2019-04-20 17:41:50','2019-04-20 17:41:50');
/*!40000 ALTER TABLE `error_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file_info`
--

DROP TABLE IF EXISTS `file_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `file_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id of the table.',
  `file_name` varchar(500) COLLATE utf8_unicode_ci NOT NULL COMMENT 'File name.',
  `file_type` varchar(45) COLLATE utf8_unicode_ci NOT NULL COMMENT 'File Type',
  `file_path` varchar(200) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Path of the file in GitHub.',
  `created_at` datetime NOT NULL,
  `updated_at` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`file_name`,`file_path`,`file_type`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_info`
--

LOCK TABLES `file_info` WRITE;
/*!40000 ALTER TABLE `file_info` DISABLE KEYS */;
INSERT INTO `file_info` VALUES (39,'pylintApi_v2.py','Python','/var/www/html/downloaded_data/dummy_dir/pylintApi_v2.py','2019-04-20 17:41:46','2019-04-20 17:41:45.647747'),(40,'pylintApi.py','Python','/var/www/html/downloaded_data/pylintApi.py','2019-04-20 17:41:46','2019-04-20 17:41:45.652442');
/*!40000 ALTER TABLE `file_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file_metrics`
--

DROP TABLE IF EXISTS `file_metrics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `file_metrics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file_info_id` int(11) NOT NULL,
  `code_percentage` int(11) NOT NULL DEFAULT '0',
  `docstring_percentage` int(11) NOT NULL DEFAULT '0',
  `comment_percentage` int(11) NOT NULL DEFAULT '0',
  `empty_percentage` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `file_id_idx` (`file_info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_metrics`
--

LOCK TABLES `file_metrics` WRITE;
/*!40000 ALTER TABLE `file_metrics` DISABLE KEYS */;
INSERT INTO `file_metrics` VALUES (19,39,67,0,17,16,'2019-04-20 17:41:46','2019-04-20 17:41:46.274679'),(20,40,67,0,17,16,'2019-04-20 17:41:47','2019-04-20 17:41:46.854979');
/*!40000 ALTER TABLE `file_metrics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `activation_key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `repository` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'abhishekpareek29','abhishekpareek29@gmail.com','4e2c51a2710425eb2ebf22b3255bbf52d65b57c8','csc510_mock_repo'),(2,'abhishekpareek29','abhishekpareek29@gmail.com','4e2c51a2710425eb2ebf22b3255bbf52d65b57c8','csc510_mock_repo'),(3,'abhishekpareek29','abhishekpareek29@gmail.com','4e2c51a2710425eb2ebf22b3255bbf52d65b57c8','csc510_mock_repo'),(4,'abhishekpareek29','abhishekpareek29@gmail.com','4e2c51a2710425eb2ebf22b3255bbf52d65b57c8','csc510_mock_repo'),(5,'abhishekpareek29','abhishekpareek29@gmail.com','4e2c51a2710425eb2ebf22b3255bbf52d65b57c8','csc510_mock_repo'),(6,'abhishekpareek29','abhishekpareek29@gmail.com','4e2c51a2710425eb2ebf22b3255bbf52d65b57c8','csc510_mock_repo'),(7,'abhishekpareek29','abhishekpareek29@gmail.com','4e2c51a2710425eb2ebf22b3255bbf52d65b57c8','csc510_mock_repo'),(8,'abhishekpareek29','abhishekpareek29@gmail.com','4e2c51a2710425eb2ebf22b3255bbf52d65b57c8','csc510_mock_repo'),(9,'abhishekpareek29','abhishekpareek29@gmail.com','4e2c51a2710425eb2ebf22b3255bbf52d65b57c8','csc510_mock_repo'),(10,'abhishekpareek29','abhishekpareek29@gmail.com','4e2c51a2710425eb2ebf22b3255bbf52d65b57c8','csc510_mock_repo'),(11,'abhishekpareek29','abhishekpareek29@gmail.com','4e2c51a2710425eb2ebf22b3255bbf52d65b57c8','csc510_mock_repo'),(12,'abhishekpareek29','abhishekpareek29@gmail.com','4e2c51a2710425eb2ebf22b3255bbf52d65b57c8','csc510_mock_repo'),(13,'abhishekpareek29','abhishekpareek29@gmail.com','4e2c51a2710425eb2ebf22b3255bbf52d65b57c8','csc510_mock_repo'),(14,'abhishekpareek29','abhishekpareek29@gmail.com','4e2c51a2710425eb2ebf22b3255bbf52d65b57c8','csc510_mock_repo'),(15,'abhishekpareek29','abhishekpareek29@gmail.com','4e2c51a2710425eb2ebf22b3255bbf52d65b57c8','csc510_mock_repo'),(16,'abhishekpareek29','abhishekpareek29@gmail.com','4e2c51a2710425eb2ebf22b3255bbf52d65b57c8','csc510_mock_repo'),(17,'abhishekpareek29','abhishekpareek29@gmail.com','4e2c51a2710425eb2ebf22b3255bbf52d65b57c8','csc510_mock_repo'),(18,'abhishekpareek29','abhishekpareek29@gmail.com','4e2c51a2710425eb2ebf22b3255bbf52d65b57c8','csc510_mock_repo'),(19,'abhishekpareek29','abhishekpareek29@gmail.com','4e2c51a2710425eb2ebf22b3255bbf52d65b57c8','csc510_mock_repo'),(20,'abhishekpareek29','abhishekpareek29@gmail.com','4e2c51a2710425eb2ebf22b3255bbf52d65b57c8','csc510_mock_repo'),(21,'abhishekpareek29','abhishekpareek29@gmail.com','4e2c51a2710425eb2ebf22b3255bbf52d65b57c8','csc510_mock_repo'),(22,'abhishekpareek29','abhishekpareek29@gmail.com','4e2c51a2710425eb2ebf22b3255bbf52d65b57c8','csc510_mock_repo'),(23,'abhishekpareek29','abhishekpareek29@gmail.com','4e2c51a2710425eb2ebf22b3255bbf52d65b57c8','csc510_mock_repo'),(24,'abhishekpareek29','abhishekpareek29@gmail.com','4e2c51a2710425eb2ebf22b3255bbf52d65b57c8','csc510_mock_repo'),(25,'abhishekpareek29','abhishekpareek29@gmail.com','4e2c51a2710425eb2ebf22b3255bbf52d65b57c8','csc510_mock_repo'),(26,'abhishekpareek29','abhishekpareek29@gmail.com','4e2c51a2710425eb2ebf22b3255bbf52d65b57c8','csc510_mock_repo'),(27,'abhishekpareek29','abhishekpareek29@gmail.com','4e2c51a2710425eb2ebf22b3255bbf52d65b57c8','csc510_mock_repo'),(28,'abhishekpareek29','abhishekpareek29@gmail.com','4e2c51a2710425eb2ebf22b3255bbf52d65b57c8','csc510_mock_repo'),(29,'abhishekpareek29','abhishekpareek29@gmail.com','4e2c51a2710425eb2ebf22b3255bbf52d65b57c8','csc510_mock_repo'),(30,'abhishekpareek29','abhishekpareek29@gmail.com','4e2c51a2710425eb2ebf22b3255bbf52d65b57c8','csc510_mock_repo'),(31,'abhishekpareek29','abhishekpareek29@gmail.com','4e2c51a2710425eb2ebf22b3255bbf52d65b57c8','csc510_mock_repo'),(32,'abhishekpareek29','abhishekpareek29@gmail.com','4e2c51a2710425eb2ebf22b3255bbf52d65b57c8','csc510_mock_repo'),(33,'abhishekpareek29','abhishekpareek29@gmail.com','4e2c51a2710425eb2ebf22b3255bbf52d65b57c8','csc510_mock_repo'),(34,'abhishekpareek29','abhishekpareek29@gmail.com','4e2c51a2710425eb2ebf22b3255bbf52d65b57c8','csc510_mock_repo'),(35,'abhishekpareek29','abhishekpareek29@gmail.com','4e2c51a2710425eb2ebf22b3255bbf52d65b57c8','csc510_mock_repo'),(36,'abhishekpareek29','abhishekpareek29@gmail.com','4e2c51a2710425eb2ebf22b3255bbf52d65b57c8','csc510_mock_repo'),(37,'abhishekpareek29','abhishekpareek29@gmail.com','4e2c51a2710425eb2ebf22b3255bbf52d65b57c8','csc510_mock_repo'),(38,'abhishekpareek29','abhishekpareek29@gmail.com','4e2c51a2710425eb2ebf22b3255bbf52d65b57c8','csc510_mock_repo'),(39,'abhishekpareek29','abhishekpareek29@gmail.com','4e2c51a2710425eb2ebf22b3255bbf52d65b57c8','csc510_mock_repo'),(40,'abhishekpareek29','abhishekpareek29@gmail.com','4e2c51a2710425eb2ebf22b3255bbf52d65b57c8','csc510_mock_repo'),(41,'abhishekpareek29','abhishekpareek29@gmail.com','4e2c51a2710425eb2ebf22b3255bbf52d65b57c8','csc510_mock_repo'),(42,'abhishekpareek29','abhishekpareek29@gmail.com','4e2c51a2710425eb2ebf22b3255bbf52d65b57c8','csc510_mock_repo'),(43,'abhishekpareek29','abhishekpareek29@gmail.com','4e2c51a2710425eb2ebf22b3255bbf52d65b57c8','csc510_mock_repo'),(44,'abhishekpareek29','abhishekpareek29@gmail.com','4e2c51a2710425eb2ebf22b3255bbf52d65b57c8','csc510_mock_repo'),(45,'abhishekpareek29','abhishekpareek29@gmail.com','4e2c51a2710425eb2ebf22b3255bbf52d65b57c8','csc510_mock_repo'),(46,'abhishekpareek29','abhishekpareek29@gmail.com','4e2c51a2710425eb2ebf22b3255bbf52d65b57c8','csc510_mock_repo'),(47,'abhishekpareek29','abhishekpareek29@gmail.com','4e2c51a2710425eb2ebf22b3255bbf52d65b57c8','csc510_mock_repo'),(48,'abhishekpareek29','abhishekpareek29@gmail.com','4e2c51a2710425eb2ebf22b3255bbf52d65b57c8','csc510_mock_repo'),(49,'abhishekpareek29','abhishekpareek29@gmail.com','4e2c51a2710425eb2ebf22b3255bbf52d65b57c8','csc510_mock_repo'),(50,'abhishekpareek29','abhishekpareek29@gmail.com','4e2c51a2710425eb2ebf22b3255bbf52d65b57c8','csc510_mock_repo'),(51,'abhishekpareek29','abhishekpareek29@gmail.com','4e2c51a2710425eb2ebf22b3255bbf52d65b57c8','csc510_mock_repo'),(52,'abhishekpareek29','abhishekpareek29@gmail.com','4e2c51a2710425eb2ebf22b3255bbf52d65b57c8','csc510_mock_repo'),(53,'abhishekpareek29','abhishekpareek29@gmail.com','4e2c51a2710425eb2ebf22b3255bbf52d65b57c8','csc510_mock_repo'),(54,'abhishekpareek29','abhishekpareek29@gmail.com','4e2c51a2710425eb2ebf22b3255bbf52d65b57c8','csc510_mock_repo'),(55,'abhishekpareek29','abhishekpareek29@gmail.com','4e2c51a2710425eb2ebf22b3255bbf52d65b57c8','csc510_mock_repo'),(56,'abhishekpareek29','abhishekpareek29@gmail.com','4e2c51a2710425eb2ebf22b3255bbf52d65b57c8','csc510_mock_repo'),(57,'abhishekpareek29','abhishekpareek29@gmail.com','4e2c51a2710425eb2ebf22b3255bbf52d65b57c8','csc510_mock_repo'),(58,'abhishekpareek29','abhishekpareek29@gmail.com','4e2c51a2710425eb2ebf22b3255bbf52d65b57c8','csc510_mock_repo'),(59,'abhishekpareek29','abhishekpareek29@gmail.com','4e2c51a2710425eb2ebf22b3255bbf52d65b57c8','csc510_mock_repo'),(60,'abhishekpareek29','abhishekpareek29@gmail.com','4e2c51a2710425eb2ebf22b3255bbf52d65b57c8','csc510_mock_repo'),(61,'abhishekpareek29','abhishekpareek29@gmail.com','4e2c51a2710425eb2ebf22b3255bbf52d65b57c8','csc510_mock_repo'),(62,'abhishekpareek29','abhishekpareek29@gmail.com','4e2c51a2710425eb2ebf22b3255bbf52d65b57c8','csc510_mock_repo'),(63,'abhishekpareek29','abhishekpareek29@gmail.com','4e2c51a2710425eb2ebf22b3255bbf52d65b57c8','csc510_mock_repo'),(64,'abhishekpareek29','abhishekpareek29@gmail.com','4e2c51a2710425eb2ebf22b3255bbf52d65b57c8','csc510_mock_repo'),(65,'abhishekpareek29','abhishekpareek29@gmail.com','4e2c51a2710425eb2ebf22b3255bbf52d65b57c8','csc510_mock_repo'),(66,'abhishekpareek29','abhishekpareek29@gmail.com','4e2c51a2710425eb2ebf22b3255bbf52d65b57c8','csc510_mock_repo'),(67,'abhishekpareek29','abhishekpareek29@gmail.com','4e2c51a2710425eb2ebf22b3255bbf52d65b57c8','csc510_mock_repo'),(68,'abhishekpareek29','abhishekpareek29@gmail.com','4e2c51a2710425eb2ebf22b3255bbf52d65b57c8','csc510_mock_repo'),(69,'abhishekpareek29','abhishekpareek29@gmail.com','4e2c51a2710425eb2ebf22b3255bbf52d65b57c8','csc510_mock_repo'),(70,'abhishekpareek29','abhishekpareek29@gmail.com','4e2c51a2710425eb2ebf22b3255bbf52d65b57c8','csc510_mock_repo'),(71,'abhishekpareek29','abhishekpareek29@gmail.com','4e2c51a2710425eb2ebf22b3255bbf52d65b57c8','csc510_mock_repo'),(72,'abhishekpareek29','abhishekpareek29@gmail.com','4e2c51a2710425eb2ebf22b3255bbf52d65b57c8','csc510_mock_repo'),(73,'abhishekpareek29','abhishekpareek29@gmail.com','4e2c51a2710425eb2ebf22b3255bbf52d65b57c8','csc510_mock_repo');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-04-20 17:53:53
