CREATE DATABASE IF NOT EXISTS RDBMS;

USE RDBMS;
DROP TABLE IF EXISTS
	CUSTOMER,
    `ORDER`,
    CAR_ORDER;
    
CREATE TABLE CUSTOMER
(
CustumerID	INT UNSIGNED AUTO_INCREMENT,
`Name`		VARCHAR(100),
Phone		CHAR(15),
Email		VARCHAR(100),
Address		TEXT,
Note		TEXT,
PRIMARY KEY (CustumerID)
);    

CREATE TABLE	CAR_ORDER
	(
    CarID		INT UNSIGNED AUTO_INCREMENT,
    Maker		ENUM("HONDA","TOYOTA","NISSAN"),
    Model		VARCHAR(100),
    `Year`		DATE,
    Color		VARCHAR(100),   
    Note		TEXT,
    PRIMARY KEY (CarID)
    );


CREATE TABLE	`ORDER`
(
OrderID			INT UNSIGNED AUTO_INCREMENT,
CustumerID		INT UNSIGNED,
CarID			INT UNSIGNED,
Amount			INT DEFAULT 1,
SalePrice		INT,
OrderDate		DATE,
DeliveryDate	DATE,
DeliveryAddress	TEXT,
`Status`		ENUM("dadathang","dagiao","dahuy") DEFAULT "dadathang",
Note			TEXT,
PRIMARY KEY		(OrderID),
FOREIGN KEY		(CustumerID) 	REFERENCES CUSTOMER(CustumerID),
FOREIGN KEY		(CarID)			REFERENCES CAR_ORDER(CarID)
);


