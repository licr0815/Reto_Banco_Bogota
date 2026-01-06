CREATE TABLE reto.movimientos_clientes (
cliente_id INT PRIMARY KEY COMMENT 'Identificacion de cliente',
nombre VARCHAR(100) COMMENT 'Nombre del cliente',
ciudad VARCHAR(50) COMMENT 'Ciudad',
fecha_registro DATE COMMENT 'Fecha en que se registro el cliente',
id_transaccion INT COMMENT 'Numero de Identificacion del movimiento',
monto NUMERIC COMMENT 'Monto del movimiento',
fecha DATE COMMENT 'Fecha en que se registro el movimiento'
);