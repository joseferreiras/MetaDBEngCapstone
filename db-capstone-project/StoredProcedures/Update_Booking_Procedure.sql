DROP PROCEDURE IF EXISTS UpdateBooking;

DELIMITER //
CREATE PROCEDURE UpdateBooking(IN BookingIDU INT, IN TableNumN INT)
BEGIN
UPDATE Bookings SET TableNum=TableNumN WHERE BookingId= BookingIDU;
END //

DELIMITER ;
 