DROP PROCEDURE IF EXISTS GetMaxQuantity;

DELIMITER //

CREATE PROCEDURE GetMaxQuantity()

BEGIN
SELECT MAX(Quantity) AS 'Max Quantity in Order' FROM
Orders;

END//

DELIMITER ;