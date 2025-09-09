# 📄 Documentación del código SQL

## 🗑️ 1. Eliminación y creación de la base de datos
- Elimina la base de datos "m5_portafolio" si ya existe, para evitar errores al recrearla desde cero.  
- Crea una nueva base de datos llamada "m5_portafolio".  
- Selecciona la base de datos recién creada para trabajar en ella.  

---

## 🛠️ 2. Creación de tablas y definición de esquemas

### 📋 Tabla "clientes":
- Crea una tabla llamada "clientes" con los siguientes campos:  
  - `cliente_id`: Identificador único del cliente (entero, no nulo).  
  - `nombre`: Nombre del cliente (cadena de hasta 50 caracteres, no nulo).  
  - `telefono`: Teléfono del cliente (cadena de hasta 50 caracteres, no nulo).  
  - `email`: Correo electrónico del cliente (cadena de hasta 50 caracteres, puede ser nulo).  
- Se define `cliente_id` como clave primaria (PRIMARY KEY).  

---

## 📥 4. Inserción de datos en las tablas

### 📥 Inserta 5 registros en la tabla "clientes":
- Cada registro contiene: cliente_id, nombre, teléfono y email.  

### 📥 Inserta 10 registros en la tabla "productos":
- Cada registro contiene: producto_id, nombre y categoría.  

### 📥 Inserta registros en la tabla "pedidos":
- Cada registro contiene: fecha_hora, cliente_id y producto_id.  
- Nótese que se ha forzado que los registros de pedidos contengan frecuencias acumuladas disímiles entre clientes.  

---

## ⚙️ Modificaciones posteriores

- **Modificar correos electrónicos** para que sean NOT NULL en la tabla `clientes`.  
- **Eliminar la tabla pedidos con método cascada** (se intentó, pero MySQL no lo aplicó como en la documentación oficial).  
- **Eliminar la columna `email` de la tabla clientes.**  
- **Truncar la tabla pedidos.**  
