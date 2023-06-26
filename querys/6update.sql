USE FrigorificoDB;

UPDATE Distribuidor
SET direccion_distribuidor = 'Ubicación X'
WHERE id_distribuidor = 1;

UPDATE Entrega
SET fecha_entrega = '07/02/2023'
WHERE id_entrega = 1;

UPDATE Cliente
SET correo_cliente = 'fake@gmail.com'
WHERE id_cliente = 1;

UPDATE Carniceria
SET ruc_carniceria = '1112223334445'
WHERE id_carniceria = 1;

UPDATE Pedido
SET lugar_entrega = 'Av X'
WHERE id_pedido = 1;

UPDATE Corte
SET nombre_corte = 'Corte XYY'
WHERE id_corte = 1;

UPDATE Pedido_Corte
SET id_corte1 = 1
WHERE id_pedido1 = 2;