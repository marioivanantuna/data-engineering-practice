USE DataEngineeringPractice;
GO

SELECT
    v.id_venta,
    c.nombre AS nombre_cliente,
    p.nombre_producto,
    v.fecha_venta,
    v.cantidad,
    p.precio,
    v.cantidad * p.precio AS total
FROM Ventas v
INNER JOIN Clientes c
    ON v.id_cliente = c.id_cliente
INNER JOIN Productos p
    ON v.id_producto = p.id_producto;