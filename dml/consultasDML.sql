--
-- 📝 Se ha desarrollado el siguiente código comentado para responder la consulta relativa a lenguaje SQL:
--

-- 🗑️ 1. Eliminación y creación de la base de datos
-- Elimina la base de datos "m5_portafolio" si ya existe, para evitar errores al recrearla desde cero.
drop DATABASE IF EXISTS m5_portafolio;

-- Crea una nueva base de datos llamada "m5_portafolio".
CREATE DATABASE m5_portafolio;

-- Selecciona la base de datos recién creada para trabajar en ella.
USE m5_portafolio;

-- 🛠️ 2. Creación de tablas y definición de esquemas

-- 📋 Tabla "clientes":
-- Crea una tabla llamada "clientes" con los siguientes campos:
--   - cliente_id: Identificador único del cliente (entero, no nulo).
--   - nombre: Nombre del cliente (cadena de hasta 50 caracteres, no nulo).
--   - telefono: Teléfono del cliente (cadena de hasta 50 caracteres, no nulo).
--   - email: Correo electrónico del cliente (cadena de hasta 50 caracteres, puede ser nulo).
-- Se define "cliente_id" como clave primaria (PRIMARY KEY), lo que garantiza que cada cliente tenga un identificador único.
CREATE TABLE clientes (
    cliente_id int NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    telefono VARCHAR(50) NOT NULL,
    email VARCHAR(50) NULL,
    PRIMARY KEY (cliente_id)
);

-- 📋 Tabla "pedidos":
-- Crea una tabla llamada "pedidos" con los siguientes campos:
--   - pedido_id: Identificador único del pedido (entero, autoincremental, no nulo).
--   - fecha_hora: Fecha y hora del pedido (formato DATETIME, no nulo).
--   - cliente_id: Identificador del cliente que realizó el pedido (entero, no nulo).
--   - producto_id: Identificador del producto pedido (entero, no nulo).
-- Se define "pedido_id" como clave primaria.
CREATE TABLE pedidos (
    pedido_id INT NOT NULL AUTO_INCREMENT,
    fecha_hora DATETIME NOT NULL,
    cliente_id int NOT NULL,
    producto_id INT NOT NULL,
    PRIMARY KEY (pedido_id)
);
-- Se  añade una restricción UNIQUE a "pedido_id" para asegurar que sólo existan registros unicos que identifiquen a los pedidos.
ALTER TABLE pedidos ADD CONSTRAINT UQ_pedido_id UNIQUE (pedido_id);

-- 📋 Tabla "productos":
-- Crea una tabla llamada "productos" con los siguientes campos:
--   - producto_id: Identificador único del producto (entero, no nulo).
--   - nombre: Nombre del producto (cadena de hasta 50 caracteres, no nulo).
--   - categoria: Categoría del producto (cadena de hasta 50 caracteres, no nulo).
-- Se define "producto_id" como su clave primaria.
CREATE TABLE productos (
    producto_id INT NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    PRIMARY KEY (producto_id)
);

-- Añade restricciones UNIQUE para evitar duplicados en "producto_id" y "nombre".
ALTER TABLE productos
ADD CONSTRAINT UQ_producto_id UNIQUE (producto_id);

ALTER TABLE productos ADD CONSTRAINT UQ_nombre UNIQUE (nombre);

--
-- 🔗 3. Definición de relaciones entre tablas (claves primarias y foráneas)
--
-- Establece una relación entre la tabla "pedidos" y "clientes":
--   - "cliente_id" en "pedidos" debe existir en "cliente_id" de "clientes".
ALTER TABLE pedidos
ADD CONSTRAINT FK_clientes_TO_pedidos FOREIGN KEY (cliente_id) REFERENCES clientes (cliente_id);
-- Establece una relación entre la tabla "pedidos" y "productos":
--   - "producto_id" en "pedidos" debe existir en "producto_id" de "productos".
ALTER TABLE pedidos
ADD CONSTRAINT FK_productos_TO_pedidos FOREIGN KEY (producto_id) REFERENCES productos (producto_id);

--
-- 📥 4. Inserción de datos en las tablas
--

-- 📥 Inserta 5 registros en la tabla "clientes":
-- Cada registro contiene: cliente_id, nombre, teléfono y email.
INSERT INTO
    clientes (
        cliente_id,
        nombre,
        telefono,
        email
    )
VALUES (
        1,
        'Juan Perez',
        '555-1234',
        'pHdHx@example.com'
    ),
    (
        2,
        'Maria Gomez',
        '555-5678',
        'TbVYf@example.com'
    ),
    (
        3,
        'Carlos Sanchez',
        '555-8765',
        'qKf3o@example.com'
    ),
    (
        4,
        'Ana Martinez',
        '555-4321',
        'p9Pd3@example.com'
    ),
    (
        5,
        'Luis Rodriguez',
        '555-6789',
        '3eOo8@example.com'
    );

-- 📥 Inserta 10 registros en la tabla "productos":
-- Cada registro contiene: producto_id, nombre y categoría.
INSERT INTO
    productos (
        producto_id,
        nombre,
        categoria
    )
VALUES (1, 'Laptop', 'Electrónica'),
    (
        2,
        'Smartphone',
        'Electrónica'
    ),
    (3, 'Tablet', 'Electrónica'),
    (4, 'Cámara', 'Electrónica'),
    (
        5,
        'Auriculares',
        'Electrónica'
    ),
    (6, 'Impresora', 'Impresión'),
    (7, 'Monitor', 'Electrónica'),
    (8, 'Teclado', 'Accesorios'),
    (9, 'Ratón', 'Accesorios'),
    (
        10,
        'Disco Duro',
        'Almacenamiento'
    );

-- 📥 Inserta 14 registros en la tabla "pedidos":
-- Cada registro contiene: fecha_hora, cliente_id y producto_id.
-- Nótese que se ha forzado que los registros de pedidos contengan frecuencias acumuladas disímiles entre clientes.
INSERT INTO
    pedidos (
        fecha_hora,
        cliente_id,
        producto_id
    )
VALUES ('2023-10-01 10:00:00', 1, 1),
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

-- 📥 Actualiza datos de los clientes en tabla clientes:

-- Actualiza el teléfono y email del cliente con cliente_id = 3.
UPDATE clientes
SET
    telefono = '555-9999',
    email = 'oK4m3@example.com'
WHERE
    cliente_id = 3;

-- De la tabla 'pedidos' elimina el registro con pedido_id = 9.
DELETE FROM pedidos
WHERE pedido_id = 9;

SELECT * FROM pedidos;