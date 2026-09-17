USE DataEngineeringPractice;
GO

SELECT
    c.id_cliente,
    c.nombre,
    SUM(v.cantidad * p.precio) AS total_comprado,

    CASE
        WHEN SUM(v.cantidad * p.precio) >= 20000 THEN 'Alto valor'
        WHEN SUM(v.cantidad * p.precio) >= 15000 THEN 'Valor medio'
        ELSE 'Valor bajo'
    END AS segmento

FROM Ventas v
INNER JOIN Clientes c
    ON v.id_cliente = c.id_cliente
INNER JOIN Productos p
    ON v.id_producto = p.id_producto

GROUP BY
    c.id_cliente,
    c.nombre

ORDER BY
    total_comprado DESC;