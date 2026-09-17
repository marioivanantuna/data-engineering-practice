USE DataEngineeringPractice;
GO

WITH total_por_cliente AS (
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
),

clientes_segmentados AS (
    SELECT
        id_cliente,
        nombre,
        total_comprado,
        CASE
            WHEN total_comprado >= 20000 THEN 'Alto valor'
            WHEN total_comprado >= 15000 THEN 'Valor medio'
            ELSE 'Valor bajo'
        END AS segmento
    FROM total_por_cliente
)

SELECT
    id_cliente,
    nombre,
    total_comprado,
    segmento
FROM clientes_segmentados
ORDER BY total_comprado DESC;