-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-08-2026 a las 02:28:01
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `frosty_delights`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id_categoria` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id_categoria`, `nombre`, `descripcion`) VALUES
(1, 'Helados', 'Helados tradicionales de diferentes sabores'),
(2, 'Malteadas', 'Malteadas preparadas con helado y leche'),
(3, 'Conos', 'Helados servidos en conos'),
(4, 'Sundaes', 'Helados acompañados de diferentes toppings'),
(5, 'Combos', 'Combos especiales para compartir'),
(6, 'Postres', 'Postres especiales de Frosty Delights');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_pedidos`
--

CREATE TABLE `detalle_pedidos` (
  `id_detalle` int(11) NOT NULL,
  `id_pedido` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_unitario` decimal(10,2) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalle_pedidos`
--

INSERT INTO `detalle_pedidos` (`id_detalle`, `id_pedido`, `id_producto`, `cantidad`, `precio_unitario`, `subtotal`) VALUES
(1, 1, 1, 2, 8000.00, 16000.00),
(2, 1, 3, 1, 7500.00, 7500.00),
(3, 2, 13, 1, 45000.00, 45000.00),
(4, 3, 6, 2, 12000.00, 24000.00),
(5, 3, 2, 1, 7500.00, 7500.00),
(6, 4, 15, 1, 15000.00, 15000.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos`
--

CREATE TABLE `pagos` (
  `id_pago` int(11) NOT NULL,
  `id_pedido` int(11) NOT NULL,
  `metodo_pago` enum('efectivo','tarjeta','nequi','daviplata','transferencia') NOT NULL,
  `monto` decimal(10,2) NOT NULL,
  `fecha_pago` datetime DEFAULT current_timestamp(),
  `estado` enum('pendiente','pagado','rechazado') DEFAULT 'pendiente'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pagos`
--

INSERT INTO `pagos` (`id_pago`, `id_pedido`, `metodo_pago`, `monto`, `fecha_pago`, `estado`) VALUES
(1, 1, 'nequi', 24000.00, '2026-08-23 12:20:47', 'pagado'),
(2, 2, 'tarjeta', 45000.00, '2026-08-23 12:20:47', 'pagado'),
(3, 3, 'efectivo', 32000.00, '2026-08-23 12:20:47', 'pendiente'),
(4, 4, 'daviplata', 15000.00, '2026-08-23 12:20:47', 'pagado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `id_pedido` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `fecha_pedido` datetime DEFAULT current_timestamp(),
  `total` decimal(10,2) NOT NULL DEFAULT 0.00,
  `estado` enum('pendiente','preparando','enviado','entregado','cancelado') DEFAULT 'pendiente',
  `direccion_entrega` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`id_pedido`, `id_usuario`, `fecha_pedido`, `total`, `estado`, `direccion_entrega`) VALUES
(1, 1, '2026-08-23 12:20:23', 24000.00, 'entregado', 'Carrera 10 #20-30'),
(2, 2, '2026-08-23 12:20:23', 45000.00, 'preparando', 'Carrera 15 #30-40'),
(3, 3, '2026-08-23 12:20:23', 32000.00, 'pendiente', 'Calle 25 #15-20'),
(4, 4, '2026-08-23 12:20:23', 15000.00, 'entregado', 'Carrera 20 #10-25');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id_producto` int(11) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `precio` decimal(10,2) NOT NULL,
  `stock` int(11) NOT NULL DEFAULT 0,
  `imagen` varchar(255) DEFAULT NULL,
  `estado` enum('disponible','agotado') DEFAULT 'disponible',
  `id_categoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id_producto`, `nombre`, `descripcion`, `precio`, `stock`, `imagen`, `estado`, `id_categoria`) VALUES
