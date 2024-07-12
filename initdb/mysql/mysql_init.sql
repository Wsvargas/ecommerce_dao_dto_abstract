CREATE DATABASE IF NOT EXISTS ecommerce;

USE ecommerce;

CREATE TABLE IF NOT EXISTS categorias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    descripcion TEXT
);

CREATE TABLE IF NOT EXISTS productos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10, 2) NOT NULL,
    categoria_id INT,
    FOREIGN KEY (categoria_id) REFERENCES categorias(id)
);

CREATE TABLE IF NOT EXISTS usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    contrasena VARCHAR(255) NOT NULL,
    rol ENUM('cliente', 'administrador') NOT NULL
);

INSERT INTO categorias (nombre, descripcion) VALUES ('Electrónica', 'Artículos de electrónica');
INSERT INTO productos (nombre, descripcion, precio, categoria_id) VALUES ('Laptop', 'Una laptop nueva', 1000.00, 1);
INSERT INTO usuarios (nombre, email, contrasena, rol) VALUES ('Admin', 'admin@example.com', 'admin_password', 'administrador');