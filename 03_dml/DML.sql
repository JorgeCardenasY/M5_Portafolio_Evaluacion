DROP DATABASE IF EXISTS m5_portafolio;
CREATE DATABASE m5_portafolio;
USE m5_portafolio;

CREATE TABLE clientes
(
  cliente_id INT NOT NULL AUTO_INCREMENT,
  nombre     VARCHAR(50) NOT NULL,
  telefono   VARCHAR(50) NOT NULL,
  email      VARCHAR(50) NULL,
  PRIMARY KEY (cliente_id)
);

CREATE TABLE empleado
(
  empleado_id   INT NOT NULL AUTO_INCREMENT,
  nombre        VARCHAR(50) NOT NULL,
  salario       DECIMAL(10,2) NOT NULL,
  fecha_ingreso DATE NOT NULL,
  PRIMARY KEY (empleado_id)
);

CREATE TABLE metodo_pago
(
  metodo_id     INT NOT NULL AUTO_INCREMENT,
  metodo_nombre VARCHAR(50) NOT NULL UNIQUE,
  activo        BOOLEAN NOT NULL DEFAULT TRUE,
  PRIMARY KEY (metodo_id)
);

CREATE TABLE productos
(
  producto_id INT NOT NULL AUTO_INCREMENT,
  nombre      VARCHAR(50) NOT NULL UNIQUE,
  categoria   VARCHAR(50) NOT NULL,
  PRIMARY KEY (producto_id)
);

CREATE TABLE pedidos
(
  pedido_id   INT NOT NULL AUTO_INCREMENT,
  fecha_hora  DATETIME NOT NULL,
  cliente_id  INT NOT NULL,
  producto_id INT NOT NULL,
  empleado_id INT NULL,
  metodo_id   INT NULL,
  PRIMARY KEY (pedido_id),
  CONSTRAINT FK_clientes_TO_pedidos FOREIGN KEY (cliente_id) REFERENCES clientes (cliente_id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT FK_productos_TO_pedidos FOREIGN KEY (producto_id) REFERENCES productos (producto_id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT FK_empleado_TO_pedidos FOREIGN KEY (empleado_id) REFERENCES empleado (empleado_id) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT FK_metodo_pago_TO_pedidos FOREIGN KEY (metodo_id) REFERENCES metodo_pago (metodo_id) ON DELETE SET NULL ON UPDATE CASCADE
);

INSERT INTO clientes (nombre, telefono, email)
VALUES 
  ('Juan Perez', '555-1234', 'pHdHx@example.com'),
  ('Maria Gomez', '555-5678', 'TbVYf@example.com'),
  ('Carlos Sanchez', '555-9999', 'oK4m3@example.com'),
  ('Ana Martinez', '555-4321', 'p9Pd3@example.com'),
  ('Luis Rodriguez', '555-6789', '3eOo8@example.com');

INSERT INTO productos (nombre, categoria)
VALUES 
  ('Laptop', 'Electrónica'),
  ('Smartphone', 'Electrónica'),
  ('Tablet', 'Electrónica'),
  ('Cámara', 'Electrónica'),
  ('Auriculares', 'Electrónica'),
  ('Impresora', 'Impresión'),
  ('Monitor', 'Electrónica'),
  ('Teclado', 'Accesorios'),
  ('Ratón', 'Accesorios'),
  ('Disco Duro', 'Almacenamiento');

INSERT INTO empleado (nombre, salario, fecha_ingreso)
VALUES
  ('Pedro López', 950000, '2021-01-10'),
  ('Marta Rivas', 850000, '2022-03-15'),
  ('José Fernández', 1000000, '2020-07-20');

INSERT INTO metodo_pago (metodo_nombre, activo)
VALUES
  ('Efectivo', TRUE),
  ('Tarjeta Crédito', TRUE),
  ('Transferencia', TRUE);

INSERT INTO pedidos (fecha_hora, cliente_id, producto_id, empleado_id, metodo_id)
VALUES 
  ('2023-10-01 10:00:00', 1, 1, 1, 1),
  ('2023-10-02 11:30:00', 2, 2, 2, 2),
  ('2023-10-03 14:15:00', 1, 3, 1, 3),
  ('2023-10-04 09:45:00', 1, 4, 3, 1),
  ('2023-10-05 16:20:00', 1, 5, 2, 2),
  ('2023-10-06 12:10:00', 5, 6, 1, 1),
  ('2023-10-07 13:50:00', 2, 7, 3, 2),
  ('2023-10-08 15:30:00', 2, 8, 1, 3),
  ('2023-10-09 10:25:00', 4, 9, 2, 1),
  ('2023-10-10 11:55:00', 5, 10, 3, 2),
  ('2023-10-11 14:05:00', 1, 1, 1, 3),
  ('2023-10-12 09:15:00', 2, 2, 3, 1),
  ('2023-10-13 16:45:00', 3, 3, 2, 2),
  ('2023-10-14 12:30:00', 1, 4, 1, 1),
  ('2023-10-15 13:20:00', 5, 5, 3, 2),
  ('2023-10-16 15:10:00', 1, 6, 1, 3),
  ('2023-10-17 10:40:00', 2, 7, 2, 1),
  ('2023-10-18 11:50:00', 2, 8, 3, 2),
  ('2023-10-19 14:30:00', 4, 9, 1, 3),
  ('2023-10-20 09:55:00', 5, 10, 2, 1);

DELETE FROM pedidos WHERE pedido_id = 9;

SELECT * FROM pedidos;
