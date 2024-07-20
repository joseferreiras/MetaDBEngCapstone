
DROP PROCEDURE IF EXISTS AddBooking;

DELIMITER //
CREATE PROCEDURE AddBooking (IN BookingIDN INT, IN CustomerIDN INT, BookingDateN DATE, IN TableNumN INT)

BEGIN
INSERT INTO Bookings (BookingID,CustomerID,BookingDate,TableNum) 
VALUES (BookingIDN,CustomerIDN,BookingDateN,TableNumN);
END//
DELIMITER ;