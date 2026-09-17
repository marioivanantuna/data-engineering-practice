USE DataEngineeringPractice;
GO

-- =========================
-- NUEVOS CLIENTES
-- =========================
INSERT INTO Clientes (id_cliente, nombre, email, ciudad)
VALUES
    (4, 'Luis Hernandez', 'luis.hernandez@email.com', 'Puebla'),
    (5, 'Mariana Torres', 'mariana.torres@email.com', 'Queretaro'),
    (6, 'Jorge Mendoza', 'jorge.mendoza@email.com', 'Merida'),
    (7, 'Fernanda Ruiz', 'fernanda.ruiz@email.com', 'Ciudad de Mexico'),
    (8, 'Diego Castro', 'diego.castro@email.com', 'Monterrey'),
    (9, 'Paola Sanchez', 'paola.sanchez@email.com', 'Guadalajara'),
    (10, 'Ricardo Gomez', 'ricardo.gomez@email.com', 'Leon');
GO


-- =========================
-- NUEVOS PRODUCTOS
-- =========================
INSERT INTO Productos (id_producto, nombre_producto, categoria, precio)
VALUES
    (104, 'Teclado Mecanico', 'Tecnologia', 1800.00),
    (105, 'Mouse Inalambrico', 'Tecnologia', 850.00),
    (106, 'Escritorio', 'Oficina', 4500.00),
    (107, 'Audifonos', 'Tecnologia', 2200.00),
    (108, 'Webcam', 'Tecnologia', 1600.00),
    (109, 'Lampara de Escritorio', 'Oficina', 950.00),
    (110, 'Tablet', 'Tecnologia', 8900.00);
GO


-- =========================
-- NUEVAS VENTAS
-- =========================
INSERT INTO Ventas (
    id_venta,
    id_cliente,
    id_producto,
    fecha_venta,
    cantidad
)
VALUES
    (5, 4, 104, '2026-09-05', 2),
    (6, 5, 110, '2026-09-06', 1),
    (7, 6, 106, '2026-09-07', 2),
    (8, 7, 101, '2026-09-08', 1),
    (9, 8, 105, '2026-09-09', 3),
    (10, 9, 107, '2026-09-10', 2),
    (11, 10, 108, '2026-09-11', 1),
    (12, 4, 103, '2026-09-12', 1),
    (13, 5, 102, '2026-09-13', 2),
    (14, 6, 109, '2026-09-14', 4),
    (15, 7, 110, '2026-09-15', 2),
    (16, 8, 101, '2026-09-16', 1),
    (17, 9, 104, '2026-09-17', 3),
    (18, 10, 106, '2026-09-17', 1);
GO