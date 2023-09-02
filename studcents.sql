-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-08-2023 a las 17:41:15
-- Versión del servidor: 10.4.17-MariaDB
-- Versión de PHP: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `studcents`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asistencia`
--

CREATE TABLE `asistencia` (
  `id_estudiante` int(15) NOT NULL,
  `estado` varchar(5) NOT NULL,
  `fk_id_hora` int(15) NOT NULL,
  `fk_materia` int(15) NOT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dia`
--

CREATE TABLE `dia` (
  `id_dia` int(15) NOT NULL,
  `nombre_dia` varchar(30) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupo`
--

CREATE TABLE `grupo` (
  `id_grupo` int(15) NOT NULL,
  `nom_num` varchar(15) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `grupo`
--

INSERT INTO `grupo` (`id_grupo`, `nom_num`) VALUES
(1, 'docente'),
(101, '0101'),
(102, '0102'),
(201, '0201'),
(202, '0202'),
(301, '0301'),
(302, '0302'),
(401, '0401'),
(402, '0402'),
(501, '0501'),
(502, '0502'),
(601, '0601'),
(602, '0602'),
(701, '0701'),
(702, '0702'),
(801, '0801'),
(802, '0802'),
(901, '0901'),
(902, '0902'),
(1001, '01001'),
(1002, '01002'),
(1101, '01101');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hora`
--

CREATE TABLE `hora` (
  `id_hora` int(15) NOT NULL,
  `numero_hora` int(2) NOT NULL,
  `fk_id_materia` int(15) NOT NULL,
  `fk_id_dia` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materia`
--

CREATE TABLE `materia` (
  `id_materia` int(15) NOT NULL,
  `nombre_materia` varchar(50) NOT NULL,
  `fk_id_dia` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `id_rol` int(15) NOT NULL,
  `nom_rol` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `des` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`id_rol`, `nom_rol`, `des`) VALUES
(1, 'estudiante', 'estudiantes'),
(2, 'docente', 'docentes'),
(3, 'administrador', 'admin'),
(4, 'acudiente', 'acudientes');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `doc` int(15) NOT NULL,
  `tipo_doc` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `nom1` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `nom2` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `ape1` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `ape2` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `correo` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `tel` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `id_rol_fk` int(15) NOT NULL,
  `nac` date NOT NULL,
  `edad` int(3) NOT NULL,
  `fk_grupo` int(15) NOT NULL,
  `clave` varchar(101) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`doc`, `tipo_doc`, `nom1`, `nom2`, `ape1`, `ape2`, `correo`, `tel`, `id_rol_fk`, `nac`, `edad`, `fk_grupo`, `clave`) VALUES
(99, 'TI', 'lllllLL', 'LLLLLLLL', 'LLL', 'LLL', 'LLL@GMAIl.com', '9232', 3, '2023-08-03', 9, 101, '45c48cce2e2d7fbdea1afc51c7c6ad26'),
(123, 'CC', 'Administrador', 'a', 'a', 'a', 'kkjkkl@gmail.com', '99', 3, '2023-08-31', 1, 1, 'c4ca4238a0b923820dcc509a6f75849b'),
(1238, 'TI', 'Administrador 2', 'a', 'a', 'a', 'kakak@gmail.com', '9', 3, '2023-08-17', 112, 1, '202cb962ac59075b964b07152d234b70');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_materia`
--

CREATE TABLE `usuario_materia` (
  `fk_id_u` int(15) NOT NULL,
  `fk_materia` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `asistencia`
--
ALTER TABLE `asistencia`
  ADD KEY `asistencia_usuario` (`id_estudiante`),
  ADD KEY `materia_asistencia` (`fk_materia`),
  ADD KEY `hora_asistencia` (`fk_id_hora`);

--
-- Indices de la tabla `dia`
--
ALTER TABLE `dia`
  ADD PRIMARY KEY (`id_dia`);

--
-- Indices de la tabla `grupo`
--
ALTER TABLE `grupo`
  ADD PRIMARY KEY (`id_grupo`);

--
-- Indices de la tabla `hora`
--
ALTER TABLE `hora`
  ADD PRIMARY KEY (`id_hora`),
  ADD KEY `dia_hora` (`fk_id_dia`),
  ADD KEY `materia_dia` (`fk_id_materia`);

--
-- Indices de la tabla `materia`
--
ALTER TABLE `materia`
  ADD PRIMARY KEY (`id_materia`),
  ADD KEY `dia_materia` (`fk_id_dia`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`id_rol`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`doc`),
  ADD UNIQUE KEY `correo` (`correo`),
  ADD KEY `user_rol` (`id_rol_fk`),
  ADD KEY `user_grupo` (`fk_grupo`);

--
-- Indices de la tabla `usuario_materia`
--
ALTER TABLE `usuario_materia`
  ADD KEY `user_materia1` (`fk_id_u`),
  ADD KEY `user_materia2` (`fk_materia`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `asistencia`
--
ALTER TABLE `asistencia`
  ADD CONSTRAINT `asistencia_usuario` FOREIGN KEY (`id_estudiante`) REFERENCES `user` (`doc`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `hora_asistencia` FOREIGN KEY (`fk_id_hora`) REFERENCES `hora` (`id_hora`),
  ADD CONSTRAINT `materia_asistencia` FOREIGN KEY (`fk_materia`) REFERENCES `materia` (`id_materia`);

--
-- Filtros para la tabla `hora`
--
ALTER TABLE `hora`
  ADD CONSTRAINT `dia_hora` FOREIGN KEY (`fk_id_dia`) REFERENCES `dia` (`id_dia`),
  ADD CONSTRAINT `materia_dia` FOREIGN KEY (`fk_id_materia`) REFERENCES `materia` (`id_materia`);

--
-- Filtros para la tabla `materia`
--
ALTER TABLE `materia`
  ADD CONSTRAINT `dia_materia` FOREIGN KEY (`fk_id_dia`) REFERENCES `dia` (`id_dia`);

--
-- Filtros para la tabla `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_grupo` FOREIGN KEY (`fk_grupo`) REFERENCES `grupo` (`id_grupo`),
  ADD CONSTRAINT `user_rol` FOREIGN KEY (`id_rol_fk`) REFERENCES `rol` (`id_rol`);

--
-- Filtros para la tabla `usuario_materia`
--
ALTER TABLE `usuario_materia`
  ADD CONSTRAINT `user_materia1` FOREIGN KEY (`fk_id_u`) REFERENCES `user` (`doc`),
  ADD CONSTRAINT `user_materia2` FOREIGN KEY (`fk_materia`) REFERENCES `materia` (`id_materia`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
