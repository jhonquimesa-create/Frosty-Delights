-- ============================================================
-- DATOS DE FROSTY DELIGHTS
-- Archivo: bd_frosty.sql
-- Ejecutar después de bd.sql
-- ============================================================

USE frosty_delights;

-- ============================================================
-- ROLES
-- ============================================================

INSERT INTO roles (nombre) VALUES
('administrador'),
('cliente'),
('empleado');

-- ============================================================
-- USUARIOS
-- Nota: estas contraseñas son de ejemplo para desarrollo.
-- En producción deben almacenarse mediante un hash seguro.
-- ============================================================

INSERT INTO usuarios
(nombre, direccion, telefono, correo_electronico, contrasena, id_rol)
VALUES
('Ana Gómez', 'Carrera 10 #20-30', '3001234567', 'ana@gmail.com', 'Ana123', 2),
('Carlos Rodríguez', 'Carrera 15 #30-40', '3012345678', 'carlos@gmail.com', 'Carlos123', 2),
('Laura Martínez', 'Calle 25 #15-20', '3023456789', 'laura@gmail.com', 'Laura123', 2),
('María González', 'Carrera 20 #10-25', '3041234567', 'maria@gmail.com', 'Maria123', 2),
('Andrés Hernández', 'Calle 30 #20-15', '3052345678', 'andres@gmail.com', 'Andres123', 2),
('Sofía Ramírez', 'Carrera 45 #12-30', '3063456789', 'sofia@gmail.com', 'Sofia123', 2),
('Juan Torres', 'Calle 50 #25-40', '3074567890', 'juan@gmail.com', 'Juan123', 2),
('Valentina Moreno', 'Carrera 60 #15-20', '3085678901', 'valentina@gmail.com', 'Valentina123', 2),
('Daniel Castro', 'Calle 70 #30-50', '3096789012', 'daniel@gmail.com', 'Daniel123', 2),
('Camila Vargas', 'Carrera 80 #40-60', '3107890123', 'camila@gmail.com', 'Camila123', 2),
('Sebastián Rojas', 'Calle 85 #50-70', '3118901234', 'sebastian@gmail.com', 'Sebastian123', 2),
('Natalia Morales', 'Carrera 90 #60-80', '3129012345', 'natalia@gmail.com', 'Natalia123', 2),
('Felipe Jiménez', 'Calle 100 #70-90', '3130123456', 'felipe@gmail.com', 'Felipe123', 2),
('Isabella Suárez', 'Carrera 15 #80-25', '3141234567', 'isabella@gmail.com', 'Isabella123', 2),
('Mateo Díaz', 'Calle 20 #90-35', '3152345678', 'mateo@gmail.com', 'Mateo123', 2),
('Gabriela Pérez', 'Carrera 35 #100-45', '3163456789', 'gabriela@gmail.com', 'Gabriela123', 2),
('Alejandro Mendoza', 'Calle 40 #110-55', '3174567890', 'alejandro@gmail.com', 'Alejandro123', 2),
('Paula Ortiz', 'Carrera 55 #120-65', '3185678901', 'paula@gmail.com', 'Paula123', 2),
('Nicolás Sánchez', 'Calle 60 #130-75', '3196789012', 'nicolas@gmail.com', 'Nicolas123', 2),
('Juliana Restrepo', 'Carrera 75 #140-85', '3207890123', 'juliana@gmail.com', 'Juliana123', 2),
('Jhon Administrador', 'Oficina Frosty Delights', '3001112233', 'admin@frostydelights.com', 'Admin123', 1),
('Pedro Empleado', 'Local Frosty Delights', '3004445566', 'empleado@frostydelights.com', 'Empleado123', 3);

-- ============================================================
-- CATEGORIAS
-- ============================================================

INSERT INTO categorias (nombre, descripcion) VALUES
('Helados', 'Helados tradicionales de diferentes sabores'),
('Malteadas', 'Malteadas preparadas con helado y leche'),
('Conos', 'Helados servidos en conos'),
('Sundaes', 'Helados acompañados de diferentes toppings'),
('Combos', 'Combos especiales para compartir'),
('Postres', 'Postres especiales de Frosty Delights');

-- ============================================================
-- PRODUCTOS
-- ============================================================

