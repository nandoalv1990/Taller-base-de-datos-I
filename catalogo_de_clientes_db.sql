CREATE TABLE Ciudad(
    codigo_postal VARCHAR(10) PRIMARY KEY,
    nombre VARCHAR(50),
    pais VARCHAR(50),
    region VARCHAR(50),
    telefono VARCHAR(20),
    codigo_oficina VARCHAR(10)
);

CREATE TABLE Empleado (
    id_empleado INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nombre VARCHAR(50),
    apellido1 VARCHAR(50),
    apellido2 VARCHAR(50),
    codigo_oficina VARCHAR(10),
    codigo_representante_ventas INT,
    FOREING KEY (codigo_oficina) REFERENCES Ciudad(codigo_oficina)
);

CREATE TABLE Cliente (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nombre VARCHAR(50),
    codigo_representante_ventas INT,
    codigo_postal VARCHAR(10),
    FOREING KEY (codigo_representante_ventas) REFERENCES Empleado(codigo_representante_ventas),
    FOREING KEY (codigo_postal) REFERENCES Ciudad(codigo_postal)
);

-----------------------------------------------------------------------------------

INSERT INTO Ciudad (codigo_postal, nombre, pais, region,telefono, codigo_oficina)
VALUES
('28001','Madrid','España','Madrid', '+34 915 123 456', 'MAD-ES'),
('08001','Barcelona','España','Cataluña','+34 936 123 456', 'BCN-ES'),
('75001', 'Paris', 'Francia', 'louvre', '+33 1 12 34 56 78', 'PAR-FR');

INSERT INTO Empleado (nombre,apellido1, apellido2, codigo_oficina, codigo_representante_ventas),
VALUES
('Laura', 'García', 'López', 'MAD-ES', 12),
('Carlos', 'Pérez', 'Alvarado','BCN-ES',34),
('Ana', 'Sánchez', 'Gómez', 'PAR-FR', 74);

INSERT INTO Cliente (nombre, codigo_representante_ventas, codigo_postal)
VALUES
('Cliente Uno S.A.', 12, '28001'),
('Cliente Dos S.A.', 34, '08001'),
('Cliente Tres S.A.', 74, '75001'),
('Cliente Cuatro S.A.',34,'08001')

UPDATE Empleado
SET apellido1 = 'Núñez'
WHERE codigo_representante_ventas = 12;

UPDATE Cliente
SET codigo_postal = '28002'
WHERE nombre = 'Cliente Uno S.A.';

DELETE FORM Cliente
WHERE nombre = 'Cliente Cuatro S.A.'

DELETE FROM Cliente
WHERE codigo_representante_ventas = 12;

DELETE FROM Empleado
WHERE codigo_representante_ventas = 12;

------------------------------------------------------------------------------------------

SELECT *
FROM Empleado
WHERE codigo_oficina = 'MAD-ES';

SELECT *
FROM Cliente
WHERE codigo_representante_ventas = 12;

SELECT
cl.nombre AS nombre_cliente,
ci.nombre AS ciudad,
ci.pais,
emp.nombre AS nombre_representante,
emp. apellido1,
emp. apellido2
FROM Cliente cl
JOIN Empleado emp ON cl.codigo_representante_ventas = emp.codigo_representante_ventas
JOIN Ciudad ci ON cl.codigo_postal = ci.codigo_postal
WHERE emp.codigo_representante_ventas = 74;

SELECT
emp.codigo_representante_ventas,
emp.nombre AS nombre_representante,
emp.apellido1,
COUNT (cl.id_cliente) AS total_clientes
FROM Empleado emp
LEFT JOIN Cliente cl ON cl.codigo_representante_ventas = emp.codigo_representante_ventas
GROUP BY emp.codigo_representante_ventas, emp.nombre, emp.apellido1
ORDER BY total_clientes DES;

SELECT
ci.ciudad AS ciudad,
COUNT (cl.id_cliente) AS total_clientes
FROM Cliente cl
JOIN Ciudad ci ON cl.codigo_postal = ci.codigo_postal
GROUP BY ci.nombre
ORDER BY total_clientes DESC;