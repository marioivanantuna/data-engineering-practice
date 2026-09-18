USE DataEngineeringPractice;
GO

WITH ventas_cliente AS (
    SELECT
        c.id_cliente,
        c.nombre,
        v.fecha_venta,
        v.id_venta,
        v.cantidad * p.precio AS total
    FROM Ventas v
    INNER JOIN Clientes c
        ON v.id_cliente = c.id_cliente
    INNER JOIN Productos p
        ON v.id_producto = p.id_producto
)

SELECT
    id_cliente,
    nombre,
    fecha_venta,
    total,

    LAG(total) OVER (
        PARTITION BY id_cliente
        ORDER BY fecha_venta
    ) AS total_anterior,

    LEAD(total) OVER (
        PARTITION BY id_cliente
        ORDER BY fecha_venta
    ) AS total_siguiente,

    COALESCE(
        LAG(total) OVER (
            PARTITION BY id_cliente
            ORDER BY fecha_venta
        ),
        0
    ) AS total_anterior_sin_null

FROM ventas_cliente
ORDER BY
    id_cliente,
    fecha_venta;

