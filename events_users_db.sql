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
-- Table `mydb`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NULL,
  `address` VARCHAR(255) NULL,
  `created_at` DATETIME NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`events`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`events` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(255) NOT NULL,
  `description` VARCHAR(255) NOT NULL,
  `start_time` DATETIME NULL,
  `end_time` DATETIME NULL,
  `eventscol` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`user_eevents`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`user_eevents` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `date` DATETIME NULL,
  `users_id` INT NOT NULL,
  `events_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_user_eevents_users_idx` (`users_id` ASC) VISIBLE,
  INDEX `fk_user_eevents_events1_idx` (`events_id` ASC) VISIBLE,
  CONSTRAINT `fk_user_eevents_users`
    FOREIGN KEY (`users_id`)
    REFERENCES `mydb`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_eevents_events1`
    FOREIGN KEY (`events_id`)
    REFERENCES `mydb`.`events` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


-- SELECT * FROM world.city;

-- INSERT INTO `world`.`city`
-- (`ID`,
-- `Name`,
-- `CountryCode`,
-- `District`,
-- `Population`)
-- VALUES
-- (<{ID: }>,
-- <{Name: }>,
-- <{CountryCode: }>,
-- <{District: }>,
-- <{Population: }>);