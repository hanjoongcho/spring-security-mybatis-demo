-- MySQL Script generated by MySQL Workbench
-- Fri Feb  2 08:49:16 2018
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema spring_security
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `spring_security` ;

-- -----------------------------------------------------
-- Schema spring_security
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `spring_security` DEFAULT CHARACTER SET utf8 ;
USE `spring_security` ;

-- -----------------------------------------------------
-- Table `spring_security`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `spring_security`.`user` ;

CREATE TABLE IF NOT EXISTS `spring_security`.`user` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `phone` VARCHAR(45) NULL,
  `password` VARCHAR(128) NULL,
  `isEnabled` TINYINT(4) UNSIGNED NULL DEFAULT 1 COMMENT '0:不可用 1:可用',
  `type` TINYINT(4) NULL DEFAULT 1 COMMENT '1:个人用户，以手机为登录凭证 2:企业用户，以邮箱为登录凭证',
  `creatAt` DATETIME NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

BEGIN;
INSERT INTO `spring_security`.`user` VALUES
(1 , 'boss' , 'boss@gmail.com' , '123' , '$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC' , 1 , 2 , DATE(NOW())),
(2 , 'manager' , 'manager@gmail.com' , '123123' , '$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC' , 1 , 2 , DATE(NOW())),
(3 , 'employee' , 'employee@gmail.com' , '123123123' , '$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC' , 1 , 2 , DATE(NOW())),
(4 , 'disemployee' , 'disemployee@gmail.com' , '123123123123' , '$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC' , 0 , 2 , DATE(NOW())),
(5 , 'personal' , 'personal@gmail.com' , '123123123123123' , '$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC' , 1 , 1 , DATE(NOW()));
COMMIT;

-- -----------------------------------------------------
-- Table `spring_security`.`role`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `spring_security`.`role` ;

CREATE TABLE IF NOT EXISTS `spring_security`.`role` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

BEGIN;
INSERT INTO `spring_security`.`role` VALUES
(1 , 'ROLE_PERSONAL'),
(2 , 'ROLE_BOSS'),
(3 , 'ROLE_MANAGER'),
(4 , 'ROLE_EMPLOYEE');
COMMIT;

-- -----------------------------------------------------
-- Table `spring_security`.`user_role`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `spring_security`.`user_role` ;

CREATE TABLE IF NOT EXISTS `spring_security`.`user_role` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `userId` BIGINT UNSIGNED NULL,
  `roleId` BIGINT UNSIGNED NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

BEGIN;
INSERT INTO `spring_security`.`user_role` VALUES
(1 , 1 , 1),
(2 , 1 , 2),
(3 , 1 , 3),
(4 , 1 , 4),
(5 , 2 , 3),
(6 , 2 , 4),
(7 , 2 , 1),
(8 , 3 , 1),
(9 , 3 , 4),
(10, 4 , 1),
(11, 4 , 4),
(12, 5 , 1);
COMMIT;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
