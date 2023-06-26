USE FrigorificoDB;

DELETE FROM Distribuidor
WHERE id_distribuidor = 7;

DELETE FROM Entrega
WHERE id_entrega = 7;

DELETE FROM Cliente
WHERE id_cliente = 7;

DELETE FROM Carniceria
WHERE id_carniceria = 7;

DELETE FROM Pedido
WHERE id_pedido = 7;

DELETE FROM Corte
WHERE id_corte = 7;

DELETE FROM Pedido_Corte
WHERE id_pedido1 = 7;
