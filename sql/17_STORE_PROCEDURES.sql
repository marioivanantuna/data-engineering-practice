USE DataEngineeringPractice;
GO

CREATE OR ALTER PROCEDURE actualizar_precio_seguro
    @id_producto INT,
    @nuevo_precio DECIMAL(10,2)
AS
BEGIN

    BEGIN TRY

        BEGIN TRANSACTION;

        -- Validación 1: el producto debe existir
        IF NOT EXISTS (
            SELECT 1
            FROM Productos
            WHERE id_producto = @id_producto
        )
        BEGIN
            THROW 50001, 'El producto indicado no existe.', 1;
        END;

        -- Validación 2: el precio debe ser mayor que cero
        IF @nuevo_precio <= 0
        BEGIN
            THROW 50002, 'El precio debe ser mayor que cero.', 1;
        END;

        -- Actualizar precio
        UPDATE Productos
        SET precio = @nuevo_precio
        WHERE id_producto = @id_producto;

        COMMIT;

    END TRY

    BEGIN CATCH

        IF @@TRANCOUNT > 0
            ROLLBACK;

        SELECT
            ERROR_NUMBER() AS numero_error,
            ERROR_MESSAGE() AS mensaje_error;

    END CATCH;

END;
GO