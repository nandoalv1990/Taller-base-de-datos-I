-- CREAR LA BASE DE DATOS
CREATE DATABASE universidad_db;
-- USAR LA BASE DE DATOS
USE universidad_db;

-- TABLA MATERIAS
CREATE TABLE materias (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50),
    creditos INT,
    profesor VARCHAR(50)
);

-- INSERTAR NUEVOS DATOS
INSERT INTO materias (nombre, creditos, profesor)
VALUES
('Programación', 8, 'Carlos Ramirez'),
('Base de datos', 7, 'Laura García'),
('Redes', 6, 'Mauricio Saenz'),
('Matemáticas Discretas', 8, 'Pedro Torres'),
('Sistemas Operativos', 7, 'Ana Gómez');

-- TABLA ALUMNOS
CREATE TABLE alumnos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50),
    edad INT,
    materia_id INT
);

-- INSERTAR NUEVOS DATOS
INSERT INTO alumnos (nombre, edad, materia_id)
VALUES
('José Lopez', 19, 1),
('Maria Pérez', 20, 2),
('Sandra Torres', 21, 3),
('Luis Aguilar', 22, 4),
('Andrea Martínez', 19, 5);

-- CONSULTAS 
-- MOSTRAR TODOS LOS REGISTROS DE AMBAS TABLAS
SELECT * FROM materias;
SELECT * FROM alumnos;

-- MOSTRAR SOLO LOS NOMBRES Y EDADES
SELECT nombre, edad, FROM alumnos;

-- MOSTRAR LOS ALUMNOS MAYORES DE 20 AÑOS
SELECT * FROM alumnos WHERE  edad > 20;

-- MOSTRAR MATERIAS CON MÁS DE 7 CRÉDITOS
SELECT * FROM materias WHERE creditos > 7;

-- ORDENAR MATERIAS POR CREDITOS DE MAYOR A MENOR
SELECT * FROM materias ORDER BY creditos DESC;

-- CONTAR CUÁNTAS MATERIAS HAY REGISTRADAS
SELECT COUNT(*) AS total_materias FROM materias;

-- COMBIAR EL NOMBRE DEL PROFE DE "SISTEMAS OPERATIVOS" POR JOSÉ HERNANDEZ
UPDATE materias SET profesor = 'José Hernández' WHERE nombre = 'Sistemas Operativos';

-- ELIMINAR AL ALUMNO "SANDRA TORRES"
DELETE FROM alumnos WHERE nombre = 'Sandra Torres';

-- BONUS! (AVANZADO)
-- MOSTRAR QUÉ MATERIA CURSA CADA ALUMNO (RELACIÓN SIMPLE)
SELECT alumnos.nombre AS alumno, materias.nombre AS materia
FROM alumnos 
JOIN materias ON alumnos.materia_id = materias.id