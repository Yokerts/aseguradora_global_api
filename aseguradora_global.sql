-- MySQL Script generated by MySQL Workbench
-- Thu Sep 19 10:21:18 2019
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema aseguradora_global
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema aseguradora_global
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS aseguradora_global DEFAULT CHARACTER SET utf8 ;
USE aseguradora_global ;

-- -----------------------------------------------------
-- Table aseguradora_global.cat_segmentos_mercado
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS aseguradora_global.cat_segmentos_mercado (
  id_cat_segmento_mercado INT NOT NULL,
  segmento_mercado VARCHAR(45) NULL,
  PRIMARY KEY (id_cat_segmento_mercado))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table aseguradora_global.cat_sexos
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS aseguradora_global.cat_sexos (
  id_cat_sexo INT NOT NULL,
  sexo VARCHAR(20) NULL,
  PRIMARY KEY (id_cat_sexo))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table aseguradora_global.cat_paises
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS aseguradora_global.cat_paises (
  id_cat_pais INT NOT NULL,
  pais VARCHAR(45) NULL,
  moneda VARCHAR(10) NULL,
  PRIMARY KEY (id_cat_pais))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table aseguradora_global.cat_municipios
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS aseguradora_global.cat_municipios (
  id_cat_municipio INT NOT NULL,
  municipio VARCHAR(45) NULL,
  PRIMARY KEY (id_cat_municipio))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table aseguradora_global.cat_estados
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS aseguradora_global.cat_estados (
  id_cat_estado INT NOT NULL,
  estado VARCHAR(45) NULL,
  PRIMARY KEY (id_cat_estado))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table aseguradora_global.clientes_asegurados
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS aseguradora_global.clientes_asegurados (
  id_cliente_asegurado INT NOT NULL,
  nombre VARCHAR(45) NULL,
  apellido_paterno VARCHAR(45) NULL,
  apellido_materno VARCHAR(45) NULL,
  fecha_nacimiento DATETIME NULL,
  codigo_postal INT NULL,
  edad INT NULL,
  direccion VARCHAR(100) NULL,
  rfc VARCHAR(45) NULL,
  cat_segmentos_mercado_id_cat_segmento_mercado INT NOT NULL,
  cat_sexos_id_cat_sexo INT NOT NULL,
  cat_paises_id_cat_pais INT NOT NULL,
  cat_municipios_id_cat_municipio INT NOT NULL,
  cat_estados_id_cat_estado INT NOT NULL,
  PRIMARY KEY (id_cliente_asegurado),
  INDEX fk_clientes_asegurados_cat_segmentos_mercado1_idx (cat_segmentos_mercado_id_cat_segmento_mercado ASC),
  INDEX fk_clientes_asegurados_cat_sexos1_idx (cat_sexos_id_cat_sexo ASC),
  INDEX fk_clientes_asegurados_cat_paises1_idx (cat_paises_id_cat_pais ASC),
  INDEX fk_clientes_asegurados_cat_municipios1_idx (cat_municipios_id_cat_municipio ASC),
  INDEX fk_clientes_asegurados_cat_estados1_idx (cat_estados_id_cat_estado ASC),
  CONSTRAINT fk_clientes_asegurados_cat_segmentos_mercado1
    FOREIGN KEY (cat_segmentos_mercado_id_cat_segmento_mercado)
    REFERENCES aseguradora_global.cat_segmentos_mercado (id_cat_segmento_mercado)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_clientes_asegurados_cat_sexos1
    FOREIGN KEY (cat_sexos_id_cat_sexo)
    REFERENCES aseguradora_global.cat_sexos (id_cat_sexo)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_clientes_asegurados_cat_paises1
    FOREIGN KEY (cat_paises_id_cat_pais)
    REFERENCES aseguradora_global.cat_paises (id_cat_pais)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_clientes_asegurados_cat_municipios1
    FOREIGN KEY (cat_municipios_id_cat_municipio)
    REFERENCES aseguradora_global.cat_municipios (id_cat_municipio)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_clientes_asegurados_cat_estados1
    FOREIGN KEY (cat_estados_id_cat_estado)
    REFERENCES aseguradora_global.cat_estados (id_cat_estado)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table aseguradora_global.doctores
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS aseguradora_global.doctores (
  id_doctor INT NOT NULL,
  nombre VARCHAR(45) NULL,
  apellido_paterno VARCHAR(45) NULL,
  apellido_materno VARCHAR(45) NULL,
  clientes_asegurados_id_cliente_asegurado INT NOT NULL,
  PRIMARY KEY (id_doctor),
  INDEX fk_doctores_clientes_asegurados1_idx (clientes_asegurados_id_cliente_asegurado ASC),
  CONSTRAINT fk_doctores_clientes_asegurados1
    FOREIGN KEY (clientes_asegurados_id_cliente_asegurado)
    REFERENCES aseguradora_global.clientes_asegurados (id_cliente_asegurado)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table aseguradora_global.empresas_aseguradoras
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS aseguradora_global.empresas_aseguradoras (
  id_empresa_aseguradora INT NOT NULL,
  empresa_aseguradora VARCHAR(60) NULL,
  doctores_id_doctor INT NOT NULL,
  PRIMARY KEY (id_empresa_aseguradora),
  INDEX fk_empresas_aseguradoras_doctores1_idx (doctores_id_doctor ASC),
  CONSTRAINT fk_empresas_aseguradoras_doctores1
    FOREIGN KEY (doctores_id_doctor)
    REFERENCES aseguradora_global.doctores (id_doctor)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table aseguradora_global.cat_estatus_polizas
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS aseguradora_global.cat_estatus_polizas (
  id_cat_estatus_poliza INT NOT NULL,
  estatus_poliza VARCHAR(45) NULL,
  PRIMARY KEY (id_cat_estatus_poliza))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table aseguradora_global.polizas
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS aseguradora_global.polizas (
  id_poliza INT NOT NULL,
  fecha_alta DATETIME NULL,
  fecha_inicio DATETIME NULL,
  fecha_fin DATETIME NULL,
  vigencia VARCHAR(45) NULL,
  clientes_asegurados_id_cliente_asegurado INT NOT NULL,
  empresas_aseguradoras_id_empresa_aseguradora INT NOT NULL,
  cat_estatus_polizas_id_cat_estatus_poliza INT NOT NULL,
  cat_paises_id_cat_pais INT NOT NULL,
  cat_municipios_id_cat_municipio INT NOT NULL,
  cat_estados_id_cat_estado INT NOT NULL,
  PRIMARY KEY (id_poliza),
  INDEX fk_polizas_clientes_asegurados1_idx (clientes_asegurados_id_cliente_asegurado ASC),
  INDEX fk_polizas_empresas_aseguradoras1_idx (empresas_aseguradoras_id_empresa_aseguradora ASC),
  INDEX fk_polizas_cat_estatus_polizas1_idx (cat_estatus_polizas_id_cat_estatus_poliza ASC),
  INDEX fk_polizas_cat_paises1_idx (cat_paises_id_cat_pais ASC),
  INDEX fk_polizas_cat_municipios1_idx (cat_municipios_id_cat_municipio ASC),
  INDEX fk_polizas_cat_estados1_idx (cat_estados_id_cat_estado ASC),
  CONSTRAINT fk_polizas_clientes_asegurados1
    FOREIGN KEY (clientes_asegurados_id_cliente_asegurado)
    REFERENCES aseguradora_global.clientes_asegurados (id_cliente_asegurado)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_polizas_empresas_aseguradoras1
    FOREIGN KEY (empresas_aseguradoras_id_empresa_aseguradora)
    REFERENCES aseguradora_global.empresas_aseguradoras (id_empresa_aseguradora)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_polizas_cat_estatus_polizas1
    FOREIGN KEY (cat_estatus_polizas_id_cat_estatus_poliza)
    REFERENCES aseguradora_global.cat_estatus_polizas (id_cat_estatus_poliza)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_polizas_cat_paises1
    FOREIGN KEY (cat_paises_id_cat_pais)
    REFERENCES aseguradora_global.cat_paises (id_cat_pais)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_polizas_cat_municipios1
    FOREIGN KEY (cat_municipios_id_cat_municipio)
    REFERENCES aseguradora_global.cat_municipios (id_cat_municipio)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_polizas_cat_estados1
    FOREIGN KEY (cat_estados_id_cat_estado)
    REFERENCES aseguradora_global.cat_estados (id_cat_estado)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table aseguradora_global.cat_especialidades_medicas
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS aseguradora_global.cat_especialidades_medicas (
  id_cat_especialidad_medica INT NOT NULL,
  especialidad_medica VARCHAR(45) NULL,
  doctores_id_doctor INT NOT NULL,
  PRIMARY KEY (id_cat_especialidad_medica),
  INDEX fk_cat_especialidades_medicas_doctores_idx (doctores_id_doctor ASC),
  CONSTRAINT fk_cat_especialidades_medicas_doctores
    FOREIGN KEY (doctores_id_doctor)
    REFERENCES aseguradora_global.doctores (id_doctor)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table aseguradora_global.eventos
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS aseguradora_global.eventos (
  id_evento INT NOT NULL,
  fecha_alta DATETIME NULL,
  eventoscol VARCHAR(45) NULL,
  polizas_id_poliza INT NOT NULL,
  PRIMARY KEY (id_evento),
  INDEX fk_eventos_polizas1_idx (polizas_id_poliza ASC),
  CONSTRAINT fk_eventos_polizas1
    FOREIGN KEY (polizas_id_poliza)
    REFERENCES aseguradora_global.polizas (id_poliza)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
