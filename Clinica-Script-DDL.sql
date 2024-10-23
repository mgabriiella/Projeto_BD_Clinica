-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Clinica2024
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Clinica2024
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Clinica2024` DEFAULT CHARACTER SET utf8 ;
USE `Clinica2024` ;

-- -----------------------------------------------------
-- Table `Clinica2024`.`seguro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Clinica2024`.`seguro` (
  `idseguro` INT NOT NULL,
  `nomeSeguradora` VARCHAR(80) NOT NULL,
  `numeroApolice` VARCHAR(50) NOT NULL,
  `cobertura` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`idseguro`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Clinica2024`.`enderecoPaciente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Clinica2024`.`enderecoPaciente` (
  `idendereco` INT NOT NULL,
  `UF` CHAR(2) NOT NULL,
  `cidade` VARCHAR(60) NOT NULL,
  `bairro` VARCHAR(60) NOT NULL,
  `rua` VARCHAR(45) NOT NULL,
  `numero` VARCHAR(10) NOT NULL,
  `CEP` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`idendereco`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Clinica2024`.`Paciente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Clinica2024`.`Paciente` (
  `Cpf` VARCHAR(15) NOT NULL,
  `nome` VARCHAR(60) NOT NULL,
  `dataNasc` DATE NOT NULL,
  `telefone` VARCHAR(15) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `sexo` CHAR(1) NOT NULL,
  `seguro_idseguro` INT NULL,
  `enderecoPaciente_idendereco` INT NOT NULL,
  PRIMARY KEY (`Cpf`),
  INDEX `fk_Paciente_seguro_idx` (`seguro_idseguro` ASC) VISIBLE,
  INDEX `fk_Paciente_enderecoPaciente1_idx` (`enderecoPaciente_idendereco` ASC) VISIBLE,
  CONSTRAINT `fk_Paciente_seguro`
    FOREIGN KEY (`seguro_idseguro`)
    REFERENCES `Clinica2024`.`seguro` (`idseguro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Paciente_enderecoPaciente1`
    FOREIGN KEY (`enderecoPaciente_idendereco`)
    REFERENCES `Clinica2024`.`enderecoPaciente` (`idendereco`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Clinica2024`.`cargo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Clinica2024`.`cargo` (
  `cbo` INT NOT NULL,
  `nome_cargo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`cbo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Clinica2024`.`Profissional`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Clinica2024`.`Profissional` (
  `cpf_profissional` VARCHAR(15) NOT NULL,
  `nome` VARCHAR(60) NOT NULL,
  `sexo` CHAR(1) NOT NULL,
  `dataNasc` DATE NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `telefone` VARCHAR(15) NOT NULL,
  `especializacao` VARCHAR(100) NOT NULL,
  `numRegProfissional` VARCHAR(20) NOT NULL,
  `salario` DECIMAL(7,2) NOT NULL,
  `cargo_cbo` INT NOT NULL,
  PRIMARY KEY (`cpf_profissional`),
  INDEX `fk_Profissional_cargo1_idx` (`cargo_cbo` ASC) VISIBLE,
  CONSTRAINT `fk_Profissional_cargo1`
    FOREIGN KEY (`cargo_cbo`)
    REFERENCES `Clinica2024`.`cargo` (`cbo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Clinica2024`.`registroClinico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Clinica2024`.`registroClinico` (
  `idregistroClinico` INT NOT NULL,
  `dataRegistro` DATE NOT NULL,
  `diagnostico` VARCHAR(255) NOT NULL,
  `tratamento` LONGTEXT NOT NULL,
  `prescrisoes` MEDIUMTEXT NOT NULL,
  `Paciente_Cpf` VARCHAR(15) NOT NULL,
  `Profissional_cpf_profissional` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`idregistroClinico`),
  INDEX `fk_registroClinico_Paciente1_idx` (`Paciente_Cpf` ASC) VISIBLE,
  INDEX `fk_registroClinico_Profissional1_idx` (`Profissional_cpf_profissional` ASC) VISIBLE,
  CONSTRAINT `fk_registroClinico_Paciente1`
    FOREIGN KEY (`Paciente_Cpf`)
    REFERENCES `Clinica2024`.`Paciente` (`Cpf`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_registroClinico_Profissional1`
    FOREIGN KEY (`Profissional_cpf_profissional`)
    REFERENCES `Clinica2024`.`Profissional` (`cpf_profissional`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Clinica2024`.`enderecoLaboratorio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Clinica2024`.`enderecoLaboratorio` (
  `idenderecoLaboratorio` INT NOT NULL,
  `UF` CHAR(2) NOT NULL,
  `cidade` VARCHAR(60) NOT NULL,
  `bairro` VARCHAR(60) NOT NULL,
  `rua` VARCHAR(45) NOT NULL,
  `numero` VARCHAR(10) NOT NULL,
  `CEP` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`idenderecoLaboratorio`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Clinica2024`.`laboratorioExterno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Clinica2024`.`laboratorioExterno` (
  `idlaboratorioExterno` INT NOT NULL,
  `nome` VARCHAR(100) NOT NULL,
  `telefone` VARCHAR(15) NOT NULL,
  `historicosTrabalhos` LONGTEXT NOT NULL,
  `enderecoLaboratorio_idenderecoLaboratorio` INT NOT NULL,
  PRIMARY KEY (`idlaboratorioExterno`),
  INDEX `fk_laboratorioExterno_enderecoLaboratorio1_idx` (`enderecoLaboratorio_idenderecoLaboratorio` ASC) VISIBLE,
  CONSTRAINT `fk_laboratorioExterno_enderecoLaboratorio1`
    FOREIGN KEY (`enderecoLaboratorio_idenderecoLaboratorio`)
    REFERENCES `Clinica2024`.`enderecoLaboratorio` (`idenderecoLaboratorio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Clinica2024`.`procedimento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Clinica2024`.`procedimento` (
  `idprocedimento` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `descricao` VARCHAR(100) NOT NULL,
  `custo` FLOAT NOT NULL,
  `Profissional_cpf_profissional` VARCHAR(15) NOT NULL,
  `laboratorioExterno_idlaboratorioExterno` INT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idprocedimento`),
  INDEX `fk_procedimento_Profissional1_idx` (`Profissional_cpf_profissional` ASC) VISIBLE,
  INDEX `fk_procedimento_laboratorioExterno1_idx` (`laboratorioExterno_idlaboratorioExterno` ASC) VISIBLE,
  CONSTRAINT `fk_procedimento_Profissional1`
    FOREIGN KEY (`Profissional_cpf_profissional`)
    REFERENCES `Clinica2024`.`Profissional` (`cpf_profissional`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_procedimento_laboratorioExterno1`
    FOREIGN KEY (`laboratorioExterno_idlaboratorioExterno`)
    REFERENCES `Clinica2024`.`laboratorioExterno` (`idlaboratorioExterno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Clinica2024`.`agendamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Clinica2024`.`agendamento` (
  `idagendamento` INT NOT NULL,
  `dataHora` DATETIME NOT NULL,
  `estadoPaciente` VARCHAR(10) NOT NULL,
  `Paciente_Cpf` VARCHAR(15) NOT NULL,
  `procedimento_idprocedimento` INT NOT NULL,
  `Profissional_cpf_profissional` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`idagendamento`),
  INDEX `fk_agendamento_Paciente1_idx` (`Paciente_Cpf` ASC) VISIBLE,
  INDEX `fk_agendamento_procedimento1_idx` (`procedimento_idprocedimento` ASC) VISIBLE,
  INDEX `fk_agendamento_Profissional1_idx` (`Profissional_cpf_profissional` ASC) VISIBLE,
  CONSTRAINT `fk_agendamento_Paciente1`
    FOREIGN KEY (`Paciente_Cpf`)
    REFERENCES `Clinica2024`.`Paciente` (`Cpf`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_agendamento_procedimento1`
    FOREIGN KEY (`procedimento_idprocedimento`)
    REFERENCES `Clinica2024`.`procedimento` (`idprocedimento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_agendamento_Profissional1`
    FOREIGN KEY (`Profissional_cpf_profissional`)
    REFERENCES `Clinica2024`.`Profissional` (`cpf_profissional`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Clinica2024`.`financeiro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Clinica2024`.`financeiro` (
  `idfinanceiro` INT NOT NULL,
  `tipo` VARCHAR(50) NOT NULL,
  `datadocusto` DATE NOT NULL,
  `descricao` VARCHAR(100) NOT NULL,
  `valor` DECIMAL(10,2) NOT NULL,
  `procedimento_idprocedimento` INT NULL,
  `Profissional_cpf_profissional` VARCHAR(15) NULL,
  PRIMARY KEY (`idfinanceiro`),
  INDEX `fk_financeiro_procedimento1_idx` (`procedimento_idprocedimento` ASC) VISIBLE,
  INDEX `fk_financeiro_Profissional1_idx` (`Profissional_cpf_profissional` ASC) VISIBLE,
  CONSTRAINT `fk_financeiro_procedimento1`
    FOREIGN KEY (`procedimento_idprocedimento`)
    REFERENCES `Clinica2024`.`procedimento` (`idprocedimento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_financeiro_Profissional1`
    FOREIGN KEY (`Profissional_cpf_profissional`)
    REFERENCES `Clinica2024`.`Profissional` (`cpf_profissional`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Clinica2024`.`registroClinico_has_Profissional`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Clinica2024`.`registroClinico_has_Profissional` (
  `registroClinico_idregistroClinico` INT NOT NULL,
  `Profissional_cpf_profissional` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`registroClinico_idregistroClinico`, `Profissional_cpf_profissional`),
  INDEX `fk_registroClinico_has_Profissional_Profissional1_idx` (`Profissional_cpf_profissional` ASC) VISIBLE,
  INDEX `fk_registroClinico_has_Profissional_registroClinico1_idx` (`registroClinico_idregistroClinico` ASC) VISIBLE,
  CONSTRAINT `fk_registroClinico_has_Profissional_registroClinico1`
    FOREIGN KEY (`registroClinico_idregistroClinico`)
    REFERENCES `Clinica2024`.`registroClinico` (`idregistroClinico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_registroClinico_has_Profissional_Profissional1`
    FOREIGN KEY (`Profissional_cpf_profissional`)
    REFERENCES `Clinica2024`.`Profissional` (`cpf_profissional`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Clinica2024`.`fatura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Clinica2024`.`fatura` (
  `idfatura` INT NOT NULL AUTO_INCREMENT,
  `data_fatura` DATE NOT NULL,
  `valorTotal` DECIMAL(10,2) NOT NULL,
  `status_pagamento` VARCHAR(45) NOT NULL,
  `financeiro_idfinanceiro` INT NOT NULL,
  `Paciente_Cpf` VARCHAR(14) NULL,
  `procedimento_idprocedimento` INT NULL,
  INDEX `fk_fatura_financeiro1_idx` (`financeiro_idfinanceiro` ASC) VISIBLE,
  INDEX `fk_fatura_Paciente1_idx` (`Paciente_Cpf` ASC) VISIBLE,
  INDEX `fk_fatura_procedimento1_idx` (`procedimento_idprocedimento` ASC) VISIBLE,
  PRIMARY KEY (`idfatura`),
  CONSTRAINT `fk_fatura_financeiro1`
    FOREIGN KEY (`financeiro_idfinanceiro`)
    REFERENCES `Clinica2024`.`financeiro` (`idfinanceiro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_fatura_Paciente1`
    FOREIGN KEY (`Paciente_Cpf`)
    REFERENCES `Clinica2024`.`Paciente` (`Cpf`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_fatura_procedimento1`
    FOREIGN KEY (`procedimento_idprocedimento`)
    REFERENCES `Clinica2024`.`procedimento` (`idprocedimento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Clinica2024`.`formaPagamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Clinica2024`.`formaPagamento` (
  `idformaPagamento` INT NOT NULL,
  `tipo` VARCHAR(45) NOT NULL,
  `valor` DECIMAL(10,2) NOT NULL,
  `qtdParcelas` INT NOT NULL,
  `desconto` DECIMAL(5,2) NULL,
  `fatura_idfatura` INT NOT NULL,
  PRIMARY KEY (`idformaPagamento`),
  INDEX `fk_formaPagamento_fatura1_idx` (`fatura_idfatura` ASC) VISIBLE,
  CONSTRAINT `fk_formaPagamento_fatura1`
    FOREIGN KEY (`fatura_idfatura`)
    REFERENCES `Clinica2024`.`fatura` (`idfatura`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `Clinica2024` ;

-- -----------------------------------------------------
-- Placeholder table for view `Clinica2024`.`view1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Clinica2024`.`view1` (`id` INT);

-- -----------------------------------------------------
-- View `Clinica2024`.`view1`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Clinica2024`.`view1`;
USE `Clinica2024`;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
