-- MySQL Script generated by MySQL Workbench
-- Mon Jun 29 00:47:09 2020
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema BIBLIOTECA
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema BIBLIOTECA
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `BIBLIOTECA` DEFAULT CHARACTER SET utf8 ;
USE `BIBLIOTECA` ;

-- -----------------------------------------------------
-- Table `BIBLIOTECA`.`AUTOR`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BIBLIOTECA`.`AUTOR` (
  `id_AUTOR` INT NOT NULL AUTO_INCREMENT,
  `NOME_AUTOR` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`id_AUTOR`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BIBLIOTECA`.`EDITORA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BIBLIOTECA`.`EDITORA` (
  `id_EDITORA` INT NOT NULL AUTO_INCREMENT,
  `NOME_EDITORA` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id_EDITORA`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BIBLIOTECA`.`CATEGORIA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BIBLIOTECA`.`CATEGORIA` (
  `id_CATEGORIA` INT NOT NULL AUTO_INCREMENT,
  `NOME_CATEGORIA` VARCHAR(80) NOT NULL,
  PRIMARY KEY (`id_CATEGORIA`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BIBLIOTECA`.`LIVRO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BIBLIOTECA`.`LIVRO` (
  `id_LIVRO` INT NOT NULL AUTO_INCREMENT,
  `NOME_LIVRO` VARCHAR(250) NOT NULL,
  `ANO_LANCAMENTO_LIVRO` VARCHAR(4) NOT NULL,
  `ISBN` VARCHAR(45) NOT NULL,
  `IMAGE_LIVRO` VARCHAR(100) NULL,
  `EDICAO_LIVRO` VARCHAR(45) NULL,
  `STATUS_LIVRO` CHAR(1) NOT NULL,
  `AUTOR_ID_LIVRO` INT NOT NULL,
  `EDITORA_ID_LIVRO` INT NOT NULL,
  `CATEGORIA_ID_LIVRO` INT NOT NULL,
  PRIMARY KEY (`id_LIVRO`),
  UNIQUE INDEX `ISBN_UNIQUE` (`ISBN` ASC) VISIBLE,
  INDEX `fk_LIVRO_AUTOR_idx` (`AUTOR_ID_LIVRO` ASC) VISIBLE,
  INDEX `fk_LIVRO_EDITORA1_idx` (`EDITORA_ID_LIVRO` ASC) VISIBLE,
  INDEX `fk_LIVRO_CATEGORIA1_idx` (`CATEGORIA_ID_LIVRO` ASC) VISIBLE,
  CONSTRAINT `fk_LIVRO_AUTOR`
    FOREIGN KEY (`AUTOR_ID_LIVRO`)
    REFERENCES `BIBLIOTECA`.`AUTOR` (`id_AUTOR`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_LIVRO_EDITORA1`
    FOREIGN KEY (`EDITORA_ID_LIVRO`)
    REFERENCES `BIBLIOTECA`.`EDITORA` (`id_EDITORA`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_LIVRO_CATEGORIA1`
    FOREIGN KEY (`CATEGORIA_ID_LIVRO`)
    REFERENCES `BIBLIOTECA`.`CATEGORIA` (`id_CATEGORIA`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BIBLIOTECA`.`ESTOQUE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BIBLIOTECA`.`ESTOQUE` (
  `id_ITEM` INT NOT NULL AUTO_INCREMENT,
  `UND_ITEM` INT NOT NULL,
  `LIVRO_ID_ESTOQUE` INT NOT NULL,
  PRIMARY KEY (`id_ITEM`),
  INDEX `fk_ESTOQUE_LIVRO1_idx` (`LIVRO_ID_ESTOQUE` ASC) VISIBLE,
  CONSTRAINT `fk_ESTOQUE_LIVRO1`
    FOREIGN KEY (`LIVRO_ID_ESTOQUE`)
    REFERENCES `BIBLIOTECA`.`LIVRO` (`id_LIVRO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BIBLIOTECA`.`ALUNO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BIBLIOTECA`.`ALUNO` (
  `id_ALUNO` INT NOT NULL AUTO_INCREMENT,
  `NOME_ALUNO` VARCHAR(200) NOT NULL,
  `STATUS_ALUNO` CHAR(1) NOT NULL,
  PRIMARY KEY (`id_ALUNO`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BIBLIOTECA`.`EMPRESTADO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BIBLIOTECA`.`EMPRESTADO` (
  `id_EMPRESTADO` INT NOT NULL AUTO_INCREMENT,
  `ENTRADA` DATETIME NOT NULL,
  `SAIDA` DATETIME NULL,
  `ALUNO_ID_EMPRESTADO` INT NOT NULL,
  `ESTOQUE_id_ITEM` INT NOT NULL,
  PRIMARY KEY (`id_EMPRESTADO`),
  INDEX `fk_EMPRESTADO_ALUNO1_idx` (`ALUNO_ID_EMPRESTADO` ASC) VISIBLE,
  INDEX `fk_EMPRESTADO_ESTOQUE1_idx` (`ESTOQUE_id_ITEM` ASC) VISIBLE,
  CONSTRAINT `fk_EMPRESTADO_ALUNO1`
    FOREIGN KEY (`ALUNO_ID_EMPRESTADO`)
    REFERENCES `BIBLIOTECA`.`ALUNO` (`id_ALUNO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_EMPRESTADO_ESTOQUE1`
    FOREIGN KEY (`ESTOQUE_id_ITEM`)
    REFERENCES `BIBLIOTECA`.`ESTOQUE` (`id_ITEM`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;