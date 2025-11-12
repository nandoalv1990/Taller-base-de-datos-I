/*
Ejercicio 1: sintaxis básica en SQL 
Recomendable utilizar el shell de xampp
Pero se puede acceder desde Http://localhost/phpmyadmin
*/
-- CREACIÓN DE LA BD
CREATE DATABASE escuela;
--INDICAR A MARIABD QUE USAREMOS 'escuela'.
USE escuela;
-- CREACIÓN DE LA TABLA 'alumnos'
CREATE TABLE alumnos (id INT PRIMARY KEY AUTO_INCREMENT, nombre VARCHAR(50), edad INT, carrera VARCHAR(50));

--  Nota:
--   PRIMARY KEY: campo único que identifica cada registro.
--   AUTO_INCREMENT: incrementa el ID automáticamente.
--   VARCHAR(50): texto de máximo 50 caracteres.

USE escuela;
-- INSERTAR EN LA TABLA 'alumnos'.
INSERT INTO alumnos (nombre, edad, carrera) VALUES ('Mauricio Saenz', 19, 'Ingeniería en Sistemas');

-- NUEVO!
-- Insertar varios registros a la vez -> Prueba agregar a tus compañeros ;)

INSERT INTO alumnos (nombre, edad, carrera) 
VALUES ('Pepe1', 20, 'Ingeniería Industrial'), 
('Pepe2', 21, 'Ingeniería en Biotecnología'), 
('Pepe3', 22, 'Ingeniería Eléctrica'); -- Punto y coma -> ENTER fin de la instrucción

-- CONSULTAR DATOS (SELECT)
SELECT * FROM alumnos;

--  El asterisco (*) significa "todas las columnas"
--  Puedes seleccionar columnas específicas:
SELECT nombre, edad FROM alumnos;


-- FILTRAR DATOS CON WHERE
SELECT * FROM alumnos WHERE carrera = 'Ingeniería en Sistemas';
SELECT * FROM alumnos WHERE edad > 20;

--  Operadores comunes:
--   =   Igual
--   >   Mayor que
--   <   Menor que
--   >=  Mayor o igual que
--   <=  Menor o igual que
--   <>  Diferente


-- ORDENAR RESULTADOS
SELECT * FROM alumnos ORDER BY edad ASC;  -- Ascendente
SELECT * FROM alumnos ORDER BY edad DESC; -- Descendente


-- CONTAR REGISTROS
SELECT COUNT(*) AS total_alumnos FROM alumnos;
SELECT COUNT(*) AS sistemas FROM alumnos WHERE carrera = 'Ingeniería en Sistemas';


-- ACTUALIZAR DATOS
UPDATE alumnos SET edad = 21 WHERE nombre = 'Mauricio Saenz';

-- Nota:
--   Siempre usa WHERE para no modificar todos los registros por error.


-- ELIMINAR DATOS
DELETE FROM alumnos WHERE nombre = 'Pepe3';

-- ELIMINAR TODA LA TABLA O BASE DE DATOS!!!
-- DROP TABLE alumnos;
-- DROP DATABASE escuela;

-- AVANZDO !!
-- BONUS: CONDICIONES COMBINADAS
SELECT * FROM alumnos WHERE carrera = 'Ingeniería en Sistemas' AND edad >= 20;
SELECT * FROM alumnos WHERE carrera = 'Contaduría' OR carrera = 'Administración';


-- BONUS: CAMBIAR NOMBRE DE UNA COLUMNA (ALTER TABLE)
ALTER TABLE alumnos CHANGE carrera programa VARCHAR(50);

-- BONUS: AGREGAR UNA NUEVA COLUMNA
ALTER TABLE alumnos ADD email VARCHAR(80);

-- CONSULTAR DESCRIPCIÓN DE LA TABLA
DESCRIBE alumnos;

-- CONSULTA FINAL
SELECT * FROM alumnos;