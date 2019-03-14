-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-03-2019 a las 20:26:37
-- Versión del servidor: 10.1.21-MariaDB
-- Versión de PHP: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd_proyecto_5`
--
DROP DATABASE IF EXISTS bd_proyecto_5;
CREATE DATABASE IF NOT EXISTS `bd_proyecto_5` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `bd_proyecto_5`;

-- --------------------------------------------------------
-- Estructura de tabla para la tabla `tbl_usuario`

DROP TABLE IF EXISTS `tbl_usuario`;
CREATE TABLE IF NOT EXISTS `tbl_usuario` (
	`usuario_id`			int(11)									NOT NULL		AUTO_INCREMENT	COMMENT 'pk_usuario',
	`usuario_usuario`		varchar(255)	COLLATE utf8_unicode_ci	NOT NULL											,
	`usuario_nombre`		varchar(255)	COLLATE utf8_unicode_ci	DEFAULT NULL										,
	`usuario_apellido`		varchar(255)	COLLATE utf8_unicode_ci	DEFAULT NULL										,
	`usuario_email`			varchar(255)	COLLATE utf8_unicode_ci	NOT NULL											,
	`usuario_contrasena`	varchar(255)	COLLATE utf8_unicode_ci	DEFAULT NULL										,
	`usuario_ultimaConexion`decimal(11,1)							DEFAULT NULL										,
	`usuario_ultimoReset`	decimal(11,1)							DEFAULT NULL										,
	`usuario_fondos`		decimal(5,2)							DEFAULT NULL										,
	`grupo_id`				int(11) 								DEFAULT NULL					COMMENT 'fk_grupo'	,
	`nivel_id`				int(11) 								DEFAULT NULL					COMMENT 'fk_nivel'	,
	`foto_id`				int(11) 								DEFAULT NULL					COMMENT 'fk_foto'	,
	PRIMARY KEY	`pk_usuario_id`		(`usuario_id`)																		,
	UNIQUE KEY	`uk_usuario_usuario`(`usuario_usuario`)																	,
	UNIQUE KEY	`uk_usuario_email`	(`usuario_email`)
) ENGINE=InnoDB								DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci	 							;

-- --------------------------------------------------------
-- Estructura de tabla para la tabla `tbl_grupo`

DROP TABLE IF EXISTS `tbl_grupo`;
CREATE TABLE IF NOT EXISTS `tbl_grupo` (
	`grupo_id`		int(11)									NOT NULL	AUTO_INCREMENT	COMMENT 'pk_grupo'	,
	`grupo_nombre`	varchar(255)	COLLATE utf8_unicode_ci	NOT NULL										,
	PRIMARY KEY	`pk_grupo_id`(`grupo_id`)
) ENGINE=InnoDB						DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci							;

-- --------------------------------------------------------
-- Estructura de tabla para la tabla `tbl_historial`

DROP TABLE IF EXISTS `tbl_historial`;
CREATE TABLE IF NOT EXISTS `tbl_historial` (
	`historial_id`			int(11) 								NOT NULL	AUTO_INCREMENT	COMMENT 'pk_historial'	,
	`historial_fechaInicio`	decimal(11,1)							NOT NULL											,
	`historial_fechaFin`	decimal(11,1)							NOT NULL											,
	`historial_kilometros`	decimal(9,3)							NOT NULL											,
	`usuario_id`			int(11)									DEFAULT NULL				COMMENT 'fk_usuario'	,
	`bicicleta_id`			int(11)									DEFAULT NULL				COMMENT 'fk_bicicleta'	,
	PRIMARY KEY	`pk_historial_id`(`historial_id`)
) ENGINE=InnoDB								DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci								;

-- --------------------------------------------------------
-- Estructura de tabla para la tabla `tbl_bicicleta`

DROP TABLE IF EXISTS `tbl_bicicleta`;
CREATE TABLE IF NOT EXISTS `tbl_bicicleta`(
	`bicicleta_id`		int(11)									NOT NULL AUTO_INCREMENT	COMMENT 'pk_bicicleta'	,
	`bicicleta_modelo`	varchar(20)		COLLATE utf8_unicode_ci	NOT NULL										,
	`bicicleta_posX`	decimal(10,5)	COLLATE utf8_unicode_ci	NOT NULL 										,
	`bicicleta_posY`	decimal(10,5)	COLLATE utf8_unicode_ci	NOT NULL 										,
	PRIMARY KEY	`pk_bicicleta_id`(`bicicleta_id`)
) ENGINE=InnoDB							DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci							;

-- --------------------------------------------------------
-- Estructura de tabla para la tabla `tbl_serie`

DROP TABLE IF EXISTS `tbl_foto`;
CREATE TABLE IF NOT EXISTS `tbl_foto` (
	`foto_id`			int(11)									NOT NULL 	AUTO_INCREMENT	COMMENT 'pk_foto'	,
	`foto_ruta`			varchar(255)	COLLATE utf8_unicode_ci	NOT NULL										,
	`foto_nombre`		varchar(255)	COLLATE utf8_unicode_ci	NOT NULL										,
	`foto_extension`	varchar(20)		COLLATE utf8_unicode_ci	NOT NULL										,
	`nivel_id`			int(11)									DEFAULT NULL				COMMENT 'fk_nivel'	,
	PRIMARY KEY	`pk_foto_id`(`foto_id`)
) ENGINE=InnoDB							DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci							;

-- --------------------------------------------------------
-- Estructura de tabla para la tabla `tbl_nivel`

DROP TABLE IF EXISTS `tbl_nivel`;
CREATE TABLE IF NOT EXISTS `tbl_nivel` (
	`nivel_id`				int(11) 								NOT NULL	AUTO_INCREMENT	COMMENT 'pk_nivel'	,
	`nivel_nombre`			varchar(255)	COLLATE utf8_unicode_ci	NOT NULL											,
	`nivel_numero`			int(11)									NOT NULL											,
	`nivel_kilometros`		decimal(9,3)							NOT NULL											,
	`nivel_fotoRuta`		varchar(255)	COLLATE utf8_unicode_ci	DEFAULT NULL										,
	`nivel_fotoNombre`		varchar(255)	COLLATE utf8_unicode_ci	DEFAULT NULL										,
	`nivel_fotoExtension`	varchar(255)	COLLATE utf8_unicode_ci	DEFAULT NULL										,
	PRIMARY KEY	`pk_nivel_id`(`nivel_id`)
) ENGINE=InnoDB								DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci								;

-- --------------------------------------------------------
-- Estructura de tabla para la tabla `tbl_pago`

DROP TABLE IF EXISTS `tbl_pago`;
CREATE TABLE IF NOT EXISTS `tbl_pago` (
	`pago_id`			int(11) 	NOT NULL	AUTO_INCREMENT	COMMENT 'pk_pago'		,
	`pago_cantidad`		decimal(5,2)NOT NULL											,
	`usuario_id`		int(11)		NOT NULL					COMMENT 'fk_usuario'	,
	`entidad_id`		int(11)		NOT NULL					COMMENT 'fk_entidad'	,
	PRIMARY KEY	`pk_pago_id`(`pago_id`)
) ENGINE=InnoDB						DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci		;

-- --------------------------------------------------------
-- Estructura de tabla para la tabla `tbl_entidad`

DROP TABLE IF EXISTS `tbl_entidad`;
CREATE TABLE IF NOT EXISTS `tbl_entidad` (
	`entidad_id`			int(11) 								NOT NULL	AUTO_INCREMENT	COMMENT 'pk_entidad'		,
	`entidad_nombre`		varchar(255)	COLLATE utf8_unicode_ci	NOT NULL												,
	`entidad_descripcion`	varchar(255)	COLLATE utf8_unicode_ci	DEFAULT NULL											,
	`entidad_dineroMeta`	decimal(5,2)							DEFAULT NULL											,
	`entidad_dineroActual`	decimal(5,2)							DEFAULT NULL											,
	`grupoEntidad_id`		int(11)									DEFAULT NULL				COMMENT 'fk_grupoEntidad'	,
	PRIMARY KEY	`pk_entidad_id`(`entidad_id`)
) ENGINE=InnoDB								DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci									;

-- --------------------------------------------------------
-- Estructura de tabla para la tabla `tbl_grupoEntidad`

DROP TABLE IF EXISTS `tbl_grupoEntidad`;
CREATE TABLE IF NOT EXISTS `tbl_grupoEntidad` (
	`grupoEntidad_id`			int(11) 								NOT NULL	AUTO_INCREMENT	COMMENT 'pk_grupoEntidad'	,
	`grupoEntidad_nombre`		varchar(255)	COLLATE utf8_unicode_ci	NOT NULL												,
	`grupoEntidad_descripcion`	varchar(255)	COLLATE utf8_unicode_ci	DEFAULT NULL											,
	PRIMARY KEY	`pk_grupoEntidad_id`(`grupoEntidad_id`)
) ENGINE=InnoDB									DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci									;




-- ------------------------------------------------------------------------------------------------------------------------
-- RELACIONES PARA LAS TABLAS ---------------------------------------------------------------------------------------------
-- ------------------------------------------------------------------------------------------------------------------------

-- `tbl_usuario` `tbl_grupo`:
ALTER TABLE `tbl_usuario`
	ADD CONSTRAINT `FK_usuario_grupo` FOREIGN KEY (`grupo_id`) REFERENCES `tbl_grupo`(`grupo_id`);
-- ---------------------------------------------------

-- `tbl_usuario` `tbl_nivel`:
ALTER TABLE `tbl_usuario`
	ADD CONSTRAINT `FK_usuario_nivel` FOREIGN KEY (`nivel_id`) REFERENCES `tbl_nivel`(`nivel_id`);
-- ---------------------------------------------------

-- `tbl_usuario` `tbl_foto`:
ALTER TABLE `tbl_usuario`
	ADD CONSTRAINT `FK_usuario_foto` FOREIGN KEY (`foto_id`) REFERENCES `tbl_foto`(`foto_id`);
-- ---------------------------------------------------

-- `tbl_foto` `tbl_nivel`:
ALTER TABLE `tbl_foto`
	ADD CONSTRAINT `FK_foto_nivel` FOREIGN KEY (`nivel_id`) REFERENCES `tbl_nivel`(`nivel_id`);
-- ---------------------------------------------------

-- `tbl_historial` `tbl_usuario:
ALTER TABLE `tbl_historial`
	ADD CONSTRAINT `FK_historial_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `tbl_usuario`(`usuario_id`);
-- ---------------------------------------------------

-- `tbl_historial` `tbl_bicicleta:
ALTER TABLE `tbl_historial`
	ADD CONSTRAINT `FK_historial_bicicleta` FOREIGN KEY (`bicicleta_id`) REFERENCES `tbl_bicicleta`(`bicicleta_id`);
