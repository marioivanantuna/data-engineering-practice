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

total_ajustado_cliente AS (
    SELECT
        id_cliente,
        nombre,
        total_comprado,
        CASE
            WHEN nombre IN ('Ana Lopez', 'Sofia Martinez') THEN 22000
            ELSE total_comprado
        END AS total_ajustado
    FROM total_por_cliente
)

SELECT
    id_cliente,
    nombre,
    total_comprado,
    total_ajustado,

    ROW_NUMBER() OVER (
        ORDER BY total_ajustado DESC
    ) AS row_number_posicion,

    RANK() OVER (
        ORDER BY total_ajustado DESC
    ) AS rank_posicion,

    DENSE_RANK() OVER (
        ORDER BY total_ajustado DESC
    ) AS dense_rank_posicion

FROM total_ajustado_cliente
ORDER BY total_ajustado DESC;