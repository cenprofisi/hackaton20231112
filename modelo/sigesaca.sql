-- MySQL Workbench Synchronization
-- Generated: 2023-11-12 10:18
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: vbustamanteo

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `sigesaca` DEFAULT CHARACTER SET utf8 ;

CREATE TABLE IF NOT EXISTS `sigesaca`.`facultad` (
  `fac_iCodigo` INT(11) NOT NULL AUTO_INCREMENT,
  `fac_vcCodigo` VARCHAR(64) NOT NULL,
  `fac_vcNombre` VARCHAR(64) NOT NULL,
  PRIMARY KEY (`fac_iCodigo`),
  UNIQUE INDEX `fac_vcCodigo_UNIQUE` (`fac_vcCodigo` ASC) VISIBLE,
  UNIQUE INDEX `fac_vcNombre_UNIQUE` (`fac_vcNombre` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `sigesaca`.`escuela` (
  `esc_iCodigo` INT(11) NOT NULL AUTO_INCREMENT,
  `esc_vcCodigo` VARCHAR(16) NOT NULL,
  `esc_vcNombre` VARCHAR(96) NOT NULL,
  `esc_bActivo` TINYINT(4) NOT NULL DEFAULT 1,
  `fac_iCodigo` INT(11) NOT NULL,
  `areaca_iCodigo` INT(11) NOT NULL,
  PRIMARY KEY (`esc_iCodigo`),
  UNIQUE INDEX `esc_vcCodigo_UNIQUE` (`esc_vcCodigo` ASC) VISIBLE,
  UNIQUE INDEX `esc_vcNombre_UNIQUE` (`esc_vcNombre` ASC) VISIBLE,
  INDEX `fk_escuela_facultad_idx` (`fac_iCodigo` ASC) VISIBLE,
  INDEX `fk_escuela_area_academica1_idx` (`areaca_iCodigo` ASC) VISIBLE,
  CONSTRAINT `fk_escuela_facultad`
    FOREIGN KEY (`fac_iCodigo`)
    REFERENCES `sigesaca`.`facultad` (`fac_iCodigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_escuela_area_academica1`
    FOREIGN KEY (`areaca_iCodigo`)
    REFERENCES `sigesaca`.`area_academica` (`areaca_iCodigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `sigesaca`.`area_academica` (
  `areaca_iCodigo` INT(11) NOT NULL AUTO_INCREMENT,
  `areaca_vcCodigo` VARCHAR(4) NOT NULL,
  `areaca_vcNombre` VARCHAR(64) NOT NULL,
  `areaca_bActivo` TINYINT(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`areaca_iCodigo`),
  UNIQUE INDEX `areaca_vcCodigo_UNIQUE` (`areaca_vcCodigo` ASC) VISIBLE,
  UNIQUE INDEX `areaca_vcNombre_UNIQUE` (`areaca_vcNombre` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `sigesaca`.`plan_estudios` (
  `plaest_iCodigo` INT(11) NOT NULL AUTO_INCREMENT,
  `plaest_vcCodigo` VARCHAR(8) NOT NULL,
  `plaest_vcRR` VARCHAR(16) NOT NULL,
  `plaest_dVigencia` DATE NULL DEFAULT NULL,
  `plaest_iCreditos` INT(11) NULL DEFAULT 0,
  `plaest_bActivo` TINYINT(4) NOT NULL DEFAULT 1,
  `esc_iCodigo` INT(11) NOT NULL,
  PRIMARY KEY (`plaest_iCodigo`),
  UNIQUE INDEX `plaest_vcCodigo_UNIQUE` (`plaest_vcCodigo` ASC) VISIBLE,
  INDEX `fk_plan_estudios_escuela1_idx` (`esc_iCodigo` ASC) VISIBLE,
  CONSTRAINT `fk_plan_estudios_escuela1`
    FOREIGN KEY (`esc_iCodigo`)
    REFERENCES `sigesaca`.`escuela` (`esc_iCodigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `sigesaca`.`curso` (
  `cur_iCodigo` INT(11) NOT NULL AUTO_INCREMENT,
  `cur_vcCodigo` VARCHAR(16) NOT NULL,
  `cur_vcNombre` VARCHAR(64) NOT NULL,
  `cur_fCreditos` DECIMAL(6,1) NOT NULL,
  `cur_fCreditosRequisito` DECIMAL(6,1) NOT NULL DEFAULT 0.0,
  `cur_iSemestre` INT(11) NULL DEFAULT NULL,
  `plaest_iCodigo` INT(11) NOT NULL,
  `curtip_iCodigo` INT(11) NOT NULL,
  `curare_iCodigo` INT(11) NOT NULL,
  PRIMARY KEY (`cur_iCodigo`),
  UNIQUE INDEX `cur_vcCodigo_UNIQUE` (`cur_vcCodigo` ASC) VISIBLE,
  UNIQUE INDEX `cur_vcNombre_UNIQUE` (`cur_vcNombre` ASC) VISIBLE,
  INDEX `fk_curso_plan_estudios1_idx` (`plaest_iCodigo` ASC) VISIBLE,
  INDEX `fk_curso_curso_tipo1_idx` (`curtip_iCodigo` ASC) VISIBLE,
  INDEX `fk_curso_curso_areaformativa1_idx` (`curare_iCodigo` ASC) VISIBLE,
  CONSTRAINT `fk_curso_plan_estudios1`
    FOREIGN KEY (`plaest_iCodigo`)
    REFERENCES `sigesaca`.`plan_estudios` (`plaest_iCodigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_curso_curso_tipo1`
    FOREIGN KEY (`curtip_iCodigo`)
    REFERENCES `sigesaca`.`curso_tipo` (`curtip_iCodigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_curso_curso_areaformativa1`
    FOREIGN KEY (`curare_iCodigo`)
    REFERENCES `sigesaca`.`curso_areaformativa` (`curare_iCodigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `sigesaca`.`curso_tipodictado` (
  `curtip_iCodigo` INT(11) NOT NULL AUTO_INCREMENT,
  `curtip_vcNombre` VARCHAR(32) NOT NULL,
  PRIMARY KEY (`curtip_iCodigo`),
  UNIQUE INDEX `curtip_vcNombre_UNIQUE` (`curtip_vcNombre` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `sigesaca`.`curso_horasdictado` (
  `curhor_iCodigo` INT(11) NOT NULL AUTO_INCREMENT,
  `curhor_iHoras` INT(11) NOT NULL,
  `cur_iCodigo` INT(11) NOT NULL,
  `curtip_iCodigo` INT(11) NOT NULL,
  PRIMARY KEY (`curhor_iCodigo`),
  INDEX `fk_curso_horasdictado_curso1_idx` (`cur_iCodigo` ASC) VISIBLE,
  INDEX `fk_curso_horasdictado_curso_tipodictado1_idx` (`curtip_iCodigo` ASC) VISIBLE,
  CONSTRAINT `fk_curso_horasdictado_curso1`
    FOREIGN KEY (`cur_iCodigo`)
    REFERENCES `sigesaca`.`curso` (`cur_iCodigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_curso_horasdictado_curso_tipodictado1`
    FOREIGN KEY (`curtip_iCodigo`)
    REFERENCES `sigesaca`.`curso_tipodictado` (`curtip_iCodigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `sigesaca`.`curso_tipo` (
  `curtip_iCodigo` INT(11) NOT NULL AUTO_INCREMENT,
  `curtip_vcNombre` VARCHAR(32) NOT NULL,
  `curtip_bActivo` TINYINT(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`curtip_iCodigo`),
  UNIQUE INDEX `curtip_vcNombre_UNIQUE` (`curtip_vcNombre` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `sigesaca`.`curso_areaformativa` (
  `curare_iCodigo` INT(11) NOT NULL AUTO_INCREMENT,
  `curare_vcNombre` VARCHAR(32) NULL DEFAULT NULL,
  PRIMARY KEY (`curare_iCodigo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `sigesaca`.`curso_prerequisito` (
  `curpre_iCodigo` INT(11) NOT NULL AUTO_INCREMENT,
  `cur_iCodigo` INT(11) NOT NULL,
  `req_iCodigo` INT(11) NOT NULL,
  PRIMARY KEY (`curpre_iCodigo`),
  INDEX `fk_curso_prerequisito_curso1_idx` (`cur_iCodigo` ASC) VISIBLE,
  INDEX `fk_curso_prerequisito_curso2_idx` (`req_iCodigo` ASC) VISIBLE,
  CONSTRAINT `fk_curso_prerequisito_curso1`
    FOREIGN KEY (`cur_iCodigo`)
    REFERENCES `sigesaca`.`curso` (`cur_iCodigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_curso_prerequisito_curso2`
    FOREIGN KEY (`req_iCodigo`)
    REFERENCES `sigesaca`.`curso` (`cur_iCodigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `sigesaca`.`semestre` (
  `sem_iCodigo` INT(11) NOT NULL AUTO_INCREMENT,
  `sem_vcCodigo` VARCHAR(8) NOT NULL,
  `sem_cActivo` CHAR(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`sem_iCodigo`),
  UNIQUE INDEX `sem_vcCodigo_UNIQUE` (`sem_vcCodigo` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `sigesaca`.`grupo` (
  `gru_iCodigo` INT(11) NOT NULL AUTO_INCREMENT,
  `sem_iCodigo` INT(11) NOT NULL,
  `cur_iCodigo` INT(11) NOT NULL,
  `gru_iNumero` INT(11) NOT NULL,
  PRIMARY KEY (`gru_iCodigo`),
  INDEX `fk_grupo_semestre1_idx` (`sem_iCodigo` ASC) VISIBLE,
  INDEX `fk_grupo_curso1_idx` (`cur_iCodigo` ASC) VISIBLE,
  CONSTRAINT `fk_grupo_semestre1`
    FOREIGN KEY (`sem_iCodigo`)
    REFERENCES `sigesaca`.`semestre` (`sem_iCodigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_grupo_curso1`
    FOREIGN KEY (`cur_iCodigo`)
    REFERENCES `sigesaca`.`curso` (`cur_iCodigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `sigesaca`.`grupo_horario` (
  `gruhor_iCodigo` INT(11) NOT NULL AUTO_INCREMENT,
  `gru_iCodigo` INT(11) NOT NULL,
  `dia_iCodigo` INT(11) NOT NULL,
  `gruhor_tHoraInicio` TIME NOT NULL,
  `gruhor_tHoraFinal` TIME NOT NULL,
  `aul_iCodigo` INT(11) NOT NULL,
  `curtip_iCodigo` INT(11) NOT NULL,
  PRIMARY KEY (`gruhor_iCodigo`),
  INDEX `fk_grupo_horario_grupo1_idx` (`gru_iCodigo` ASC) VISIBLE,
  INDEX `fk_grupo_horario_dia1_idx` (`dia_iCodigo` ASC) VISIBLE,
  INDEX `fk_grupo_horario_aula1_idx` (`aul_iCodigo` ASC) VISIBLE,
  INDEX `fk_grupo_horario_curso_tipodictado1_idx` (`curtip_iCodigo` ASC) VISIBLE,
  CONSTRAINT `fk_grupo_horario_grupo1`
    FOREIGN KEY (`gru_iCodigo`)
    REFERENCES `sigesaca`.`grupo` (`gru_iCodigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_grupo_horario_dia1`
    FOREIGN KEY (`dia_iCodigo`)
    REFERENCES `sigesaca`.`dia` (`dia_iCodigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_grupo_horario_aula1`
    FOREIGN KEY (`aul_iCodigo`)
    REFERENCES `sigesaca`.`aula` (`aul_iCodigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_grupo_horario_curso_tipodictado1`
    FOREIGN KEY (`curtip_iCodigo`)
    REFERENCES `sigesaca`.`curso_tipodictado` (`curtip_iCodigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `sigesaca`.`dia` (
  `dia_iCodigo` INT(11) NOT NULL AUTO_INCREMENT,
  `dia_iNumero` INT(11) NOT NULL,
  `dia_vcNombre` VARCHAR(16) NOT NULL,
  PRIMARY KEY (`dia_iCodigo`),
  UNIQUE INDEX `dia_iNumero_UNIQUE` (`dia_iNumero` ASC) VISIBLE,
  UNIQUE INDEX `dia_vcNombre_UNIQUE` (`dia_vcNombre` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `sigesaca`.`aula` (
  `aul_iCodigo` INT(11) NOT NULL AUTO_INCREMENT,
  `aul_vcCodigo` VARCHAR(16) NOT NULL,
  `aul_iCapacidad` INT(11) NOT NULL,
  `loc_iCodigo` INT(11) NOT NULL,
  PRIMARY KEY (`aul_iCodigo`),
  UNIQUE INDEX `aul_vcCodigo_UNIQUE` (`aul_vcCodigo` ASC) VISIBLE,
  INDEX `fk_aula_locales1_idx` (`loc_iCodigo` ASC) VISIBLE,
  CONSTRAINT `fk_aula_locales1`
    FOREIGN KEY (`loc_iCodigo`)
    REFERENCES `sigesaca`.`locales` (`loc_iCodigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `sigesaca`.`locales` (
  `loc_iCodigo` INT(11) NOT NULL AUTO_INCREMENT,
  `loc_vcCodigo` VARCHAR(16) NOT NULL,
  `loc_vcNombre` VARCHAR(64) NOT NULL,
  PRIMARY KEY (`loc_iCodigo`),
  UNIQUE INDEX `loc_vcCodigo_UNIQUE` (`loc_vcCodigo` ASC) VISIBLE,
  UNIQUE INDEX `loc_vcNombre_UNIQUE` (`loc_vcNombre` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `sigesaca`.`curso_equivalente` (
  `cureqi_iCodigo` INT(11) NOT NULL AUTO_INCREMENT,
  `cur_iCodigo` INT(11) NOT NULL,
  `equ_iCodigo` INT(11) NOT NULL,
  PRIMARY KEY (`cureqi_iCodigo`),
  INDEX `fk_curso_equivalente_curso1_idx` (`cur_iCodigo` ASC) VISIBLE,
  INDEX `fk_curso_equivalente_curso2_idx` (`equ_iCodigo` ASC) VISIBLE,
  CONSTRAINT `fk_curso_equivalente_curso1`
    FOREIGN KEY (`cur_iCodigo`)
    REFERENCES `sigesaca`.`curso` (`cur_iCodigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_curso_equivalente_curso2`
    FOREIGN KEY (`equ_iCodigo`)
    REFERENCES `sigesaca`.`curso` (`cur_iCodigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
