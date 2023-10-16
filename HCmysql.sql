
CREATE DATABASE `menu`;

USE `menu`;


DROP TABLE IF EXISTS `desk`;

CREATE TABLE `desk` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'Table id',
  `deskCode` varchar(50) NOT NULL COMMENT 'Table number',
  `status` int(10) NOT NULL COMMENT '1: empty 2: order not paid',
  `peopleNum` int(10) DEFAULT '0' COMMENT 'Number of people',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS `deskbill`;

CREATE TABLE `deskbill` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'Bill id',
  `deskID` int(10) DEFAULT NULL COMMENT 'Table ID for the bill',
  `billCode` varchar(50) DEFAULT NULL COMMENT 'Bill number',
  `totalMoney` decimal(20,2) DEFAULT '0.00' COMMENT 'Total consumption',
  `peopleNum` int(10) DEFAULT '0' COMMENT 'Number of consumers',
  `discount` decimal(10,1) DEFAULT '0.0' COMMENT 'Consumption discount',
  `createDate` datetime DEFAULT NULL COMMENT 'Consumption time',
  `debtor` varchar(50) DEFAULT NULL COMMENT 'debtor',
  `payType` int(10) DEFAULT NULL COMMENT 'Payment methods: 1. Wechat 2. Alipay 3. Credit Card 4. Cash 5. Charge',
  `beforeMoney` decimal(20,2) DEFAULT '0.00' COMMENT 'Total before discount',
  `deskCode` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



