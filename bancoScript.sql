-- O banco é criado automatimente via ORM enão sendo não necessário nem recomendado a execução deste script
-- o máximo que deve ser feito é utilizar o 'CREATE DATABASE startups' e somente

-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema startups
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema startups
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `startups` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `startups` ;

-- -----------------------------------------------------
-- Table `startups`.`linguagem_programaçãos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `startups`.`linguagem_programaçãos` (
  `id_linguagem` INT NOT NULL,
  `nome_linguagem` TEXT NOT NULL,
  `ano_lancamento` INT NOT NULL,
  `createdAt` DATETIME NOT NULL,
  `updatedAt` DATETIME NOT NULL,
  PRIMARY KEY (`id_linguagem`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `startups`.`startups`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `startups`.`startups` (
  `id_startup` INT NOT NULL,
  `nome_startup` TEXT NOT NULL,
  `cidade_sede` TEXT NOT NULL,
  `createdAt` DATETIME NOT NULL,
  `updatedAt` DATETIME NOT NULL,
  PRIMARY KEY (`id_startup`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `startups`.`programadors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `startups`.`programadors` (
  `id_programador` INT NOT NULL,
  `nome_programador` TEXT NOT NULL,
  `genero` CHAR(255) NOT NULL,
  `data_nascimento` DATETIME NOT NULL,
  `email` TEXT NOT NULL,
  `createdAt` DATETIME NOT NULL,
  `updatedAt` DATETIME NOT NULL,
  `id_startup` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id_programador`),
  INDEX `id_startup` (`id_startup` ASC) VISIBLE,
  CONSTRAINT `programadors_ibfk_1`
    FOREIGN KEY (`id_startup`)
    REFERENCES `startups`.`startups` (`id_startup`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `startups`.`programador_linguagens`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `startups`.`programador_linguagens` (
  `createdAt` DATETIME NOT NULL,
  `updatedAt` DATETIME NOT NULL,
  `id_programador` INT NOT NULL,
  `id_linguagem` INT NOT NULL,
  PRIMARY KEY (`id_programador`, `id_linguagem`),
  INDEX `id_linguagem` (`id_linguagem` ASC) VISIBLE,
  CONSTRAINT `programador_linguagens_ibfk_1`
    FOREIGN KEY (`id_programador`)
    REFERENCES `startups`.`programadors` (`id_programador`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `programador_linguagens_ibfk_2`
    FOREIGN KEY (`id_linguagem`)
    REFERENCES `startups`.`linguagem_programaçãos` (`id_linguagem`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

USE `startups` ;

-- -----------------------------------------------------
-- Placeholder table for view `startups`.`info_startup`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `startups`.`info_startup` (`nome_startup` INT, `group_concat(" ", nome_programador)` INT, `group_concat(" ", email)` INT, `count(*)` INT);

-- -----------------------------------------------------
-- View `startups`.`info_startup`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `startups`.`info_startup`;
USE `startups`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `startups`.`info_startup` (`Nome_Startup`,`Programadores`,`email`,`contador`) AS select `s`.`nome_startup` AS `nome_startup`,group_concat(' ',`p`.`nome_programador` separator ',') AS `group_concat(" ", nome_programador)`,group_concat(' ',`p`.`email` separator ',') AS `group_concat(" ", email)`,count(0) AS `count(*)` from (`startups`.`programadors` `p` join `startups`.`startups` `s` on((`p`.`id_startup` = `s`.`id_startup`))) group by `s`.`nome_startup`;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;




insert into Startup values(10001,'Tech4Toy','Porto Alegre' );
insert into Startup values(10002,'Smart123','Belo Horizonte');
insert into Startup values(10003,'KnowledgeUp','Rio de Janeiro');
insert into Startup values(10004,'BSI Next Level','Recife');
insert into Startup values(10005,'QualiHealth','São Paulo');
insert into Startup values(10006,'ProEdu','Florianópolis');





insert into programador values(30001,10001,'João Pedro','M','1993-06-23','joaop@mail.com');
insert into programador values(30002,10002,'Paula Silva','F','1986-01-10','paulas@mail.com');
insert into programador values(30003,10003,'Renata Vieira','F','1991-07-05','renatav@mail.com');
insert into programador values(30004,10004,'Felipe Santos','M','1976-11-25','felipes@mail.com');
insert into programador values(30005,10001,'Ana Cristina','F','1968-02-19','anac@mail.com');
insert into programador values(30006,10004,'Alexandre Alves','M','1988-07-07','alexandrea@mail.com');
insert into programador values(30007,10002,'Laura Marquer','F','1987-10-04','lauram@mail.com');





insert into linguagem_programação values(20001,'Python',1991);
insert into linguagem_programação values(20002,'PHP',1995);
insert into linguagem_programação values(20003,'JAVA',1995);
insert into linguagem_programação values(20004,'C',1972);
insert into linguagem_programação values(20005,'JavaScript',1995);
insert into linguagem_programação values(20006,'Dart',2011);


insert into programador_linguagem values (30001,20001);
insert into programador_linguagem values (30001,20002);
insert into programador_linguagem values (30002,20003);
insert into programador_linguagem values (30003,20004);
insert into programador_linguagem values (30003,20005);
insert into programador_linguagem values (30004,20005);
insert into programador_linguagem values (30007,20001);
insert into programador_linguagem values (30007,20002);