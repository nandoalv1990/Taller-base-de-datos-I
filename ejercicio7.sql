
/*
Ejercicio 7 - 24 de enero del 2026
Una ferretería desea implementar un sistema para controlar su inventario y las ventas realizadas.
*/

CREATE DATABASE ferreteria_db;
USE ferreteria_db;

--- CREACIÓN DE TABLAS

CREATE TABLE almacen (
    codigo_producto INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    categoria VARCHAR(50),
    precio_unitario DECIMAL(10,2) NOT NULL,
    existencia INT NOT NULL
);

CREATE TABLE proveedor (
    id_proveedor INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    telefono VARCHAR(20),
    email VARCHAR(100)
);

CREATE TABLE producto_proveedor (
    codigo_producto INT,
    id_proveedor INT,
    PRIMARY KEY (codigo_producto, id_proveedor),
    FOREIGN KEY (codigo_producto) REFERENCES producto(codigo_producto),
    FOREIGN KEY (id_proveedor) REFERENCES proveedor(id_proveedor)
);

CREATE TABLE venta (
    id_venta INT PRIMARY KEY AUTO_INCREMENT,
    fecha DATE NOT NULL
);

CREATE TABLE detalle_venta (
    id_venta INT,
    codigo_producto INT,
    cantidad INT NOT NULL,
    PRIMARY KEY (id_venta, codigo_producto),
    FOREIGN KEY (id_venta) REFERENCES venta(id_venta),
    FOREIGN KEY (codigo_producto) REFERENCES producto(codigo_producto)
);

--- CONSULTAS + INNER JOIN

-- Calcular el total vendido por producto
SELECT 
p.codigo_producto,
p.nombre,
SUM(dv.cantidad) AS total_vendido
p.nombre,
SUM(dv.cantidad) AS total_vendido
FROM producto p
INNER JOIN detalle_venta dv ON p.codigo_producto = detalle_venta
GROUP BY p.codigo_producto, p.nombre;

-- Listado de productos por venta
SELECT
v.id_venta,
v.fecha,
p.nombre AS producto,
dv.cantidad
FROM venta v
INNER JOIN detalle_venta dv ON v.id_venta = dv.id_venta
INNER JOIN producto p ON dv.codigo_producto = p.codigo_producto
ORDER BY v.id_venta;

-- Mostrar inventario
SELECT
 codigo_producto,
 nombre,
 categoria,
 existencia
FROM producto;

-- Calcular total por unidades de producto
SELECT 
 p.producto,
 p.nombre,
 SUM(dv.cantidad) AS total_vendido
FROM producto p
INNER JOIN detalle_venta dv ON p.codigo_producto = dv.codigo_producto
GROUP BY p.codigo_producto, p.nombre;

-- Existencia de productos (menores a 100u)
SELECT
 codigo_producto,
 nombre,
 existencia
FROM producto
WHERE existencia < 100;
