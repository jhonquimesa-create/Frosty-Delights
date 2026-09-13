-- ============================================================
-- BASE DE DATOS: FROSTY DELIGHTS
-- Archivo: bd.sql
-- ============================================================

DROP DATABASE IF EXISTS frosty_delights;
CREATE DATABASE frosty_delights
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

USE frosty_delights;

-- ============================================================
-- TABLA: roles
-- ============================================================

CREATE TABLE roles (
    id_rol INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL UNIQUE
);

-- ============================================================
-- TABLA: usuarios
-- ============================================================

CREATE TABLE usuarios (
    id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(255),
    telefono VARCHAR(20),
    correo_electronico VARCHAR(150) NOT NULL UNIQUE,
    contrasena VARCHAR(255) NOT NULL,
    id_rol INT NOT NULL,
    fecha_registro DATETIME DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_usuarios_roles
        FOREIGN KEY (id_rol)
        REFERENCES roles(id_rol)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

-- ============================================================
-- TABLA: categorias
-- ============================================================

CREATE TABLE categorias (
    id_categoria INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL UNIQUE,
    descripcion VARCHAR(255)
);

-- ============================================================
-- TABLA: productos
-- ============================================================

CREATE TABLE productos (
    id_producto INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(150) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10,2) NOT NULL,
    stock INT NOT NULL DEFAULT 0,
    imagen VARCHAR(255),
    estado ENUM('disponible', 'agotado') DEFAULT 'disponible',
    id_categoria INT NOT NULL,

    CONSTRAINT fk_productos_categorias
        FOREIGN KEY (id_categoria)
        REFERENCES categorias(id_categoria)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

-- ============================================================
-- TABLA: promociones
-- ============================================================

CREATE TABLE promociones (
    id_promocion INT PRIMARY KEY AUTO_INCREMENT,
    codigo VARCHAR(50) NOT NULL UNIQUE,
    descripcion VARCHAR(255) NOT NULL,
    descuento DECIMAL(5,2) NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL,
    estado ENUM('activa', 'inactiva') DEFAULT 'activa'
);

-- ============================================================
-- TABLA: servicios
-- ============================================================

CREATE TABLE servicios (
    id_servicio INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(150) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10,2) NOT NULL,
    estado ENUM('disponible', 'no disponible') DEFAULT 'disponible',
    fecha_registro DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- ============================================================
-- TABLA: pedidos
-- ============================================================

CREATE TABLE pedidos (
    id_pedido INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario INT NOT NULL,
    fecha_pedido DATETIME DEFAULT CURRENT_TIMESTAMP,
    total DECIMAL(10,2) NOT NULL DEFAULT 0,
    estado ENUM(
        'pendiente',
        'preparando',
        'enviado',
        'entregado',
        'cancelado'
    ) DEFAULT 'pendiente',
    direccion_entrega VARCHAR(255),

    CONSTRAINT fk_pedidos_usuarios
        FOREIGN KEY (id_usuario)
        REFERENCES usuarios(id_usuario)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

-- ============================================================
-- TABLA: detalle_pedidos
-- ============================================================

CREATE TABLE detalle_pedidos (
    id_detalle INT PRIMARY KEY AUTO_INCREMENT,
    id_pedido INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10,2) NOT NULL,
    subtotal DECIMAL(10,2) NOT NULL,

    CONSTRAINT fk_detalle_pedidos
        FOREIGN KEY (id_pedido)
        REFERENCES pedidos(id_pedido)
        ON UPDATE CASCADE
        ON DELETE CASCADE,

    CONSTRAINT fk_detalle_productos
        FOREIGN KEY (id_producto)
        REFERENCES productos(id_producto)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

-- ============================================================
-- TABLA: pagos
-- ============================================================

CREATE TABLE pagos (
    id_pago INT PRIMARY KEY AUTO_INCREMENT,
    id_pedido INT NOT NULL,
    metodo_pago ENUM(
        'efectivo',
        'tarjeta',
        'nequi',
        'daviplata',
        'transferencia'
    ) NOT NULL,
    monto DECIMAL(10,2) NOT NULL,
    fecha_pago DATETIME DEFAULT CURRENT_TIMESTAMP,
    estado ENUM(
        'pendiente',
        'pagado',
        'rechazado'
    ) DEFAULT 'pendiente',

    CONSTRAINT fk_pagos_pedidos
        FOREIGN KEY (id_pedido)
        REFERENCES pedidos(id_pedido)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

-- ============================================================
-- VISTA: productos disponibles
-- ============================================================

CREATE VIEW vista_productos_disponibles AS
SELECT
    p.id_producto,
    p.nombre,
    p.descripcion,
    p.precio,
    p.stock,
    c.nombre AS categoria,
    p.estado
FROM productos p
INNER JOIN categorias c
    ON p.id_categoria = c.id_categoria
WHERE p.estado = 'disponible'
  AND p.stock > 0;

-- ============================================================
-- VISTA: usuarios con sus roles
-- ============================================================

CREATE VIEW vista_usuarios_roles AS
SELECT
    u.id_usuario,
    u.nombre,
    u.direccion,
    u.telefono,
    u.correo_electronico,
    r.nombre AS rol,
    u.fecha_registro
FROM usuarios u
INNER JOIN roles r
    ON u.id_rol = r.id_rol;

-- ============================================================
-- VISTA: pedidos de clientes
-- ============================================================

CREATE VIEW vista_pedidos_clientes AS
SELECT
    p.id_pedido,
    u.nombre AS cliente,
    u.telefono,
    u.correo_electronico,
    p.fecha_pedido,
    p.total,
    p.estado,
    p.direccion_entrega
FROM pedidos p
INNER JOIN usuarios u
    ON p.id_usuario = u.id_usuario;