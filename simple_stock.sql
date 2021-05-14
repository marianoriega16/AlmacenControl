-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-05-2021 a las 07:23:59
-- Versión del servidor: 10.4.18-MariaDB
-- Versión de PHP: 7.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `simple_stock`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id_categoria` int(11) NOT NULL,
  `nombre_categoria` varchar(255) NOT NULL,
  `descripcion_categoria` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id_categoria`, `nombre_categoria`, `descripcion_categoria`, `date_added`) VALUES
(13, 'Reductores de velocidad', 'Categoría de reductores de velocidad', '2021-05-14 00:41:05'),
(14, 'Variadores de velocidad críticos', 'Categoría de variadores de velocidad críticos', '2021-05-14 00:41:45'),
(12, 'Motores críticos', 'Categoría de motores críticos', '2021-05-14 00:40:38'),
(15, 'Tarjetas y/o cosas de PLCs', 'Categoría de tarjetas y/o cosas de PLCs', '2021-05-14 00:42:11'),
(16, 'Tuberias', 'Categoría de tuberías', '2021-05-14 00:42:21'),
(17, 'Góndolas', 'Categoría de góndolas', '2021-05-14 00:42:31');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estantes`
--

CREATE TABLE `estantes` (
  `id_estante` int(11) NOT NULL,
  `codigo_estante` int(11) NOT NULL,
  `nombre_estante` varchar(255) NOT NULL,
  `numero_lejas` int(11) NOT NULL,
  `lejas_ocupadas` int(11) NOT NULL,
  `id_pasillo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `estantes`
--

