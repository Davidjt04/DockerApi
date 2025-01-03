-- Crear la base de datos
CREATE DATABASE IF NOT EXISTS proyectodocker;

-- Usar la base de datos
USE proyectodocker;

-- Crear la tabla users
CREATE TABLE IF NOT EXISTS kebab (
    idKebab  INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(45) NOT NULL,
    precio VARCHAR(45) NOT NULL
);

-- Insertar datos en la tabla users
INSERT INTO kebab (nombre, precio) VALUES ('Kebab de Pollo', '5.99');
INSERT INTO kebab (nombre, precio) VALUES ('Kebab de Ternera', '6.49');
INSERT INTO kebab (nombre, precio) VALUES ('Kebab Mixto', '6.99');