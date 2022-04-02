-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-04-2022 a las 18:13:00
-- Versión del servidor: 10.4.14-MariaDB
-- Versión de PHP: 7.2.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `juegos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `juegos`
--

CREATE TABLE `juegos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `precio` decimal(9,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `juegos`
--

INSERT INTO `juegos` (`id`, `nombre`, `descripcion`, `precio`) VALUES
(2, 'Metroid Prime 4 ', 'Metroid Prime 4, cuarta entrega de la saga Prime protagonizada por Samus Aran que salió en GameCube', '345.00'),
(5, 'Granblue Fantasy: Relink', 'Granblue Fantasy: Relink es un juego de rol y acción desarrollado por Cygames Osaka, que nos trasladará a un mundo abierto, plagado de criaturas y bestias.', '123.00'),
(6, 'Bayonetta 3 ', 'Bayonetta 3 es la tercera entrega, programada y desarrollada por PlatinumGames, de la famosa saga de hack and slash protagonizada por la famosa bruja. ', '123.00'),
(7, 'Lost Soul Aside', ' El juego nos lleva a un mundo que diez años antes sufrió una gran guerra entre dos reinos. Aunque el conflicto terminó, monstruos desconocidos aparecen desde entonces con el único objetivo de aniquilar a la población. ', '123.00'),
(8, 'Gran Turismo 7 ', 'En exclusiva para PlayStation 5, la nueva entrega del videojuego de coches tendrá mejoras audiovisuales inimaginables en la licencia, haciendo especial hincapié', '123.00'),
(10, 'Assassin\'s Creed Valhalla ', 'El título se desarrollará en la época vikinga y el personaje principal será Ragnar Lodbrok, ofreciéndonos un pormenorizado vistazo a la mitología nórdica. ', '123.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(8) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `Pass` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nombre`, `Pass`) VALUES
(1, 'Bibiana', '1234');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `juegos`
--
ALTER TABLE `juegos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `juegos`
--
ALTER TABLE `juegos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
