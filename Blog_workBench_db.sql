-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema blog
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema blog
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `blog` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `blog` ;

-- -----------------------------------------------------
-- Table `blog`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blog`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `firstName` VARCHAR(255) NOT NULL,
  `lastName` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `createdAt` DATETIME NULL DEFAULT NULL,
  `updatedAt` DATETIME NULL DEFAULT NULL,
  `country` VARCHAR(2) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email` (`email` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `blog`.`blogs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blog`.`blogs` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `createdAt` DATETIME NULL DEFAULT NULL,
  `updatedAt` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `blog`.`admins`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blog`.`admins` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `blog_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `createdAt` DATETIME NULL DEFAULT NULL,
  `updatedAt` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `user_id` (`user_id` ASC) VISIBLE,
  INDEX `blog_id` (`blog_id` ASC) VISIBLE,
  CONSTRAINT `admins_ibfk_1`
    FOREIGN KEY (`user_id`)
    REFERENCES `blog`.`users` (`id`),
  CONSTRAINT `admins_ibfk_2`
    FOREIGN KEY (`blog_id`)
    REFERENCES `blog`.`blogs` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;