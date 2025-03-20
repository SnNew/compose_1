CREATE DATABASE IF NOT EXISTS videojuegos;

USE videojuegos;

CREATE TABLE Clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    telefono VARCHAR(15),
    direccion TEXT
);

CREATE TABLE Videojuegos (
    id_videojuego INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    categoria VARCHAR(100),
    precio DECIMAL(10, 2) NOT NULL,
    descripcion TEXT,
    fecha_lanzamiento DATE
);

CREATE TABLE IF NOT EXISTS Ventas (
    id_venta INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    id_videojuego INT,
    fecha_venta DATE,
    cantidad INT NOT NULL,
    total DECIMAL(10, 2),
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente),
    FOREIGN KEY (id_videojuego) REFERENCES Videojuegos(id_videojuego)
);

CREATE TABLE IF NOT EXISTS Inventario (
    id_inventario INT AUTO_INCREMENT PRIMARY KEY,
    id_videojuego INT,
    cantidad INT NOT NULL,
    FOREIGN KEY (id_videojuego) REFERENCES Videojuegos(id_videojuego)
);

INSERT INTO Clientes (nombre, apellido, email, telefono, direccion)
VALUES
('Juan', 'Pérez', 'juan.perez@example.com', '555-1234', 'Calle Falsa 123'),
('María', 'Gómez', 'maria.gomez@example.com', '555-5678', 'Avenida Libertad 456'),
('Carlos', 'López', 'carlos.lopez@example.com', '555-8765', 'Calle Real 789');

INSERT INTO Videojuegos (nombre, categoria, precio, descripcion, fecha_lanzamiento)
VALUES
('FIFA 23', 'Deportes', 59.99, 'Simulador de fútbol, la última entrega de la saga FIFA.', '2022-09-30'),
('The Legend of Zelda: Breath of the Wild', 'Aventura', 49.99, 'Un juego de aventura en un mundo abierto con mecánicas innovadoras.', '2017-03-03'),
('Call of Duty: Modern Warfare II', 'Acción', 69.99, 'Shooter en primera persona, la secuela de Modern Warfare.', '2022-10-28');

INSERT INTO Ventas (id_cliente, id_videojuego, fecha_venta, cantidad, total)
VALUES
(1, 1, '2023-03-15', 1, 59.99),
(2, 2, '2023-03-16', 2, 99.98),
(3, 3, '2023-03-17', 1, 69.99);

INSERT INTO Inventario (id_videojuego, cantidad)
VALUES
(1, 20),
(2, 15),
(3, 30);
