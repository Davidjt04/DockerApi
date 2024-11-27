-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema kebab
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema kebab
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `kebab` DEFAULT CHARACTER SET utf8mb3 ;
USE `kebab` ;

-- -----------------------------------------------------
-- Table `kebab`.`alergenos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `kebab`.`alergenos` (
  `id` INT NOT NULL,
  `foto` LONGTEXT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `kebab`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `kebab`.`usuario` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `foto` LONGTEXT NOT NULL,
  `contrasenia` VARCHAR(45) NOT NULL,
  `direccion` VARCHAR(80) NOT NULL,
  `monedero` INT NOT NULL,
  `tlf` VARCHAR(9) NOT NULL,
  `carrito` JSON NULL,
  `ubicacion` VARCHAR(45) NULL,
  `correoElectronico` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `kebab`.`alergenos_has_usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `kebab`.`alergenos_has_usuario` (
  `alergenos_id` INT NOT NULL,
  `usuario_id` INT NOT NULL,
  PRIMARY KEY (`alergenos_id`, `usuario_id`),
  INDEX `fk_alergenos_has_usuario_usuario1_idx` (`usuario_id` ASC) VISIBLE,
  INDEX `fk_alergenos_has_usuario_alergenos1_idx` (`alergenos_id` ASC) VISIBLE,
  CONSTRAINT `fk_alergenos_has_usuario_alergenos1`
    FOREIGN KEY (`alergenos_id`)
    REFERENCES `kebab`.`alergenos` (`id`),
  CONSTRAINT `fk_alergenos_has_usuario_usuario1`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `kebab`.`usuario` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `kebab`.`ingredientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `kebab`.`ingredientes` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `foto` LONGTEXT NOT NULL,
  `precio` DOUBLE NOT NULL,
  `tipo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `kebab`.`ingredientes_has_alergenos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `kebab`.`ingredientes_has_alergenos` (
  `ingredientes_id` INT NOT NULL,
  `alergenos_id` INT NOT NULL,
  PRIMARY KEY (`ingredientes_id`, `alergenos_id`),
  INDEX `fk_ingredientes_has_alergenos_alergenos1_idx` (`alergenos_id` ASC) VISIBLE,
  INDEX `fk_ingredientes_has_alergenos_ingredientes1_idx` (`ingredientes_id` ASC) VISIBLE,
  CONSTRAINT `fk_ingredientes_has_alergenos_alergenos1`
    FOREIGN KEY (`alergenos_id`)
    REFERENCES `kebab`.`alergenos` (`id`),
  CONSTRAINT `fk_ingredientes_has_alergenos_ingredientes1`
    FOREIGN KEY (`ingredientes_id`)
    REFERENCES `kebab`.`ingredientes` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `kebab`.`kebab`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `kebab`.`kebab` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `foto` LONGTEXT NOT NULL,
  `precio` DOUBLE NOT NULL,
  `descripcion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `kebab`.`kebab_has_ingredientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `kebab`.`kebab_has_ingredientes` (
  `kebab_id` INT NOT NULL,
  `ingredientes_id` INT NOT NULL,
  PRIMARY KEY (`kebab_id`, `ingredientes_id`),
  INDEX `fk_kebab_has_ingredientes_ingredientes1_idx` (`ingredientes_id` ASC) VISIBLE,
  INDEX `fk_kebab_has_ingredientes_kebab_idx` (`kebab_id` ASC) VISIBLE,
  CONSTRAINT `fk_kebab_has_ingredientes_ingredientes1`
    FOREIGN KEY (`ingredientes_id`)
    REFERENCES `kebab`.`ingredientes` (`id`),
  CONSTRAINT `fk_kebab_has_ingredientes_kebab`
    FOREIGN KEY (`kebab_id`)
    REFERENCES `kebab`.`kebab` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `kebab`.`pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `kebab`.`pedido` (
  `id` INT NOT NULL,
  `estado` INT NOT NULL COMMENT 'en preparacion =1 enenviado = 2 completado = 2 recibido =3',
  `fecha` DATETIME NOT NULL,
  `precio` DOUBLE NOT NULL,
  `usuario_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_pedido_usuario1_idx` (`usuario_id` ASC) VISIBLE,
  CONSTRAINT `fk_pedido_usuario1`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `kebab`.`usuario` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `kebab`.`lineapedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `kebab`.`lineapedido` (
  `id` INT NOT NULL,
  `cantidad` INT NOT NULL,
  `precio` DOUBLE NOT NULL,
  `lineaPedido` JSON NOT NULL,
  `pedido_id` INT NOT NULL,
  PRIMARY KEY (`id`, `pedido_id`),
  INDEX `fk_lineapedido_pedido1_idx` (`pedido_id` ASC) VISIBLE,
  CONSTRAINT `fk_lineapedido_pedido1`
    FOREIGN KEY (`pedido_id`)
    REFERENCES `kebab`.`pedido` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `kebab`.`direccion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `kebab`.`direccion` (
  `iddireccion` INT NOT NULL,
  `direccion` VARCHAR(100) NOT NULL COMMENT 'varchar donde esta toda la informacion de la direccion metida en string ',
  `usuario_id` INT NOT NULL,
  PRIMARY KEY (`iddireccion`, `usuario_id`),
  INDEX `fk_direccion_usuario1_idx` (`usuario_id` ASC) VISIBLE,
  CONSTRAINT `fk_direccion_usuario1`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `kebab`.`usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
