-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-03-2019 a las 20:26:37
-- Versión del servidor: 10.1.21-MariaDB
-- Versión de PHP: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
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
	`usuario_id`				int(11)														NOT NULL		AUTO_INCREMENT	COMMENT 'pk_usuario',
	`usuario_usuario`			varchar(255)						COLLATE utf8_unicode_ci	NOT NULL											,
	`usuario_nombre`			varchar(255)						COLLATE utf8_unicode_ci	DEFAULT NULL										,
	`usuario_apellido`			varchar(255)						COLLATE utf8_unicode_ci	DEFAULT NULL										,
	`usuario_email`				varchar(255)						COLLATE utf8_unicode_ci	NOT NULL											,
	`usuario_contrasena`		varchar(255)						COLLATE utf8_unicode_ci	DEFAULT NULL										,
	`usuario_sexo`				enum('Hombre', 'Mujer', 'Otros')	COLLATE utf8_unicode_ci	DEFAULT NULL										,
	`usuario_ultimaConexion`	decimal(11,1)						COLLATE utf8_unicode_ci	DEFAULT NULL										,
	`usuario_ultimoReset`		decimal(11,1)												DEFAULT NULL										,
	`usuario_fondosMensuales`	decimal(5,2)												DEFAULT NULL										,
	`usuario_fondosTotales`		decimal(5,2)												DEFAULT NULL										,
	`grupo_id`					int(11) 													DEFAULT NULL					COMMENT 'fk_grupo'	,
	`nivel_id`					int(11) 													DEFAULT NULL					COMMENT 'fk_nivel'	,
	`foto_id`					int(11) 													DEFAULT NULL					COMMENT 'fk_foto'	,
	PRIMARY KEY	`pk_usuario_id`		(`usuario_id`)																								,
	UNIQUE KEY	`uk_usuario_usuario`(`usuario_usuario`)																							,
	UNIQUE KEY	`uk_usuario_email`	(`usuario_email`)
) ENGINE=InnoDB														DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci	 							;

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
	`pago_id`			int(11) 		NOT NULL	AUTO_INCREMENT	COMMENT 'pk_pago'		,
	`pago_cantidad`		decimal(5,2)	NOT NULL											,
	/*`pago_fecha`		decimal(11,1)	NOT NULL											,*/ /*añadir en un futuro*/
	`usuario_id`		int(11)			NOT NULL					COMMENT 'fk_usuario'	,
	`entidad_id`		int(11)			NOT NULL					COMMENT 'fk_entidad'	,
	PRIMARY KEY	`pk_pago_id`(`pago_id`)
) ENGINE=InnoDB							DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci		;

-- --------------------------------------------------------
-- Estructura de tabla para la tabla `tbl_entidad`

