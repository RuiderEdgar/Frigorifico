
CREATE VIEW Cliente_Corte_Pedido AS (
    SELECT c.nombre_Cliente, co.nombre_corte, p.numero_piezas
    FROM Cliente c, Corte co, Pedido_Corte pc, Pedido p
    WHERE c.id_Cliente = p.id_Cliente1
    AND pc.id_pedido1 = p.id_pedido
    AND co.id_corte = pc.id_corte1;
)


CREATE VIEW Carniceria_Distribuidor_Entrega AS
SELECT ca.nombre_carniceria, d.nombre_distribuidor, e.fecha_entrega
FROM Carnicería ca, Distribuidor d, Pedido p, Entrega e
WHERE ca.id_Carniceria = p.id_Carniceria1
  AND d.id_distribuidor = p.id_distribuidor1
  AND e.id_entrega = p.id_entrega1;




CREATE VIEW Distribuidor_Corte_Entrega AS
SELECT d.nombre_distribuidor, co.nombre_corte, e.fecha_entrega
FROM Distribuidor d, Corte co, Pedido_Corte pc, Pedido p, Entrega e
WHERE d.id_distribuidor = p.id_distribuidor1
  AND pc.id_pedido1 = p.id_pedido
  AND co.id_corte = pc.id_corte1
  AND e.id_entrega = p.id_entrega1;




CREATE VIEW Cliente_Pedido_Entrega_Corte AS
SELECT c.nombre_Cliente, p.numero_piezas, e.fecha_entrega, co.nombre_corte
FROM Cliente c, Pedido p, Entrega e, Pedido_Corte pc, Corte co
WHERE c.id_Cliente = p.id_Cliente1
  AND p.id_entrega1 = e.id_entrega
  AND p.id_pedido = pc.id_pedido1
  AND pc.id_corte1 = co.id_corte;





CREATE VIEW Distribuidor_Carniceria_Pedido_Entrega AS
SELECT d.nombre_distribuidor, ca.nombre_carniceria, p.numero_piezas, e.fecha_entrega
FROM Distribuidor d, Carnicería ca, Pedido p, Entrega e
WHERE d.id_distribuidor = p.id_distribuidor1
  AND ca.id_Carniceria = p.id_Carniceria1
  AND p.id_entrega1 = e.id_entrega;
