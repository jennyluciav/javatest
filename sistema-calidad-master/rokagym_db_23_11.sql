-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-11-2017 a las 18:55:02
-- Versión del servidor: 10.1.26-MariaDB
-- Versión de PHP: 7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `rokagym_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrador`
--

CREATE TABLE `administrador` (
  `idAdmin` int(11) NOT NULL,
  `nombreAdmin` varchar(150) NOT NULL,
  `password` varchar(150) NOT NULL,
  `rol` varchar(50) NOT NULL,
  `intentos` int(11) NOT NULL DEFAULT '0',
  `fechaCreado` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `administrador`
--

INSERT INTO `administrador` (`idAdmin`, `nombreAdmin`, `password`, `rol`, `intentos`, `fechaCreado`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'A', 0, '2017-11-06'),
(13, 'test1', 'b4011246cdd7ba2713bd62a5a82b1f1d', 'U', 0, '2017-11-18');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `idCliente` int(11) NOT NULL,
  `nombreCliente` varchar(150) NOT NULL,
  `apellidoCliente` varchar(150) NOT NULL,
  `estado` int(11) NOT NULL DEFAULT '1',
  `telefono` varchar(50) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `dni` int(11) NOT NULL,
  `sexo` varchar(10) NOT NULL,
  `edad` int(11) NOT NULL,
  `fechaNacimiento` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`idCliente`, `nombreCliente`, `apellidoCliente`, `estado`, `telefono`, `direccion`, `dni`, `sexo`, `edad`, `fechaNacimiento`) VALUES
(11, 'Ernesto', 'Guevara', 1, '123456789', 'Jr. Zorritos 1399 block 38 dpto 402', 1, '', 0, '0000-00-00'),
(12, 'Tony', 'Rosado', 1, '977183442', 'Lima', 2, '', 0, '0000-00-00'),
(13, 'Kike', 'Suero', 1, '1234', 'administrador', 4, '', 0, '0000-00-00'),
(14, 'David', 'Coperfield', 1, '977183442', 'admin', 4, '', 0, '0000-00-00'),
(16, 'Koky', 'Belaunde', 1, '123456', 'admin', 123456, '', 0, '0000-00-00'),
(17, 'Rosy', 'War', 1, '147258', 'Jr. Zorritos 1399 block 38 dpto 402', 123456789, 'femenino', 12, '1969-12-31'),
(19, 'Susy', 'Diaz', 1, '977183442', 'admin', 70126281, '', 0, '0000-00-00'),
(20, 'ada', 'asdasdasd', 1, '1222', 'asdasdasd', 2147483647, 'masculino', 12, '1969-12-31'),
(21, '1', 'adsdasdsa', 1, '1231232', 'asdasdsda', 123123, 'masculino', 12, '1969-12-31'),
(22, 'a', 'asddsd', 1, '12323', 'asdasdsds', 123, 'masculino', 12, '2017-09-11'),
(23, 'Ana Maria', 'Alvarado Porras', 1, '962768687', 'asdadasdadsad', 75071786, 'femenino', 21, '1969-12-31'),
(24, 'asdsa', 'asdsds', 1, '1232321', 'asdasdsa', 12323213, 'masculino', 12, '1969-12-31'),
(25, 'silvia', 'sanchez', 1, '12345678', 'mzblt15', 65437890, 'femenino', 21, '1969-12-31'),
(26, 'mariana', 'cadillo', 1, '34567890', 'mzblt3', 54678908, 'femenino', 18, '1969-12-31'),
(27, 'asdsad', 'qwqewqewq', 1, '13123313', 'asdasdsd', 12313123, 'masculino', 12, '1969-12-31');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalles`
--

CREATE TABLE `detalles` (
  `idDetalle` int(11) NOT NULL,
  `idCliente` int(11) NOT NULL,
  `idProducto` int(11) NOT NULL,
  `fechaVenta` date NOT NULL,
  `precioVenta` double NOT NULL,
  `cantidadKilos` int(11) NOT NULL,
  `totalVenta` double NOT NULL,
  `numFac` int(110) NOT NULL,
  `tipoFactura` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `idFactura` int(11) NOT NULL,
  `numFac` int(110) NOT NULL,
  `fechaVenta` date NOT NULL,
  `idCliente` int(11) NOT NULL,
  `idAdmin` int(11) NOT NULL,
  `totalVenta` double NOT NULL,
  `tipoFactura` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `factura`
--

INSERT INTO `factura` (`idFactura`, `numFac`, `fechaVenta`, `idCliente`, `idAdmin`, `totalVenta`, `tipoFactura`) VALUES
(4, 3, '2017-11-22', 21, 1, 2400, 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario`
--

