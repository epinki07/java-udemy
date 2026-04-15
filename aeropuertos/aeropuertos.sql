-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 05-09-2019 a las 16:48:09
-- Versión del servidor: 10.1.37-MariaDB
-- Versión de PHP: 7.3.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `aeropuertos`
--
CREATE DATABASE IF NOT EXISTS `aeropuertos` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `aeropuertos`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aeropuertos`
--

DROP TABLE IF EXISTS `aeropuertos`;
CREATE TABLE IF NOT EXISTS `aeropuertos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `anio_inauguracion` int(11) NOT NULL,
  `capacidad` int(11) NOT NULL,
  `id_direccion` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `aeropuertos_ibfk_1` (`id_direccion`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `aeropuertos`
--

INSERT INTO `aeropuertos` (`id`, `nombre`, `anio_inauguracion`, `capacidad`, `id_direccion`) VALUES
(1, 'Quijote airport', 2000, 2000, 1),
(2, 'Adolfo Suárez Madrid-Barajas', 1970, 300000, 2),
(4, 'El Prat', 1980, 200000, 8),
(5, 'Aeropuerto de Castellón-Costa Azahar', 200000, 1500, 9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aeropuertos_privados`
--

DROP TABLE IF EXISTS `aeropuertos_privados`;
CREATE TABLE IF NOT EXISTS `aeropuertos_privados` (
  `id_aeropuerto` int(11) NOT NULL,
  `numero_socios` int(11) NOT NULL,
  PRIMARY KEY (`id_aeropuerto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `aeropuertos_privados`
--

INSERT INTO `aeropuertos_privados` (`id_aeropuerto`, `numero_socios`) VALUES
(1, 5),
(5, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aeropuertos_publicos`
--

DROP TABLE IF EXISTS `aeropuertos_publicos`;
CREATE TABLE IF NOT EXISTS `aeropuertos_publicos` (
  `id_aeropuerto` int(11) NOT NULL,
  `financiacion` decimal(10,2) NOT NULL,
  `num_trab_discapacitados` int(11) NOT NULL,
  PRIMARY KEY (`id_aeropuerto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `aeropuertos_publicos`
--

INSERT INTO `aeropuertos_publicos` (`id_aeropuerto`, `financiacion`, `num_trab_discapacitados`) VALUES
(2, '100000.50', 10),
(4, '100000.00', 150);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aviones`
--

DROP TABLE IF EXISTS `aviones`;
CREATE TABLE IF NOT EXISTS `aviones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `modelo` varchar(60) NOT NULL,
  `numero_asientos` int(11) NOT NULL,
  `velocidad_maxima` int(11) NOT NULL,
  `activado` int(1) NOT NULL,
  `id_aeropuerto` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_aeropuerto` (`id_aeropuerto`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `aviones`
--

INSERT INTO `aviones` (`id`, `modelo`, `numero_asientos`, `velocidad_maxima`, `activado`, `id_aeropuerto`) VALUES
(1, 'Boeing', 100, 250, 1, 1),
(2, 'Falcon', 10, 300, 1, 2),
(3, 'Air force', 200, 200, 1, 5),
(4, 'airbus', 60, 150, 1, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `direcciones`
--

DROP TABLE IF EXISTS `direcciones`;
CREATE TABLE IF NOT EXISTS `direcciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pais` varchar(50) NOT NULL,
  `ciudad` varchar(50) NOT NULL,
  `calle` varchar(50) NOT NULL,
  `numero` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `direcciones`
--

INSERT INTO `direcciones` (`id`, `pais`, `ciudad`, `calle`, `numero`) VALUES
(1, 'España', 'Ciudad Real', 'Calle falsa', 123),
(2, 'España', 'Madrid', 'Avenida Libertad', 1),
(8, 'España', 'El Prat de Llobregat', 'Calle maravillosa', 2),
(9, 'España', 'Castellon', 'Calle aeropuerto', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `usuario` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  PRIMARY KEY (`usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`usuario`, `password`) VALUES
('admin', 'admin');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `aeropuertos`
--
ALTER TABLE `aeropuertos`
  ADD CONSTRAINT `aeropuertos_ibfk_1` FOREIGN KEY (`id_direccion`) REFERENCES `direcciones` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `aeropuertos_privados`
--
ALTER TABLE `aeropuertos_privados`
  ADD CONSTRAINT `aeropuertos_privados_ibfk_1` FOREIGN KEY (`id_aeropuerto`) REFERENCES `aeropuertos` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `aeropuertos_publicos`
--
ALTER TABLE `aeropuertos_publicos`
  ADD CONSTRAINT `aeropuertos_publicos_ibfk_1` FOREIGN KEY (`id_aeropuerto`) REFERENCES `aeropuertos` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `aviones`
--
ALTER TABLE `aviones`
  ADD CONSTRAINT `aviones_ibfk_1` FOREIGN KEY (`id_aeropuerto`) REFERENCES `aeropuertos` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
