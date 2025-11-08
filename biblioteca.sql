--Tabla de autores

CREATE TABLE Autores (
    id INTEGER PRIMARY KEY,
    nombre TEXT, 
    nacionalidad TEXT

);

--Tabla de libros

CREATE TABLE Libros (
    id INTEGER PRIMARY KEY,
    titulo TEXT,
    editorial TEXT,
    area TEXT,
    autor_id INTEGER,
    FOREING KEY (autor_id) REFERENCES
);

--Tabla de estudiantes
CREATE TABLE Estudiantes (
    id INTEGER PRIMARY KEY,
    nombre TEXT, 
    edad TEXT,
    apellido TEXT,
    carrera TEXT,

);

--Tabla de prestamos
CREATE TABLE Prestamos (
    id INTEGER PRIMARY KEY,
    libro_id INTEGER,
    estudiante_id INTEGER,
    fecha_prestamo TEXT,
    fecha_devolucion TEXT,
    FOREING KEY (libro_id) REFERENCES

);