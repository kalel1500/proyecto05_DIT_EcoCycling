-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-03-2019 a las 16:06:48
-- Versión del servidor: 10.1.34-MariaDB
-- Versión de PHP: 7.2.8

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
  `bicicleta_posX` decimal(10,5) NOT NULL,
  `bicicleta_posY` decimal(10,5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `tbl_bicicleta`
--

INSERT INTO `tbl_bicicleta` (`bicicleta_id`, `bicicleta_modelo`, `bicicleta_posX`, `bicicleta_posY`) VALUES
(1, 'Specialized Tarmac', '0.00000', '0.00000'),
(2, 'Specialized Shiv', '0.00000', '0.00000'),
(3, 'Specialized Venge ', '0.00000', '0.00000'),
(4, 'Specialized Allez', '0.00000', '0.00000'),
(5, 'Scott Foil', '0.00000', '0.00000'),
(6, 'Scott Addict', '0.00000', '0.00000'),
(7, 'Canyon Aeroad', '0.00000', '0.00000'),
(8, 'Canyon Ultimate ', '0.00000', '0.00000'),
(9, 'Canyon Endurance', '0.00000', '0.00000'),
(10, 'Supersix EVO', '0.00000', '0.00000'),
(11, 'La Caad 12', '0.00000', '0.00000'),
(12, 'Synapse', '0.00000', '0.00000'),
(13, 'Orbea Avant', '0.00000', '0.00000');

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
  `grupoEntidad_id` int(11) DEFAULT NULL COMMENT 'fk_grupoEntidad'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `tbl_entidad`
--

INSERT INTO `tbl_entidad` (`entidad_id`, `entidad_nombre`, `entidad_descripcion`, `entidad_dineroMeta`, `entidad_dineroActual`, `grupoEntidad_id`) VALUES
(1, 'UNICEF', 'Organizacion no goburnamental de las naciones unidas que provee ayuda humanitaria y de desarrollo a niños y a padres', '700.00', '40.00', 2),
(2, 'SAVE THE CHILDREN', 'Save the children es una organizacion no gubernamental para la educacion,sanidad y proteccion infantil', '800.00', '10.00', 2),
(3, 'GREENPEACE', 'Greenpeace es una organización no gubernamental ecologista y pacifista internacional fundada en Canadá en 1971', '500.00', '20.00', 1),
(4, 'WWF', 'El Fondo Mundial para la Naturaleza es una organización de conservación global del ambiente, investigación y de defensa ambiental.', '999.00', '62.00', 1),
(5, 'CARITAS', 'Cáritas es un organismo de la Iglesia católica dedicado a la coordinación de la beneficencia humanitaria.', '700.00', '54.00', 2),
(6, 'LA VINYA', 'Somos una entidad que trabaja para atender a las personas en situación de riesgo social de los barrios de Bellvitge y El Gornal de la ciudad de L\'Hospitalet.', '900.00', '60.00', 2),
(7, 'ACCIONATURA', 'Organización Española de defensa del medio ambiente y su entorno', '900.00', '5.00', 1),
(8, 'TOBARRI', 'Organizacion en defensa de la precariedad en el barrio de Tobarra (VALDEPIERNA)', '800.00', '23.00', 2),
(9, 'DANAL', 'Entidad en defensa de el mundo rural y los espacios naturales', '999.00', '1.00', 2);

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
(1, 'assets/img/nivel/', '1_foto01', '.jpg', 1),
(2, 'assets/img/nivel/', '2_foto02', '.jpg', 1),
(3, 'assets/img/nivel/', '3_foto03', '.jpg', 1),
(4, 'assets/img/nivel/', '4_foto04', '.jpg', 2),
(5, 'assets/img/nivel/', '5_foto05', '.jpg', 2),
(6, 'assets/img/nivel/', '6_foto06', '.jpg', 2),
(7, 'assets/img/nivel/', '7_foto07', '.jpg', 3),
(8, 'assets/img/nivel/', '8_foto08', '.jpg', 3),
(9, 'assets/img/nivel/', '9_foto09', '.jpg', 3);

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
(1, '1549024870.0', '1549057270.0', '10.000', 3, 11),
(2, '1549267962.0', '1549282362.0', '3.000', 3, 4),
(3, '1549627942.0', '1549651882.0', '41.000', 3, 7),
(4, '1550412742.0', '1550428282.0', '61.000', 3, 12),
(5, '1550754742.0', '1550776342.0', '14.000', 4, 6),
(6, '1551460342.0', '1551467542.0', '3.000', 4, 8),
(7, '1551460342.0', '1601460342.0', '20.000', 3, 9),
(8, '1561460342.0', '1601460342.0', '10.000', 17, 3),
(9, '1521460342.0', '1541460342.0', '10.000', 14, 1),
(10, '1421460342.0', '1461460342.0', '11.000', 11, 2),
(11, '1481460342.0', '1601460342.0', '40.000', 12, 3),
(12, '1601460342.0', '1611460342.0', '10.000', 12, 4),
(13, '1601460342.0', '1621460342.0', '10.000', 12, 2),
(14, '1301460342.0', '1401460342.0', '11.000', 7, 4),
(15, '1591460342.0', '1601900342.0', '10.000', 4, 5),
(16, '1221460342.0', '1401421190.0', '70.000', 16, 10),
(17, '1221460342.0', '1222460342.0', '2.000', 5, 9),
(18, '1561460342.0', '1661560342.0', '1.000', 18, 2),
(19, '1221460342.0', '1341460342.0', '100.000', 16, 5),
(20, '1221460342.0', '1441460342.0', '15.000', 16, 6),
(21, '1571460342.0', '1661460342.0', '121.000', 17, 4),
(22, '1231460342.0', '1339460342.0', '200.000', 4, 10),
(23, '1121460342.0', '1224460342.0', '100.000', 4, 3),
(24, '1111460342.0', '1661460342.0', '900.000', 8, 10),
(25, '1661460342.0', '1991460342.0', '40.000', 14, 2),
(26, '1221460342.0', '1661460342.0', '100.000', 16, 1),
(27, '1221460342.0', '1661460342.0', '56.000', 18, 3),
(28, '1223460342.0', '1442460342.0', '260.000', 6, 1),
(29, '1221460342.0', '1661460342.0', '100.000', 19, 4),
(30, '1441460342.0', '1661460342.0', '600.000', 14, 3);

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
(1, 'nivel01', 1, '10.000', 'assets/img/nivel/', '1_nivel01', '.jpg'),
(2, 'nivel02', 2, '20.000', 'assets/img/nivel/', '2_nivel02', '.jpg'),
(3, 'nivel03', 3, '30.000', 'assets/img/nivel/', '3_nivel03', '.jpg');

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
  `usuario_ultimaConexion` decimal(11,1) DEFAULT NULL,
  `usuario_ultimoReset` decimal(11,1) DEFAULT NULL,
  `usuario_fondos` decimal(5,2) DEFAULT NULL,
  `grupo_id` int(11) DEFAULT NULL COMMENT 'fk_grupo',
  `nivel_id` int(11) DEFAULT NULL COMMENT 'fk_nivel',
  `foto_id` int(11) DEFAULT NULL COMMENT 'fk_foto'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `tbl_usuario`
--

INSERT INTO `tbl_usuario` (`usuario_id`, `usuario_usuario`, `usuario_nombre`, `usuario_apellido`, `usuario_email`, `usuario_contrasena`, `usuario_ultimaConexion`, `usuario_ultimoReset`, `usuario_fondos`, `grupo_id`, `nivel_id`, `foto_id`) VALUES
(1, 'usuAdmin', 'Admin', 'Empresa', 'admin@gmail.com', '$2y$10$BhHdy5dTii3ESp3tCLGazOJmwntxEWac8kIyMlNGNpwdr5NMhs1jq', '1552204800.0', NULL, '0.00', 2, 1, 1),
(2, 'usuSuperAdmin', 'SuperAdmin', 'Empresa', 'superAdmin@gmail.com', '$2y$10$BhHdy5dTii3ESp3tCLGazOJmwntxEWac8kIyMlNGNpwdr5NMhs1jq', '1552204800.0', NULL, '0.00', 3, 1, 1),
(3, 'usu01', 'Stefan', 'Salvatore', 'usu01@gmail.com', '$2y$10$BhHdy5dTii3ESp3tCLGazOJmwntxEWac8kIyMlNGNpwdr5NMhs1jq', '1552204800.0', NULL, '0.00', 1, 1, 1),
(4, 'usu02', 'Damon', 'Salvatore', 'usu02@gmail.com', '$2y$10$BhHdy5dTii3ESp3tCLGazOJmwntxEWac8kIyMlNGNpwdr5NMhs1jq', '1552204800.0', NULL, '0.00', 1, 1, 1),
(5, 'usu03', 'Elena', 'Gilbert', 'usu03@gmail.com', '$2y$10$BhHdy5dTii3ESp3tCLGazOJmwntxEWac8kIyMlNGNpwdr5NMhs1jq', '1552204800.0', NULL, '0.00', 1, 1, 1),
(6, 'usu04', 'Jeremy', 'Gilbert', 'usu04@gmail.com', '$2y$10$BhHdy5dTii3ESp3tCLGazOJmwntxEWac8kIyMlNGNpwdr5NMhs1jq', '1552204800.0', NULL, '0.00', 1, 1, 1),
(7, 'usu05', 'Bonnie', 'Bennett', 'usu05@gmail.com', '$2y$10$BhHdy5dTii3ESp3tCLGazOJmwntxEWac8kIyMlNGNpwdr5NMhs1jq', '1552204800.0', NULL, '0.00', 1, 1, 1),
(8, 'usu06', 'Caroline', 'Forbes', 'usu06@gmail.com', '$2y$10$BhHdy5dTii3ESp3tCLGazOJmwntxEWac8kIyMlNGNpwdr5NMhs1jq', '1552204800.0', NULL, '0.00', 1, 1, 1),
(9, 'usu07', 'Matt', 'Donovan', 'usu07@gmail.com', '$2y$10$BhHdy5dTii3ESp3tCLGazOJmwntxEWac8kIyMlNGNpwdr5NMhs1jq', '1552204800.0', NULL, '0.00', 1, 1, 1),
(10, 'usu08', 'Tyler', 'Lockwood', 'usu08@gmail.com', '$2y$10$BhHdy5dTii3ESp3tCLGazOJmwntxEWac8kIyMlNGNpwdr5NMhs1jq', '1552204800.0', NULL, '0.00', 1, 1, 1),
(11, 'usu09', 'Alaric', 'Saltzman', 'usu09@gmail.com', '$2y$10$BhHdy5dTii3ESp3tCLGazOJmwntxEWac8kIyMlNGNpwdr5NMhs1jq', '1552204800.0', NULL, '0.00', 1, 1, 1),
(12, 'usu10', 'Katherine', 'Pierce', 'usu10@gmail.com', '$2y$10$BhHdy5dTii3ESp3tCLGazOJmwntxEWac8kIyMlNGNpwdr5NMhs1jq', '1552204800.0', NULL, '0.00', 1, 1, 1),
(13, 'usu11', 'Kai', 'Parker', 'usu11@gmail.com', '$2y$10$BhHdy5dTii3ESp3tCLGazOJmwntxEWac8kIyMlNGNpwdr5NMhs1jq', '1552204800.0', NULL, '0.00', 1, 1, 1),
(14, 'usu12', 'Niklaus', 'Mikaelson', 'usu12@gmail.com', '$2y$10$BhHdy5dTii3ESp3tCLGazOJmwntxEWac8kIyMlNGNpwdr5NMhs1jq', '1552204800.0', NULL, '0.00', 1, 1, 1),
(15, 'usu13', 'Elijah', 'Mikaelson', 'usu13@gmail.com', '$2y$10$BhHdy5dTii3ESp3tCLGazOJmwntxEWac8kIyMlNGNpwdr5NMhs1jq', '1552204800.0', NULL, '0.00', 1, 1, 1),
(16, 'usu14', 'Rebekah ', 'Mikaelson', 'usu14@gmail.com', '$2y$10$BhHdy5dTii3ESp3tCLGazOJmwntxEWac8kIyMlNGNpwdr5NMhs1jq', '1552204800.0', NULL, '0.00', 1, 1, 1),
(17, 'usu15', 'Cole', 'Mikaelson', 'usu15@gmail.com', '$2y$10$BhHdy5dTii3ESp3tCLGazOJmwntxEWac8kIyMlNGNpwdr5NMhs1jq', '1552204800.0', NULL, '0.00', 1, 1, 1),
(18, 'usu16', 'Fin', 'Mikaelson', 'usu16@gmail.com', '$2y$10$BhHdy5dTii3ESp3tCLGazOJmwntxEWac8kIyMlNGNpwdr5NMhs1jq', '1552204800.0', NULL, '0.00', 1, 1, 1),
(19, 'usu17', 'Freya', 'Mikaelson', 'usu17@gmail.com', '$2y$10$BhHdy5dTii3ESp3tCLGazOJmwntxEWac8kIyMlNGNpwdr5NMhs1jq', '1552204800.0', NULL, '0.00', 1, 1, 1);

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
  MODIFY `entidad_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'pk_entidad', AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `tbl_foto`
--
ALTER TABLE `tbl_foto`
  MODIFY `foto_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'pk_foto', AUTO_INCREMENT=10;

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
  MODIFY `nivel_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'pk_nivel', AUTO_INCREMENT=4;

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
