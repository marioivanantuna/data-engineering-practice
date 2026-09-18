USE DataEngineeringPractice;
GO

BEGIN TRY

    BEGIN TRANSACTION;

    -- 1. Cambio válido
    UPDATE Productos
    SET precio = 99999.00
    WHERE id_producto = 101;

    -- 2. Forzamos un error:
    -- id_producto 101 ya existe y es PRIMARY KEY
    INSERT INTO Productos (
        id_producto,
        nombre_producto,
        categoria,
        precio
    )
    VALUES (
        101,
        'Producto Duplicado',
        'Prueba',
        1000.00
    );

    -- Solo llegará aquí si todo salió bien
    COMMIT;

END TRY

BEGIN CATCH

    -- Si existe una transacción abierta, la deshacemos
    IF @@TRANCOUNT > 0
        ROLLBACK;

    SELECT
        ERROR_MESSAGE() AS mensaje_error;

END CATCH;
GO


-- Verificar que el UPDATE también se deshizo
SELECT
    id_producto,
    nombre_producto,
    precio
FROM Productos
WHERE id_producto = 101;