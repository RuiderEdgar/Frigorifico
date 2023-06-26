
CREATE VIEW Numero_piezas_de_corte_a_cliente AS (
SELECT nombres_cliente, nombre_corte, numero_piezas
FROM Cliente, Corte, Pedido_Corte, Pedido
WHERE id_cliente = id_cliente1
  AND id_pedido1 = id_pedido
  AND id_corte = id_corte1
);



CREATE VIEW Fecha_entrega_de_distribuidor_a_carniceria AS(
SELECT Carniceria.nombre_carcineria, Distribuidor.nombre_distribuidor, Entrega.fecha_entrega
FROM Carniceria, Distribuidor, Pedido, Entrega
WHERE Carniceria.id_carniceria = Pedido.id_carniceria1
  AND Distribuidor.id_distribuidor = Pedido.id_distribuidor1
  AND Entrega.id_entrega = Pedido.id_entrega1
)

CREATE VIEW Entregas_de_distrubuidor_a_cliente AS(
SELECT Distribuidor.nombre_distribuidor, Corte.nombre_corte, Entrega.fecha_entrega
FROM Distribuidor, Corte, Pedido_Corte, Pedido, Entrega
WHERE Distribuidor.id_distribuidor = Pedido.id_distribuidor1
  AND Pedido_Corte.id_pedido1 = Pedido.id_pedido
  AND Corte.id_corte = Pedido_Corte.id_corte1
  AND Entrega.id_entrega = Pedido.id_entrega1
)

CREATE VIEW Detalles_de_un_pedido_de_corte AS(
SELECT Cliente.nombres_cliente, Pedido.numero_piezas, Entrega.fecha_entrega, Corte.nombre_corte
FROM Cliente, Pedido, Entrega, Pedido_Corte, Corte
WHERE Cliente.id_Cliente = Pedido.id_Cliente1
  AND Pedido.id_entrega1 = Entrega.id_entrega
  AND Pedido.id_pedido = Pedido_Corte.id_pedido1
  AND Pedido_Corte.id_corte1 = Corte.id_corte
)

CREATE VIEW Pedidos_detallados_de_carniceria_a_distribuidor AS(
SELECT Distribuidor.nombre_distribuidor, Carniceria.nombre_carcineria, Pedido.numero_piezas, Entrega.fecha_entrega
FROM Distribuidor, Carniceria, Pedido, Entrega
WHERE Distribuidor.id_distribuidor = Pedido.id_distribuidor1
  AND Carniceria.id_carniceria = Pedido.id_carniceria1
  AND Pedido.id_entrega1 = Entrega.id_entrega
)