-- ---------------------------------------------------

-- `tbl_pago` `tbl_usuario:
ALTER TABLE `tbl_pago`
	ADD CONSTRAINT `FK_pago_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `tbl_usuario`(`usuario_id`);
-- ---------------------------------------------------

-- `tbl_entidad` `tbl_usuario:
ALTER TABLE `tbl_entidad`
	ADD CONSTRAINT `FK_entidad_grupoEntidad` FOREIGN KEY (`grupoEntidad_id`) REFERENCES `tbl_grupoEntidad`(`grupoEntidad_id`);
-- ---------------------------------------------------





-- ------------------------------------------------------------------------------------------------------------------------
-- DATOS DE LAS TABLAS ----------------------------------------------------------------------------------------------------
-- ------------------------------------------------------------------------------------------------------------------------


-- TRUNCATE TABLE `tbl_grupo`;
INSERT INTO `tbl_grupo` (`grupo_nombre`) VALUES
('Usuario'),
('Administrador'),
('SuperAdministrador');


-- TRUNCATE TABLE `tbl_nivel`;
INSERT INTO `tbl_nivel` (`nivel_nombre`,`nivel_numero`,`nivel_kilometros`,`nivel_fotoRuta`,`nivel_fotoNombre`,`nivel_fotoExtension`) VALUES
('nivel01',	1,	10,	'assets/img/nivel/',	'1_nivel01',	'.jpg'),
('nivel02',	2,	20,	'assets/img/nivel/',	'2_nivel02',	'.jpg'),
('nivel03',	3,	30,	'assets/img/nivel/',	'3_nivel03',	'.jpg');


-- TRUNCATE TABLE `tbl_foto`;
INSERT INTO `tbl_foto` (`foto_ruta`,`foto_nombre`,`foto_extension`,`nivel_id`) VALUES
('assets/img/nivel/',	'1_foto01',	'.jpg',	(SELECT `nivel_id` FROM `tbl_nivel` WHERE `nivel_nombre` = "nivel01")),
('assets/img/nivel/',	'2_foto02',	'.jpg',	(SELECT `nivel_id` FROM `tbl_nivel` WHERE `nivel_nombre` = "nivel01")),
('assets/img/nivel/',	'3_foto03',	'.jpg',	(SELECT `nivel_id` FROM `tbl_nivel` WHERE `nivel_nombre` = "nivel01")),
('assets/img/nivel/',	'4_foto04',	'.jpg',	(SELECT `nivel_id` FROM `tbl_nivel` WHERE `nivel_nombre` = "nivel02")),
('assets/img/nivel/',	'5_foto05',	'.jpg',	(SELECT `nivel_id` FROM `tbl_nivel` WHERE `nivel_nombre` = "nivel02")),
('assets/img/nivel/',	'6_foto06',	'.jpg',	(SELECT `nivel_id` FROM `tbl_nivel` WHERE `nivel_nombre` = "nivel02")),
('assets/img/nivel/',	'7_foto07',	'.jpg',	(SELECT `nivel_id` FROM `tbl_nivel` WHERE `nivel_nombre` = "nivel03")),
('assets/img/nivel/',	'8_foto08',	'.jpg',	(SELECT `nivel_id` FROM `tbl_nivel` WHERE `nivel_nombre` = "nivel03")),
('assets/img/nivel/',	'9_foto09',	'.jpg',	(SELECT `nivel_id` FROM `tbl_nivel` WHERE `nivel_nombre` = "nivel03"));


-- TRUNCATE TABLE `tbl_usuario`;
INSERT INTO `tbl_usuario` (`usuario_usuario`,`usuario_nombre`,`usuario_apellido`,`usuario_email`,`usuario_contrasena`,`usuario_ultimaConexion`,`usuario_ultimoReset`,`usuario_fondos`,`grupo_id`,`nivel_id`,`foto_id`) VALUES
('usuAdmin',		'Admin',		'Empresa',		'admin@gmail.com',		NULL,	'1552204800',	NULL,	0,	(SELECT `grupo_id` FROM `tbl_grupo` WHERE `grupo_nombre` = "Administrador"),		(SELECT `nivel_id` FROM `tbl_nivel` WHERE `nivel_nombre` = "nivel01"),	(SELECT `foto_id` FROM `tbl_foto` WHERE `foto_nombre` = "1_foto01")),
('usuSuperAdmin',	'SuperAdmin',	'Empresa',		'superAdmin@gmail.com',	NULL,	'1552204800',	NULL,	0,	(SELECT `grupo_id` FROM `tbl_grupo` WHERE `grupo_nombre` = "SuperAdministrador"),	(SELECT `nivel_id` FROM `tbl_nivel` WHERE `nivel_nombre` = "nivel01"),	(SELECT `foto_id` FROM `tbl_foto` WHERE `foto_nombre` = "1_foto01")),
('usu01',			'Stefan',		'Salvatore',	'usu01@gmail.com',		NULL,	'1552204800',	NULL,	0,	(SELECT `grupo_id` FROM `tbl_grupo` WHERE `grupo_nombre` = "Usuario"),				(SELECT `nivel_id` FROM `tbl_nivel` WHERE `nivel_nombre` = "nivel01"),	(SELECT `foto_id` FROM `tbl_foto` WHERE `foto_nombre` = "1_foto01")),
('usu02',			'Damon',		'Salvatore',	'usu02@gmail.com',		NULL,	'1552204800',	NULL,	0,	(SELECT `grupo_id` FROM `tbl_grupo` WHERE `grupo_nombre` = "Usuario"),				(SELECT `nivel_id` FROM `tbl_nivel` WHERE `nivel_nombre` = "nivel01"),	(SELECT `foto_id` FROM `tbl_foto` WHERE `foto_nombre` = "1_foto01")),
('usu03',			'Elena',		'Gilbert',		'usu03@gmail.com',		NULL,	'1552204800',	NULL,	0,	(SELECT `grupo_id` FROM `tbl_grupo` WHERE `grupo_nombre` = "Usuario"),				(SELECT `nivel_id` FROM `tbl_nivel` WHERE `nivel_nombre` = "nivel01"),	(SELECT `foto_id` FROM `tbl_foto` WHERE `foto_nombre` = "1_foto01")),
('usu04',			'Jeremy',		'Gilbert',		'usu04@gmail.com',		NULL,	'1552204800',	NULL,	0,	(SELECT `grupo_id` FROM `tbl_grupo` WHERE `grupo_nombre` = "Usuario"),				(SELECT `nivel_id` FROM `tbl_nivel` WHERE `nivel_nombre` = "nivel01"),	(SELECT `foto_id` FROM `tbl_foto` WHERE `foto_nombre` = "1_foto01")),
('usu05',			'Bonnie',		'Bennett',		'usu05@gmail.com',		NULL,	'1552204800',	NULL,	0,	(SELECT `grupo_id` FROM `tbl_grupo` WHERE `grupo_nombre` = "Usuario"),				(SELECT `nivel_id` FROM `tbl_nivel` WHERE `nivel_nombre` = "nivel01"),	(SELECT `foto_id` FROM `tbl_foto` WHERE `foto_nombre` = "1_foto01")),
('usu06',			'Caroline',		'Forbes',		'usu06@gmail.com',		NULL,	'1552204800',	NULL,	0,	(SELECT `grupo_id` FROM `tbl_grupo` WHERE `grupo_nombre` = "Usuario"),				(SELECT `nivel_id` FROM `tbl_nivel` WHERE `nivel_nombre` = "nivel01"),	(SELECT `foto_id` FROM `tbl_foto` WHERE `foto_nombre` = "1_foto01")),
('usu07',			'Matt',			'Donovan',		'usu07@gmail.com',		NULL,	'1552204800',	NULL,	0,	(SELECT `grupo_id` FROM `tbl_grupo` WHERE `grupo_nombre` = "Usuario"),				(SELECT `nivel_id` FROM `tbl_nivel` WHERE `nivel_nombre` = "nivel01"),	(SELECT `foto_id` FROM `tbl_foto` WHERE `foto_nombre` = "1_foto01")),
('usu08',			'Tyler',		'Lockwood',		'usu08@gmail.com',		NULL,	'1552204800',	NULL,	0,	(SELECT `grupo_id` FROM `tbl_grupo` WHERE `grupo_nombre` = "Usuario"),				(SELECT `nivel_id` FROM `tbl_nivel` WHERE `nivel_nombre` = "nivel01"),	(SELECT `foto_id` FROM `tbl_foto` WHERE `foto_nombre` = "1_foto01")),
('usu09',			'Alaric',		'Saltzman',		'usu09@gmail.com',		NULL,	'1552204800',	NULL,	0,	(SELECT `grupo_id` FROM `tbl_grupo` WHERE `grupo_nombre` = "Usuario"),				(SELECT `nivel_id` FROM `tbl_nivel` WHERE `nivel_nombre` = "nivel01"),	(SELECT `foto_id` FROM `tbl_foto` WHERE `foto_nombre` = "1_foto01")),
('usu10',			'Katherine',	'Pierce',		'usu10@gmail.com',		NULL,	'1552204800',	NULL,	0,	(SELECT `grupo_id` FROM `tbl_grupo` WHERE `grupo_nombre` = "Usuario"),				(SELECT `nivel_id` FROM `tbl_nivel` WHERE `nivel_nombre` = "nivel01"),	(SELECT `foto_id` FROM `tbl_foto` WHERE `foto_nombre` = "1_foto01")),
('usu11',			'Kai',			'Parker',		'usu11@gmail.com',		NULL,	'1552204800',	NULL,	0,	(SELECT `grupo_id` FROM `tbl_grupo` WHERE `grupo_nombre` = "Usuario"),				(SELECT `nivel_id` FROM `tbl_nivel` WHERE `nivel_nombre` = "nivel01"),	(SELECT `foto_id` FROM `tbl_foto` WHERE `foto_nombre` = "1_foto01")),
('usu12',			'Niklaus',		'Mikaelson',	'usu12@gmail.com',		NULL,	'1552204800',	NULL,	0,	(SELECT `grupo_id` FROM `tbl_grupo` WHERE `grupo_nombre` = "Usuario"),				(SELECT `nivel_id` FROM `tbl_nivel` WHERE `nivel_nombre` = "nivel01"),	(SELECT `foto_id` FROM `tbl_foto` WHERE `foto_nombre` = "1_foto01")),
('usu13',			'Elijah',		'Mikaelson',	'usu13@gmail.com',		NULL,	'1552204800',	NULL,	0,	(SELECT `grupo_id` FROM `tbl_grupo` WHERE `grupo_nombre` = "Usuario"),				(SELECT `nivel_id` FROM `tbl_nivel` WHERE `nivel_nombre` = "nivel01"),	(SELECT `foto_id` FROM `tbl_foto` WHERE `foto_nombre` = "1_foto01")),
('usu14',			'Rebekah ',		'Mikaelson',	'usu14@gmail.com',		NULL,	'1552204800',	NULL,	0,	(SELECT `grupo_id` FROM `tbl_grupo` WHERE `grupo_nombre` = "Usuario"),				(SELECT `nivel_id` FROM `tbl_nivel` WHERE `nivel_nombre` = "nivel01"),	(SELECT `foto_id` FROM `tbl_foto` WHERE `foto_nombre` = "1_foto01")),
('usu15',			'Cole',			'Mikaelson',	'usu15@gmail.com',		NULL,	'1552204800',	NULL,	0,	(SELECT `grupo_id` FROM `tbl_grupo` WHERE `grupo_nombre` = "Usuario"),				(SELECT `nivel_id` FROM `tbl_nivel` WHERE `nivel_nombre` = "nivel01"),	(SELECT `foto_id` FROM `tbl_foto` WHERE `foto_nombre` = "1_foto01")),
('usu16',			'Fin',			'Mikaelson',	'usu16@gmail.com',		NULL,	'1552204800',	NULL,	0,	(SELECT `grupo_id` FROM `tbl_grupo` WHERE `grupo_nombre` = "Usuario"),				(SELECT `nivel_id` FROM `tbl_nivel` WHERE `nivel_nombre` = "nivel01"),	(SELECT `foto_id` FROM `tbl_foto` WHERE `foto_nombre` = "1_foto01")),
('usu17',			'Freya',		'Mikaelson',	'usu17@gmail.com',		NULL,	'1552204800',	NULL,	0,	(SELECT `grupo_id` FROM `tbl_grupo` WHERE `grupo_nombre` = "Usuario"),				(SELECT `nivel_id` FROM `tbl_nivel` WHERE `nivel_nombre` = "nivel01"),	(SELECT `foto_id` FROM `tbl_foto` WHERE `foto_nombre` = "1_foto01"));
UPDATE `tbl_usuario` SET `usuario_contrasena` = '$2y$10$BhHdy5dTii3ESp3tCLGazOJmwntxEWac8kIyMlNGNpwdr5NMhs1jq';

