CREATE DATABASE escuela;

USE escuela;
CREATE TABLE alumnos (id INT PRIMARY KEY AUTO_INCREMENT, nombre VARCHAR(50), edad INT, carrera VARCHAR(50));

USE escuela;
INSERT INTO alumnos (nombre, edad, carrera) 
VALUES ('Mauricio Saenz', 19, 'Ingeniería en Sistemas');