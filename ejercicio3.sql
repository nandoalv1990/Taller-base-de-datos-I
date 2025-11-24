/*
La universidad desea crear un sistema que almacene las calificaciones de los alumnos en cada materia.


Tu tarea es:

Crear la base de datos control_escolar.

Crear las tablas alumnos, materias y calificaciones.

Insertar registros de ejemplo.

Realizar consultas que relacionen las tres tablas y obtengan información útil para el docente.
*/
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

-- MOSTRAR ÚNICAMENTE LAS CALIFICACIONES DE LA CARRERA "INGENIERÍIA EN SISTEMAS"
SELECT alumnos.nombre, materiias.nombre, calificaicones.calificacion
FROM calificaciones
JOIN alumnos ON calificaciones.alumno_id = alumnos.id
JOIN materias ON calificaciones.materia_id = materias.id
WHERE alumnos.carrera = 'Ingeniería en sistemas';

-- Calcular el promedio de calificaciones por materia
SELECT materias.nombre AS Materia, AVG(calificaciones.calificacion) AS promedio
FROM calificaciones
JOIN materias ON calificaciones.materia_id = materias.id
GROUP BY materias.nombre;

-- CONNTAR CUÁNTOS ALUMNOS HAN CURSADO CADA MATERIA
SELECT materias.nombre AS Materia, COUNT(calificaciones.alumno_id) AS total_alumnos
FROM calificaciones
JOIN materias ON calificaciones.materia_id = materias.id
GROUP BY materias.nombre;

-- MOSTRAR LAS MATERIAS CON PROMEDIO MAYOR O IGUAL A 9.0
SELECT materias.nombre AS Materia, AVG(calificaciones.calificacion) AS Promedio
FROM calificaciones
JOIN materias ON calificaciones.materia_id = materias.id
GROUP BY materias.nombre
HAVING Promedio >= 9.0;

-- CAMBIAR LA CALIFICACIÓN DE "CARLOS PÉREZ" EN "PROGRAMACIÓN I" A 8.0
UPDATE calificaciones
SET calificacion = 8.0
WHERE alumno_id = 2 AND materia_id = 1;

-- ELIMINAR LA MATERIA "MATEMÁTICAS DISCRETAS" Y VERIFICAR REGISTROS
DELETE FROM materias WHERE nombre = 'Matemáticas Discretas';
SELECT * FROM materias;

-- AGREGAR UNA NUEVA COLUMNA "SEMESTRE" A LA TABLA MATERIAS
ALTER TABLE materias ADD semestre INT;

-- BONUS!
-- MOSTRAR EL PROMEDIO GENERAL POR ALUMNO, ORDENADO DE MAYOR A MENOR
SELECT alumnos.nombre AS Alumno, AVG(calificaciones.calificacion) AS Promedio_General
FROM calificaciones
JOIN alumnos ON calificaciones.alumno_id = alumnos.id
GROUP BY alumnos.nombre
ORDER BY Promedio_General DESC;

/*
Conceptos clave:
| Habilidad                     | Comandos involucrados                    |
| ----------------------------- | ---------------------------------------- |
| Relaciones entre tablas       | `JOIN`                                   |
| Agregaciones y estadísticas   | `AVG()`, `COUNT()`, `GROUP BY`, `HAVING` |
| Actualización y mantenimiento | `UPDATE`, `DELETE`, `ALTER TABLE`        |
| Presentación de resultados    | `ORDER BY`, `AS` (alias)                 |
*/