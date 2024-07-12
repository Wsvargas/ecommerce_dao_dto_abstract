CREATE DATABASE ecommerce;

\connect ecommerce;

CREATE TABLE IF NOT EXISTS pedidos (
    id SERIAL PRIMARY KEY,
    usuario_id INT NOT NULL,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total DECIMAL(10, 2) NOT NULL,
    estado VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS detalles_pedidos (
    id SERIAL PRIMARY KEY,
    pedido_id INT REFERENCES pedidos(id),
    producto_id INT NOT NULL,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10, 2) NOT NULL
);

CREATE TABLE IF NOT EXISTS logs_transacciones (
    id SERIAL PRIMARY KEY,
    usuario_id INT NOT NULL,
    accion VARCHAR(255) NOT NULL,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO pedidos (usuario_id, total, estado) VALUES (1, 100.00, 'pendiente');
INSERT INTO detalles_pedidos (pedido_id, producto_id, cantidad, precio_unitario) VALUES (1, 1, 2, 50.00);
INSERT INTO logs_transacciones (usuario_id, accion) VALUES (1, 'Creación de pedido');
