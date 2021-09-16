-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema blog_database
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema blog_database
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `blog_database` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;

-- -----------------------------------------------------
-- Table `blog_database`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blog_database`.`user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(50) NOT NULL,
  `last_name` VARCHAR(50) NOT NULL,
  `phone` VARCHAR(15) NOT NULL,
  `email` VARCHAR(50) NOT NULL,
  `passwordHash` VARCHAR(50) NOT NULL,
  `registeredAt` DATE NULL DEFAULT NULL,
  `lastLogin` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `blog_database`.`posts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blog_database`.`posts` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `authotId` BIGINT NOT NULL,
  `parentId` BIGINT NOT NULL,
  `title` VARCHAR(75) NOT NULL,
  `metaTitle` VARCHAR(100) NOT NULL,
  `slug` VARCHAR(100) NOT NULL,
  `summary` TINYTEXT NULL DEFAULT NULL,
  `published` TINYINT(1) NULL DEFAULT NULL,
  `createdAt` DATE NULL DEFAULT NULL,
  `updatedAt` DATE NULL DEFAULT NULL,
  `publishedAt` DATE NULL DEFAULT NULL,
  `content` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_posts_user_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_posts_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `blog_database`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `blog_database`.`post_category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blog_database`.`post_category` (
  `postId` BIGINT NOT NULL,
  `categoryId` BIGINT NOT NULL,
  `posts_id` BIGINT NOT NULL,
  PRIMARY KEY (`posts_id`),
  CONSTRAINT `fk_post_category_posts1`
    FOREIGN KEY (`posts_id`)
    REFERENCES `blog_database`.`posts` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `blog_database`.`category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blog_database`.`category` (
  `id` BIGINT NOT NULL,
  `parentId` BIGINT NOT NULL,
  `title` VARCHAR(75) NOT NULL,
  `metaTitle` VARCHAR(100) NOT NULL,
  `slug` VARCHAR(100) NOT NULL,
  `content` TEXT NULL DEFAULT NULL,
  `post_category_posts_id` BIGINT NOT NULL,
  PRIMARY KEY (`id`, `post_category_posts_id`),
  INDEX `fk_category_post_category1_idx` (`post_category_posts_id` ASC) VISIBLE,
  CONSTRAINT `fk_category_post_category1`
    FOREIGN KEY (`post_category_posts_id`)
    REFERENCES `blog_database`.`post_category` (`posts_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `blog_database`.`post_comment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blog_database`.`post_comment` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `post_id` BIGINT NOT NULL,
  `postId` BIGINT NOT NULL,
  `parentId` BIGINT NOT NULL,
  `title` VARCHAR(100) NOT NULL,
  `published` TINYINT(1) NULL DEFAULT NULL,
  `createdAt` DATE NULL DEFAULT NULL,
  `publishedAt` DATE NULL DEFAULT NULL,
  `content` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_post_comment_posts1_idx` (`post_id` ASC) VISIBLE,
  CONSTRAINT `fk_post_comment_posts1`
    FOREIGN KEY (`post_id`)
    REFERENCES `blog_database`.`posts` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `blog_database`.`post_meta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blog_database`.`post_meta` (
  `id` BIGINT NOT NULL,
  `postId` BIGINT NOT NULL,
  `content` TEXT NULL DEFAULT NULL,
  `posts_id` BIGINT NOT NULL,
  INDEX `fk_post_meta_posts1_idx` (`posts_id` ASC) VISIBLE,
  CONSTRAINT `fk_post_meta_posts1`
    FOREIGN KEY (`posts_id`)
    REFERENCES `blog_database`.`posts` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `blog_database`.`tag`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blog_database`.`tag` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `title` VARCHAR(75) NOT NULL,
  `metaTitle` VARCHAR(100) NULL DEFAULT NULL,
  `slug` VARCHAR(100) NULL DEFAULT NULL,
  `content` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`id`, `user_id`),
  INDEX `fk_tag_user1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_tag_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `blog_database`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `blog_database`.`post_tag`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blog_database`.`post_tag` (
  `postId` BIGINT NOT NULL,
  `tagId` BIGINT NOT NULL,
  `posts_id` BIGINT NOT NULL,
  `tag_id` BIGINT NOT NULL,
  `tag_user_id` INT NOT NULL,
  PRIMARY KEY (`posts_id`, `tag_id`, `tag_user_id`),
  INDEX `fk_post_tag_tag1_idx` (`tag_id` ASC, `tag_user_id` ASC) VISIBLE,
  CONSTRAINT `fk_post_tag_posts1`
    FOREIGN KEY (`posts_id`)
    REFERENCES `blog_database`.`posts` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_post_tag_tag1`
    FOREIGN KEY (`tag_id` , `tag_user_id`)
    REFERENCES `blog_database`.`tag` (`id` , `user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;
