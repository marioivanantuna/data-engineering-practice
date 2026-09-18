
USE DataEngineeringPractice;
GO

MERGE INTO Productos AS target
USING (
    VALUES
        (101, 'Laptop Pro', 'Tecnologia', 19500.00),
        (111, 'Monitor Ultrawide', 'Tecnologia', 7800.00)
) AS source (
    id_producto,
    nombre_producto,
    categoria,
    precio
)

ON target.id_producto = source.id_producto

WHEN MATCHED THEN
    UPDATE SET
        target.nombre_producto = source.nombre_producto,
        target.categoria = source.categoria,
        target.precio = source.precio

WHEN NOT MATCHED THEN
    INSERT (
        id_producto,
        nombre_producto,
        categoria,
        precio
    )
    VALUES (
        source.id_producto,
        source.nombre_producto,
        source.categoria,
        source.precio
    );

GO
