-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema LittleLemonDB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema LittleLemonDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `LittleLemonDB` DEFAULT CHARACTER SET utf8 ;
USE `LittleLemonDB` ;

-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Country`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Country` (
  `CountryCode` VARCHAR(45) NOT NULL,
  `Country` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`CountryCode`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`City`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`City` (
  `CityID` INT NOT NULL,
  `City` VARCHAR(45) NOT NULL,
  `ContryCode` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`CityID`),
  INDEX `CountryCode_idx` (`ContryCode` ASC) VISIBLE,
  CONSTRAINT `CountryCode`
    FOREIGN KEY (`ContryCode`)
    REFERENCES `LittleLemonDB`.`Country` (`CountryCode`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Delivery`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Delivery` (
  `DeliveryID` INT NOT NULL,
  `DeliveryDate` DATE NOT NULL,
  `DeliveryCost` DECIMAL NOT NULL,
  `CityID` INT NOT NULL,
  `PostalCode` VARCHAR(45) NULL,
  PRIMARY KEY (`DeliveryID`),
  INDEX `CityID_idx` (`CityID` ASC) VISIBLE,
  CONSTRAINT `CityID`
    FOREIGN KEY (`CityID`)
    REFERENCES `LittleLemonDB`.`City` (`CityID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Customers` (
  `CustomerID` INT NOT NULL,
  `CustomerName` VARCHAR(120) NOT NULL,
  PRIMARY KEY (`CustomerID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Drinks`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Drinks` (
  `DrinkID` INT NOT NULL,
  `DrinkName` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`DrinkID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Sides`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Sides` (
  `SideID` INT NOT NULL,
  `SideName` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`SideID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Desserts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Desserts` (
  `DessertID` INT NOT NULL,
  `DessertName` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`DessertID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Starters`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Starters` (
  `StarterID` INT NOT NULL,
  `StarterName` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`StarterID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Courses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Courses` (
  `CourseID` INT NOT NULL,
  `CourseName` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`CourseID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Cuisine`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Cuisine` (
  `CuisineID` INT NOT NULL,
  `CuisineName` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`CuisineID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Menu` (
  `MenuID` INT NOT NULL,
  `DrinkID` INT NULL,
  `SideID` INT NULL,
  `DessertID` INT NULL,
  `StarterID` INT NULL,
  `CourseID` INT NULL,
  `CuisineID` INT NULL,
  PRIMARY KEY (`MenuID`),
  INDEX `DrinkID_idx` (`DrinkID` ASC) VISIBLE,
  INDEX `SideID_idx` (`SideID` ASC) VISIBLE,
  INDEX `DessertID_idx` (`DessertID` ASC) VISIBLE,
  INDEX `StarterID_idx` (`StarterID` ASC) VISIBLE,
  INDEX `CourseID_idx` (`CourseID` ASC) VISIBLE,
  INDEX `CuisineID_idx` (`CuisineID` ASC) VISIBLE,
  CONSTRAINT `DrinkID`
    FOREIGN KEY (`DrinkID`)
    REFERENCES `LittleLemonDB`.`Drinks` (`DrinkID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `SideID`
    FOREIGN KEY (`SideID`)
    REFERENCES `LittleLemonDB`.`Sides` (`SideID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `DessertID`
    FOREIGN KEY (`DessertID`)
    REFERENCES `LittleLemonDB`.`Desserts` (`DessertID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `StarterID`
    FOREIGN KEY (`StarterID`)
    REFERENCES `LittleLemonDB`.`Starters` (`StarterID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `CourseID`
    FOREIGN KEY (`CourseID`)
    REFERENCES `LittleLemonDB`.`Courses` (`CourseID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `CuisineID`
    FOREIGN KEY (`CuisineID`)
    REFERENCES `LittleLemonDB`.`Cuisine` (`CuisineID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Orders` (
  `OrderID` INT NOT NULL,
  `OrderDate` DATE NOT NULL,
  `DeliveryID` INT NULL,
  `CustomerID` INT NOT NULL,
  `Discount` DECIMAL NULL,
  `Cost` DECIMAL NOT NULL,
  `Sales` DECIMAL NOT NULL,
  `MenuID` INT NOT NULL,
  `Quantity` INT NOT NULL,
  PRIMARY KEY (`OrderID`),
  INDEX `DeliveryID_idx` (`DeliveryID` ASC) VISIBLE,
  INDEX `CustomerID_idx` (`CustomerID` ASC) VISIBLE,
  INDEX `MenuID_idx` (`MenuID` ASC) VISIBLE,
  CONSTRAINT `DeliveryID`
    FOREIGN KEY (`DeliveryID`)
    REFERENCES `LittleLemonDB`.`Delivery` (`DeliveryID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `CustomerID`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `LittleLemonDB`.`Customers` (`CustomerID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `MenuID`
    FOREIGN KEY (`MenuID`)
    REFERENCES `LittleLemonDB`.`Menu` (`MenuID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Bookings` (
  `BookingID` INT NOT NULL,
  `CustomerID` INT NOT NULL,
  `BookingDate` DATE NOT NULL,
  `TableNum` INT NOT NULL,
  PRIMARY KEY (`BookingID`),
  INDEX `CustomerID_idx` (`CustomerID` ASC) VISIBLE,
  CONSTRAINT `CustomerIDBookings`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `LittleLemonDB`.`Customers` (`CustomerID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