INSERT INTO productos
(nombre, descripcion, precio, stock, imagen, id_categoria)
VALUES
('Helado de Chocolate', 'Delicioso helado cremoso de chocolate', 8000, 50, 'chocolate.jpg', 1),
('Helado de Vainilla', 'Helado suave y cremoso de vainilla', 7500, 50, 'vainilla.jpg', 1),
('Helado de Fresa', 'Helado de fresa con sabor natural', 7500, 45, 'fresa.jpg', 1),
('Helado de Oreo', 'Helado de vainilla con trozos de Oreo', 9000, 40, 'oreo.jpg', 1),
('Helado de Mango', 'Refrescante helado de mango', 8000, 35, 'mango.jpg', 1),
('Malteada de Chocolate', 'Malteada cremosa de chocolate', 12000, 30, 'malteada-chocolate.jpg', 2),
('Malteada de Fresa', 'Malteada de fresa con crema', 12000, 30, 'malteada-fresa.jpg', 2),
('Malteada de Oreo', 'Malteada de Oreo con crema y galleta', 14000, 25, 'malteada-oreo.jpg', 2),
('Cono de Chocolate', 'Cono crujiente con helado de chocolate', 9000, 30, 'cono-chocolate.jpg', 3),
('Cono Especial', 'Cono con dos sabores y toppings', 11000, 25, 'cono-especial.jpg', 3),
('Sundae de Fresa', 'Helado con salsa de fresa y crema', 13000, 25, 'sundae-fresa.jpg', 4),
('Sundae de Chocolate', 'Helado con salsa de chocolate y crema', 13000, 25, 'sundae-chocolate.jpg', 4),
('Combo Familiar', '4 helados + 2 malteadas para compartir', 45000, 20, 'combo-familiar.jpg', 5),
('Combo Pareja', '2 helados + 2 malteadas', 32000, 20, 'combo-pareja.jpg', 5),
('Brownie con Helado', 'Brownie caliente acompañado de helado', 15000, 20, 'brownie.jpg', 6);

-- ============================================================
-- PROMOCIONES
-- ============================================================

INSERT INTO promociones
(codigo, descripcion, descuento, fecha_inicio, fecha_fin, estado)
VALUES
('FROSTY10', '10% de descuento en productos seleccionados', 10.00, '2026-08-01', '2026-12-31', 'activa'),
('FROSTY20', '20% de descuento en compras especiales', 20.00, '2026-08-01', '2026-10-31', 'activa'),
('HELADO5', '5% de descuento en helados', 5.00, '2026-08-01', '2026-12-31', 'activa');

-- ============================================================
-- SERVICIOS
-- ============================================================

INSERT INTO servicios
(nombre, descripcion, precio, estado)
VALUES
('Servicio a Domicilio',
 'Entrega de nuestros productos Frosty Delights directamente a tu domicilio.',
 5000, 'disponible'),

('Servicio para Fiestas',
 'Servicio especial de helados y malteadas para cumpleaños y celebraciones.',
 80000, 'disponible'),

('Eventos Empresariales',
 'Servicio de helados, malteadas y postres para eventos empresariales.',
 150000, 'disponible'),

('Helados Personalizados',
 'Preparación de helados personalizados con diferentes sabores y toppings.',
 12000, 'disponible'),

('Barra de Helados',
 'Barra de helados para eventos con diferentes sabores y acompañamientos.',
 120000, 'disponible'),

('Catering de Helados',
 'Servicio completo de helados y postres para celebraciones y eventos.',
 200000, 'disponible'),

('Servicio para Cumpleaños',
 'Paquete especial de helados y malteadas para fiestas de cumpleaños.',
 100000, 'disponible'),

('Decoración de Postres',
 'Decoración personalizada de helados, brownies, sundaes y otros postres.',
 10000, 'disponible');

-- ============================================================
-- PEDIDOS
-- ============================================================

INSERT INTO pedidos
(id_usuario, total, estado, direccion_entrega)
VALUES
(1, 23500, 'entregado', 'Carrera 10 #20-30'),
(2, 45000, 'preparando', 'Carrera 15 #30-40'),
(3, 31500, 'pendiente', 'Calle 25 #15-20'),
(4, 15000, 'entregado', 'Carrera 20 #10-25');

-- ============================================================
-- DETALLE DE PEDIDOS
-- ============================================================

INSERT INTO detalle_pedidos
(id_pedido, id_producto, cantidad, precio_unitario, subtotal)
VALUES
(1, 1, 2, 8000, 16000),
(1, 3, 1, 7500, 7500),
(2, 13, 1, 45000, 45000),
(3, 6, 2, 12000, 24000),
(3, 2, 1, 7500, 7500),
(4, 15, 1, 15000, 15000);

-- ============================================================
-- PAGOS
-- ============================================================

INSERT INTO pagos
(id_pedido, metodo_pago, monto, estado)
VALUES
(1, 'nequi', 23500, 'pagado'),
(2, 'tarjeta', 45000, 'pagado'),
(3, 'efectivo', 31500, 'pendiente'),
(4, 'daviplata', 15000, 'pagado');

-- ============================================================
-- CONSULTAS DE PRUEBA
-- ============================================================

-- Ver usuarios y sus roles
SELECT * FROM vista_usuarios_roles;

-- Ver productos disponibles
SELECT * FROM vista_productos_disponibles;

-- Ver servicios
SELECT * FROM servicios;

-- Ver promociones activas
SELECT *
FROM promociones
WHERE estado = 'activa';

-- Ver pedidos y clientes
SELECT * FROM vista_pedidos_clientes;

-- Ver productos más vendidos
SELECT
    pr.nombre AS producto,
    SUM(dp.cantidad) AS unidades_vendidas,
    SUM(dp.subtotal) AS dinero_generado
FROM detalle_pedidos dp
INNER JOIN productos pr
    ON dp.id_producto = pr.id_producto
GROUP BY pr.id_producto, pr.nombre
ORDER BY unidades_vendidas DESC;