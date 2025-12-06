/*
La universidad está implementando un sistema para administrar los libros, autores, y los préstamos de libros que hacen los alumnos.

Debes crear una base de datos llamada biblioteca que permita:
Registrar autores y libros.
Registrar alumnos que piden libros.
Registrar los préstamos de libros.
Consultar información combinada usando consultas complejas.

*/

CREATE DATABASE biblioteca_db;
USE biblioteca_db;

CREATE TABLE autores (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    nacionalidad VARCHAR(50)
);

CREATE TABLE libros (
    id INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(100) NOT NULL,
    anio_publicacion INT,
    autor_id INT,
    FOREIGN KEY (autor_id) REFERENCES autores(id)
);

CREATE TABLE alumnos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    carrera VARCHAR(50),
    edad INT
);

CREATE TABLE prestamos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    fecha_prestamo DATE,
    fecha_devolucion DATE,
    alumno_id INT,
    libro_id INT,
    FOREIGN KEY (alumno_id) REFERENCES alumnos(id),
    FOREIGN KEY (libro_id) REFERENCES libros(id)
);

-- INSERTAR DATOS

INSERT INTO autores (nombre, nacionalidad) VALUES 
('Gabriel García Márquez', 'Colombia'),
('Jane Austen', 'Reino Unido'),
('Julio Verne', 'Francia');

INSERT INTO libros (titulo, anio_publicacion, autor_id) VALUES 
('Cien años de soledad', 1967, 1),
('Orgullo y prejuicio', 1813, 2),
('Veinte mil leguas de viaje submarino', 1870, 3);

INSERT INTO alumnos (nombre, carrera, edad) VALUES
('Inserta tu nombre aquí', 'Ingeniería en sistemas', 18),
('Inserta nombre aquí', 'Biotecnología', 18),
('Inserta nombre aquí', 'Administración', 18);

INSERT INTO prestamos (fecha_prestamo, fecha_devolucion, alumno_id, libro_id) VALUES
('2025-01-15', '2025-02-15', 1, 1),
('2025-01-20', '2025-02-20', 2, 2),
('2025-01-25', '2025-02-25', 3, 3);

-- CONSULTAS

-- 1. LISTAR TODOS LOS LIBROS CON SUS AUTORES
SELECT libros.titulo, autores.nombre AS autor
FROM libros
JOIN autores ON libros.autor_id = autores.id;   

-- 2. LISTAR TODOS LOS PRÉSTAMOS CON NOMBRES DE ALUMNOS Y TÍTULOS DE LIBROS
SELECT alumnos.nombre AS alumno, libros.titulo AS libro, prestamos.fecha_prestamo, prestamos.fecha_devolucion
FROM prestamos
JOIN alumnos ON prestamos.alumno_id = alumnos.id
JOIN libros ON prestamos.libro_id = libros.id;          

-- 3. LISTAR AUTORES Y LA CANTIDAD DE LIBROS QUE HAN ESCRITO
SELECT autores.nombre AS autor, COUNT(libros.id) AS cantidad_libros
FROM autores
LEFT JOIN libros ON autores.id = libros.autor_id
GROUP BY autores.id;    

-- CONSULTAS AVANZADAS

-- 4. LISTAR ALUMNOS QUE HAN PEDIDO MÁS DE UN LIBRO
SELECT alumnos.nombre AS alumno, COUNT(prestamos.id) AS cantidad_prestamos
FROM alumnos
JOIN prestamos ON alumnos.id = prestamos.alumno_id
GROUP BY alumnos.id
HAVING COUNT(prestamos.id) > 1;                         

-- 5. LISTAR LIBROS QUE NO HAN SIDO PRESTADOS
SELECT libros.titulo AS libro
FROM libros
LEFT JOIN prestamos ON libros.id = prestamos.libro_id
WHERE prestamos.id IS NULL;         

-- 6. LISTAR TODOS LOS PRÉSTAMOS REALIZADOS EN ENERO DE 2025
SELECT alumnos.nombre AS alumno, libros.titulo AS libro, prestamos.fecha_prestamo
FROM prestamos
JOIN alumnos ON prestamos.alumno_id = alumnos.id
JOIN libros ON prestamos.libro_id = libros.id
WHERE MONTH(prestamos.fecha_prestamo) = 1 AND YEAR(prestamos.fecha_prestamo) = 2025;    

-- 7. LISTAR AUTORES Y SUS LIBROS ORDENADOS POR AÑO DE PUBLICACIÓN
SELECT autores.nombre AS autor, libros.titulo AS libro, libros.anio_publicacion
FROM autores
JOIN libros ON autores.id = libros.autor_id
ORDER BY libros.anio_publicacion;       

-- 8. LISTAR ALUMNOS Y LA CANTIDAD DE LIBROS QUE HAN PEDIDO
SELECT alumnos.nombre AS alumno, COUNT(prestamos.id) AS cantidad_libros_pedidos
FROM alumnos
LEFT JOIN prestamos ON alumnos.id = prestamos.alumno_id
GROUP BY alumnos.id;

-- 9. LISTAR TODOS LOS PRÉSTAMOS CON DETALLES COMPLETOS
SELECT 
    prestamos.id,
    alumnos.nombre AS alumno,
    libros.titulo AS libro,
    prestamos.fecha_prestamo,
    prestamos.fecha_devolucion
FROM prestamos
INNER JOIN alumnos ON prestamos.alumno_id = alumnos.id
INNER JOIN libros ON prestamos.libro_id = libros.id;

-- 10. LISTAR LIBROS ACTUALMENTE PRESTADOS (SIN DEVOLVER)
SELECT 
    alumnos.nombre AS alumno,
    libros.titulo AS libro,
    prestamos.fecha_prestamo
FROM prestamos
JOIN alumnos ON prestamos.alumno_id = alumnos.id
JOIN libros ON prestamos.libro_id = libros.id
WHERE prestamos.fecha_devolucion IS NULL;