(1, 'Helado de Chocolate', 'Delicioso helado cremoso de chocolate', 8000.00, 50, 'chocolate.jpg', 'disponible', 1),
(2, 'Helado de Vainilla', 'Helado suave y cremoso de vainilla', 7500.00, 50, 'vainilla.jpg', 'disponible', 1),
(3, 'Helado de Fresa', 'Helado de fresa con sabor natural', 7500.00, 45, 'fresa.jpg', 'disponible', 1),
(4, 'Helado de Oreo', 'Helado de vainilla con trozos de Oreo', 9000.00, 40, 'oreo.jpg', 'disponible', 1),
(5, 'Helado de Mango', 'Refrescante helado de mango', 8000.00, 35, 'mango.jpg', 'disponible', 1),
(6, 'Malteada de Chocolate', 'Malteada cremosa de chocolate', 12000.00, 30, 'malteada-chocolate.jpg', 'disponible', 2),
(7, 'Malteada de Fresa', 'Malteada de fresa con crema', 12000.00, 30, 'malteada-fresa.jpg', 'disponible', 2),
(8, 'Malteada de Oreo', 'Malteada de Oreo con crema y galleta', 14000.00, 25, 'malteada-oreo.jpg', 'disponible', 2),
(9, 'Cono de Chocolate', 'Cono crujiente con helado de chocolate', 9000.00, 30, 'cono-chocolate.jpg', 'disponible', 3),
(10, 'Cono Especial', 'Cono con dos sabores y toppings', 11000.00, 25, 'cono-especial.jpg', 'disponible', 3),
(11, 'Sundae de Fresa', 'Helado con salsa de fresa y crema', 13000.00, 25, 'sundae-fresa.jpg', 'disponible', 4),
(12, 'Sundae de Chocolate', 'Helado con salsa de chocolate y crema', 13000.00, 25, 'sundae-chocolate.jpg', 'disponible', 4),
(13, 'Combo Familiar', '4 helados + 2 malteadas para compartir', 45000.00, 20, 'combo-familiar.jpg', 'disponible', 5),
(14, 'Combo Pareja', '2 helados + 2 malteadas', 32000.00, 20, 'combo-pareja.jpg', 'disponible', 5),
(15, 'Brownie con Helado', 'Brownie caliente acompañado de helado', 15000.00, 20, 'brownie.jpg', 'disponible', 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `promociones`
--

CREATE TABLE `promociones` (
  `id_promocion` int(11) NOT NULL,
  `codigo` varchar(50) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `descuento` decimal(5,2) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `estado` enum('activa','inactiva') DEFAULT 'activa'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `promociones`
--

INSERT INTO `promociones` (`id_promocion`, `codigo`, `descripcion`, `descuento`, `fecha_inicio`, `fecha_fin`, `estado`) VALUES
(1, 'FROSTY10', '10% de descuento en productos seleccionados', 10.00, '2026-08-01', '2026-12-31', 'activa'),
(2, 'FROSTY20', '20% de descuento en compras especiales', 20.00, '2026-08-01', '2026-10-31', 'activa'),
(3, 'HELADO5', '5% de descuento en helados', 5.00, '2026-08-01', '2026-12-31', 'activa');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id_rol` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id_rol`, `nombre`) VALUES
(1, 'administrador'),
(2, 'cliente'),
(3, 'empleado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios`
--

CREATE TABLE `servicios` (
  `id_servicio` int(11) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `precio` decimal(10,2) NOT NULL,
  `estado` enum('disponible','no disponible') DEFAULT 'disponible',
  `fecha_registro` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `servicios`
--

INSERT INTO `servicios` (`id_servicio`, `nombre`, `descripcion`, `precio`, `estado`, `fecha_registro`) VALUES
(1, 'Servicio a Domicilio', 'Entrega de nuestros productos Frosty Delights directamente a tu domicilio.', 5000.00, 'disponible', '2026-08-23 12:24:34'),
(2, 'Servicio para Fiestas', 'Servicio especial de helados y malteadas para cumpleaños y celebraciones.', 80000.00, 'disponible', '2026-08-23 12:24:34'),
(3, 'Eventos Empresariales', 'Servicio de helados, malteadas y postres para eventos empresariales.', 150000.00, 'disponible', '2026-08-23 12:24:34'),
(4, 'Helados Personalizados', 'Preparación de helados personalizados con diferentes sabores y toppings.', 12000.00, 'disponible', '2026-08-23 12:24:34'),
(5, 'Barra de Helados', 'Barra de helados para eventos con diferentes sabores y acompañamientos.', 120000.00, 'disponible', '2026-08-23 12:24:34'),
(6, 'Catering de Helados', 'Servicio completo de helados y postres para celebraciones y eventos.', 200000.00, 'disponible', '2026-08-23 12:24:34'),
(7, 'Servicio para Cumpleaños', 'Paquete especial de helados y malteadas para fiestas de cumpleaños.', 100000.00, 'disponible', '2026-08-23 12:24:34'),
(8, 'Decoración de Postres', 'Decoración personalizada de helados, brownies, sundaes y otros postres.', 10000.00, 'disponible', '2026-08-23 12:24:34');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `correo_electronico` varchar(150) NOT NULL,
  `contrasena` varchar(255) NOT NULL,
  `id_rol` int(11) NOT NULL,
  `fecha_registro` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nombre`, `direccion`, `telefono`, `correo_electronico`, `contrasena`, `id_rol`, `fecha_registro`) VALUES
(1, 'Ana Gómez', 'Carrera 10 #20-30', '3001234567', 'ana@gmail.com', 'Ana123', 2, '2026-08-23 12:15:48'),
(2, 'Carlos Rodríguez', 'Carrera 15 #30-40', '3012345678', 'carlos@gmail.com', 'Carlos123', 2, '2026-08-23 12:15:48'),
(3, 'Laura Martínez', 'Calle 25 #15-20', '3023456789', 'laura@gmail.com', 'Laura123', 2, '2026-08-23 12:15:48'),
(4, 'María González', 'Carrera 20 #10-25', '3041234567', 'maria@gmail.com', 'Maria123', 2, '2026-08-23 12:15:48'),
(5, 'Andrés Hernández', 'Calle 30 #20-15', '3052345678', 'andres@gmail.com', 'Andres123', 2, '2026-08-23 12:15:48'),
(6, 'Sofía Ramírez', 'Carrera 45 #12-30', '3063456789', 'sofia@gmail.com', 'Sofia123', 2, '2026-08-23 12:15:48'),
(7, 'Juan Torres', 'Calle 50 #25-40', '3074567890', 'juan@gmail.com', 'Juan123', 2, '2026-08-23 12:15:48'),
(8, 'Valentina Moreno', 'Carrera 60 #15-20', '3085678901', 'valentina@gmail.com', 'Valentina123', 2, '2026-08-23 12:15:48'),
(9, 'Daniel Castro', 'Calle 70 #30-50', '3096789012', 'daniel@gmail.com', 'Daniel123', 2, '2026-08-23 12:15:48'),
(10, 'Camila Vargas', 'Carrera 80 #40-60', '3107890123', 'camila@gmail.com', 'Camila123', 2, '2026-08-23 12:15:48'),
(11, 'Jhon Administrador', 'Oficina Frosty Delights', '3001112233', 'admin@frostydelights.com', 'Admin123', 1, '2026-08-23 12:15:48'),
(12, 'Pedro Empleado', 'Local Frosty Delights', '3004445566', 'empleado@frostydelights.com', 'Empleado123', 3, '2026-08-23 12:15:48');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id_categoria`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `detalle_pedidos`
--
ALTER TABLE `detalle_pedidos`
  ADD PRIMARY KEY (`id_detalle`),
  ADD KEY `id_pedido` (`id_pedido`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD PRIMARY KEY (`id_pago`),
  ADD KEY `id_pedido` (`id_pedido`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id_pedido`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `id_categoria` (`id_categoria`);

--
-- Indices de la tabla `promociones`
--
ALTER TABLE `promociones`
  ADD PRIMARY KEY (`id_promocion`),
  ADD UNIQUE KEY `codigo` (`codigo`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id_rol`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD PRIMARY KEY (`id_servicio`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `correo_electronico` (`correo_electronico`),
  ADD KEY `id_rol` (`id_rol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `detalle_pedidos`
--
ALTER TABLE `detalle_pedidos`
  MODIFY `id_detalle` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `pagos`
--
ALTER TABLE `pagos`
  MODIFY `id_pago` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id_pedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `promociones`
--
ALTER TABLE `promociones`
  MODIFY `id_promocion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id_rol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `servicios`
--
ALTER TABLE `servicios`
  MODIFY `id_servicio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalle_pedidos`
--
ALTER TABLE `detalle_pedidos`
  ADD CONSTRAINT `detalle_pedidos_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id_pedido`),
  ADD CONSTRAINT `detalle_pedidos_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`);

--
-- Filtros para la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD CONSTRAINT `pagos_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id_pedido`);

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id_rol`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
