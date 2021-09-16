create database if not exists message_app;

use message_app;

create table if not exists users(
  id int primary key auto_increment,
  firstName varchar(255) not null,
  lastName varchar(255) not null,
  email varchar(255) not null,
  password varchar(255) not null,
  createdAt datetime,
  updatedAt datetime
)engine=InnoDB;

create table if not exists messages(
  id int primary key auto_increment,
  messageContent text,
  user_id int not null,
  createdAt datetime,
  updatedAt datetime,
  foreign key (user_id) references users(id) 
)engine=InnoDB;

create table if not exists comments(
  id int primary key auto_increment,
  comment text,
  message_id int not null,
  user_id int not null,
  createdAt datetime,
  updatedAt datetime,
  foreign key (message_id) references messages(id),
  foreign key (user_id) references users(id)
)engine=InnoDB;


-- -- MySQL Workbench Forward Engineering

-- SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
-- SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
-- SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -- -----------------------------------------------------
-- -- Schema mydb
-- -- -----------------------------------------------------
-- -- -----------------------------------------------------
-- -- Schema message_app
-- -- -----------------------------------------------------

-- -- -----------------------------------------------------
-- -- Schema message_app
-- -- -----------------------------------------------------
-- CREATE SCHEMA IF NOT EXISTS `message_app` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
-- USE `message_app` ;

-- -- -----------------------------------------------------
-- -- Table `message_app`.`users`
-- -- -----------------------------------------------------
-- CREATE TABLE IF NOT EXISTS `message_app`.`users` (
--   `id` INT NOT NULL AUTO_INCREMENT,
--   `firstName` VARCHAR(255) NOT NULL,
--   `lastName` VARCHAR(255) NOT NULL,
--   `email` VARCHAR(255) NOT NULL,
--   `password` VARCHAR(255) NOT NULL,
--   `createdAt` DATETIME NULL DEFAULT NULL,
--   `updatedAt` DATETIME NULL DEFAULT NULL,
--   PRIMARY KEY (`id`))
-- ENGINE = InnoDB
-- DEFAULT CHARACTER SET = utf8mb4
-- COLLATE = utf8mb4_0900_ai_ci;


-- -- -----------------------------------------------------
-- -- Table `message_app`.`messages`
-- -- -----------------------------------------------------
-- CREATE TABLE IF NOT EXISTS `message_app`.`messages` (
--   `id` INT NOT NULL AUTO_INCREMENT,
--   `messageContent` TEXT NULL DEFAULT NULL,
--   `user_id` INT NOT NULL,
--   `createdAt` DATETIME NULL DEFAULT NULL,
--   `updatedAt` DATETIME NULL DEFAULT NULL,
--   PRIMARY KEY (`id`),
--   INDEX `user_id` (`user_id` ASC) VISIBLE,
--   CONSTRAINT `messages_ibfk_1`
--     FOREIGN KEY (`user_id`)
--     REFERENCES `message_app`.`users` (`id`))
-- ENGINE = InnoDB
-- DEFAULT CHARACTER SET = utf8mb4
-- COLLATE = utf8mb4_0900_ai_ci;


-- -- -----------------------------------------------------
-- -- Table `message_app`.`comments`
-- -- -----------------------------------------------------
-- CREATE TABLE IF NOT EXISTS `message_app`.`comments` (
--   `id` INT NOT NULL AUTO_INCREMENT,
--   `comment` TEXT NULL DEFAULT NULL,
--   `message_id` INT NOT NULL,
--   `user_id` INT NOT NULL,
--   `createdAt` DATETIME NULL DEFAULT NULL,
--   `updatedAt` DATETIME NULL DEFAULT NULL,
--   PRIMARY KEY (`id`),
--   INDEX `message_id` (`message_id` ASC) VISIBLE,
--   INDEX `user_id` (`user_id` ASC) VISIBLE,
--   CONSTRAINT `comments_ibfk_1`
--     FOREIGN KEY (`message_id`)
--     REFERENCES `message_app`.`messages` (`id`),
--   CONSTRAINT `comments_ibfk_2`
--     FOREIGN KEY (`user_id`)
--     REFERENCES `message_app`.`users` (`id`))
-- ENGINE = InnoDB
-- DEFAULT CHARACTER SET = utf8mb4
-- COLLATE = utf8mb4_0900_ai_ci;


-- SET SQL_MODE=@OLD_SQL_MODE;
-- SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
-- SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
