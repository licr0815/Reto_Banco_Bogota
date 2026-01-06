CREATE TABLE reto.clientes (
cliente_id INT PRIMARY KEY COMMENT 'Identificacion de cliente',
nombre VARCHAR(100) COMMENT 'Nombre del cliente',
ciudad VARCHAR(50) COMMENT 'Ciudad',
fecha_registro DATE COMMENT 'Fecha en que se registro el cliente'
);