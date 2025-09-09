# 📑 Descripción de Acciones del Script SQL

Este script implementa la creación de una base de datos relacional, definiendo sus tablas, relaciones, inserción de datos iniciales y consultas de verificación.  

---

## 🗑️ 1. Eliminación y creación de la base de datos
- Elimina la base de datos `m5_portafolio` si existe.  
- Crea nuevamente la base de datos con el mismo nombre.  
- Selecciona la base de datos para su uso posterior.  

---

## 🛠️ 2. Creación de tablas y definición de esquemas

### 📋 Tabla `clientes`
- Contiene información de clientes con los campos:
  - `cliente_id` (PK, autoincremental)  
  - `nombre` (texto obligatorio)  
  - `telefono` (texto obligatorio)  
  - `email` (texto opcional)  

### 📋 Tabla `empleado`
- Registra los empleados con los campos:
  - `empleado_id` (PK, autoincremental)  
  - `nombre` (texto obligatorio)  
  - `salario` (decimal con dos decimales, obligatorio)  
  - `fecha_ingreso` (fecha obligatoria)  

### 📋 Tabla `metodo_pago`
- Define los métodos de pago disponibles:
  - `metodo_id` (PK, autoincremental)  
  - `metodo_nombre` (texto único, obligatorio)  
  - `activo` (booleano, valor por defecto: `TRUE`)  

### 📋 Tabla `productos`
- Almacena los productos:
  - `producto_id` (PK, autoincremental)  
  - `nombre` (texto único, obligatorio)  
  - `categoria` (texto obligatorio)  

### 📋 Tabla `pedidos`
- Representa las órdenes realizadas por los clientes:  
  - `pedido_id` (PK, autoincremental)  
  - `fecha_hora` (fecha y hora obligatoria)  
  - `cliente_id` (FK → `clientes`)  
  - `producto_id` (FK → `productos`)  
  - `empleado_id` (FK → `empleado`, permite `NULL`, elimina con `SET NULL`)  
  - `metodo_id` (FK → `metodo_pago`, permite `NULL`, elimina con `SET NULL`)  

- Relaciones definidas con claves foráneas y reglas de integridad referencial:  
  - Eliminación en cascada para clientes y productos.  
  - Eliminación con `SET NULL` para empleados y métodos de pago.  
  - Actualización en cascada en todos los casos.  

---

## 📥 3. Inserción de datos iniciales
- **Clientes**: Inserta 5 registros de ejemplo.  
- **Productos**: Inserta 10 productos en distintas categorías.  
- **Empleados**: Inserta 3 trabajadores con sus salarios y fechas de ingreso.  
- **Métodos de pago**: Inserta 3 formas de pago (Efectivo, Tarjeta, Transferencia).  
- **Pedidos**: Inserta 20 registros de órdenes, con combinaciones de cliente, producto, empleado y método de pago.  

---

## 🗑️ 4. Eliminación de un registro
- Se elimina el pedido con `pedido_id = 9`.  

---

## 📊 5. Consulta de verificación
- Se listan todos los registros existentes en la tabla `pedidos` para validar la integridad de los datos.  

---

👉 Este flujo asegura la **consistencia, integridad referencial y disponibilidad de datos de prueba** en la base de datos `m5_portafolio`.  