CREATE TABLE `inventario` (
  `idInventario` int(11) NOT NULL,
  `cantidadIngresada` int(11) NOT NULL,
  `precioVenta` double NOT NULL,
  `idProducto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `inventario`
--

INSERT INTO `inventario` (`idInventario`, `cantidadIngresada`, `precioVenta`, `idProducto`) VALUES
(20, 110, 3, 32),
(21, 30, 1.5, 33),
(22, 40, 3.5, 34);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `matricula`
--

CREATE TABLE `matricula` (
  `idMatricula` int(11) NOT NULL,
  `idCliente` int(11) NOT NULL,
  `idMembresia` int(11) NOT NULL,
  `fechaInicio` date NOT NULL,
  `fechaFin` date NOT NULL,
  `fechaMatricula` date NOT NULL,
  `idAdmin` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `matricula`
--

INSERT INTO `matricula` (`idMatricula`, `idCliente`, `idMembresia`, `fechaInicio`, `fechaFin`, `fechaMatricula`, `idAdmin`) VALUES
(39, 11, 3, '2018-07-12', '2017-08-12', '0000-00-00', 1),
(45, 13, 1, '0000-00-00', '0000-00-00', '0000-00-00', 1),
(46, 14, 2, '1969-12-31', '1969-12-31', '2017-11-08', 1),
(47, 19, 2, '2017-08-11', '1969-12-31', '2017-11-08', 1),
(48, 12, 1, '2017-09-11', '1969-12-31', '2017-11-08', 1),
(49, 16, 2, '1969-12-31', '1969-12-31', '2017-11-08', 1),
(50, 17, 3, '1969-12-31', '1969-12-31', '2017-11-08', 1),
(51, 12, 2, '1969-12-31', '1969-12-31', '2017-11-08', 1),
(52, 23, 1, '2008-12-01', '1969-12-31', '2017-11-08', 1),
(53, 12, 2, '1969-12-31', '1969-12-31', '2017-11-08', 1),
(58, 17, 3, '1969-12-31', '1969-12-31', '2017-11-08', 1),
(61, 16, 3, '1969-12-31', '1969-12-31', '2017-11-08', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `membresias`
--

CREATE TABLE `membresias` (
  `idMembresia` int(11) NOT NULL,
  `nombreMembresia` varchar(50) NOT NULL,
  `costoMembresia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `membresias`
--

INSERT INTO `membresias` (`idMembresia`, `nombreMembresia`, `costoMembresia`) VALUES
(1, 'General', 500),
(2, 'Gold', 320),
(3, 'Silver', 250);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pass`
--

CREATE TABLE `pass` (
  `idpass` int(11) NOT NULL,
  `password` varchar(50) NOT NULL,
  `idAdmin` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `idProducto` int(11) NOT NULL,
  `nombreProducto` varchar(50) NOT NULL,
  `precioProducto` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`idProducto`, `nombreProducto`, `precioProducto`) VALUES
(32, 'Volt (Energizante)', 2.5),
(33, 'Agua Cielo', 1),
(34, 'Quemador X', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `temp`
--

CREATE TABLE `temp` (
  `idTemp` int(11) NOT NULL,
  `idProducto` int(11) NOT NULL,
  `idCliente` int(11) NOT NULL,
  `precioVenta` double NOT NULL,
  `cantidad` int(11) NOT NULL,
  `iva` double NOT NULL,
  `totalVenta` double NOT NULL,
  `numFac` int(11) NOT NULL,
  `fechaVenta` date NOT NULL,
  `unidad` int(11) NOT NULL,
  `tipoFactura` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD PRIMARY KEY (`idAdmin`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`idCliente`);

--
-- Indices de la tabla `detalles`
--
ALTER TABLE `detalles`
  ADD PRIMARY KEY (`idDetalle`),
  ADD KEY `FK_detalles_clientes` (`idCliente`),
  ADD KEY `FK_detalles_productos` (`idProducto`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`idFactura`),
  ADD KEY `FK_factura_clientes` (`idCliente`),
  ADD KEY `FK_factura_administrador` (`idAdmin`);

--
-- Indices de la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD PRIMARY KEY (`idInventario`),
  ADD KEY `FK_inventario_productos` (`idProducto`);

--
-- Indices de la tabla `matricula`
--
ALTER TABLE `matricula`
  ADD PRIMARY KEY (`idMatricula`),
  ADD KEY `FK_cliente_ID` (`idCliente`) USING BTREE,
  ADD KEY `FK_membresia_ID` (`idMembresia`) USING BTREE,
  ADD KEY `FK_admin_ID` (`idAdmin`);

--
-- Indices de la tabla `membresias`
--
ALTER TABLE `membresias`
  ADD PRIMARY KEY (`idMembresia`);

--
-- Indices de la tabla `pass`
--
ALTER TABLE `pass`
  ADD PRIMARY KEY (`idpass`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`idProducto`);

--
-- Indices de la tabla `temp`
--
ALTER TABLE `temp`
  ADD PRIMARY KEY (`idTemp`),
  ADD KEY `FK_temp_clientes` (`idCliente`),
  ADD KEY `FK_temp_productos` (`idProducto`) USING BTREE;

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `administrador`
--
ALTER TABLE `administrador`
  MODIFY `idAdmin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `idCliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de la tabla `detalles`
--
ALTER TABLE `detalles`
  MODIFY `idDetalle` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `factura`
--
ALTER TABLE `factura`
  MODIFY `idFactura` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `inventario`
--
ALTER TABLE `inventario`
  MODIFY `idInventario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `matricula`
--
ALTER TABLE `matricula`
  MODIFY `idMatricula` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT de la tabla `membresias`
--
ALTER TABLE `membresias`
  MODIFY `idMembresia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `pass`
--
ALTER TABLE `pass`
  MODIFY `idpass` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `idProducto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT de la tabla `temp`
--
ALTER TABLE `temp`
  MODIFY `idTemp` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
