create database if not exists dojos_students;

use dojos_students;

create table if not exists dojos(
  id int primary key auto_increment,
  dojoName varchar(255) not null,
  location varchar(255) not null,
  createdAt datetime,
  updatedAt datetime
)engine=InnoDB;

create table if not exists students(
  id int primary key auto_increment,
  firstName varchar(255) not null,
  lastName varchar(255) not null,
  email varchar(255) not null,
  dojo_id int not null,
  createdAt datetime,
  updatedAt datetime,
  foreign key (dojo_id) references dojos(id)
)engine=InnoDB;

create table if not exists addresses(
  id int primary key auto_increment,
  street varchar(255) not null,
  street_number int not null,
  student_id int not null,
  foreign key (student_id) references students(id)
)engine=InnoDB;

create table if not exists intrests(
  id int primary key auto_increment,
  intrestName varchar(255) not null,
  student_id int not null,
  foreign key (student_id) references students(id)
)engine=InnoDB;


-- -- MySQL Workbench Forward Engineering

-- SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
-- SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
-- SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -- -----------------------------------------------------
-- -- Schema mydb
-- -- -----------------------------------------------------
-- -- -----------------------------------------------------
-- -- Schema dojos_students
-- -- -----------------------------------------------------

-- -- -----------------------------------------------------
-- -- Schema dojos_students
-- -- -----------------------------------------------------
-- CREATE SCHEMA IF NOT EXISTS `dojos_students` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
-- USE `dojos_students` ;

-- -- -----------------------------------------------------
-- -- Table `dojos_students`.`dojos`
-- -- -----------------------------------------------------
-- CREATE TABLE IF NOT EXISTS `dojos_students`.`dojos` (
--   `id` INT NOT NULL AUTO_INCREMENT,
--   `dojoName` VARCHAR(255) NOT NULL,
--   `location` VARCHAR(255) NOT NULL,
--   `createdAt` DATETIME NULL DEFAULT NULL,
--   `updatedAt` DATETIME NULL DEFAULT NULL,
--   PRIMARY KEY (`id`))
-- ENGINE = InnoDB
-- DEFAULT CHARACTER SET = utf8mb4
-- COLLATE = utf8mb4_0900_ai_ci;


-- -- -----------------------------------------------------
-- -- Table `dojos_students`.`students`
-- -- -----------------------------------------------------
-- CREATE TABLE IF NOT EXISTS `dojos_students`.`students` (
--   `id` INT NOT NULL AUTO_INCREMENT,
--   `firstName` VARCHAR(255) NOT NULL,
--   `lastName` VARCHAR(255) NOT NULL,
--   `email` VARCHAR(255) NOT NULL,
--   `dojo_id` INT NOT NULL,
--   `createdAt` DATETIME NULL DEFAULT NULL,
--   `updatedAt` DATETIME NULL DEFAULT NULL,
--   PRIMARY KEY (`id`),
--   INDEX `dojo_id` (`dojo_id` ASC) VISIBLE,
--   CONSTRAINT `students_ibfk_1`
--     FOREIGN KEY (`dojo_id`)
--     REFERENCES `dojos_students`.`dojos` (`id`))
-- ENGINE = InnoDB
-- DEFAULT CHARACTER SET = utf8mb4
-- COLLATE = utf8mb4_0900_ai_ci;


-- -- -----------------------------------------------------
-- -- Table `dojos_students`.`addresses`
-- -- -----------------------------------------------------
-- CREATE TABLE IF NOT EXISTS `dojos_students`.`addresses` (
--   `id` INT NOT NULL AUTO_INCREMENT,
--   `street` VARCHAR(255) NOT NULL,
--   `street_number` INT NOT NULL,
--   `student_id` INT NOT NULL,
--   PRIMARY KEY (`id`),
--   INDEX `student_id` (`student_id` ASC) VISIBLE,
--   CONSTRAINT `addresses_ibfk_1`
--     FOREIGN KEY (`student_id`)
--     REFERENCES `dojos_students`.`students` (`id`))
-- ENGINE = InnoDB
-- DEFAULT CHARACTER SET = utf8mb4
-- COLLATE = utf8mb4_0900_ai_ci;


-- -- -----------------------------------------------------
-- -- Table `dojos_students`.`intrests`
-- -- -----------------------------------------------------
-- CREATE TABLE IF NOT EXISTS `dojos_students`.`intrests` (
--   `id` INT NOT NULL AUTO_INCREMENT,
--   `intrestName` VARCHAR(255) NOT NULL,
--   `student_id` INT NOT NULL,
--   PRIMARY KEY (`id`),
--   INDEX `student_id` (`student_id` ASC) VISIBLE,
--   CONSTRAINT `intrests_ibfk_1`
--     FOREIGN KEY (`student_id`)
--     REFERENCES `dojos_students`.`students` (`id`))
-- ENGINE = InnoDB
-- DEFAULT CHARACTER SET = utf8mb4
-- COLLATE = utf8mb4_0900_ai_ci;


-- SET SQL_MODE=@OLD_SQL_MODE;
-- SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
-- SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
