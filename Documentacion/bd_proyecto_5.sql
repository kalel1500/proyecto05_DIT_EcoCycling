-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-03-2019 a las 18:37:46
-- Versión del servidor: 10.1.38-MariaDB
-- Versión de PHP: 5.6.40

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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_bicicleta`
--

CREATE TABLE `tbl_bicicleta` (
	`bicicleta_id` int(11) NOT NULL COMMENT 'pk_bicicleta',
	`bicicleta_modelo` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
	`bicicleta_posX` decimal(10,6) NOT NULL,
	`bicicleta_posY` decimal(10,6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `tbl_bicicleta`
--

INSERT INTO `tbl_bicicleta` (`bicicleta_id`, `bicicleta_modelo`, `bicicleta_posX`, `bicicleta_posY`) VALUES
(1, 'Specialized Tarmac',	'2.185677', '41.381876'),
(2, 'Specialized Shiv',		'2.175456', '41.376262'),
(3, 'Specialized Venge ',	'2.178690', '41.392567'),
(4, 'Specialized Allez',	'2.133200', '41.394592'),
(5, 'Scott Foil',			'2.153201', '41.409005'),
(6, 'Scott Addict',			'2.134116', '41.408432'),
(7, 'Canyon Aeroad',		'2.074372', '41.351594'),
(8, 'Canyon Ultimate',		'2.123098', '41.355205'),
(9, 'Canyon Endurance',		'2.110986', '41.350469'),
(10, 'Supersix EVO',		'2.160824', '41.363236'),
(11, 'La Caad 12',			'2.147187', '41.362569'),
(12, 'Synapse',				'2.152079', '41.391002'),
(13, 'Orbea Avant',			'2.146380', '41.378078');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_entidad`
--

