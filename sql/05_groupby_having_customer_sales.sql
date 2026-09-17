USE DataEngineeringPractice;
GO

SELECT
    c.id_cliente,
    c.nombre,
    SUM(v.cantidad * p.precio) AS total_comprado
FROM Ventas v
INNER JOIN Clientes c
    ON v.id_cliente = c.id_cliente
INNER JOIN Productos p
    ON v.id_producto = p.id_producto
GROUP BY
    c.id_cliente,
    c.nombre
HAVING  SUM(v.cantidad * p.precio) > 15000
ORDER BY
    total_comprado DESC;