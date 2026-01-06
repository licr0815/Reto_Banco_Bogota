CREATE TABLE reto.movimientos_clientes (
id_transaccion PRIMARY KEY  INT COMMENT 'Numero de Identificacion del movimiento',
cliente_id INT COMMENT 'Identificacion de cliente',
nombre VARCHAR(100) COMMENT 'Nombre del cliente',
ciudad VARCHAR(50) COMMENT 'Ciudad',
fecha_registro DATE COMMENT 'Fecha en que se registro el cliente',
monto NUMERIC COMMENT 'Monto del movimiento',
fecha DATE COMMENT 'Fecha en que se registro el movimiento'
);
