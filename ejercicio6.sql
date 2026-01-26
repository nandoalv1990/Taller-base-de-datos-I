/* 
Ejercicio 6 - 17 de enero del 2026
Problema integrador (actividad en clase - no Teams): Tienda de computadoras.

Contexto: 

Una tienda de computadoras desea desarrollar un sistema sencillo para llevar el control de: 

- Clientes 

- Computadoras (laptops / PCs) 

- Marcas 

- Ventas de computadoras 
*/

CREATE DATABASE tienda; 

USE tienda; 

CREATE TABLE clientes ( 

 id_cliente INT PRIMARY KEY AUTO_INCREMENT, 

 nombre VARCHAR(50) 

); 

CREATE TABLE marcas ( 

 id_marca INT PRIMARY KEY AUTO_INCREMENT, 

 nombre VARCHAR(50) 

); 

CREATE TABLE computadoras ( 

 id_computadora INT PRIMARY KEY AUTO_INCREMENT, 

 modelo VARCHAR(50), 

 precio DECIMAL(10,2), 

 id_marca INT, 

 FOREIGN KEY (id_marca) REFERENCES marcas(id_marca) 

); 

CREATE TABLE ventas ( 

 id_venta INT PRIMARY KEY AUTO_INCREMENT, 

 id_cliente INT, 

 id_computadora INT, 

 fecha_venta DATE, 

 FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente), 

 FOREIGN KEY (id_computadora) REFERENCES computadoras(id_computadora) 

); 

-- Consultas

SELECT computadoras.modelo, marcas.nombre AS marca 

FROM computadoras 

JOIN marcas ON computadoras.id_marca = marcas.id_marca; 

---

SELECT clientes.nombre AS cliente, computadoras.modelo AS computadora, ventas.fecha_venta 

FROM ventas 

JOIN clientes ON ventas.id_cliente = clientes.id_cliente 

JOIN computadoras ON ventas.id_computadora = computadoras.id_computadora; 

---

SELECT computadoras.modelo 

FROM ventas 

JOIN computadoras ON ventas.id_computadora = computadoras.id_computadora; 

---

SELECT DISTINCT clientes.nombre 

FROM ventas 

JOIN clientes ON ventas.id_cliente = clientes.id_cliente; 

---

SELECT computadoras.modelo 

FROM computadoras 

JOIN marcas ON computadoras.id_marca = marcas.id_marca 

WHERE marcas.nombre = 'Dell'; 

---

SELECT * 

FROM ventas 

ORDER BY fecha_venta DESC; 

---

SELECT clientes.nombre, COUNT(ventas.id_venta) AS total_compras 

FROM clientes 

LEFT JOIN ventas ON ventas.id_cliente = clientes.id_cliente 

GROUP BY clientes.id_cliente, clientes.nombre; 