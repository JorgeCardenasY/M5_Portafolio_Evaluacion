drop DATABASE IF EXISTS m5_portafolio;
CREATE DATABASE m5_portafolio;
USE m5_portafolio;

CREATE TABLE clientes
(
  cliente_id int         NOT NULL,
  nombre     VARCHAR(50) NOT NULL,
  telefono   VARCHAR(50) NOT NULL,
  email      VARCHAR(50) NULL,
  PRIMARY KEY (cliente_id)
);

CREATE TABLE empleado
(
  empleado_id   INT           NOT NULL,
  nombre        VARCHAR(50)   NOT NULL,
  salario       DECIMAL(10,2) NOT NULL,
  fecha_ingreso DATE          NOT NULL,
  PRIMARY KEY (empleado_id)
);

CREATE TABLE metodo_pago
(
  metodo_id     INT         NOT NULL,
  metodo_nombre VARCHAR(50) NOT NULL,
  activo        BOOLEAN     NOT NULL,
  PRIMARY KEY (metodo_id)
);

ALTER TABLE metodo_pago
  ADD CONSTRAINT UQ_metodo_id UNIQUE (metodo_id);

ALTER TABLE metodo_pago
  ADD CONSTRAINT UQ_metodo_nombre UNIQUE (metodo_nombre);

CREATE TABLE pedidos
(
  pedido_id   INT      NOT NULL AUTO_INCREMENT,
  fecha_hora  DATETIME NOT NULL,
  cliente_id  int      NOT NULL,
  producto_id INT      NOT NULL,
  empleado_id INT      NOT NULL,
  metodo_id   INT      NOT NULL,
  PRIMARY KEY (pedido_id)
);

ALTER TABLE pedidos
  ADD CONSTRAINT UQ_pedido_id UNIQUE (pedido_id);

CREATE TABLE productos
(
  producto_id INT         NOT NULL,
  nombre      VARCHAR(50) NOT NULL,
  categoria   VARCHAR(50) NOT NULL,
  PRIMARY KEY (producto_id)
);

ALTER TABLE productos
  ADD CONSTRAINT UQ_producto_id UNIQUE (producto_id);

ALTER TABLE productos
  ADD CONSTRAINT UQ_nombre UNIQUE (nombre);

ALTER TABLE pedidos
  ADD CONSTRAINT FK_clientes_TO_pedidos
    FOREIGN KEY (cliente_id)
    REFERENCES clientes (cliente_id);

ALTER TABLE pedidos
  ADD CONSTRAINT FK_productos_TO_pedidos
    FOREIGN KEY (producto_id)
    REFERENCES productos (producto_id);

ALTER TABLE pedidos
  ADD CONSTRAINT FK_empleado_TO_pedidos
    FOREIGN KEY (empleado_id)
    REFERENCES empleado (empleado_id);

ALTER TABLE pedidos
  ADD CONSTRAINT FK_metodo_pago_TO_pedidos
    FOREIGN KEY (metodo_id)
    REFERENCES metodo_pago (metodo_id);

INSERT INTO clientes (cliente_id, nombre, telefono, email) VALUES
(1, 'Juan Perez', '555-1234', 'pHdHx@example.com'),
(2, 'Maria Gomez', '555-5678', 'TbVYf@example.com'),
(3, 'Carlos Sanchez', '555-8765', 'qKf3o@example.com'),
(4, 'Ana Martinez', '555-4321', 'p9Pd3@example.com'),
(5, 'Luis Rodriguez', '555-6789', '3eOo8@example.com');

INSERT INTO productos (producto_id, nombre, categoria) VALUES
(1, 'Laptop', 'Electrónica'),
(2, 'Smartphone', 'Electrónica'),
(3, 'Tablet', 'Electrónica'),
(4, 'Cámara', 'Electrónica'),
(5, 'Auriculares', 'Electrónica'),
(6, 'Impresora', 'Impresión'),
(7, 'Monitor', 'Electrónica'),
(8, 'Teclado', 'Accesorios'),
(9, 'Ratón', 'Accesorios'),
(10, 'Disco Duro', 'Almacenamiento');

INSERT INTO pedidos (fecha_hora, cliente_id, producto_id) VALUES
('2023-10-01 10:00:00', 1, 1),
('2023-10-02 11:30:00', 2, 2),
('2023-10-03 14:15:00', 1, 3),
('2023-10-04 09:45:00', 1, 4),
('2023-10-05 16:20:00', 1, 5),
('2023-10-06 12:10:00', 5, 6),
('2023-10-07 13:50:00', 2, 7),
('2023-10-08 15:30:00', 2, 8),
('2023-10-09 10:25:00', 4, 9),
('2023-10-10 11:55:00', 5, 10),
('2023-10-11 14:05:00', 1, 1),
('2023-10-12 09:15:00', 2, 2),
('2023-10-13 16:45:00', 3, 3),
('2023-10-14 12:30:00', 1, 4),
('2023-10-15 13:20:00', 5, 5),
('2023-10-16 15:10:00', 1, 6),
('2023-10-17 10:40:00', 2, 7),
('2023-10-18 11:50:00', 2, 8),
('2023-10-19 14:30:00', 4, 9),
('2023-10-20 09:55:00', 5, 10);

SELECT * FROM clientes;
SELECT * FROM pedidos WHERE cliente_id = 1;

SELECT cliente_id, COUNT(*) AS total_pedidos
FROM pedidos
GROUP BY cliente_id;

SELECT c.nombre, p.fecha_hora, pr.nombre AS producto
FROM clientes c
JOIN pedidos p ON c.cliente_id = p.cliente_id
JOIN productos pr ON p.producto_id = pr.producto_id
WHERE c.cliente_id = 1;

SELECT * FROM productos WHERE categoria = 'Electrónica';
