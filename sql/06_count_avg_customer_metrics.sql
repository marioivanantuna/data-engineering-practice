USE DataEngineeringPractice;
GO

SELECT
    c.id_cliente,
    c.nombre,
    COUNT(v.id_venta) AS numero_compras,
    AVG(v.cantidad * p.precio) AS ticket_promedio
FROM Ventas v
INNER JOIN Clientes c
    ON v.id_cliente = c.id_cliente
INNER JOIN Productos p
    ON v.id_producto = p.id_producto
GROUP BY
    c.id_cliente,
    c.nombre
ORDER BY
    ticket_promedio DESC;

