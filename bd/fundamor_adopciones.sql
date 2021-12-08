-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-12-2021 a las 23:09:21
-- Versión del servidor: 10.4.19-MariaDB
-- Versión de PHP: 7.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `fundamor_adopciones`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `adopcion`
--

CREATE TABLE `adopcion` (
  `id_adopcion` int(11) NOT NULL,
  `id_animal` int(11) NOT NULL,
  `fecha_estudio` date NOT NULL,
  `fecha_entrega` date DEFAULT NULL,
  `estado` enum('en espera','finalizada','en proceso') NOT NULL DEFAULT 'en proceso',
  `observaciones` varchar(200) DEFAULT NULL,
  `id_adoptante` varchar(45) NOT NULL,
  `id_empleado` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `adopcion`
--

INSERT INTO `adopcion` (`id_adopcion`, `id_animal`, `fecha_estudio`, `fecha_entrega`, `estado`, `observaciones`, `id_adoptante`, `id_empleado`) VALUES
(29, 28, '2021-12-05', '2021-12-24', 'finalizada', 'asdsad', '23', '1001'),
(30, 29, '2021-12-05', NULL, 'finalizada', 'asdasd', '23213', '1001');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `adoptante`
--

CREATE TABLE `adoptante` (
  `id_adoptante` varchar(45) NOT NULL,
  `nombre` varchar(70) NOT NULL,
  `telefono_casa` varchar(45) DEFAULT NULL,
  `telefono_celular` varchar(45) NOT NULL,
  `ciudad` varchar(90) NOT NULL,
  `ocupacion` varchar(90) NOT NULL,
  `correo` varchar(90) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `adoptante`
--

INSERT INTO `adoptante` (`id_adoptante`, `nombre`, `telefono_casa`, `telefono_celular`, `ciudad`, `ocupacion`, `correo`) VALUES
('23', 'Juan manuel giraldo gonzales', '213', '213', 'asd', 'asd', 'aads@gmailt.ocm'),
('23213', 'adrian david trejos', 'asd', 'asd', 'asd', 'asd', NULL),
('asd', 'Efran rojas patiño', 'sad', 'sad', 'asd', 'da', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `animal`
--

CREATE TABLE `animal` (
  `id_animal` int(11) NOT NULL,
  `id_fundacion` int(11) NOT NULL,
  `especie` varchar(45) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `sexo` varchar(10) NOT NULL,
  `caracteristicas` varchar(300) DEFAULT NULL,
  `sitio_rescate` varchar(190) DEFAULT NULL,
  `fecha_rescate` date DEFAULT NULL,
  `color` varchar(45) NOT NULL,
  `vacunas` varchar(100) DEFAULT NULL,
  `esterilizado` tinyint(4) NOT NULL,
  `desparasitado` tinyint(1) NOT NULL,
  `tamanio` varchar(45) NOT NULL,
  `estado` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `animal`
--

INSERT INTO `animal` (`id_animal`, `id_fundacion`, `especie`, `nombre`, `fecha_nacimiento`, `sexo`, `caracteristicas`, `sitio_rescate`, `fecha_rescate`, `color`, `vacunas`, `esterilizado`, `desparasitado`, `tamanio`, `estado`) VALUES
(27, 2, 'perro', 'paco', '2021-11-10', 'macho', 'assadsad', 'asdasd', '2021-11-05', 'sadsad', 'sadsad', 1, 1, 'mediano', 'En proceso de adopción'),
(28, 2, 'perro', 'sadsad', '2021-11-10', 'macho', 'assadsad', 'asdasd', '2021-11-05', 'sadsad', 'sadsad', 1, 1, 'mediano', 'Adoptado'),
(29, 2, 'perro', 'sadsad', '2021-11-10', 'macho', 'assadsad', 'asdasd', '2021-11-05', 'sadsad', 'sadsad', 1, 1, 'mediano', 'Adoptado'),
(30, 2, 'gato', 'sdada', '2021-11-10', 'macho', 'asdsad', 'sadsad', '2021-11-11', 'sadsad', 'sadsad', 1, 1, 'mediano', 'En proceso de adopción'),
(31, 2, 'gato', 'asdasd', '2021-11-05', 'macho', 'asdsad', 'sadasd', '2021-11-12', 'cafe', 'asdasdasd', 1, 1, 'mediano', 'Adoptado'),
(36, 2, 'perro', 'sdasd', '2021-11-11', 'macho', 'sadad', 'asdasd', '2021-11-02', 'sadasd', 'sdasdasd', 1, 1, 'mediano', 'Sin adoptar'),
(37, 2, 'perro', 'sdasd', '2021-11-11', 'macho', 'sadad', 'asdasd', '2021-11-02', 'sadasd', 'sdasdasd', 1, 1, 'mediano', 'Sin adoptar'),
(38, 2, 'perro', 'adssad', '2021-11-05', 'hembra', 'asdsad', 'sadasd', '2021-11-10', 'asdasd', 'sadasd', 1, 0, 'mediano', 'Sin adoptar'),
(39, 2, 'gato', 'sadsa', '2021-11-05', 'hembra', 'sadsad', 'asd', '2021-11-12', 'sadasd', 'asdsad', 1, 1, 'mediano', 'Sin adoptar'),
(40, 2, 'gato', 'sadsa', '2021-11-05', 'hembra', 'sadsad', 'asd', '2021-11-12', 'sadasd', 'asdsad', 1, 1, 'mediano', 'Sin adoptar'),
(41, 2, 'gato', 'Morioh', '2021-11-05', 'hembra', 'sadsad', 'asd', '2021-11-12', 'sadasd', 'asdsad', 1, 1, 'mediano', 'Sin adoptar'),
(42, 2, 'gato', 'sadsa', '2021-11-05', 'hembra', 'sadsad', 'asd', '2021-11-12', 'sadasd', 'asdsad', 1, 1, 'mediano', 'Sin adoptar'),
(43, 2, 'gato', 'sadsa', '2021-11-05', 'hembra', 'sadsad', 'asd', '2021-11-12', 'sadasd', 'asdsad', 1, 1, 'mediano', 'Sin adoptar'),
(44, 2, 'gato', 'sadsa', '2021-11-05', 'hembra', 'sadsad', 'asd', '2021-11-12', 'sadasd', 'asdsad', 1, 1, 'mediano', 'Sin adoptar'),
(45, 2, 'gato', 'sadsa', '2021-11-05', 'hembra', 'sadsad', 'asd', '2021-11-12', 'sadasd', 'asdsad', 1, 1, 'mediano', 'Sin adoptar'),
(46, 2, 'gato', 'sadsa', '2021-11-05', 'hembra', 'sadsad', 'asd', '2021-11-12', 'sadasd', 'asdsad', 1, 1, 'mediano', 'Sin adoptar'),
(47, 2, 'gato', 'sadsa', '2021-11-05', 'hembra', 'sadsad', 'asd', '2021-11-12', 'sadasd', 'asdsad', 1, 1, 'mediano', 'Sin adoptar'),
(48, 2, 'gato', 'sadsa', '2021-11-05', 'hembra', 'sadsad', 'asd', '2021-11-12', 'sadasd', 'asdsad', 1, 1, 'mediano', 'Sin adoptar'),
(49, 2, 'gato', 'sadsa', '2021-11-05', 'hembra', 'sadsad', 'asd', '2021-11-12', 'sadasd', 'asdsad', 1, 1, 'mediano', 'Sin adoptar'),
(50, 2, 'gato', 'sadsa', '2021-11-05', 'hembra', 'sadsad', 'asd', '2021-11-12', 'sadasd', 'asdsad', 1, 1, 'mediano', 'Sin adoptar'),
(51, 2, 'gato', 'sadsa', '2021-11-05', 'hembra', 'sadsad', 'asd', '2021-11-12', 'sadasd', 'asdsad', 1, 1, 'mediano', 'Sin adoptar'),
(52, 2, 'gato', 'sadsa', '2021-11-05', 'hembra', 'sadsad', 'asd', '2021-11-12', 'sadasd', 'asdsad', 1, 1, 'mediano', 'Sin adoptar'),
(53, 2, 'gato', 'asdsad', '2021-11-11', 'macho', 'sadsad', 'sadas', '2021-11-03', 'sadsad', 'sadsad', 1, 1, 'mediano', 'Sin adoptar'),
(54, 2, 'perro', 'dad', '2021-11-11', 'macho', 'sadasd', 'asdasd', '2021-11-13', 'sadd', 'sadasd', 1, 1, 'mediano', 'Sin adoptar'),
(56, 2, 'gato', 'sadsad', '2021-11-06', 'macho', 'asdsad', 'sadasd', '2021-11-10', 'asdasd', 'sadsad', 1, 1, 'pequeño', 'Sin adoptar'),
(57, 2, 'gato', 'sadsad', '2021-11-06', 'macho', 'asdsad', 'sadasd', '2021-11-10', 'asdasd', 'sadsad', 1, 1, 'pequeño', 'Sin adoptar'),
(58, 2, 'gato', 'asdsad', '2021-11-03', 'macho', 'sadsad', 'sadas', '2021-11-04', 'sadasd', 'sadsad', 1, 1, 'mediano', 'Sin adoptar'),
(59, 2, 'gato', 'asd', '2021-11-12', 'macho', 'sadasd', 'sadsad', '2021-11-10', 'asdasd', 'sadasd', 1, 1, 'grande', 'Sin adoptar');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `id_empleado` varchar(45) NOT NULL,
  `id_fundacion` int(11) NOT NULL,
  `correo` varchar(70) NOT NULL,
  `contrasenia` varchar(300) NOT NULL,
  `nombre` varchar(70) NOT NULL,
  `rol` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`id_empleado`, `id_fundacion`, `correo`, `contrasenia`, `nombre`, `rol`) VALUES
('1001', 2, 'aurelio@gmail.com', '$2a$10$PW9wNChN5NlmhLg3YBb3yeFh06uno/D1IeCeRgloW1bGBiY/YuLD.', 'Test User2', 'colaborador'),
('10011', 2, 'asdas@malo.com', '$2a$10$rpCJXlt.h3RvKBjCf.8G/eu1RqvhALJjfqY8u/Lnq.odIXmi1NR3W', 'aurelio mejia', 'administrador'),
('123123', 2, 'aurelio@gmail.comx', '$2a$10$zaS77dgdIKWxCW41heSAc.iUf2/KSEJQkj5hxK7glXqoBSui2VQ9C', 'asdads', 'colaborador'),
('23213', 2, 'asdsada@gmail.com', '12345678', 'papillon', 'colaborador');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fundacion`
--

CREATE TABLE `fundacion` (
  `id_fundacion` int(11) NOT NULL,
  `correo` varchar(70) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `cuenta_donaciones` varchar(45) DEFAULT NULL,
  `nombre` varchar(70) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `fundacion`
--

INSERT INTO `fundacion` (`id_fundacion`, `correo`, `telefono`, `cuenta_donaciones`, `nombre`) VALUES
(2, 'fundamor@gmail.com', '1233', '312321', 'Fundacion fundamor');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `imagen_animal`
--

CREATE TABLE `imagen_animal` (
  `id_imagen_animal` int(11) NOT NULL,
  `id_animal` int(11) NOT NULL,
  `ruta` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `imagen_animal`
--

INSERT INTO `imagen_animal` (`id_imagen_animal`, `id_animal`, `ruta`) VALUES
(14, 39, 'images/animalImages/40c0a5b9-6d34-43d7-8ae7-10092b04b1e1.jpg'),
(15, 40, 'images/animalImages/4a6afc36-0cfd-4202-acaa-945470c0874f.jpg'),
(17, 42, 'images/animalImages/404cb80c-cd55-4a19-838e-7cbf4c70155a.jpg'),
(18, 43, 'images/animalImages/b50fe136-8676-4bbc-945b-d7c7d2bd0103.jpg'),
(19, 44, 'images/animalImages/24eaf879-ce4e-403e-8246-efc232b089f3.jpg'),
(20, 45, 'images/animalImages/7bf2da70-3102-44a9-9cd0-420431396e37.jpg'),
(21, 46, 'images/animalImages/e4c5f90a-bfbb-4d3d-aa23-eb0f1d7cfe21.jpg'),
(22, 47, 'images/animalImages/d1d0d83d-0a76-40b9-8a58-ef1336a5c0b7.jpg'),
(23, 48, 'images/animalImages/e234aee9-fb04-47a1-acdf-a862487e66da.jpg'),
(35, 41, 'images/animalImages/2a9d9957-6d94-4feb-8ab1-1eb7a072bc3c.jpg'),
(39, 31, 'images/animalImages/ad0f2760-0fa7-4e0b-acf2-734999a854d8.jpg'),
(41, 29, 'images/animalImages/2a7db08d-9568-42a3-8f2f-49c26c5307e7.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `imagen_publicacion`
--

CREATE TABLE `imagen_publicacion` (
  `id_publicacion` int(11) NOT NULL,
  `id_imagen_publicacion` int(11) NOT NULL,
  `ruta` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `opcion_pregunta`
--

CREATE TABLE `opcion_pregunta` (
  `id_opcion` int(11) NOT NULL,
  `id_pregunta` int(11) DEFAULT NULL,
  `descripcion` varchar(70) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `opcion_pregunta`
--

INSERT INTO `opcion_pregunta` (`id_opcion`, `id_pregunta`, `descripcion`) VALUES
(55, 36, 'Mañana'),
(56, 36, 'Hoy');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pregunta`
--

CREATE TABLE `pregunta` (
  `id_pregunta` int(11) NOT NULL,
  `id_fundacion` int(11) NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `tipo_pregunta` enum('abierta','multiple') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pregunta`
--

INSERT INTO `pregunta` (`id_pregunta`, `id_fundacion`, `titulo`, `tipo_pregunta`) VALUES
(32, 2, 'melos?', 'abierta'),
(35, 2, 'Le interesa', 'abierta'),
(36, 2, '¿Cuando es el dia de la independencia?', 'multiple'),
(37, 2, 'meloski', 'abierta');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pregunta_adopcion`
--

CREATE TABLE `pregunta_adopcion` (
  `id_pregunta_adopcion` int(11) NOT NULL,
  `id_adopcion` int(11) NOT NULL,
  `id_pregunta` int(11) NOT NULL,
  `respuesta` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pregunta_adopcion`
--

INSERT INTO `pregunta_adopcion` (`id_pregunta_adopcion`, `id_adopcion`, `id_pregunta`, `respuesta`) VALUES
(39, 29, 36, 'Mañana'),
(40, 29, 32, 'as'),
(41, 29, 35, 'as'),
(42, 29, 37, 'as'),
(43, 30, 36, 'Mañana'),
(44, 30, 32, 'asd'),
(45, 30, 35, 'sad'),
(46, 30, 37, 'sad');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `publicacion`
--

CREATE TABLE `publicacion` (
  `id_publicacion` int(11) NOT NULL,
  `id_fundacion` int(11) NOT NULL,
  `titulo` varchar(200) NOT NULL,
  `cuerpo` text NOT NULL,
  `fecha_creacion` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seguimiento`
--

CREATE TABLE `seguimiento` (
  `id_adopcion` int(11) NOT NULL,
  `id_seguimiento` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `anotaciones` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `adopcion`
--
ALTER TABLE `adopcion`
  ADD PRIMARY KEY (`id_adopcion`),
  ADD KEY `fkIdx_135` (`id_adoptante`),
  ADD KEY `fkIdx_171` (`id_empleado`),
  ADD KEY `FK_190` (`id_animal`);

--
-- Indices de la tabla `adoptante`
--
ALTER TABLE `adoptante`
  ADD PRIMARY KEY (`id_adoptante`);

--
-- Indices de la tabla `animal`
--
ALTER TABLE `animal`
  ADD PRIMARY KEY (`id_animal`),
  ADD KEY `fk_animal_fundacion1_idx` (`id_fundacion`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`id_empleado`),
  ADD KEY `id_fundacion_fk1` (`id_fundacion`);

--
-- Indices de la tabla `fundacion`
--
ALTER TABLE `fundacion`
  ADD PRIMARY KEY (`id_fundacion`);

--
-- Indices de la tabla `imagen_animal`
--
ALTER TABLE `imagen_animal`
  ADD PRIMARY KEY (`id_imagen_animal`),
  ADD KEY `fkIdx_178` (`id_animal`);

--
-- Indices de la tabla `imagen_publicacion`
--
ALTER TABLE `imagen_publicacion`
  ADD PRIMARY KEY (`id_imagen_publicacion`,`id_publicacion`),
  ADD KEY `fkIdx_79` (`id_publicacion`);

--
-- Indices de la tabla `opcion_pregunta`
--
ALTER TABLE `opcion_pregunta`
  ADD PRIMARY KEY (`id_opcion`),
  ADD KEY `fk_pregunta_idx` (`id_pregunta`);

--
-- Indices de la tabla `pregunta`
--
ALTER TABLE `pregunta`
  ADD PRIMARY KEY (`id_pregunta`),
  ADD UNIQUE KEY `id_pregunta` (`id_pregunta`),
  ADD KEY `id_fk_respuesta_pregunta` (`id_fundacion`);

--
-- Indices de la tabla `pregunta_adopcion`
--
ALTER TABLE `pregunta_adopcion`
  ADD PRIMARY KEY (`id_pregunta_adopcion`),
  ADD KEY `FK_141_idx` (`id_adopcion`),
  ADD KEY `fkIdx_141` (`id_pregunta`);

--
-- Indices de la tabla `publicacion`
--
ALTER TABLE `publicacion`
  ADD PRIMARY KEY (`id_publicacion`),
  ADD KEY `fkIdx_206` (`id_fundacion`);

--
-- Indices de la tabla `seguimiento`
--
ALTER TABLE `seguimiento`
  ADD PRIMARY KEY (`id_seguimiento`),
  ADD KEY `id_adopcion_fk` (`id_adopcion`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `adopcion`
--
ALTER TABLE `adopcion`
  MODIFY `id_adopcion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT de la tabla `animal`
--
ALTER TABLE `animal`
  MODIFY `id_animal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT de la tabla `fundacion`
--
ALTER TABLE `fundacion`
  MODIFY `id_fundacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `imagen_animal`
--
ALTER TABLE `imagen_animal`
  MODIFY `id_imagen_animal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT de la tabla `imagen_publicacion`
--
ALTER TABLE `imagen_publicacion`
  MODIFY `id_imagen_publicacion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `opcion_pregunta`
--
ALTER TABLE `opcion_pregunta`
  MODIFY `id_opcion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT de la tabla `pregunta`
--
ALTER TABLE `pregunta`
  MODIFY `id_pregunta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT de la tabla `pregunta_adopcion`
--
ALTER TABLE `pregunta_adopcion`
  MODIFY `id_pregunta_adopcion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT de la tabla `publicacion`
--
ALTER TABLE `publicacion`
  MODIFY `id_publicacion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `seguimiento`
--
ALTER TABLE `seguimiento`
  MODIFY `id_seguimiento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `adopcion`
--
ALTER TABLE `adopcion`
  ADD CONSTRAINT `FK_170` FOREIGN KEY (`id_empleado`) REFERENCES `empleado` (`id_empleado`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_190` FOREIGN KEY (`id_animal`) REFERENCES `animal` (`id_animal`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_adoptante_adopcion` FOREIGN KEY (`id_adoptante`) REFERENCES `adoptante` (`id_adoptante`);

--
-- Filtros para la tabla `animal`
--
ALTER TABLE `animal`
  ADD CONSTRAINT `fk_animal_fundacion1` FOREIGN KEY (`id_fundacion`) REFERENCES `fundacion` (`id_fundacion`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD CONSTRAINT `id_fundacion_fk1` FOREIGN KEY (`id_fundacion`) REFERENCES `fundacion` (`id_fundacion`);

--
-- Filtros para la tabla `imagen_animal`
--
ALTER TABLE `imagen_animal`
  ADD CONSTRAINT `FK_177` FOREIGN KEY (`id_animal`) REFERENCES `animal` (`id_animal`) ON DELETE CASCADE;

--
-- Filtros para la tabla `imagen_publicacion`
--
ALTER TABLE `imagen_publicacion`
  ADD CONSTRAINT `FK_78` FOREIGN KEY (`id_publicacion`) REFERENCES `publicacion` (`id_publicacion`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `opcion_pregunta`
--
ALTER TABLE `opcion_pregunta`
  ADD CONSTRAINT `fk_pregunta` FOREIGN KEY (`id_pregunta`) REFERENCES `pregunta` (`id_pregunta`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Filtros para la tabla `pregunta`
--
ALTER TABLE `pregunta`
  ADD CONSTRAINT `id_fk_respuesta_pregunta` FOREIGN KEY (`id_fundacion`) REFERENCES `fundacion` (`id_fundacion`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `pregunta_adopcion`
--
ALTER TABLE `pregunta_adopcion`
  ADD CONSTRAINT `FK_140` FOREIGN KEY (`id_pregunta`) REFERENCES `pregunta` (`id_pregunta`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_141` FOREIGN KEY (`id_adopcion`) REFERENCES `adopcion` (`id_adopcion`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Filtros para la tabla `publicacion`
--
ALTER TABLE `publicacion`
  ADD CONSTRAINT `FK_205` FOREIGN KEY (`id_fundacion`) REFERENCES `fundacion` (`id_fundacion`);

--
-- Filtros para la tabla `seguimiento`
--
ALTER TABLE `seguimiento`
  ADD CONSTRAINT `id_adopcion_fk` FOREIGN KEY (`id_adopcion`) REFERENCES `adopcion` (`id_adopcion`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
