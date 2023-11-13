
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



DROP TABLE IF EXISTS `deskbill_detail`;

CREATE TABLE `deskbill_detail` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'Billing Details ID',
  `deskBillID` int(10) DEFAULT NULL COMMENT 'Bill ID',
  `dishName` varchar(50) DEFAULT NULL COMMENT 'Dish name',
  `dishNum` int(10) DEFAULT NULL COMMENT 'Number of dishes',
  `cost` decimal(20,2) DEFAULT NULL COMMENT 'subtotal',
  `content` varchar(50) DEFAULT NULL COMMENT 'Food notes',
  `price` double(20,2) DEFAULT NULL COMMENT 'Unit price',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `dish`;

CREATE TABLE `dish` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'Dish ID',
  `dishName` varchar(50) DEFAULT NULL COMMENT 'Dish name',
  `price` decimal(20,2) DEFAULT NULL COMMENT 'Food price',
  `type` int(10) DEFAULT NULL COMMENT 'Menu type 1: soup, 2: Stir-fry,3: wine, 4: Other',
  `stock` int(10) DEFAULT NULL COMMENT 'Dishes inventory',
  `fileName` varchar(100) DEFAULT NULL COMMENT 'Picture name',
  `drinkBillID` int(10) DEFAULT NULL COMMENT 'Purchase ID',
  `drinkBillCode` varbinary(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `drink_sell_bill`;

CREATE TABLE `drink_sell_bill` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'Sales information id',
  `drinkbillID` int(10) DEFAULT NULL COMMENT 'Corresponding wine purchase information id',
  `sellCount` int(10) DEFAULT NULL COMMENT 'Number of sales',
  `sellPrice` decimal(20,2) DEFAULT NULL COMMENT 'Sales unit price',
  `DrinkBillCode` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `drinkbill`;

CREATE TABLE `drinkbill` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'Purchase id',
  `drinbillCode` varchar(100) NOT NULL COMMENT 'Order number',
  `productName` varchar(50) DEFAULT NULL COMMENT 'Trade name',
  `proCount` int(10) DEFAULT NULL COMMENT 'Number of commodities',
  `remark` varchar(50) DEFAULT NULL COMMENT 'remark',
  `unit` varchar(10) DEFAULT NULL COMMENT 'unit',
  `createDate` datetime DEFAULT NULL COMMENT 'Creation time',
  `createBy` varchar(50) DEFAULT NULL COMMENT 'founder',
  `providerID` int(10) DEFAULT NULL COMMENT 'Supplier ID',
  `totalCost` decimal(20,2) DEFAULT NULL COMMENT 'Total order price',
  `price` decimal(20,2) DEFAULT NULL COMMENT 'Unit price of goods',
  `isPay` int(5) DEFAULT '0' COMMENT 'Whether to pay 1 Unpaid 2 Paid',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `provider`;

CREATE TABLE `provider` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'Supplier ID',
  `proName` varchar(50) DEFAULT NULL COMMENT 'Supplier name',
  `product` varchar(50) DEFAULT NULL COMMENT 'Main supply commodities',
  `telNumber` varchar(50) DEFAULT NULL COMMENT 'Contact number',
  `address` varchar(50) DEFAULT NULL COMMENT 'address',
  `contact` varchar(50) DEFAULT NULL COMMENT 'Primary contact person',
  `phone` varchar(50) DEFAULT NULL COMMENT 'Contact phone number',
  `remark` varchar(50) DEFAULT NULL COMMENT 'remark',
  `createDate` datetime DEFAULT NULL COMMENT 'Order creation time',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'uid',
  `userCode` varchar(50) NOT NULL COMMENT 'user',
  `userName` varchar(50) DEFAULT NULL COMMENT 'username',
  `userPassWord` varchar(50) NOT NULL COMMENT 'password',
  `phone` varchar(50) DEFAULT NULL COMMENT 'user phone',
  `identity` varchar(50) DEFAULT NULL COMMENT 'Identity card number',
  `createDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;


insert  into `user`(`id`,`userCode`,`userName`,`userPassWord`,`phone`,`identity`,`createDate`) values (1,'admin','root','123456','1222222','111111111111111111','2023-10-18 00:00:00');