DROP TABLE IF EXISTS `tbl_entidad`;
CREATE TABLE IF NOT EXISTS `tbl_entidad` (
	`entidad_id`			int(11) 								NOT NULL	AUTO_INCREMENT	COMMENT 'pk_entidad'		,
	`entidad_nombre`		varchar(255)	COLLATE utf8_unicode_ci	NOT NULL												,
	`entidad_descripcion`	varchar(255)	COLLATE utf8_unicode_ci	DEFAULT NULL											,
	`entidad_dineroMeta`	decimal(5,2)							DEFAULT NULL											,
	`entidad_dineroActual`	decimal(5,2)							DEFAULT NULL											,
	`entidad_url`			varchar(100)							DEFAULT NULL											,
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

-- `tbl_pago` `tbl_entidad:
ALTER TABLE `tbl_pago`
	ADD CONSTRAINT `FK_pago_entidad` FOREIGN KEY (`entidad_id`) REFERENCES `tbl_entidad`(`entidad_id`);
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
('nivel00',	0,	0,		'assets/img/levels/',	'1_nivel00',	'.png'),
('nivel01',	1,	100,	'assets/img/levels/',	'2_nivel01',	'.png'),
('nivel02',	2,	200,	'assets/img/levels/',	'3_nivel02',	'.png'),
('nivel03',	3,	300,	'assets/img/levels/',	'4_nivel03',	'.png'),
('nivel04',	4,	400,	'assets/img/levels/',	'5_nivel04',	'.png'),
('nivel05',	5,	500,	'assets/img/levels/',	'6_nivel05',	'.png'),
('nivel06',	6,	600,	'assets/img/levels/',	'7_nivel06',	'.png'),
('nivel07',	7,	700,	'assets/img/levels/',	'8_nivel07',	'.png'),
('nivel08',	8,	800,	'assets/img/levels/',	'9_nivel08',	'.png');


-- TRUNCATE TABLE `tbl_foto`;
INSERT INTO `tbl_foto` (`foto_ruta`,`foto_nombre`,`foto_extension`,`nivel_id`) VALUES
('assets/img/users/',	'1_foto01',		'.png',	(SELECT `nivel_id` FROM `tbl_nivel` WHERE `nivel_nombre` = "nivel00")),
('assets/img/users/',	'2_foto02',		'.png',	(SELECT `nivel_id` FROM `tbl_nivel` WHERE `nivel_nombre` = "nivel00")),
('assets/img/users/',	'3_foto03',		'.png',	(SELECT `nivel_id` FROM `tbl_nivel` WHERE `nivel_nombre` = "nivel01")),
('assets/img/users/',	'4_foto04',		'.png',	(SELECT `nivel_id` FROM `tbl_nivel` WHERE `nivel_nombre` = "nivel01")),
('assets/img/users/',	'5_foto05',		'.png',	(SELECT `nivel_id` FROM `tbl_nivel` WHERE `nivel_nombre` = "nivel02")),
('assets/img/users/',	'6_foto06',		'.png',	(SELECT `nivel_id` FROM `tbl_nivel` WHERE `nivel_nombre` = "nivel02")),
('assets/img/users/',	'7_foto07',		'.png',	(SELECT `nivel_id` FROM `tbl_nivel` WHERE `nivel_nombre` = "nivel03")),
('assets/img/users/',	'8_foto08',		'.png',	(SELECT `nivel_id` FROM `tbl_nivel` WHERE `nivel_nombre` = "nivel03")),
('assets/img/users/',	'9_foto09',		'.png',	(SELECT `nivel_id` FROM `tbl_nivel` WHERE `nivel_nombre` = "nivel04")),
('assets/img/users/',	'10_foto10',	'.png',	(SELECT `nivel_id` FROM `tbl_nivel` WHERE `nivel_nombre` = "nivel04")),
('assets/img/users/',	'11_foto11',	'.png',	(SELECT `nivel_id` FROM `tbl_nivel` WHERE `nivel_nombre` = "nivel05")),
('assets/img/users/',	'12_foto12',	'.png',	(SELECT `nivel_id` FROM `tbl_nivel` WHERE `nivel_nombre` = "nivel05")),
('assets/img/users/',	'13_foto13',	'.png',	(SELECT `nivel_id` FROM `tbl_nivel` WHERE `nivel_nombre` = "nivel06")),
('assets/img/users/',	'14_foto14',	'.png',	(SELECT `nivel_id` FROM `tbl_nivel` WHERE `nivel_nombre` = "nivel06")),
('assets/img/users/',	'15_foto15',	'.png',	(SELECT `nivel_id` FROM `tbl_nivel` WHERE `nivel_nombre` = "nivel07")),
('assets/img/users/',	'16_foto16',	'.png',	(SELECT `nivel_id` FROM `tbl_nivel` WHERE `nivel_nombre` = "nivel07")),
('assets/img/users/',	'17_foto17',	'.png',	(SELECT `nivel_id` FROM `tbl_nivel` WHERE `nivel_nombre` = "nivel058"));


-- TRUNCATE TABLE `tbl_usuario`;
INSERT INTO `tbl_usuario` (`usuario_usuario`,`usuario_nombre`,`usuario_apellido`,`usuario_email`,`usuario_contrasena`,`usuario_sexo`,`usuario_ultimaConexion`,`usuario_ultimoReset`,`usuario_fondosMensuales`,`usuario_fondosTotales`,`grupo_id`,`nivel_id`,`foto_id`) VALUES
('usu01',			'Stefan',		'Salvatore',	'usu01@gmail.com',		NULL,	'Hombre',	'1552204800',	NULL,	0,	0,	(SELECT `grupo_id` FROM `tbl_grupo` WHERE `grupo_nombre` = "Usuario"),				(SELECT `nivel_id` FROM `tbl_nivel` WHERE `nivel_nombre` = "nivel00"),	(SELECT `foto_id` FROM `tbl_foto` WHERE `foto_nombre` = "1_foto01")),
('usu02',			'Damon',		'Salvatore',	'usu02@gmail.com',		NULL,	'Hombre',	'1552204800',	NULL,	0,	0,	(SELECT `grupo_id` FROM `tbl_grupo` WHERE `grupo_nombre` = "Usuario"),				(SELECT `nivel_id` FROM `tbl_nivel` WHERE `nivel_nombre` = "nivel00"),	(SELECT `foto_id` FROM `tbl_foto` WHERE `foto_nombre` = "1_foto01")),
('usu03',			'Elena',		'Gilbert',		'usu03@gmail.com',		NULL,	'Mujer',	'1552204800',	NULL,	5,	5,	(SELECT `grupo_id` FROM `tbl_grupo` WHERE `grupo_nombre` = "Usuario"),				(SELECT `nivel_id` FROM `tbl_nivel` WHERE `nivel_nombre` = "nivel01"),	(SELECT `foto_id` FROM `tbl_foto` WHERE `foto_nombre` = "1_foto01")),
('usu04',			'Jeremy',		'Gilbert',		'usu04@gmail.com',		NULL,	'Hombre',	'1552204800',	NULL,	5,	5,	(SELECT `grupo_id` FROM `tbl_grupo` WHERE `grupo_nombre` = "Usuario"),				(SELECT `nivel_id` FROM `tbl_nivel` WHERE `nivel_nombre` = "nivel02"),	(SELECT `foto_id` FROM `tbl_foto` WHERE `foto_nombre` = "1_foto01")),
('usu05',			'Bonnie',		'Bennett',		'usu05@gmail.com',		NULL,	'Mujer',	'1552204800',	NULL,	5,	5,	(SELECT `grupo_id` FROM `tbl_grupo` WHERE `grupo_nombre` = "Usuario"),				(SELECT `nivel_id` FROM `tbl_nivel` WHERE `nivel_nombre` = "nivel03"),	(SELECT `foto_id` FROM `tbl_foto` WHERE `foto_nombre` = "1_foto01")),
('usu06',			'Caroline',		'Forbes',		'usu06@gmail.com',		NULL,	'Mujer',	'1552204800',	NULL,	5,	5,	(SELECT `grupo_id` FROM `tbl_grupo` WHERE `grupo_nombre` = "Usuario"),				(SELECT `nivel_id` FROM `tbl_nivel` WHERE `nivel_nombre` = "nivel04"),	(SELECT `foto_id` FROM `tbl_foto` WHERE `foto_nombre` = "1_foto01")),
('usu07',			'Matt',			'Donovan',		'usu07@gmail.com',		NULL,	'Hombre',	'1552204800',	NULL,	5,	5,	(SELECT `grupo_id` FROM `tbl_grupo` WHERE `grupo_nombre` = "Usuario"),				(SELECT `nivel_id` FROM `tbl_nivel` WHERE `nivel_nombre` = "nivel05"),	(SELECT `foto_id` FROM `tbl_foto` WHERE `foto_nombre` = "1_foto01")),
('usu08',			'Tyler',		'Lockwood',		'usu08@gmail.com',		NULL,	'Hombre',	'1552204800',	NULL,	5,	5,	(SELECT `grupo_id` FROM `tbl_grupo` WHERE `grupo_nombre` = "Usuario"),				(SELECT `nivel_id` FROM `tbl_nivel` WHERE `nivel_nombre` = "nivel06"),	(SELECT `foto_id` FROM `tbl_foto` WHERE `foto_nombre` = "1_foto01")),
('usu09',			'Alaric',		'Saltzman',		'usu09@gmail.com',		NULL,	'Hombre',	'1552204800',	NULL,	5,	5,	(SELECT `grupo_id` FROM `tbl_grupo` WHERE `grupo_nombre` = "Usuario"),				(SELECT `nivel_id` FROM `tbl_nivel` WHERE `nivel_nombre` = "nivel07"),	(SELECT `foto_id` FROM `tbl_foto` WHERE `foto_nombre` = "1_foto01")),
('usu10',			'Katherine',	'Pierce',		'usu10@gmail.com',		NULL,	'Mujer',	'1552204800',	NULL,	0,	5,	(SELECT `grupo_id` FROM `tbl_grupo` WHERE `grupo_nombre` = "Usuario"),				(SELECT `nivel_id` FROM `tbl_nivel` WHERE `nivel_nombre` = "nivel08"),	(SELECT `foto_id` FROM `tbl_foto` WHERE `foto_nombre` = "1_foto01")),
('usu11',			'Kai',			'Parker',		'usu11@gmail.com',		NULL,	'Hombre',	'1552204800',	NULL,	0,	3,	(SELECT `grupo_id` FROM `tbl_grupo` WHERE `grupo_nombre` = "Usuario"),				(SELECT `nivel_id` FROM `tbl_nivel` WHERE `nivel_nombre` = "nivel00"),	(SELECT `foto_id` FROM `tbl_foto` WHERE `foto_nombre` = "1_foto01")),
('usu12',			'Niklaus',		'Mikaelson',	'usu12@gmail.com',		NULL,	'Hombre',	'1552204800',	NULL,	0,	5,	(SELECT `grupo_id` FROM `tbl_grupo` WHERE `grupo_nombre` = "Usuario"),				(SELECT `nivel_id` FROM `tbl_nivel` WHERE `nivel_nombre` = "nivel01"),	(SELECT `foto_id` FROM `tbl_foto` WHERE `foto_nombre` = "1_foto01")),
('usu13',			'Elijah',		'Mikaelson',	'usu13@gmail.com',		NULL,	'Hombre',	'1552204800',	NULL,	0,	5,	(SELECT `grupo_id` FROM `tbl_grupo` WHERE `grupo_nombre` = "Usuario"),				(SELECT `nivel_id` FROM `tbl_nivel` WHERE `nivel_nombre` = "nivel02"),	(SELECT `foto_id` FROM `tbl_foto` WHERE `foto_nombre` = "1_foto01")),
('usu14',			'Rebekah ',		'Mikaelson',	'usu14@gmail.com',		NULL,	'Mujer',	'1552204800',	NULL,	0,	5,	(SELECT `grupo_id` FROM `tbl_grupo` WHERE `grupo_nombre` = "Usuario"),				(SELECT `nivel_id` FROM `tbl_nivel` WHERE `nivel_nombre` = "nivel03"),	(SELECT `foto_id` FROM `tbl_foto` WHERE `foto_nombre` = "1_foto01")),
('usu15',			'Cole',			'Mikaelson',	'usu15@gmail.com',		NULL,	'Hombre',	'1552204800',	NULL,	0,	5,	(SELECT `grupo_id` FROM `tbl_grupo` WHERE `grupo_nombre` = "Usuario"),				(SELECT `nivel_id` FROM `tbl_nivel` WHERE `nivel_nombre` = "nivel04"),	(SELECT `foto_id` FROM `tbl_foto` WHERE `foto_nombre` = "1_foto01")),
('usu16',			'Fin',			'Mikaelson',	'usu16@gmail.com',		NULL,	'Hombre',	'1552204800',	NULL,	0,	5,	(SELECT `grupo_id` FROM `tbl_grupo` WHERE `grupo_nombre` = "Usuario"),				(SELECT `nivel_id` FROM `tbl_nivel` WHERE `nivel_nombre` = "nivel05"),	(SELECT `foto_id` FROM `tbl_foto` WHERE `foto_nombre` = "1_foto01")),
('usu17',			'Freya',		'Mikaelson',	'usu17@gmail.com',		NULL,	'Mujer',	'1552204800',	NULL,	0,	5,	(SELECT `grupo_id` FROM `tbl_grupo` WHERE `grupo_nombre` = "Usuario"),				(SELECT `nivel_id` FROM `tbl_nivel` WHERE `nivel_nombre` = "nivel04"),	(SELECT `foto_id` FROM `tbl_foto` WHERE `foto_nombre` = "1_foto01")),
('usuAdmin',		'Admin',		'Empresa',		'admin@gmail.com',		NULL,	'Hombre',	'1552204800',	NULL,	0,	0,	(SELECT `grupo_id` FROM `tbl_grupo` WHERE `grupo_nombre` = "Administrador"),		(SELECT `nivel_id` FROM `tbl_nivel` WHERE `nivel_nombre` = "nivel00"),	(SELECT `foto_id` FROM `tbl_foto` WHERE `foto_nombre` = "1_foto01")),
('usuSuperAdmin',	'SuperAdmin',	'Empresa',		'superAdmin@gmail.com',	NULL,	'Mujer',	'1552204800',	NULL,	0,	0,	(SELECT `grupo_id` FROM `tbl_grupo` WHERE `grupo_nombre` = "SuperAdministrador"),	(SELECT `nivel_id` FROM `tbl_nivel` WHERE `nivel_nombre` = "nivel00"),	(SELECT `foto_id` FROM `tbl_foto` WHERE `foto_nombre` = "1_foto01"));
UPDATE `tbl_usuario` SET `usuario_contrasena` = '$2y$10$BhHdy5dTii3ESp3tCLGazOJmwntxEWac8kIyMlNGNpwdr5NMhs1jq';


INSERT INTO `tbl_bicicleta` (`bicicleta_modelo`, `bicicleta_posX`, `bicicleta_posY`) VALUES
('Specialized Tarmac',	'0.00000',	'0.00000'),
('Specialized Shiv',	'0.00000',	'0.00000'),
('Specialized Venge ',	'0.00000',	'0.00000'),
('Specialized Allez',	'0.00000',	'0.00000'),
('Scott Foil',			'0.00000',	'0.00000'),
('Scott Addict',		'0.00000',	'0.00000'),
('Canyon Aeroad',		'0.00000',	'0.00000'),
('Canyon Ultimate',		'0.00000',	'0.00000'),
('Canyon Endurance',	'0.00000',	'0.00000'),
('Supersix EVO',		'0.00000',	'0.00000'),
('La Caad 12',			'0.00000',	'0.00000'),
('Synapse',				'0.00000',	'0.00000'),
('Orbea Avant',			'0.00000',	'0.00000');


INSERT INTO `tbl_grupoentidad` (`grupoEntidad_nombre`, `grupoEntidad_descripcion`) VALUES
('Fauna y flora',		'Entidades relacionadas con el cuidado de animales o plantas tanto en temas de conservación como de investigación.'),
('Economía y sanidad',	'Entidades que centran su actividad en proporcionar ayuda económica y sanitaria a las personas necesitadas. También contribuyen en el desarrollo de estos ámbitos en diferentes localidades.');


INSERT INTO `tbl_entidad` (`entidad_nombre`, `entidad_dineroMeta`, `entidad_dineroActual`, `grupoEntidad_id`, `entidad_url`, `entidad_descripcion`) VALUES
('UNICEF',				700.00,	40.00,	2,	'https://www.unicef.es/',			'Organizacion no goburnamental de las naciones unidas que provee ayuda humanitaria y de desarrollo a niños y a padres'),
('SAVE THE CHILDREN',	800.00,	10.00,	2,	'https://www.savethechildren.es/',	'Save the children es una organizacion no gubernamental para la educacion,sanidad y proteccion infantil'),
('GREENPEACE',			500.00,	20.00,	1,	'https://es.greenpeace.org/es/',	'Greenpeace es una organización no gubernamental ecologista y pacifista internacional fundada en Canadá en 1971'),
('WWF',					999.00,	62.00,	1,	'https://www.wwf.es/',				'El Fondo Mundial para la Naturaleza es una organización de conservación global del ambiente, investigación y de defensa ambiental.'),
('CÁRITAS',				700.00,	54.00,	2,	'https://www.caritas.es/',			'Cáritas es un organismo de la Iglesia católica dedicado a la coordinación de la beneficencia humanitaria.');
/*('LA VINYA',			900.00,	60.00,	2,	NULL,								'Somos una entidad que trabaja para atender a las personas en situación de riesgo social de los barrios de Bellvitge y El Gornal de la ciudad de L\'Hospitalet.'),
('ACCIONATURA',			900.00,	5.00,	1,	NULL,								'Organización Española de defensa del medio ambiente y su entorno'),
('TOBARRI',				800.00,	23.00,	2,	NULL,								'Organizacion en defensa de la precariedad en el barrio de Tobarra (VALDEPIERNA)'),
('DANAL',				999.00,	1.00,	2,	NULL,								'Entidad en defensa de el mundo rural y los espacios naturales');
*/

INSERT INTO `tbl_historial` (`historial_fechaInicio`, `historial_fechaFin`, `historial_kilometros`, `usuario_id`, `bicicleta_id`) VALUES
(UNIX_TIMESTAMP('2019-03-01 13:41:10'), UNIX_TIMESTAMP('2019-03-01 22:41:10'), 1,	1,	1),
(UNIX_TIMESTAMP('2019-03-02 09:12:42'), UNIX_TIMESTAMP('2019-03-02 13:12:42'), 10,	2,	2),
(UNIX_TIMESTAMP('2019-03-03 13:12:22'), UNIX_TIMESTAMP('2019-03-03 19:51:22'), 100,	3,	3),
(UNIX_TIMESTAMP('2019-03-04 15:12:22'), UNIX_TIMESTAMP('2019-03-04 19:31:22'), 200,	4,	4),
(UNIX_TIMESTAMP('2019-03-05 14:12:22'), UNIX_TIMESTAMP('2019-03-05 20:12:22'), 300,	5,	5),
(UNIX_TIMESTAMP('2019-03-06 18:12:22'), UNIX_TIMESTAMP('2019-03-06 20:12:22'), 400,	6,	6),
(UNIX_TIMESTAMP('2019-03-07 12:12:22'), UNIX_TIMESTAMP('2019-03-07 18:05:42'), 500,	7,	7),
(UNIX_TIMESTAMP('2019-03-08 12:05:02'), UNIX_TIMESTAMP('2019-03-08 12:59:42'), 600,	8,	8),
(UNIX_TIMESTAMP('2019-03-09 23:52:22'), UNIX_TIMESTAMP('2019-03-10 00:25:42'), 700,	9,	9),

(UNIX_TIMESTAMP('2019-02-07 03:05:42'), UNIX_TIMESTAMP('2019-02-07 03:12:22'), 800,	10,	10),
(UNIX_TIMESTAMP('2019-02-08 13:45:42'), UNIX_TIMESTAMP('2019-02-08 14:05:42'), 10,	11,	11),
(UNIX_TIMESTAMP('2019-02-09 08:05:42'), UNIX_TIMESTAMP('2019-02-09 10:52:22'), 20,	11,	12),
(UNIX_TIMESTAMP('2019-02-10 12:05:42'), UNIX_TIMESTAMP('2019-02-10 23:39:02'), 30,	11,	13),
(UNIX_TIMESTAMP('2019-02-11 06:45:42'), UNIX_TIMESTAMP('2019-02-11 16:32:22'), 40,	12,	1),
(UNIX_TIMESTAMP('2019-02-12 18:19:02'), UNIX_TIMESTAMP('2019-02-12 14:19:02'), 50,	12,	2),
(UNIX_TIMESTAMP('2019-02-13 05:32:22'), UNIX_TIMESTAMP('2019-02-13 07:39:50'), 60,	12,	3),
(UNIX_TIMESTAMP('2019-02-14 08:32:22'), UNIX_TIMESTAMP('2019-02-14 22:19:02'), 70,	13,	4),
(UNIX_TIMESTAMP('2019-02-15 12:59:02'), UNIX_TIMESTAMP('2019-02-15 18:32:22'), 80,	13,	5),
(UNIX_TIMESTAMP('2019-02-16 08:32:22'), UNIX_TIMESTAMP('2019-02-16 15:52:22'), 90,	13,	6),
(UNIX_TIMESTAMP('2019-02-17 08:32:22'), UNIX_TIMESTAMP('2019-02-17 15:39:02'), 110,	14,	7),
(UNIX_TIMESTAMP('2019-02-18 06:45:42'), UNIX_TIMESTAMP('2019-02-18 22:45:42'), 120,	14, 8),
(UNIX_TIMESTAMP('2019-02-19 01:19:02'), UNIX_TIMESTAMP('2019-02-19 02:19:02'), 130,	14,	9),
(UNIX_TIMESTAMP('2019-02-21 22:45:42'), UNIX_TIMESTAMP('2019-02-21 23:52:22'), 140,	15,	10),
(UNIX_TIMESTAMP('2019-02-22 03:59:02'), UNIX_TIMESTAMP('2019-02-22 22:45:42'), 150,	15,	11),
(UNIX_TIMESTAMP('2019-02-23 16:45:42'), UNIX_TIMESTAMP('2019-02-23 17:25:42'), 160,	15,	12),
(UNIX_TIMESTAMP('2019-02-24 08:32:22'), UNIX_TIMESTAMP('2019-02-24 09:45:42'), 170,	16,	13),
(UNIX_TIMESTAMP('2019-02-25 20:32:22'), UNIX_TIMESTAMP('2019-02-25 22:45:42'), 180,	16,	1),
(UNIX_TIMESTAMP('2019-02-26 12:05:42'), UNIX_TIMESTAMP('2019-02-26 17:25:42'), 190,	16,	2),
(UNIX_TIMESTAMP('2019-02-27 08:32:22'), UNIX_TIMESTAMP('2019-02-27 22:45:42'), 200,	17,	3),
(UNIX_TIMESTAMP('2019-02-28 15:39:02'), UNIX_TIMESTAMP('2019-02-28 22:45:42'), 210,	17,	3);


INSERT INTO `tbl_pago` (`pago_cantidad`, `usuario_id`, `entidad_id`) VALUES
('2.00',	3,	3),
('5.00',	7,	4),
('4.00',	14,	2),
('5.00',	19,	1),
('20.00',	12,	4),
('10.00',	15,	3),
('4.00',	10,	2),
('9.00',	18,	1),
('2.00',	6,	1),
('3.00',	19,	4),
('2.00',	6,	2),
('1.00',	16,	1),
('16.00',	3,	1),
('2.00',	12,	2),
('6.00',	9,	3),
('4.00',	18,	1);

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;