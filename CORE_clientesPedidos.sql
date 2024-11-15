INSERT INTO clientes (nombre, direccion, telefono)
VALUES ('Maria', 'calle #1', 12345678),
('Juan','calle #2', 23456789),
('Pedro','calle #3', 34567890),
('Sara','calle #4', 45678901),
('Daniel','calle #5', 56789012);

INSERT INTO pedidos (cliente_id, fecha, total)
VALUES (1, '2024-10-01', 100.50),
(1, '2024-10-05', 250.75),
(2, '2024-10-03', 150.00),
(2, '2024-10-07', 300.20),
(3, '2024-10-08', 50.00),
(4, '2024-10-02', 200.10),
(4, '2024-10-09', 130.25),
(5, '2024-10-04', 180.00),
(5, '2024-10-10', 90.00),
(5, '2024-10-12', 120.00);

SELECT c.id_clientes, c.nombre, c.direccion, c.telefono, p.id_pedidos, p.fecha, p.total
FROM clientes c LEFT JOIN pedidos p ON c.id_clientes = p.cliente_id ORDER BY c.id_clientes;

SELECT p.id_pedidos, p.fecha, p.total FROM pedidos p
WHERE p.cliente_id = 1 ORDER BY p.fecha;

SELECT c.id_clientes, c.nombre, SUM(p.total) AS total_pedidos
FROM clientes c LEFT JOIN pedidos p ON c.id_clientes = p.cliente_id GROUP BY c.id_clientes, c.nombre
ORDER BY c.id_clientes;

DELETE FROM pedidos WHERE cliente_id = 1;
DELETE FROM clientes WHERE id_clientes = 1;

SELECT c.id_clientes, c.nombre, COUNT(p.id_pedidos) AS num_pedidos
FROM clientes c LEFT JOIN pedidos p ON c.id_clientes = p.cliente_id
GROUP BY c.id_clientes, c.nombre ORDER BY num_pedidos DESC LIMIT 3;