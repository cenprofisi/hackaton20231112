-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-11-2023 a las 23:13:53
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sgh-fisi`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciclos`
--

CREATE TABLE `ciclos` (
  `id_ciclo` int(11) NOT NULL,
  `ciclo` varchar(20) NOT NULL,
  `id_semestre` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ciclos`
--

INSERT INTO `ciclos` (`id_ciclo`, `ciclo`, `id_semestre`) VALUES
(1, '1', NULL),
(2, '2', NULL),
(3, '3', NULL),
(6, '4', NULL),
(7, '5', NULL),
(8, '6', NULL),
(9, '7', NULL),
(10, '8', NULL),
(11, '9', NULL),
(12, '10', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cursos`
--

CREATE TABLE `cursos` (
  `id_curso` int(11) NOT NULL,
  `codigo` varchar(20) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `creditos` decimal(6,1) NOT NULL,
  `cantidad_alumnos` int(11) DEFAULT NULL,
  `id_semestre` int(11) DEFAULT NULL,
  `id_ciclo` int(11) DEFAULT NULL,
  `id_plan_estudios` int(11) DEFAULT NULL,
  `id_seccion` int(11) DEFAULT NULL,
  `id_horario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cursos`
--

INSERT INTO `cursos` (`id_curso`, `codigo`, `nombre`, `creditos`, `cantidad_alumnos`, `id_semestre`, `id_ciclo`, `id_plan_estudios`, `id_seccion`, `id_horario`) VALUES
(1, 'CURSO001', 'Curso de ejemplo', 0.0, 50, NULL, 1, 1, NULL, 5),
(2, 'CURSO002', 'Otro curso', 0.0, 40, NULL, 2, 2, 2, 7),
(3, 'CURSO003', 'Tercer curso', 0.0, 60, NULL, 3, 3, 3, 6),
(4, 'CURSO004', 'SISTEMAS OPERATIVOS', 0.0, 40, NULL, 1, 1, 1, 1),
(6, 'CURSO005', 'Estructura de Datos', 0.0, 60, NULL, 1, 1, 2, 3),
(7, 'CURSO005', 'Estructura de Datos', 0.0, 40, NULL, 1, 1, 2, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horarios`
--

CREATE TABLE `horarios` (
  `id_horario` int(11) NOT NULL,
  `hora` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `horarios`
--

INSERT INTO `horarios` (`id_horario`, `hora`) VALUES
(1, '8am - 10am'),
(2, '10am - 12pm'),
(3, '12pm - 2pm'),
(4, '2pm - 4pm'),
(5, '4pm - 6pm'),
(6, '6pm - 8pm'),
(7, '8pm - 10pm');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plan_estudios`
--

CREATE TABLE `plan_estudios` (
  `id_plan_estudios` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `plan_estudios`
--

INSERT INTO `plan_estudios` (`id_plan_estudios`, `nombre`) VALUES
(1, 'Plan 2015'),
(2, 'Plan 2018'),
(3, 'Plan 2023');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id_rol` int(11) NOT NULL,
  `nombre_rol` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id_rol`, `nombre_rol`) VALUES
(1, 'Administrador'),
(2, 'Usuario'),
(3, 'Moderador');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seccion`
--

CREATE TABLE `seccion` (
  `id_seccion` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `seccion`
--

INSERT INTO `seccion` (`id_seccion`, `nombre`) VALUES
(1, 'Sección 1'),
(2, 'Sección 2'),
(3, 'Sección 3');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `semestre`
--

CREATE TABLE `semestre` (
  `id_semestre` int(11) NOT NULL,
  `anio` int(11) DEFAULT NULL,
  `ciclo_academico` varchar(10) DEFAULT NULL,
  `estado` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `semestre`
--

INSERT INTO `semestre` (`id_semestre`, `anio`, `ciclo_academico`, `estado`) VALUES
(17, 2025, '1', ''),
(18, 2026, '0', ''),
(19, 2023, '4', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `nombre_usuario` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `id_rol` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nombre_usuario`, `password`, `id_rol`) VALUES
(1, 'xmlroot', 'xmlroot', 1),
(2, 'xmlmood', 'xmlmood', 3),
(3, 'xmluser', 'xmluser', 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `ciclos`
--
ALTER TABLE `ciclos`
  ADD PRIMARY KEY (`id_ciclo`),
  ADD KEY `id_semestre` (`id_semestre`);

--
-- Indices de la tabla `cursos`
--
ALTER TABLE `cursos`
  ADD PRIMARY KEY (`id_curso`),
  ADD KEY `id_plan_estudios` (`id_plan_estudios`),
  ADD KEY `id_seccion` (`id_seccion`),
  ADD KEY `id_ciclo` (`id_ciclo`),
  ADD KEY `id_horario` (`id_horario`),
  ADD KEY `id_semestre` (`id_semestre`);

--
-- Indices de la tabla `horarios`
--
ALTER TABLE `horarios`
  ADD PRIMARY KEY (`id_horario`);

--
-- Indices de la tabla `plan_estudios`
--
ALTER TABLE `plan_estudios`
  ADD PRIMARY KEY (`id_plan_estudios`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id_rol`);

--
-- Indices de la tabla `seccion`
--
ALTER TABLE `seccion`
  ADD PRIMARY KEY (`id_seccion`);

--
-- Indices de la tabla `semestre`
--
ALTER TABLE `semestre`
  ADD PRIMARY KEY (`id_semestre`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `id_rol` (`id_rol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `ciclos`
--
ALTER TABLE `ciclos`
  MODIFY `id_ciclo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `cursos`
--
ALTER TABLE `cursos`
  MODIFY `id_curso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `horarios`
--
ALTER TABLE `horarios`
  MODIFY `id_horario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `plan_estudios`
--
ALTER TABLE `plan_estudios`
  MODIFY `id_plan_estudios` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id_rol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `seccion`
--
ALTER TABLE `seccion`
  MODIFY `id_seccion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `semestre`
--
ALTER TABLE `semestre`
  MODIFY `id_semestre` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `ciclos`
--
ALTER TABLE `ciclos`
  ADD CONSTRAINT `ciclos_ibfk_1` FOREIGN KEY (`id_semestre`) REFERENCES `semestre` (`id_semestre`);

--
-- Filtros para la tabla `cursos`
--
ALTER TABLE `cursos`
  ADD CONSTRAINT `cursos_ibfk_1` FOREIGN KEY (`id_plan_estudios`) REFERENCES `plan_estudios` (`id_plan_estudios`),
  ADD CONSTRAINT `cursos_ibfk_2` FOREIGN KEY (`id_seccion`) REFERENCES `seccion` (`id_seccion`),
  ADD CONSTRAINT `cursos_ibfk_3` FOREIGN KEY (`id_ciclo`) REFERENCES `ciclos` (`id_ciclo`),
  ADD CONSTRAINT `cursos_ibfk_4` FOREIGN KEY (`id_horario`) REFERENCES `horarios` (`id_horario`),
  ADD CONSTRAINT `cursos_ibfk_5` FOREIGN KEY (`id_semestre`) REFERENCES `semestre` (`id_semestre`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id_rol`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
