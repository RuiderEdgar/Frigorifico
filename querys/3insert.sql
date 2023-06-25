-- Registros para la tabla Distribuidor
INSERT INTO Distribuidor (nombre_distribuidor, direccion_distribuidor, correo_distribuidor, receptor_autorizado)
VALUES
    ('Distribuidor 1', 'Dirección 1', 'correo1@example.com', 'Receptor 1'),
    ('Distribuidor 2', 'Dirección 2', 'correo2@example.com', 'Receptor 2'),
    ('Distribuidor 3', 'Dirección 3', 'correo3@example.com', 'Receptor 3'),
    ('Distribuidor 4', 'Dirección 4', 'correo4@example.com', 'Receptor 4'),
    ('Distribuidor 5', 'Dirección 5', 'correo5@example.com', 'Receptor 5'),
    ('Distribuidor 6', 'Dirección 6', 'correo6@example.com', 'Receptor 6'),
    ('Distribuidor 7', 'Dirección 7', 'correo7@example.com', 'Receptor 7'),
    ('Distribuidor 8', 'Dirección 8', 'correo8@example.com', 'Receptor 8');
Select * From Distribuidor;

-- Registros para la tabla Entrega
INSERT INTO Entrega (fecha_entrega, hora_salida, camion, piezas_entrega)
VALUES
    ('01/01/2023', '08:00', 1, 10),
    ('02/01/2023', '09:30', 2, 15),
    ('03/01/2023', '10:45', 3, 8),
    ('04/01/2023', '11:15', 4, 12),
    ('05/01/2023', '12:30', 1, 20),
    ('06/01/2023', '13:45', 2, 18),
    ('07/01/2023', '14:00', 3, 10),
    ('08/01/2023', '15:30', 4, 15);
Select * From Entrega;

-- Registros para la tabla Cliente
INSERT INTO Cliente (nombres_cliente, direccion_cliente, ruc_cliente, correo_cliente)
VALUES
    ('Cliente 1', 'Dirección 1', '1234567890123', 'cliente1@example.com'),
    ('Cliente 2', 'Dirección 2', '2345678901234', 'cliente2@example.com'),
    ('Cliente 3', 'Dirección 3', '3456789012345', 'cliente3@example.com'),
    ('Cliente 4', 'Dirección 4', '4567890123456', 'cliente4@example.com'),
    ('Cliente 5', 'Dirección 5', '5678901234567', 'cliente5@example.com'),
    ('Cliente 6', 'Dirección 6', '6789012345678', 'cliente6@example.com'),
    ('Cliente 7', 'Dirección 7', '7890123456789', 'cliente7@example.com'),
    ('Cliente 8', 'Dirección 8', '8901234567890', 'cliente8@example.com');
Select * From Cliente;

-- Registros para la tabla Carniceria
INSERT INTO Carniceria (nombre_carcineria, direccion_carniceria, ruc_carniceria, correo_carniceria)
VALUES
    ('Carnicería 1', 'Dirección 1', '1234567890123', 'carni1@example.com'),
    ('Carnicería 2', 'Dirección 2', '2345678901234', 'carni2@example.com'),
    ('Carnicería 3', 'Dirección 3', '3456789012345', 'carni3@example.com'),
    ('Carnicería 4', 'Dirección 4', '4567890123456', 'carni4@example.com'),
    ('Carnicería 5', 'Dirección 5', '5678901234567', 'carni5@example.com'),
    ('Carnicería 6', 'Dirección 6', '6789012345678', 'carni6@example.com'),
    ('Carnicería 7', 'Dirección 7', '7890123456789', 'carni7@example.com'),
    ('Carnicería 8', 'Dirección 8', '8901234567890', 'carni8@example.com');
Select * From Carniceria;

-- Registros para la tabla Pedido
INSERT INTO Pedido (numero_piezas, lugar_entrega, peso_aprox, id_entrega1, id_cliente1, id_distribuidor1, id_carniceria1)
VALUES
    (5, 'Lugar 1', 10.5, 1, 1, 1, 1),
    (8, 'Lugar 2', 15.2, 2, 2, 2, 2),
    (6, 'Lugar 3', 12.1, 3, 3, 3, 3),
    (10, 'Lugar 4', 18.7, 4, 4, 4, 4),
    (7, 'Lugar 5', 13.8, 5, 5, 5, 5),
    (12, 'Lugar 6', 22.3, 6, 6, 6, 6),
    (9, 'Lugar 7', 16.6, 7, 7, 7, 7),
    (15, 'Lugar 8', 25.9, 8, 8, 8, 8);
Select * From Pedido;

-- Registros para la tabla Corte
INSERT INTO Corte (tipo_corte, nombre_corte, peso_corte, fecha_corte)
VALUES
    ('Tipo 1', 'Corte 1', 5.3, '01/01/2023'),
    ('Tipo 2', 'Corte 2', 8.1, '02/01/2023'),
    ('Tipo 3', 'Corte 3', 6.7, '03/01/2023'),
    ('Tipo 4', 'Corte 4', 10.2, '04/01/2023'),
    ('Tipo 5', 'Corte 5', 5.9, '05/01/2023'),
    ('Tipo 6', 'Corte 6', 9.5, '06/01/2023'),
    ('Tipo 7', 'Corte 7', 7.2, '07/01/2023'),
    ('Tipo 8', 'Corte 8', 11.8, '08/01/2023');
Select * From Corte;

-- Registros para la tabla Pedido_Corte
INSERT INTO Pedido_Corte (id_pedido1, id_corte1)
VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6),
    (7, 7),
    (8, 8);
Select * From Pedido_Corte;