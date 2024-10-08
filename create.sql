-- MySQL Script generated by MySQL Workbench
-- Tue Oct  8 16:53:08 2024
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Car`
-- -----------------------------------------------------
DROP TABLE IF EXISTS Car;
CREATE TABLE IF NOT EXISTS `mydb`.`Car` (
  `car_id` INT NOT NULL,
  `vin` TEXT,
  `manufacturer` VARCHAR(45) NULL,
  `model` VARCHAR(45) NULL,
  `year` INT NULL,
  `color` VARCHAR(55),
  PRIMARY KEY (`car_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Salesperson`
-- -----------------------------------------------------
DROP TABLE IF EXISTS Salesperson;
CREATE TABLE IF NOT EXISTS `mydb`.`Salesperson` (
  `salesperson_id` INT NOT NULL,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `phone` INT NULL,
  `email` VARCHAR(255) NULL,
  PRIMARY KEY (`salesperson_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Customer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS Customer;
CREATE TABLE IF NOT EXISTS `mydb`.`Customer` (
  `customer_id` INT NOT NULL,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `phone` INT NULL,
  PRIMARY KEY (`customer_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Invoice`
-- -----------------------------------------------------
DROP TABLE IF EXISTS Invoice;
CREATE TABLE IF NOT EXISTS `mydb`.`Invoice` (
  `invoice_id` INT NOT NULL,
  `sale_date` TEXT,
  `total_amount` FLOAT NULL,
  `Salesperson_salesperson_id` INT NOT NULL,
  `Car_car_id` INT NOT NULL,
  `Customer_customer_id` INT NOT NULL,
  PRIMARY KEY (`invoice_id`),
  INDEX `fk_Invoice_Salesperson_idx` (`Salesperson_salesperson_id` ASC) VISIBLE,
  INDEX `fk_Invoice_Car1_idx` (`Car_car_id` ASC) VISIBLE,
  INDEX `fk_Invoice_Customer1_idx` (`Customer_customer_id` ASC) VISIBLE,
  CONSTRAINT `fk_Invoice_Salesperson`
    FOREIGN KEY (`Salesperson_salesperson_id`)
    REFERENCES `mydb`.`Salesperson` (`salesperson_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Invoice_Car1`
    FOREIGN KEY (`Car_car_id`)
    REFERENCES `mydb`.`Car` (`car_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Invoice_Customer1`
    FOREIGN KEY (`Customer_customer_id`)
    REFERENCES `mydb`.`Customer` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
