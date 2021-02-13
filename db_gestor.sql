-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-02-2021 a las 22:30:53
-- Versión del servidor: 10.4.17-MariaDB
-- Versión de PHP: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_gestor`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumno`
--

CREATE TABLE `alumno` (
  `cod_alum` int(11) NOT NULL,
  `nom_alum` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `password` varchar(20) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `alumno`
--

INSERT INTO `alumno` (`cod_alum`, `nom_alum`, `password`) VALUES
(1, 'alumno 1', '123456'),
(2, 'alumno 2', '123456');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumn_asig`
--

CREATE TABLE `alumn_asig` (
  `cod_alum` int(11) NOT NULL,
  `cod_asig` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alum_curso`
--

CREATE TABLE `alum_curso` (
  `cod_alum` int(11) NOT NULL,
  `cod_curso` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `alum_curso`
--

INSERT INTO `alum_curso` (`cod_alum`, `cod_curso`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alum_tarea`
--

CREATE TABLE `alum_tarea` (
  `cod_alum` int(11) NOT NULL,
  `cod_tarea` int(11) NOT NULL,
  `cod_asig` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignatura`
--

CREATE TABLE `asignatura` (
  `cod_asig` int(11) NOT NULL,
  `nom_asig` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `curs_año` int(4) DEFAULT NULL,
  `n_horas` int(11) DEFAULT NULL,
  `profesor` varchar(45) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `curso`
--

CREATE TABLE `curso` (
  `cod_curso` int(11) NOT NULL,
  `nom_centro` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `anio_ini` int(4) DEFAULT NULL,
  `anio_fin` int(4) DEFAULT NULL,
  `descript_curso` varchar(60) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `curso`
--

INSERT INTO `curso` (`cod_curso`, `nom_centro`, `anio_ini`, `anio_fin`, `descript_curso`) VALUES
(1, 'I.E.S Saladillo', 2020, 2021, '2Âº CFGS - Desarrollo de Aplicaciones Multiplataforma');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `curso_asig`
--

CREATE TABLE `curso_asig` (
  `cod_curso` int(11) NOT NULL,
  `cod_asig` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tarea`
--

CREATE TABLE `tarea` (
  `cod_tarea` int(11) NOT NULL,
  `cod_asig` int(11) NOT NULL,
  `nom_tarea` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `f_inicio` timestamp NULL DEFAULT NULL,
  `f_limite` timestamp NULL DEFAULT NULL,
  `estado` enum('completo','pendiente','edicion') COLLATE utf8_bin DEFAULT NULL,
  `descript_tarea` varchar(60) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alumno`
--
ALTER TABLE `alumno`
  ADD PRIMARY KEY (`cod_alum`);

--
-- Indices de la tabla `alumn_asig`
--
ALTER TABLE `alumn_asig`
  ADD PRIMARY KEY (`cod_alum`,`cod_asig`);

--
-- Indices de la tabla `alum_curso`
--
ALTER TABLE `alum_curso`
  ADD PRIMARY KEY (`cod_alum`,`cod_curso`),
  ADD KEY `mjhfkifl` (`cod_curso`);

--
-- Indices de la tabla `alum_tarea`
--
ALTER TABLE `alum_tarea`
  ADD PRIMARY KEY (`cod_alum`,`cod_tarea`,`cod_asig`);

--
-- Indices de la tabla `asignatura`
--
ALTER TABLE `asignatura`
  ADD PRIMARY KEY (`cod_asig`);

--
-- Indices de la tabla `curso`
--
ALTER TABLE `curso`
  ADD PRIMARY KEY (`cod_curso`);

--
-- Indices de la tabla `curso_asig`
--
ALTER TABLE `curso_asig`
  ADD PRIMARY KEY (`cod_curso`,`cod_asig`),
  ADD KEY `vfdghhd` (`cod_asig`);

--
-- Indices de la tabla `tarea`
--
ALTER TABLE `tarea`
  ADD PRIMARY KEY (`cod_tarea`,`cod_asig`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alumno`
--
ALTER TABLE `alumno`
  MODIFY `cod_alum` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `asignatura`
--
ALTER TABLE `asignatura`
  MODIFY `cod_asig` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `curso`
--
ALTER TABLE `curso`
  MODIFY `cod_curso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alumn_asig`
--
ALTER TABLE `alumn_asig`
  ADD CONSTRAINT `alumn_asig_ibfk_1` FOREIGN KEY (`cod_alum`) REFERENCES `alumno` (`cod_alum`),
  ADD CONSTRAINT `alumn_asig_ibfk_2` FOREIGN KEY (`cod_asig`) REFERENCES `asignatura` (`cod_asig`);

--
-- Filtros para la tabla `alum_curso`
--
ALTER TABLE `alum_curso`
  ADD CONSTRAINT `hgfhsjfjhsj` FOREIGN KEY (`cod_alum`) REFERENCES `alumno` (`cod_alum`),
  ADD CONSTRAINT `mjhfkifl` FOREIGN KEY (`cod_curso`) REFERENCES `curso` (`cod_curso`);

--
-- Filtros para la tabla `alum_tarea`
--
ALTER TABLE `alum_tarea`
  ADD CONSTRAINT `alum_tarea_ibfk_1` FOREIGN KEY (`cod_alum`) REFERENCES `alumno` (`cod_alum`),
  ADD CONSTRAINT `alum_tarea_ibfk_2` FOREIGN KEY (`cod_tarea`) REFERENCES `tarea` (`cod_tarea`),
  ADD CONSTRAINT `alum_tarea_ibfk_3` FOREIGN KEY (`cod_asig`) REFERENCES `asignatura` (`cod_asig`);

--
-- Filtros para la tabla `curso_asig`
--
ALTER TABLE `curso_asig`
  ADD CONSTRAINT `curso_asig_ibfk_2` FOREIGN KEY (`cod_asig`) REFERENCES `asignatura` (`cod_asig`),
  ADD CONSTRAINT `vfdghhd` FOREIGN KEY (`cod_curso`) REFERENCES `curso` (`cod_curso`);

--
-- Filtros para la tabla `tarea`
--
ALTER TABLE `tarea`
  ADD CONSTRAINT `tarea_ibfk_1` FOREIGN KEY (`cod_asig`) REFERENCES `asignatura` (`cod_asig`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
