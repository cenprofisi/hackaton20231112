-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-11-2023 a las 19:42:30
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
-- Base de datos: `sigesaca`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `area_academica`
--

CREATE TABLE `area_academica` (
  `areaca_iCodigo` int(11) NOT NULL,
  `areaca_vcCodigo` varchar(4) NOT NULL,
  `areaca_vcNombre` varchar(64) NOT NULL,
  `areaca_bActivo` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aula`
--

CREATE TABLE `aula` (
  `aul_iCodigo` int(11) NOT NULL,
  `aul_vcCodigo` varchar(16) NOT NULL,
  `aul_iCapacidad` int(11) NOT NULL,
  `loc_iCodigo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `curso`
--

CREATE TABLE `curso` (
  `cur_iCodigo` int(11) NOT NULL,
  `cur_vcCodigo` varchar(16) NOT NULL,
  `cur_vcNombre` varchar(64) NOT NULL,
  `cur_fCreditos` decimal(6,1) NOT NULL,
  `cur_fCreditosRequisito` decimal(6,1) NOT NULL DEFAULT 0.0,
  `cur_iSemestre` int(11) DEFAULT NULL,
  `plaest_iCodigo` int(11) NOT NULL,
  `curtip_iCodigo` int(11) NOT NULL,
  `curare_iCodigo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `curso_areaformativa`
--

CREATE TABLE `curso_areaformativa` (
  `curare_iCodigo` int(11) NOT NULL,
  `curare_vcNombre` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `curso_equivalente`
--

CREATE TABLE `curso_equivalente` (
  `cureqi_iCodigo` int(11) NOT NULL,
  `cur_iCodigo` int(11) NOT NULL,
  `equ_iCodigo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `curso_horasdictado`
--

CREATE TABLE `curso_horasdictado` (
  `curhor_iCodigo` int(11) NOT NULL,
  `curhor_iHoras` int(11) NOT NULL,
  `cur_iCodigo` int(11) NOT NULL,
  `curtip_iCodigo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `curso_prerequisito`
--

CREATE TABLE `curso_prerequisito` (
  `curpre_iCodigo` int(11) NOT NULL,
  `cur_iCodigo` int(11) NOT NULL,
  `req_iCodigo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `curso_tipo`
--

CREATE TABLE `curso_tipo` (
  `curtip_iCodigo` int(11) NOT NULL,
  `curtip_vcNombre` varchar(32) NOT NULL,
  `curtip_bActivo` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `curso_tipodictado`
--

CREATE TABLE `curso_tipodictado` (
  `curtip_iCodigo` int(11) NOT NULL,
  `curtip_vcNombre` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dia`
--

CREATE TABLE `dia` (
  `dia_iCodigo` int(11) NOT NULL,
  `dia_iNumero` int(11) NOT NULL,
  `dia_vcNombre` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `escuela`
--

CREATE TABLE `escuela` (
  `esc_iCodigo` int(11) NOT NULL,
  `esc_vcCodigo` varchar(16) NOT NULL,
  `esc_vcNombre` varchar(96) NOT NULL,
  `esc_bActivo` tinyint(4) NOT NULL DEFAULT 1,
  `fac_iCodigo` int(11) NOT NULL,
  `areaca_iCodigo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facultad`
--

CREATE TABLE `facultad` (
  `fac_iCodigo` int(11) NOT NULL,
  `fac_vcCodigo` varchar(64) NOT NULL,
  `fac_vcNombre` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupo`
--

CREATE TABLE `grupo` (
  `gru_iCodigo` int(11) NOT NULL,
  `sem_iCodigo` int(11) NOT NULL,
  `cur_iCodigo` int(11) NOT NULL,
  `gru_iNumero` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupo_horario`
--

CREATE TABLE `grupo_horario` (
  `gruhor_iCodigo` int(11) NOT NULL,
  `gru_iCodigo` int(11) NOT NULL,
  `dia_iCodigo` int(11) NOT NULL,
  `gruhor_tHoraInicio` time NOT NULL,
  `gruhor_tHoraFinal` time NOT NULL,
  `aul_iCodigo` int(11) NOT NULL,
  `curtip_iCodigo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `locales`
--

CREATE TABLE `locales` (
  `loc_iCodigo` int(11) NOT NULL,
  `loc_vcCodigo` varchar(16) NOT NULL,
  `loc_vcNombre` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plan_estudios`
--

CREATE TABLE `plan_estudios` (
  `plaest_iCodigo` int(11) NOT NULL,
  `plaest_vcCodigo` varchar(8) NOT NULL,
  `plaest_vcRR` varchar(16) NOT NULL,
  `plaest_dVigencia` date DEFAULT NULL,
  `plaest_iCreditos` int(11) DEFAULT 0,
  `plaest_bActivo` tinyint(4) NOT NULL DEFAULT 1,
  `esc_iCodigo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id_rol` int(11) NOT NULL,
  `nombre_rol` varchar(50) NOT NULL
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
-- Estructura de tabla para la tabla `semestre`
--

CREATE TABLE `semestre` (
  `sem_iCodigo` int(11) NOT NULL,
  `sem_vcCodigo` varchar(8) NOT NULL,
  `sem_cActivo` char(1) NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `nombre_usuario` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `id_rol` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nombre_usuario`, `password`, `email`, `id_rol`) VALUES
(1, 'xmldoot', 'xmldoot', 'xmldoot@gmail.com', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `area_academica`
--
ALTER TABLE `area_academica`
  ADD PRIMARY KEY (`areaca_iCodigo`),
  ADD UNIQUE KEY `areaca_vcCodigo_UNIQUE` (`areaca_vcCodigo`),
  ADD UNIQUE KEY `areaca_vcNombre_UNIQUE` (`areaca_vcNombre`);

--
-- Indices de la tabla `aula`
--
ALTER TABLE `aula`
  ADD PRIMARY KEY (`aul_iCodigo`),
  ADD UNIQUE KEY `aul_vcCodigo_UNIQUE` (`aul_vcCodigo`),
  ADD KEY `fk_aula_locales1_idx` (`loc_iCodigo`);

--
-- Indices de la tabla `curso`
--
ALTER TABLE `curso`
  ADD PRIMARY KEY (`cur_iCodigo`),
  ADD UNIQUE KEY `cur_vcCodigo_UNIQUE` (`cur_vcCodigo`),
  ADD UNIQUE KEY `cur_vcNombre_UNIQUE` (`cur_vcNombre`),
  ADD KEY `fk_curso_plan_estudios1_idx` (`plaest_iCodigo`),
  ADD KEY `fk_curso_curso_tipo1_idx` (`curtip_iCodigo`),
  ADD KEY `fk_curso_curso_areaformativa1_idx` (`curare_iCodigo`);

--
-- Indices de la tabla `curso_areaformativa`
--
ALTER TABLE `curso_areaformativa`
  ADD PRIMARY KEY (`curare_iCodigo`);

--
-- Indices de la tabla `curso_equivalente`
--
ALTER TABLE `curso_equivalente`
  ADD PRIMARY KEY (`cureqi_iCodigo`),
  ADD KEY `fk_curso_equivalente_curso1_idx` (`cur_iCodigo`),
  ADD KEY `fk_curso_equivalente_curso2_idx` (`equ_iCodigo`);

--
-- Indices de la tabla `curso_horasdictado`
--
ALTER TABLE `curso_horasdictado`
  ADD PRIMARY KEY (`curhor_iCodigo`),
  ADD KEY `fk_curso_horasdictado_curso1_idx` (`cur_iCodigo`),
  ADD KEY `fk_curso_horasdictado_curso_tipodictado1_idx` (`curtip_iCodigo`);

--
-- Indices de la tabla `curso_prerequisito`
--
ALTER TABLE `curso_prerequisito`
  ADD PRIMARY KEY (`curpre_iCodigo`),
  ADD KEY `fk_curso_prerequisito_curso1_idx` (`cur_iCodigo`),
  ADD KEY `fk_curso_prerequisito_curso2_idx` (`req_iCodigo`);

--
-- Indices de la tabla `curso_tipo`
--
ALTER TABLE `curso_tipo`
  ADD PRIMARY KEY (`curtip_iCodigo`),
  ADD UNIQUE KEY `curtip_vcNombre_UNIQUE` (`curtip_vcNombre`);

--
-- Indices de la tabla `curso_tipodictado`
--
ALTER TABLE `curso_tipodictado`
  ADD PRIMARY KEY (`curtip_iCodigo`),
  ADD UNIQUE KEY `curtip_vcNombre_UNIQUE` (`curtip_vcNombre`);

--
-- Indices de la tabla `dia`
--
ALTER TABLE `dia`
  ADD PRIMARY KEY (`dia_iCodigo`),
  ADD UNIQUE KEY `dia_iNumero_UNIQUE` (`dia_iNumero`),
  ADD UNIQUE KEY `dia_vcNombre_UNIQUE` (`dia_vcNombre`);

--
-- Indices de la tabla `escuela`
--
ALTER TABLE `escuela`
  ADD PRIMARY KEY (`esc_iCodigo`),
  ADD UNIQUE KEY `esc_vcCodigo_UNIQUE` (`esc_vcCodigo`),
  ADD UNIQUE KEY `esc_vcNombre_UNIQUE` (`esc_vcNombre`),
  ADD KEY `fk_escuela_facultad_idx` (`fac_iCodigo`),
  ADD KEY `fk_escuela_area_academica1_idx` (`areaca_iCodigo`);

--
-- Indices de la tabla `facultad`
--
ALTER TABLE `facultad`
  ADD PRIMARY KEY (`fac_iCodigo`),
  ADD UNIQUE KEY `fac_vcCodigo_UNIQUE` (`fac_vcCodigo`),
  ADD UNIQUE KEY `fac_vcNombre_UNIQUE` (`fac_vcNombre`);

--
-- Indices de la tabla `grupo`
--
ALTER TABLE `grupo`
  ADD PRIMARY KEY (`gru_iCodigo`),
  ADD KEY `fk_grupo_semestre1_idx` (`sem_iCodigo`),
  ADD KEY `fk_grupo_curso1_idx` (`cur_iCodigo`);

--
-- Indices de la tabla `grupo_horario`
--
ALTER TABLE `grupo_horario`
  ADD PRIMARY KEY (`gruhor_iCodigo`),
  ADD KEY `fk_grupo_horario_grupo1_idx` (`gru_iCodigo`),
  ADD KEY `fk_grupo_horario_dia1_idx` (`dia_iCodigo`),
  ADD KEY `fk_grupo_horario_aula1_idx` (`aul_iCodigo`),
  ADD KEY `fk_grupo_horario_curso_tipodictado1_idx` (`curtip_iCodigo`);

--
-- Indices de la tabla `locales`
--
ALTER TABLE `locales`
  ADD PRIMARY KEY (`loc_iCodigo`),
  ADD UNIQUE KEY `loc_vcCodigo_UNIQUE` (`loc_vcCodigo`),
  ADD UNIQUE KEY `loc_vcNombre_UNIQUE` (`loc_vcNombre`);

--
-- Indices de la tabla `plan_estudios`
--
ALTER TABLE `plan_estudios`
  ADD PRIMARY KEY (`plaest_iCodigo`),
  ADD UNIQUE KEY `plaest_vcCodigo_UNIQUE` (`plaest_vcCodigo`),
  ADD KEY `fk_plan_estudios_escuela1_idx` (`esc_iCodigo`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id_rol`);

--
-- Indices de la tabla `semestre`
--
ALTER TABLE `semestre`
  ADD PRIMARY KEY (`sem_iCodigo`),
  ADD UNIQUE KEY `sem_vcCodigo_UNIQUE` (`sem_vcCodigo`);

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
-- AUTO_INCREMENT de la tabla `area_academica`
--
ALTER TABLE `area_academica`
  MODIFY `areaca_iCodigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `aula`
--
ALTER TABLE `aula`
  MODIFY `aul_iCodigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `curso`
--
ALTER TABLE `curso`
  MODIFY `cur_iCodigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `curso_areaformativa`
--
ALTER TABLE `curso_areaformativa`
  MODIFY `curare_iCodigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `curso_equivalente`
--
ALTER TABLE `curso_equivalente`
  MODIFY `cureqi_iCodigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `curso_horasdictado`
--
ALTER TABLE `curso_horasdictado`
  MODIFY `curhor_iCodigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `curso_prerequisito`
--
ALTER TABLE `curso_prerequisito`
  MODIFY `curpre_iCodigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `curso_tipo`
--
ALTER TABLE `curso_tipo`
  MODIFY `curtip_iCodigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `curso_tipodictado`
--
ALTER TABLE `curso_tipodictado`
  MODIFY `curtip_iCodigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `dia`
--
ALTER TABLE `dia`
  MODIFY `dia_iCodigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `escuela`
--
ALTER TABLE `escuela`
  MODIFY `esc_iCodigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `facultad`
--
ALTER TABLE `facultad`
  MODIFY `fac_iCodigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `grupo`
--
ALTER TABLE `grupo`
  MODIFY `gru_iCodigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `grupo_horario`
--
ALTER TABLE `grupo_horario`
  MODIFY `gruhor_iCodigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `locales`
--
ALTER TABLE `locales`
  MODIFY `loc_iCodigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `plan_estudios`
--
ALTER TABLE `plan_estudios`
  MODIFY `plaest_iCodigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id_rol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `semestre`
--
ALTER TABLE `semestre`
  MODIFY `sem_iCodigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `aula`
--
ALTER TABLE `aula`
  ADD CONSTRAINT `fk_aula_locales1` FOREIGN KEY (`loc_iCodigo`) REFERENCES `locales` (`loc_iCodigo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `curso`
--
ALTER TABLE `curso`
  ADD CONSTRAINT `fk_curso_curso_areaformativa1` FOREIGN KEY (`curare_iCodigo`) REFERENCES `curso_areaformativa` (`curare_iCodigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_curso_curso_tipo1` FOREIGN KEY (`curtip_iCodigo`) REFERENCES `curso_tipo` (`curtip_iCodigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_curso_plan_estudios1` FOREIGN KEY (`plaest_iCodigo`) REFERENCES `plan_estudios` (`plaest_iCodigo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `curso_equivalente`
--
ALTER TABLE `curso_equivalente`
  ADD CONSTRAINT `fk_curso_equivalente_curso1` FOREIGN KEY (`cur_iCodigo`) REFERENCES `curso` (`cur_iCodigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_curso_equivalente_curso2` FOREIGN KEY (`equ_iCodigo`) REFERENCES `curso` (`cur_iCodigo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `curso_horasdictado`
--
ALTER TABLE `curso_horasdictado`
  ADD CONSTRAINT `fk_curso_horasdictado_curso1` FOREIGN KEY (`cur_iCodigo`) REFERENCES `curso` (`cur_iCodigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_curso_horasdictado_curso_tipodictado1` FOREIGN KEY (`curtip_iCodigo`) REFERENCES `curso_tipodictado` (`curtip_iCodigo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `curso_prerequisito`
--
ALTER TABLE `curso_prerequisito`
  ADD CONSTRAINT `fk_curso_prerequisito_curso1` FOREIGN KEY (`cur_iCodigo`) REFERENCES `curso` (`cur_iCodigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_curso_prerequisito_curso2` FOREIGN KEY (`req_iCodigo`) REFERENCES `curso` (`cur_iCodigo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `escuela`
--
ALTER TABLE `escuela`
  ADD CONSTRAINT `fk_escuela_area_academica1` FOREIGN KEY (`areaca_iCodigo`) REFERENCES `area_academica` (`areaca_iCodigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_escuela_facultad` FOREIGN KEY (`fac_iCodigo`) REFERENCES `facultad` (`fac_iCodigo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `grupo`
--
ALTER TABLE `grupo`
  ADD CONSTRAINT `fk_grupo_curso1` FOREIGN KEY (`cur_iCodigo`) REFERENCES `curso` (`cur_iCodigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_grupo_semestre1` FOREIGN KEY (`sem_iCodigo`) REFERENCES `semestre` (`sem_iCodigo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `grupo_horario`
--
ALTER TABLE `grupo_horario`
  ADD CONSTRAINT `fk_grupo_horario_aula1` FOREIGN KEY (`aul_iCodigo`) REFERENCES `aula` (`aul_iCodigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_grupo_horario_curso_tipodictado1` FOREIGN KEY (`curtip_iCodigo`) REFERENCES `curso_tipodictado` (`curtip_iCodigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_grupo_horario_dia1` FOREIGN KEY (`dia_iCodigo`) REFERENCES `dia` (`dia_iCodigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_grupo_horario_grupo1` FOREIGN KEY (`gru_iCodigo`) REFERENCES `grupo` (`gru_iCodigo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `plan_estudios`
--
ALTER TABLE `plan_estudios`
  ADD CONSTRAINT `fk_plan_estudios_escuela1` FOREIGN KEY (`esc_iCodigo`) REFERENCES `escuela` (`esc_iCodigo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id_rol`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
