-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema libary
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema libary
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `libary` DEFAULT CHARACTER SET utf8 ;
USE `libary` ;

-- -----------------------------------------------------
-- Table `libary`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `libary`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `address_id` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `libary`.`addresses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `libary`.`addresses` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `street_name` VARCHAR(255) NOT NULL,
  `street_number` VARCHAR(255) NOT NULL,
  `state_name` VARCHAR(255) NOT NULL,
  `user_address` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `user_address` (`user_address` ASC) VISIBLE,
  CONSTRAINT `user_address`
    FOREIGN KEY (`user_address`)
    REFERENCES `libary`.`users` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `libary`.`authors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `libary`.`authors` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `author_name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `libary`.`books`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `libary`.`books` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `author` VARCHAR(255) NOT NULL,
  `title` VARCHAR(255) NOT NULL,
  `description` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `libary`.`books_and_authors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `libary`.`books_and_authors` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `author_id` INT NOT NULL,
  `book_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `author_book` (`author_id` ASC) VISIBLE,
  INDEX `book_author` (`book_id` ASC) VISIBLE,
  CONSTRAINT `author_book`
    FOREIGN KEY (`author_id`)
    REFERENCES `libary`.`authors` (`id`),
  CONSTRAINT `book_author`
    FOREIGN KEY (`book_id`)
    REFERENCES `libary`.`books` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `libary`.`favorite_books`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `libary`.`favorite_books` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `book_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `book_id` (`book_id` ASC) VISIBLE,
  CONSTRAINT `book_id`
    FOREIGN KEY (`book_id`)
    REFERENCES `libary`.`books` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;



