USE DataEngineeringPractice;
GO

-- =========================
-- INSERTAR CLIENTES
-- =========================
INSERT INTO Clientes (id_cliente, nombre, email, ciudad)
VALUES
    (1, 'Ana Lopez', 'ana.lopez@email.com', 'Ciudad de Mexico'),
    (2, 'Carlos Ramirez', 'carlos.ramirez@email.com', 'Monterrey'),
    (3, 'Sofia Martinez', 'sofia.martinez@email.com', 'Guadalajara');
GO


-- =========================
-- INSERTAR PRODUCTOS
-- =========================
INSERT INTO Productos (id_producto, nombre_producto, categoria, precio)
VALUES
    (101, 'Laptop', 'Tecnologia', 18500.00),
    (102, 'Monitor', 'Tecnologia', 5200.00),
    (103, 'Silla Ergonomica', 'Oficina', 3500.00);
GO


-- =========================
-- INSERTAR VENTAS
-- =========================
INSERT INTO Ventas (
    id_venta,
    id_cliente,
    id_producto,
    fecha_venta,
    cantidad
)
VALUES
    (1, 1, 101, '2026-09-01', 1),
    (2, 2, 102, '2026-09-02', 2),
    (3, 1, 103, '2026-09-03', 1),
    (4, 3, 101, '2026-09-04', 1);
GO


-- =========================
-- CONSULTAR LOS DATOS
-- =========================
SELECT *
FROM Clientes;

SELECT *
FROM Productos;

SELECT *
FROM Ventas;