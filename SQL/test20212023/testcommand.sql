SELECT	c.CustumerID,o.CarID,c.`Name`,o.Amount so_xe_da_mua
FROM	`ORDER` o
INNER 	JOIN	CUSTOMER c	
ON	o.CustumerID=c.CustumerID
GROUP BY	o.CustumerID,o.CarID
ORDER BY 	o.Amount;

DROP PROCEDURE IF EXISTS hang_ban_chay;
DELIMITER $$
CREATE PROCEDURE hang_ban_chay()
BEGIN 
	SELECT		Maker,count(o.CustumerID) so_xe_da_ban
	FROM		CAR_ORDER ca
	LEFT JOIN	`ORDER` o
	ON			o.CarID=ca.CarID
    WHERE	year(o.OrderDate)=(SELECT year(now()))
	GROUP BY	ca.Maker
    LIMIT		1;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS huy_don;
CREATE PROCEDURE huy_don()
			BEGIN
				SELECT	count(`Status`) so_don_da_bi_huy
                FROM	`ORDER`
                WHERE	`Status`="dahuy";
				DELETE   
				FROM	`ORDER`
				WHERE	`Status`="dahuy";
			END$$
DELIMITER ;

-- CREATE FUNCTION
-- DELIMITER $$

-- CREATE FUNCTION  thong_tin_don_hang(ma_khach_hang INT) 
-- RETURN  TABLE
-- AS
-- 		RETURN
-- 				(
-- 					SELECT	c.`Name` ,o.OrderID,o.Amount,ca.Maker
-- 					FROM	((`ORDER` o
-- 						INNER JOIN CUSTOMER c	ON c.CustumerID=o.CustumerID)
--                         INNER JOIN	CAR_ORDER ca	ON	o.CarID=ca.CarID)
-- 				)
--               
-- 		GO ;

CREATE FUNCTION
DELIMITER $$
CREATE FUNCTION thong_tin_don_hang (CustomerID INT) 
			RETURNS Datatype
			BEGIN
DECLARE variable_name datatype;
				SELECT …;
				RETURN  variable_name;
				END$$
			DELIMITER ;
-- bó tay k biết trả nhiều giá trị trong function!! 
