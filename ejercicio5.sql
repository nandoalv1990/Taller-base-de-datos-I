/*
La empresa TecnoShop quiere almacenar información sobre sus clientes, los productos que vende y las ventas que realiza.

El sistema debe permitir:

Registrar clientes

Registrar productos

Registrar ventas

Registrar los productos vendidos en cada venta

*/

-- CREAR LA BASE DE DATOS
CREATE DATABASE tecnoshop;
USE tecnoshop;

-- CREAR TABLAS CON LLAVES
-- CLIENTES
CREATE TABLE clientes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(80),
    correo VARCHAR(100)
);

-- PRODUCTOS
CREATE TABLE productos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(80),
    precio DECIMAL(10,2),
    stock INT
);

-- VENTAS
CREATE TABLE ventas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    fecha DATE,
    cliente_id INT,
    FOREIGN KEY (cliente_id) REFERENCES clientes(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- DETALLE VENTA
CREATE TABLE detalle_venta (
    id INT PRIMARY KEY AUTO_INCREMENT,
    venta_id INT,
    producto_id INT,
    cantidad INT,
    FOREIGN KEY (venta_id) REFERENCES ventas(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (producto_id) REFERENCES productos(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- INSERTAR DATOS
INSERT INTO clientes (nombre, correo) VALUES
('Juan Ramírez', 'juan@example.com'),
('María Torres', 'maria@example.com');

INSERT INTO productos (nombre, precio, stock) VALUES
('Laptop', 15000.00, 10),
('Teclado Mecánico', 1500.00, 25),
('Mouse Gamer', 900.00, 30);

INSERT INTO ventas (fecha, cliente_id) VALUES
('2025-02-15', 1),
('2025-02-16', 2);

INSERT INTO detalle_venta (venta_id, producto_id, cantidad) VALUES
(1, 1, 1),
(1, 3, 2),
(2, 2, 1);

-- CONSULTAS
-- TODAS LAS VENTAS CON EL NOMBRE DEL CLIENTE
SELECT ventas.id AS Venta, fecha, clientes.nombre AS Cliente
FROM ventas
JOIN clientes ON ventas.cliente_id = clientes.id;

-- MOSTAR DETALLES DE CADA VENTA
SELECT ventas.id AS Venta,
       productos.nombre AS Producto,
       detalle_venta.cantidad,
       (productos.precio * detalle_venta.cantidad) AS Total
FROM detalle_venta
JOIN ventas ON detalle_venta.venta_id = ventas.id
JOIN productos ON detalle_venta.producto_id = productos.id;

-- MOSTAR MONTO TOTAL POR VENTA
SELECT ventas.id AS Venta,
       SUM(productos.precio * detalle_venta.cantidad) AS Monto_Total
FROM detalle_venta
JOIN productos ON detalle_venta.producto_id = productos.id
JOIN ventas ON detalle_venta.venta_id = ventas.id
GROUP BY ventas.id;

-- FILTAR VENTAS POR CLIENTE
SELECT productos.nombre
FROM detalle_venta
JOIN ventas ON detalle_venta.venta_id = ventas.id
JOIN productos ON detalle_venta.producto_id = productos.id
JOIN clientes ON ventas.cliente_id = clientes.id
WHERE clientes.nombre = 'María Torres';

-- SUBCONSULTA: EL PRODUCTO MÁS VENDIDO
SELECT nombre
FROM productos
WHERE id = (
    SELECT producto_id
    FROM detalle_venta
    GROUP BY producto_id
    ORDER BY SUM(cantidad) DESC
    LIMIT 1
);

-- PENDIENTE: ESTUDIAR EL MER