CREATE TABLE `tbl_entidad` (
	`entidad_id` int(11) NOT NULL COMMENT 'pk_entidad',
	`entidad_nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
	`entidad_descripcion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
	`entidad_dineroMeta` decimal(5,2) DEFAULT NULL,
	`entidad_dineroActual` decimal(5,2) DEFAULT NULL,
	`grupoEntidad_id` int(11) DEFAULT NULL COMMENT 'fk_grupoEntidad',
	`entidad_url` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `tbl_entidad`
--

INSERT INTO `tbl_entidad` (`entidad_id`, `entidad_nombre`, `entidad_descripcion`, `entidad_dineroMeta`, `entidad_dineroActual`, `grupoEntidad_id`, `entidad_url`) VALUES
(1, 'UNICEF', 'Organizacion no goburnamental de las naciones unidas que provee ayuda humanitaria y de desarrollo a niños y a padres', '700.00', '40.00', 2, NULL),
(2, 'SAVE THE CHILDREN', 'Save the children es una organizacion no gubernamental para la educacion,sanidad y proteccion infantil', '800.00', '10.00', 2, NULL),
(3, 'GREENPEACE', 'Greenpeace es una organización no gubernamental ecologista y pacifista internacional fundada en Canadá en 1971', '500.00', '20.00', 1, NULL),
(4, 'WWF', 'El Fondo Mundial para la Naturaleza es una organización de conservación global del ambiente, investigación y de defensa ambiental.', '999.00', '62.00', 1, NULL),
(5, 'CÁRITAS', 'Cáritas es un organismo de la Iglesia católica dedicado a la coordinación de la beneficencia humanitaria.', '700.00', '70.00', 2, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_foto`
--

CREATE TABLE `tbl_foto` (
	`foto_id` int(11) NOT NULL COMMENT 'pk_foto',
	`foto_ruta` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
	`foto_nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
	`foto_extension` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
	`nivel_id` int(11) DEFAULT NULL COMMENT 'fk_nivel'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `tbl_foto`
--

INSERT INTO `tbl_foto` (`foto_id`, `foto_ruta`, `foto_nombre`, `foto_extension`, `nivel_id`) VALUES
(1, 'assets/img/users/', '1_foto01', '.png', 1),
(2, 'assets/img/users/', '2_foto02', '.png', 1),
(3, 'assets/img/users/', '3_foto03', '.png', 1),
(4, 'assets/img/users/', '4_foto04', '.png', 2),
(5, 'assets/img/users/', '5_foto05', '.png', 2),
(6, 'assets/img/users/', '6_foto06', '.png', 2),
(7, 'assets/img/users/', '7_foto07', '.png', 3),
(8, 'assets/img/users/', '8_foto08', '.png', 3),
(9, 'assets/img/users/', '9_foto09', '.png', 3),
(10, 'assets/img/users/', '10_foto10', '.png', 4),
(11, 'assets/img/users/', '11_foto11', '.png', 4),
(12, 'assets/img/users/', '12_foto12', '.png', 4),
(13, 'assets/img/users/', '13_foto13', '.png', 5),
(14, 'assets/img/users/', '14_foto14', '.png', 5),
(15, 'assets/img/users/', '15_foto15', '.png', 5),
(16, 'assets/img/users/', '16_foto16', '.png', 6),
(17, 'assets/img/users/', '17_foto17', '.png', 6),
(18, 'assets/img/users/', '18_foto18', '.png', 6),
(19, 'assets/img/users/', '19_foto19', '.png', 7),
(20, 'assets/img/users/', '20_foto20', '.png', 7),
(21, 'assets/img/users/', '21_foto21', '.png', 7),
(22, 'assets/img/users/', '22_foto22', '.png', 8),
(23, 'assets/img/users/', '23_foto23', '.png', 8),
(24, 'assets/img/users/', '24_foto24', '.png', 8),
(25, 'assets/img/users/', '25_foto25', '.png', 9),
(26, 'assets/img/users/', '26_foto26', '.png', 9),
(27, 'assets/img/users/', '27_foto27', '.png', 9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_grupo`
--

CREATE TABLE `tbl_grupo` (
	`grupo_id` int(11) NOT NULL COMMENT 'pk_grupo',
	`grupo_nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `tbl_grupo`
--

INSERT INTO `tbl_grupo` (`grupo_id`, `grupo_nombre`) VALUES
(1, 'Usuario'),
(2, 'Administrador'),
(3, 'SuperAdministrador');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_grupoentidad`
--

CREATE TABLE `tbl_grupoentidad` (
	`grupoEntidad_id` int(11) NOT NULL COMMENT 'pk_grupoEntidad',
	`grupoEntidad_nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
	`grupoEntidad_descripcion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `tbl_grupoentidad`
--

INSERT INTO `tbl_grupoentidad` (`grupoEntidad_id`, `grupoEntidad_nombre`, `grupoEntidad_descripcion`) VALUES
(1, 'Fauna y flora', 'Entidades relacionadas con el cuidado de animales o plantas tanto en temas de conservación como de investigación.'),
(2, 'Economía y sanidad', 'Entidades que centran su actividad en proporcionar ayuda económica y sanitaria a las personas necesitadas. También contribuyen en el desarrollo de estos ámbitos en diferentes localidades.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_historial`
--

CREATE TABLE `tbl_historial` (
	`historial_id` int(11) NOT NULL COMMENT 'pk_historial',
	`historial_fechaInicio` decimal(11,1) NOT NULL,
	`historial_fechaFin` decimal(11,1) NOT NULL,
	`historial_kilometros` decimal(9,3) NOT NULL,
	`usuario_id` int(11) DEFAULT NULL COMMENT 'fk_usuario',
	`bicicleta_id` int(11) DEFAULT NULL COMMENT 'fk_bicicleta'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `tbl_historial`
--

INSERT INTO `tbl_historial` (`historial_id`, `historial_fechaInicio`, `historial_fechaFin`, `historial_kilometros`, `usuario_id`, `bicicleta_id`) VALUES
(1, '1551444070.0', '1551476470.0', '1.000', 1, 1),
(2, '1551514362.0', '1551528762.0', '10.000', 2, 2),
(3, '1551615142.0', '1551639082.0', '100.000', 3, 3),
(4, '1551708742.0', '1551724282.0', '200.000', 4, 4),
(5, '1551791542.0', '1551813142.0', '300.000', 5, 5),
(6, '1551892342.0', '1551899542.0', '400.000', 6, 6),
(7, '1551957142.0', '1551978342.0', '500.000', 7, 7),
(8, '1552043102.0', '1552046382.0', '600.000', 8, 8),
(9, '1552171942.0', '1552173942.0', '700.000', 9, 9),
(10, '1549505142.0', '1549505542.0', '800.000', 10, 10),
(11, '1549629942.0', '1549631142.0', '10.000', 11, 11),
(12, '1549695942.0', '1549705942.0', '20.000', 11, 12),
(13, '1549796742.0', '1549838342.0', '30.000', 11, 13),
(14, '1549863942.0', '1549899142.0', '40.000', 12, 1),
(15, '1549991942.0', '1549977542.0', '50.000', 12, 2),
(16, '1550032342.0', '1550039990.0', '60.000', 12, 3),
(17, '1550129542.0', '1550179142.0', '70.000', 13, 4),
(18, '1550231942.0', '1550251942.0', '80.000', 13, 5),
(19, '1550302342.0', '1550328742.0', '90.000', 13, 6),
(20, '1550388742.0', '1550414342.0', '110.000', 14, 7),
(21, '1550468742.0', '1550526342.0', '120.000', 14, 8),
(22, '1550535542.0', '1550539142.0', '130.000', 14, 9),
(23, '1550785542.0', '1550789542.0', '140.000', 15, 10),
(24, '1550804342.0', '1550871942.0', '150.000', 15, 11),
(25, '1550936742.0', '1550939142.0', '160.000', 15, 12),
(26, '1550993542.0', '1550997942.0', '170.000', 16, 13),
(27, '1551123142.0', '1551131142.0', '180.000', 16, 1),
(28, '1551179142.0', '1551198342.0', '190.000', 16, 2),
(29, '1551252742.0', '1551303942.0', '200.000', 17, 3),
(30, '1551364742.0', '1551390342.0', '210.000', 17, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_nivel`
--

CREATE TABLE `tbl_nivel` (
	`nivel_id` int(11) NOT NULL COMMENT 'pk_nivel',
	`nivel_nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
	`nivel_numero` int(11) NOT NULL,
	`nivel_kilometros` decimal(9,3) NOT NULL,
	`nivel_fotoRuta` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
	`nivel_fotoNombre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
	`nivel_fotoExtension` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `tbl_nivel`
--

INSERT INTO `tbl_nivel` (`nivel_id`, `nivel_nombre`, `nivel_numero`, `nivel_kilometros`, `nivel_fotoRuta`, `nivel_fotoNombre`, `nivel_fotoExtension`) VALUES
(1, 'nivel00', 0, '0.000', 'assets/img/levels/', '1_nivel00', '.png'),
(2, 'nivel01', 1, '100.000', 'assets/img/levels/', '2_nivel01', '.png'),
(3, 'nivel02', 2, '200.000', 'assets/img/levels/', '3_nivel02', '.png'),
(4, 'nivel03', 3, '300.000', 'assets/img/levels/', '4_nivel03', '.png'),
(5, 'nivel04', 4, '400.000', 'assets/img/levels/', '5_nivel04', '.png'),
(6, 'nivel05', 5, '500.000', 'assets/img/levels/', '6_nivel05', '.png'),
(7, 'nivel06', 6, '600.000', 'assets/img/levels/', '7_nivel06', '.png'),
(8, 'nivel07', 7, '700.000', 'assets/img/levels/', '8_nivel07', '.png'),
(9, 'nivel08', 8, '800.000', 'assets/img/levels/', '9_nivel08', '.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_pago`
--

CREATE TABLE `tbl_pago` (
	`pago_id` int(11) NOT NULL COMMENT 'pk_pago',
	`pago_cantidad` decimal(5,2) NOT NULL,
	`usuario_id` int(11) NOT NULL COMMENT 'fk_usuario',
	`entidad_id` int(11) NOT NULL COMMENT 'fk_entidad'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `tbl_pago`
--

INSERT INTO `tbl_pago` (`pago_id`, `pago_cantidad`, `usuario_id`, `entidad_id`) VALUES
(1, '2.00', 3, 3),
(2, '5.00', 7, 4),
(3, '4.00', 14, 2),
(4, '5.00', 19, 1),
(5, '20.00', 12, 4),
(6, '10.00', 15, 3),
(7, '4.00', 10, 2),
(8, '9.00', 18, 1),
(9, '2.00', 6, 1),
(10, '3.00', 19, 4),
(11, '2.00', 6, 2),
(12, '1.00', 16, 1),
(13, '16.00', 3, 1),
(14, '2.00', 12, 2),
(15, '6.00', 9, 3),
(16, '4.00', 18, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_usuario`
--

CREATE TABLE `tbl_usuario` (
	`usuario_id` int(11) NOT NULL COMMENT 'pk_usuario',
	`usuario_usuario` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
	`usuario_nombre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
	`usuario_apellido` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
	`usuario_email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
	`usuario_contrasena` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
	`usuario_sexo` enum('Hombre','Mujer','Otros') COLLATE utf8_unicode_ci DEFAULT NULL,
	`usuario_ultimaConexion` decimal(11,1) DEFAULT NULL,
	`usuario_ultimoReset` decimal(11,1) DEFAULT NULL,
	`usuario_fondosMensuales` decimal(5,2) DEFAULT NULL,
	`usuario_fondosTotales` decimal(5,2) DEFAULT NULL,
	`grupo_id` int(11) DEFAULT NULL COMMENT 'fk_grupo',
	`nivel_id` int(11) DEFAULT NULL COMMENT 'fk_nivel',
	`foto_id` int(11) DEFAULT NULL COMMENT 'fk_foto'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `tbl_usuario`
--

INSERT INTO `tbl_usuario` (`usuario_id`, `usuario_usuario`, `usuario_nombre`, `usuario_apellido`, `usuario_email`, `usuario_contrasena`, `usuario_sexo`, `usuario_ultimaConexion`, `usuario_ultimoReset`, `usuario_fondosMensuales`, `usuario_fondosTotales`, `grupo_id`, `nivel_id`, `foto_id`) VALUES
(1, 'usu01', 'Stefan', 'Salvatore', 'usu01@gmail.com', '$2y$10$BhHdy5dTii3ESp3tCLGazOJmwntxEWac8kIyMlNGNpwdr5NMhs1jq', 'Hombre', '1552204800.0', NULL, '0.00', '0.00', 1, 1, 1),
(2, 'usu02', 'Damon', 'Salvatore', 'usu02@gmail.com', '$2y$10$BhHdy5dTii3ESp3tCLGazOJmwntxEWac8kIyMlNGNpwdr5NMhs1jq', 'Hombre', '1552204800.0', NULL, '0.00', '24.00', 1, 1, 1),
(3, 'usu03', 'Elena', 'Gilbert', 'usu03@gmail.com', '$2y$10$BhHdy5dTii3ESp3tCLGazOJmwntxEWac8kIyMlNGNpwdr5NMhs1jq', 'Mujer', '1552204800.0', NULL, '5.00', '5.00', 1, 2, 1),
(4, 'usu04', 'Jeremy', 'Gilbert', 'usu04@gmail.com', '$2y$10$BhHdy5dTii3ESp3tCLGazOJmwntxEWac8kIyMlNGNpwdr5NMhs1jq', 'Hombre', '1552204800.0', NULL, '5.00', '5.00', 1, 3, 1),
(5, 'usu05', 'Bonnie', 'Bennett', 'usu05@gmail.com', '$2y$10$BhHdy5dTii3ESp3tCLGazOJmwntxEWac8kIyMlNGNpwdr5NMhs1jq', 'Mujer', '1552204800.0', NULL, '5.00', '5.00', 1, 4, 1),
(6, 'usu06', 'Caroline', 'Forbes', 'usu06@gmail.com', '$2y$10$BhHdy5dTii3ESp3tCLGazOJmwntxEWac8kIyMlNGNpwdr5NMhs1jq', 'Mujer', '1552204800.0', NULL, '5.00', '5.00', 1, 5, 1),
(7, 'usu07', 'Matt', 'Donovan', 'usu07@gmail.com', '$2y$10$BhHdy5dTii3ESp3tCLGazOJmwntxEWac8kIyMlNGNpwdr5NMhs1jq', 'Hombre', '1552204800.0', NULL, '5.00', '5.00', 1, 6, 1),
(8, 'usu08', 'Tyler', 'Lockwood', 'usu08@gmail.com', '$2y$10$BhHdy5dTii3ESp3tCLGazOJmwntxEWac8kIyMlNGNpwdr5NMhs1jq', 'Hombre', '1552204800.0', NULL, '5.00', '5.00', 1, 7, 1),
(9, 'usu09', 'Alaric', 'Saltzman', 'usu09@gmail.com', '$2y$10$BhHdy5dTii3ESp3tCLGazOJmwntxEWac8kIyMlNGNpwdr5NMhs1jq', 'Hombre', '1552204800.0', NULL, '5.00', '5.00', 1, 8, 1),
(10, 'usu10', 'Katherine', 'Pierce', 'usu10@gmail.com', '$2y$10$BhHdy5dTii3ESp3tCLGazOJmwntxEWac8kIyMlNGNpwdr5NMhs1jq', 'Mujer', '1552204800.0', NULL, '0.00', '5.00', 1, 9, 1),
(11, 'usu11', 'Kai', 'Parker', 'usu11@gmail.com', '$2y$10$BhHdy5dTii3ESp3tCLGazOJmwntxEWac8kIyMlNGNpwdr5NMhs1jq', 'Hombre', '1552204800.0', NULL, '0.00', '3.00', 1, 1, 1),
(12, 'usu12', 'Niklaus', 'Mikaelson', 'usu12@gmail.com', '$2y$10$BhHdy5dTii3ESp3tCLGazOJmwntxEWac8kIyMlNGNpwdr5NMhs1jq', 'Hombre', '1552204800.0', NULL, '0.00', '5.00', 1, 2, 1),
(13, 'usu13', 'Elijah', 'Mikaelson', 'usu13@gmail.com', '$2y$10$BhHdy5dTii3ESp3tCLGazOJmwntxEWac8kIyMlNGNpwdr5NMhs1jq', 'Hombre', '1552204800.0', NULL, '0.00', '5.00', 1, 3, 1),
(14, 'usu14', 'Rebekah ', 'Mikaelson', 'usu14@gmail.com', '$2y$10$BhHdy5dTii3ESp3tCLGazOJmwntxEWac8kIyMlNGNpwdr5NMhs1jq', 'Mujer', '1552204800.0', NULL, '0.00', '5.00', 1, 4, 1),
(15, 'usu15', 'Cole', 'Mikaelson', 'usu15@gmail.com', '$2y$10$BhHdy5dTii3ESp3tCLGazOJmwntxEWac8kIyMlNGNpwdr5NMhs1jq', 'Hombre', '1552204800.0', NULL, '0.00', '5.00', 1, 5, 1),
(16, 'usu16', 'Fin', 'Mikaelson', 'usu16@gmail.com', '$2y$10$BhHdy5dTii3ESp3tCLGazOJmwntxEWac8kIyMlNGNpwdr5NMhs1jq', 'Hombre', '1552204800.0', NULL, '0.00', '5.00', 1, 6, 1),
(17, 'usu17', 'Freya', 'Mikaelson', 'usu17@gmail.com', '$2y$10$BhHdy5dTii3ESp3tCLGazOJmwntxEWac8kIyMlNGNpwdr5NMhs1jq', 'Mujer', '1552204800.0', NULL, '0.00', '5.00', 1, 5, 1),
(18, 'usuAdmin', 'Admin', 'Empresa', 'admin@gmail.com', '$2y$10$BhHdy5dTii3ESp3tCLGazOJmwntxEWac8kIyMlNGNpwdr5NMhs1jq', 'Hombre', '1552204800.0', NULL, '0.00', '0.00', 2, 1, 1),
(19, 'usuSuperAdmin', 'SuperAdmin', 'Empresa', 'superAdmin@gmail.com', '$2y$10$BhHdy5dTii3ESp3tCLGazOJmwntxEWac8kIyMlNGNpwdr5NMhs1jq', 'Mujer', '1552204800.0', NULL, '0.00', '0.00', 3, 1, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tbl_bicicleta`
--
ALTER TABLE `tbl_bicicleta`
	ADD PRIMARY KEY (`bicicleta_id`);

--
-- Indices de la tabla `tbl_entidad`
--
ALTER TABLE `tbl_entidad`
	ADD PRIMARY KEY (`entidad_id`),
	ADD KEY `FK_entidad_grupoEntidad` (`grupoEntidad_id`);

--
-- Indices de la tabla `tbl_foto`
--
ALTER TABLE `tbl_foto`
	ADD PRIMARY KEY (`foto_id`),
	ADD KEY `FK_foto_nivel` (`nivel_id`);

--
-- Indices de la tabla `tbl_grupo`
--
ALTER TABLE `tbl_grupo`
	ADD PRIMARY KEY (`grupo_id`);

--
-- Indices de la tabla `tbl_grupoentidad`
--
ALTER TABLE `tbl_grupoentidad`
	ADD PRIMARY KEY (`grupoEntidad_id`);

--
-- Indices de la tabla `tbl_historial`
--
ALTER TABLE `tbl_historial`
	ADD PRIMARY KEY (`historial_id`),
	ADD KEY `FK_historial_usuario` (`usuario_id`),
	ADD KEY `FK_historial_bicicleta` (`bicicleta_id`);

--
-- Indices de la tabla `tbl_nivel`
--
ALTER TABLE `tbl_nivel`
	ADD PRIMARY KEY (`nivel_id`);

--
-- Indices de la tabla `tbl_pago`
--
ALTER TABLE `tbl_pago`
	ADD PRIMARY KEY (`pago_id`),
	ADD KEY `FK_pago_usuario` (`usuario_id`),
	ADD KEY `FK_pago_entidad` (`entidad_id`);

--
-- Indices de la tabla `tbl_usuario`
--
ALTER TABLE `tbl_usuario`
	ADD PRIMARY KEY (`usuario_id`),
	ADD UNIQUE KEY `uk_usuario_usuario` (`usuario_usuario`),
	ADD UNIQUE KEY `uk_usuario_email` (`usuario_email`),
	ADD KEY `FK_usuario_grupo` (`grupo_id`),
	ADD KEY `FK_usuario_nivel` (`nivel_id`),
	ADD KEY `FK_usuario_foto` (`foto_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tbl_bicicleta`
--
ALTER TABLE `tbl_bicicleta`
	MODIFY `bicicleta_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'pk_bicicleta', AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `tbl_entidad`
--
ALTER TABLE `tbl_entidad`
	MODIFY `entidad_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'pk_entidad', AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tbl_foto`
--
ALTER TABLE `tbl_foto`
	MODIFY `foto_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'pk_foto', AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de la tabla `tbl_grupo`
--
ALTER TABLE `tbl_grupo`
	MODIFY `grupo_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'pk_grupo', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tbl_grupoentidad`
--
ALTER TABLE `tbl_grupoentidad`
	MODIFY `grupoEntidad_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'pk_grupoEntidad', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tbl_historial`
--
ALTER TABLE `tbl_historial`
	MODIFY `historial_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'pk_historial', AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `tbl_nivel`
--
ALTER TABLE `tbl_nivel`
	MODIFY `nivel_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'pk_nivel', AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `tbl_pago`
--
ALTER TABLE `tbl_pago`
	MODIFY `pago_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'pk_pago', AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `tbl_usuario`
--
ALTER TABLE `tbl_usuario`
	MODIFY `usuario_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'pk_usuario', AUTO_INCREMENT=20;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tbl_entidad`
--
ALTER TABLE `tbl_entidad`
	ADD CONSTRAINT `FK_entidad_grupoEntidad` FOREIGN KEY (`grupoEntidad_id`) REFERENCES `tbl_grupoentidad` (`grupoEntidad_id`);

--
-- Filtros para la tabla `tbl_foto`
--
ALTER TABLE `tbl_foto`
	ADD CONSTRAINT `FK_foto_nivel` FOREIGN KEY (`nivel_id`) REFERENCES `tbl_nivel` (`nivel_id`);

--
-- Filtros para la tabla `tbl_historial`
--
ALTER TABLE `tbl_historial`
	ADD CONSTRAINT `FK_historial_bicicleta` FOREIGN KEY (`bicicleta_id`) REFERENCES `tbl_bicicleta` (`bicicleta_id`),
	ADD CONSTRAINT `FK_historial_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `tbl_usuario` (`usuario_id`);

--
-- Filtros para la tabla `tbl_pago`
--
ALTER TABLE `tbl_pago`
	ADD CONSTRAINT `FK_pago_entidad` FOREIGN KEY (`entidad_id`) REFERENCES `tbl_entidad` (`entidad_id`),
	ADD CONSTRAINT `FK_pago_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `tbl_usuario` (`usuario_id`);

--
-- Filtros para la tabla `tbl_usuario`
--
ALTER TABLE `tbl_usuario`
	ADD CONSTRAINT `FK_usuario_foto` FOREIGN KEY (`foto_id`) REFERENCES `tbl_foto` (`foto_id`),
	ADD CONSTRAINT `FK_usuario_grupo` FOREIGN KEY (`grupo_id`) REFERENCES `tbl_grupo` (`grupo_id`),
	ADD CONSTRAINT `FK_usuario_nivel` FOREIGN KEY (`nivel_id`) REFERENCES `tbl_nivel` (`nivel_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
