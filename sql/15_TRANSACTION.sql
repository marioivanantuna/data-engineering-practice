USE DataEngineeringPractice;
GO

-- 1. Iniciar transacción
BEGIN TRANSACTION;

-- 2. Cambiar temporalmente el precio de un producto
UPDATE Productos
SET precio = 25000.00
WHERE id_producto = 101;

-- 3. Ver el cambio dentro de la transacción
SELECT
    id_producto,
    nombre_producto,
    precio
FROM Productos
WHERE id_producto = 101;

-- 4. Deshacer todos los cambios de la transacción
ROLLBACK;

-- 5. Verificar que regresó al valor original
SELECT
    id_producto,
    nombre_producto,
    precio
FROM Productos
WHERE id_producto = 101;