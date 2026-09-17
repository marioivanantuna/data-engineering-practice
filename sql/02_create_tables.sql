USE DataEngineeringPractice;
GO

CREATE TABLE Clientes (
    id_cliente INT PRIMARY KEY,
    nombre VARCHAR(100),
    email VARCHAR(150),
    ciudad VARCHAR(100)
);
GO

CREATE TABLE Productos (
    id_producto INT PRIMARY KEY,
    nombre_producto VARCHAR(100),
    categoria VARCHAR(100),
    precio DECIMAL(10,2)
);
GO

CREATE TABLE Ventas (
    id_venta INT PRIMARY KEY,
    id_cliente INT,
    id_producto INT,
    fecha_venta DATE,
    cantidad INT,

    CONSTRAINT FK_Ventas_Clientes
        FOREIGN KEY (id_cliente)
        REFERENCES Clientes(id_cliente),

    CONSTRAINT FK_Ventas_Productos
        FOREIGN KEY (id_producto)
        REFERENCES Productos(id_producto)
);
GO