-- CREACÍON DE LA BASE DE DATOS
CREATE DATABASE control_escolar;
-- USAR LA BASE DE DATOS
USE control_escolar;
-- CREACIÓN DE TABLAS
CREATE TABLE alumnos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50),
    edad INT,
    carrera VARCHAR(50)
);

CREATE TABLE materias (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50),
    creditos INT
);

CREATE TABLE calificaciones (
    id INT PRIMARY KEY AUTO_INCREMENT,
    alumno_id INT,
    materia_id INT,
    calificacion DECIMAL(4,2)
);
-- DATOS
INSERT INTO alumnos (nombre, edad, carrera) VALUES
('María López', 20, 'Ingeniería en Sistemas'),
('Carlos Pérez', 22, 'Administración'),
('Laura García', 21, 'Contaduría'),
('José Hernández', 19, 'Ingeniería en Sistemas');

INSERT INTO materias (nombre, creditos) VALUES
('Programación I', 8),
('Bases de Datos', 7),
('Matemáticas Discretas', 8);

INSERT INTO calificaciones (alumno_id, materia_id, calificacion) VALUES
(1, 1, 9.5),
(1, 2, 8.0),
(2, 1, 7.5),
(3, 3, 8.8),
(4, 1, 9.0),
(4, 2, 9.2);
-- CONSULTAS

-- MOSTRAR TODOS LOS ALUMNOS CON SUS CALIFICACIONES Y MATERIA CORRESPONDIENTE
SELECT  alumnos.nombre AS Alumno, materias.nombre AS Materia, calificaciones.calificación
FROM calificaciones
JOIN alumnos ON calificaciones.alumno_id = alumno_id
JOIN materias ON calificaciones.materia_id = materias.id;

-- 