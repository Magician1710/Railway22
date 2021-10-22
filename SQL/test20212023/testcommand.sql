SELECT	*,count(o.CarID) so_xe_da_mua
FROM	((`ORDER` o
INNER 	JOIN	CUSTOMER c	ON	o.CustumerID=c.CustumerID)
INNER	JOIN	CAR_ORDER	ca	ON	o.CarID=ca.CarID)
GROUP BY	o.CustumerID,o.CarID 
ORDER BY 	o.CarID;

DROP PROCEDURE IF EXISTS hang_ban_chay;
DELIMITER $$
CREATE PROCEDURE hang_ban_chay()
BEGIN 
	SELECT		Maker,count(o.CustumerID)
	FROM		CAR_ORDER ca
	LEFT JOIN	`ORDER` o
	ON			o.CarID=ca.CarID
    WHERE	year(o.OrderDate)=(SELECT year(now()))
	GROUP BY	ca.Maker
    LIMIT		1;
END$$

DROP PROCEDURE IF EXISTS hang_ban_chay;
DELIMITER $$
CREATE PROCEDURE hang_ban_chay()
BEGIN 
	
END$$