INSERT INTO `estantes` (`id_estante`, `codigo_estante`, `nombre_estante`, `numero_lejas`, `lejas_ocupadas`, `id_pasillo`) VALUES
(1, 100, 'Motores críticos', 15, 5, 1),
(2, 200, 'Reductores de velocidad', 15, 5, 2),
(3, 300, 'Velocidad críticos', 15, 5, 3),
(4, 400, 'Tarjetas y/o PLCs', 15, 5, 4),
(5, 500, 'Tuberías', 15, 5, 5),
(6, 600, 'Gondolas', 15, 5, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial`
--

CREATE TABLE `historial` (
  `id_historial` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `nota` varchar(255) NOT NULL,
  `referencia` varchar(100) NOT NULL,
  `cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `historial`
--

INSERT INTO `historial` (`id_historial`, `id_producto`, `user_id`, `fecha`, `nota`, `referencia`, `cantidad`) VALUES
(14, 17, 1, '2021-05-14 07:11:52', 'Admin agregó 25 producto(s) al inventario', 'Nuevos productos', 25);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pasillos`
--

CREATE TABLE `pasillos` (
  `id_pasillo` int(11) NOT NULL,
  `codigo_pasillo` int(11) NOT NULL,
  `nombre_pasillo` varchar(255) NOT NULL,
  `descripcion_pasillo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pasillos`
--

INSERT INTO `pasillos` (`id_pasillo`, `codigo_pasillo`, `nombre_pasillo`, `descripcion_pasillo`) VALUES
(1, 10, 'Motores críticos', 'Pasillo de motores críticos'),
(2, 20, 'Reductores de velocidad', 'Pasillo de reductores de velocidad'),
(3, 30, 'Variadores de velocidad críticos', 'Pasillo de variadores de velocidad críticos'),
(4, 40, 'Tarjetas y/o cosas de PLC\'s', 'Pasillo de tarjetas y/o cosas de PLC\'s'),
(5, 50, 'Tuberías', 'Pasillo de tuberías'),
(6, 60, 'Góndolas', 'Pasillo de góndolas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `id_producto` int(11) NOT NULL,
  `codigo_producto` char(20) NOT NULL,
  `nombre_producto` char(255) NOT NULL,
  `date_added` datetime NOT NULL,
  `stock` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `id_pasillo` int(11) NOT NULL,
  `id_estante` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`id_producto`, `codigo_producto`, `nombre_producto`, `date_added`, `stock`, `id_categoria`, `id_pasillo`, `id_estante`) VALUES
(8, '10', 'Motores críticos pequeños', '2021-04-15 10:27:54', 150, 1, 1, 1),
(9, '15', 'Motores críticos medianos', '2021-04-15 00:00:00', 100, 1, 1, 1),
(10, '20', 'Reductores de velocidad baja', '2021-04-15 00:00:00', 150, 2, 2, 2),
(11, '25', 'Reductores de velocidad media', '2021-04-15 00:00:00', 100, 2, 2, 2),
(12, '30', 'Variadores de velocidad críticos bajos', '2021-04-15 00:00:00', 150, 3, 3, 3),
(13, '35', 'Variadores de velocidad críticos altos', '2021-04-15 00:00:00', 100, 3, 3, 3),
(14, '40', 'Tarjetas de PLCs', '2021-04-15 00:00:00', 150, 4, 4, 4),
(15, '45', 'Cosas de PLCs', '2021-04-15 00:00:00', 100, 4, 4, 4),
(16, '50', 'Tubería de 1 pulgada', '2021-04-15 00:00:00', 150, 5, 5, 5),
(17, '55', 'Tubería de 12 pulgadas', '2021-04-15 00:00:00', 125, 5, 5, 5),
(18, '60', 'Góndolas chicas', '2021-04-15 00:00:00', 150, 6, 6, 6),
(19, '65', 'Góndolas grandes', '2021-04-15 00:00:00', 100, 6, 6, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id_role` int(11) NOT NULL,
  `nombre_role` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id_role`, `nombre_role`) VALUES
(1, 'Administrador'),
(3, 'Supervisor'),
(2, 'Supervisor General'),
(4, 'Trabajador');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL COMMENT 'auto incrementing user_id of each user, unique index',
  `firstname` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `lastname` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `user_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT 'user''s name, unique',
  `user_password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'user''s password in salted and hashed format',
  `user_email` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT 'user''s email, unique',
  `date_added` datetime NOT NULL,
  `id_role` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='user data';

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`user_id`, `firstname`, `lastname`, `user_name`, `user_password_hash`, `user_email`, `date_added`, `id_role`) VALUES
(1, 'Admin', '-', 'admin', '$2y$10$MPVHzZ2ZPOWmtUUGCq3RXu31OTB.jo7M9LZ7PmPQYmgETSNn19ejO', 'admin@admin.com', '2016-12-19 15:06:00', 1),
(2, 'Silvia', 'Noriega', 'silviam', '$2y$10$G1aCQ.ym4kN/ngjVRO.eheQNuypoiU/7Ng9jDnzhxyqn5dbfx6OXq', 'silvia@gmail.com', '2021-04-21 04:50:42', 4),
(3, 'Judas', 'Duran', 'judasduran', '$2y$10$Eh6bttbmLn7vFyVQFDyc9.wih86PYgtWgyb3tJD2G4wrzOK2Se2re', 'judasduran@gmail.com', '2021-05-14 00:37:01', 2),
(4, 'Denia', 'Medina', 'deniam', '$2y$10$d83EXjT8rUqJJZ.8VZFlU.VlE.ooB6Sl9F0HpVTXdAMFhsv2HujXu', 'deniam@gmail.com', '2021-05-14 00:37:19', 2),
(7, 'Martin', 'Abril', 'martin', '$2y$10$2tFIbYBYFIogD9ZWccbha.aHI0vSXnIp3EQgKC0xziX6wqhKOO36q', 'martin@gmail.com', '2021-05-14 06:12:53', 4);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `estantes`
--
ALTER TABLE `estantes`
  ADD PRIMARY KEY (`id_estante`),
  ADD UNIQUE KEY `codigo_estante` (`codigo_estante`),
  ADD UNIQUE KEY `nombre_estante` (`nombre_estante`),
  ADD KEY `id_pasillo` (`id_pasillo`);

--
-- Indices de la tabla `historial`
--
ALTER TABLE `historial`
  ADD PRIMARY KEY (`id_historial`),
  ADD KEY `id_producto` (`id_producto`),
  ADD KEY `historial_ibfk_1` (`user_id`);

--
-- Indices de la tabla `pasillos`
--
ALTER TABLE `pasillos`
  ADD PRIMARY KEY (`id_pasillo`),
  ADD UNIQUE KEY `codigo_pasillo` (`codigo_pasillo`),
  ADD UNIQUE KEY `nombre_pasillo` (`nombre_pasillo`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id_producto`),
  ADD UNIQUE KEY `codigo_producto` (`codigo_producto`),
  ADD KEY `products_ibfk_2` (`id_pasillo`),
  ADD KEY `products_ibfk_3` (`id_estante`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id_role`),
  ADD UNIQUE KEY `nombre_role` (`nombre_role`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `user_name` (`user_name`),
  ADD UNIQUE KEY `user_email` (`user_email`),
  ADD KEY `users_ibfk_1` (`id_role`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `estantes`
--
ALTER TABLE `estantes`
  MODIFY `id_estante` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `historial`
--
ALTER TABLE `historial`
  MODIFY `id_historial` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `pasillos`
--
ALTER TABLE `pasillos`
  MODIFY `id_pasillo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id_role` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'auto incrementing user_id of each user, unique index', AUTO_INCREMENT=8;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `estantes`
--
ALTER TABLE `estantes`
  ADD CONSTRAINT `estantes_ibfk_1` FOREIGN KEY (`id_pasillo`) REFERENCES `pasillos` (`id_pasillo`);

--
-- Filtros para la tabla `historial`
--
ALTER TABLE `historial`
  ADD CONSTRAINT `fk_id_producto` FOREIGN KEY (`id_producto`) REFERENCES `products` (`id_producto`) ON DELETE CASCADE,
  ADD CONSTRAINT `historial_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Filtros para la tabla `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`id_pasillo`) REFERENCES `pasillos` (`id_pasillo`),
  ADD CONSTRAINT `products_ibfk_3` FOREIGN KEY (`id_estante`) REFERENCES `estantes` (`id_estante`);

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`id_role`) REFERENCES `roles` (`id_role`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
