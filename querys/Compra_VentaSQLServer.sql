USE Compra_Venta;

CREATE TABLE Personal (
    NumSS INT NOT NULL,
    Nombre VARCHAR(45) NULL,
    ApePaterno VARCHAR(45) NULL,
    ApeMaterno VARCHAR(45) NULL,
    TelPersonal INT NULL,
    TelCasa INT NULL,
    FechaContrato DATE NULL,
    FrecuenciaPago VARCHAR(15) NULL,
    SueldoBase DECIMAL(7,2) NULL,
    PRIMARY KEY (NumSS)
);

CREATE TABLE Clientes (
    RFC VARCHAR(13) NOT NULL,
    Nombre VARCHAR(45) NULL,
    ApePaterno VARCHAR(45) NULL,
    ApeMaterno VARCHAR(45) NULL,
    Calle VARCHAR(20) NULL,
    Num INT NULL,
    Colonia VARCHAR(45) NULL,
    CP INT NULL,
    Alcaldia VARCHAR(45) NULL,
    PRIMARY KEY (RFC)
);

CREATE TABLE Proveedores (
    RFC VARCHAR(13) NOT NULL,
    NomEmpresa VARCHAR(45) NULL,
    NombreRepresentante VARCHAR(45) NULL,
    ApeP_Representante VARCHAR(45) NULL,
    TelContacto VARCHAR(10) NULL,
    DiaPedido VARCHAR(15) NULL,
    DiaEntrega VARCHAR(15) NULL,
    TipoPago VARCHAR(45) NULL,
    PRIMARY KEY (RFC)
);

CREATE TABLE Productos (
    CodProd INT NOT NULL IDENTITY(1,1),
    DescripL VARCHAR(45) NULL,
    DescripC VARCHAR(20) NULL,
    PrecioV DECIMAL(7,2) NULL,
    Existencias INT NULL,
    StockMin INT NULL,
    StockMax INT NULL,
    Oferta TINYINT NULL,
    PRIMARY KEY (CodProd)
);

CREATE TABLE Ventas (
    NumV INT NOT NULL,
    Fecha DATE NULL,
    Hora TIME NULL,
    Subtotal DECIMAL(7,2) NULL,
    IVA DECIMAL(7,2) NULL,
    Total DECIMAL(7,2) NULL,
    Clientes_RFC VARCHAR(13) NULL,
    Personal_NumSS INT NOT NULL,
    PRIMARY KEY (NumV),
    FOREIGN KEY (Clientes_RFC) REFERENCES Clientes(RFC),
    FOREIGN KEY (Personal_NumSS) REFERENCES Personal(NumSS)
);

CREATE TABLE productosv (
    Cantidad INT NULL,
    PrecioV DECIMAL(7,2) NULL,
    Subtotal_Prod DECIMAL(7,2) NULL,
    Ventas_NumV INT NOT NULL,
    Productos_CodProd INT NOT NULL,
    PRIMARY KEY (Ventas_NumV, Productos_CodProd),
    FOREIGN KEY (Ventas_NumV) REFERENCES Ventas(NumV),
    FOREIGN KEY (Productos_CodProd) REFERENCES Productos(CodProd)
);

CREATE TABLE Compras (
    NumC INT NOT NULL IDENTITY(1,1),
    FechaHoraP DATETIME NULL,
    FechaHoraE DATETIME NULL,
    TipoPago VARCHAR(15) NULL,
    Subtotal DECIMAL(7,2) NULL,
    IVA DECIMAL(7,2) NULL,
    Total DECIMAL(7,2) NULL,
    Proveedores_RFC VARCHAR(13) NULL,
    PRIMARY KEY (NumC),
    FOREIGN KEY (Proveedores_RFC) REFERENCES Proveedores(RFC)
);

CREATE TABLE productosc (
    Cantidad INT NULL,
    PrecioC DECIMAL(7,2) NULL,
    Subtotal_Prod DECIMAL(7,2) NULL,
    Compras_NumC INT NOT NULL,
    Productos_CodProd INT NOT NULL,
    PRIMARY KEY (Compras_NumC, Productos_CodProd),
    FOREIGN KEY (Compras_NumC) REFERENCES Compras(NumC),
    FOREIGN KEY (Productos_CodProd) REFERENCES Productos(CodProd)
);

-- Cambiando nombre de tablas
EXEC sp_rename 'ProductosVentas', 'productosv';
EXEC sp_rename 'ProductosCompras', 'productosc';

-- Agregando columnas
ALTER TABLE Personal
ADD Puesto VARCHAR(10) NULL,
H_entrada TIME,
H_salida TIME;


/*Insert en Personal*/
INSERT INTO Personal (NumSS,Nombre,ApePaterno,ApeMaterno,TelPersonal,TelCasa,FechaContrato,FrecuenciaPago,SueldoBase,Puesto,h_entrada,h_salida)
 VALUES (167,'Hilda','Guzmán','Reyes',55456789,21572456,'2015-05-16','Semana',1200.00,'Ayudante','07:35:30','12:36:19');
INSERT INTO Personal (NumSS,Nombre,ApePaterno,ApeMaterno,TelPersonal,TelCasa,FechaContrato,FrecuenciaPago,SueldoBase,Puesto,h_entrada,h_salida)
 VALUES (321,'Erendira','Del Valle','Merino',55123456,21573520,'1995-01-01','Quincena',3000.00,'Administra','07:35:31','10:36:19');
INSERT INTO Personal (NumSS,Nombre,ApePaterno,ApeMaterno,TelPersonal,TelCasa,FechaContrato,FrecuenciaPago,SueldoBase,Puesto,h_entrada,h_salida)
 VALUES (456,'Luis','Garcia','Becerril',55234567,21571234,'1995-01-01','Quincena',3000.00,'Administra','07:35:31','15:36:19');
INSERT INTO Personal (NumSS,Nombre,ApePaterno,ApeMaterno,TelPersonal,TelCasa,FechaContrato,FrecuenciaPago,SueldoBase,Puesto,h_entrada,h_salida)
 VALUES (687,'Veronica','Ordoñes','Flores',55001234,21579874,'2010-07-01','Semana',1000.00,'Ayudante','07:35:31','09:36:19');
INSERT INTO Personal (NumSS,Nombre,ApePaterno,ApeMaterno,TelPersonal,TelCasa,FechaContrato,FrecuenciaPago,SueldoBase,Puesto,h_entrada,h_salida)
 VALUES (897,'Cristina','Monroy','Jimenez',55345678,21571265,'2016-01-16','Semana',1200.00,'Ayudante','07:35:31','16:36:19');

/*Insert en Clientes*/
INSERT INTO Clientes (RFC,Nombre,ApePaterno,ApeMaterno,Calle,Num,Colonia,CP,Alcaldia)
 VALUES ('CARH810911','Hilda','Guzmán','Reyes','Los Pinos',29,'La Peña',15230,'Milpa Alta');
INSERT INTO Clientes (RFC,Nombre,ApePaterno,ApeMaterno,Calle,Num,Colonia,CP,Alcaldia)
 VALUES ('DOME751202','Erick','Dominguez','Morales','El Mirador',12,'Tejomulco',15225,'Milpa Alta');
INSERT INTO Clientes (RFC,Nombre,ApePaterno,ApeMaterno,Calle,Num,Colonia,CP,Alcaldia)
 VALUES ('GUJA770724','Adriana','Guzmá¡n','Jimenez','Gladiolas',30,'Jazmin',15220,'Milpa Alta');
INSERT INTO Clientes (RFC,Nombre,ApePaterno,ApeMaterno,Calle,Num,Colonia,CP,Alcaldia)
 VALUES ('REAM850330','Mauricio','Reyes','Aguilar','Las Flores',15,'La PeÃ±a',15230,'Milpa Alta');
INSERT INTO Clientes (RFC,Nombre,ApePaterno,ApeMaterno,Calle,Num,Colonia,CP,Alcaldia)
 VALUES ('VIPI800215','Israel','Vigueras','Perez','Aldama',48,'Jazmin',15220,'Milpa Alta');

/*Insert en Proveedores*/
INSERT INTO Proveedores (RFC,NomEmpresa,NombreRepresentante,ApeP_Representante,TelContacto,DiaPedido,DiaEntrega,TipoPago)
 VALUES ('CCF911030','Coca-Cola','Esteban','Cruz','55999911','Jueves','Jueves','Transferencia');
INSERT INTO Proveedores (RFC,NomEmpresa,NombreRepresentante,ApeP_Representante,TelContacto,DiaPedido,DiaEntrega,TipoPago)
 VALUES ('CPC650101','Sabritas,Gamesa,Pepsi','Enrique','Marin','55999922','Jueves','Viernes','Efectivo');
INSERT INTO Proveedores (RFC,NomEmpresa,NombreRepresentante,ApeP_Representante,TelContacto,DiaPedido,DiaEntrega,TipoPago)
 VALUES ('GBI600203','Bimbo','Juan','Alcazar','55999999','Lunes','Martes','Efectivo');

/*Insert en Productos*/
INSERT INTO Productos (DescripL,DescripC,PrecioV,Existencias,StockMin,StockMax,Oferta) VALUES ('Pan tostado clásico','Pan T Clásico',35.00,8,1,10,1);
INSERT INTO Productos (DescripL,DescripC,PrecioV,Existencias,StockMin,StockMax,Oferta) VALUES ('Pan integral grande','Pan Int Grnd',45.00,4,1,10,1);
INSERT INTO Productos (DescripL,DescripC,PrecioV,Existencias,StockMin,StockMax,Oferta) VALUES ('Roles de canela glaseados','Roles Glas',20.00,5,1,10,0);
INSERT INTO Productos (DescripL,DescripC,PrecioV,Existencias,StockMin,StockMax,Oferta) VALUES ('Panquecitos con chispas sabor chocolate','Panques Chispas Choc',25.00,5,1,10,0);
INSERT INTO Productos (DescripL,DescripC,PrecioV,Existencias,StockMin,StockMax,Oferta) VALUES ('Donitas espolvoreadas','Donas Espolv',20.00,6,1,10,0);
INSERT INTO Productos (DescripL,DescripC,PrecioV,Existencias,StockMin,StockMax,Oferta) VALUES ('Coca cola sabor original 235 ml botella de v','CocaCola vidrio 235',10.00,20,1,10,1);
INSERT INTO Productos (DescripL,DescripC,PrecioV,Existencias,StockMin,StockMax,Oferta) VALUES ('Coca cola sabor original 600 ml no retornable','CocaCola 600',15.00,15,1,10,1);
INSERT INTO Productos (DescripL,DescripC,PrecioV,Existencias,StockMin,StockMax,Oferta) VALUES ('Fanta sabor naranja 354 ml lata','Fanta lata',13.00,30,1,10,0);
INSERT INTO Productos (DescripL,DescripC,PrecioV,Existencias,StockMin,StockMax,Oferta) VALUES ('Coca cola light 354 ml lata','CocaCola L lata',13.00,10,1,10,NULL);
INSERT INTO Productos (DescripL,DescripC,PrecioV,Existencias,StockMin,StockMax,Oferta) VALUES ('Coca cola light 600 ml no retornable','CocaCola L 600',15.00,20,1,10,0);
INSERT INTO Productos (DescripL,DescripC,PrecioV,Existencias,StockMin,StockMax,Oferta) VALUES ('Papas Sabritas adobadas 170 gr','PapasAdibadas ch',15.00,15,1,10,1);
INSERT INTO Productos (DescripL,DescripC,PrecioV,Existencias,StockMin,StockMax,Oferta) VALUES ('Fritos limón 180 gr','Fritos ch',15.00,16,1,10,NULL);
INSERT INTO Productos (DescripL,DescripC,PrecioV,Existencias,StockMin,StockMax,Oferta) VALUES ('Rufles de queso 200 gr','RuflesQ ch',15.00,17,1,10,NULL);
INSERT INTO Productos (DescripL,DescripC,PrecioV,Existencias,StockMin,StockMax,Oferta) VALUES ('Churrumais 200 gr','Churrumais ch',15.00,18,1,10,NULL);
INSERT INTO Productos (DescripL,DescripC,PrecioV,Existencias,StockMin,StockMax,Oferta) VALUES ('Gamesa Emperador de chocolate 200gr','Emperador choc ch',20.00,5,1,10,0);
INSERT INTO Productos (DescripL,DescripC,PrecioV,Existencias,StockMin,StockMax,Oferta) VALUES ('Gamesa Emperador piruetas limón 200gr','Emperador limón ch',20.00,6,1,10,1);

/*Insert en Ventas*/
INSERT INTO Ventas (NumV,Fecha,Hora,Subtotal,IVA,Total,Clientes_RFC,Personal_NumSS) VALUES (1,'2022-11-07','09:00:00',98.28,15.72,114.00,'CARH810911',321);
INSERT INTO Ventas (NumV,Fecha,Hora,Subtotal,IVA,Total,Clientes_RFC,Personal_NumSS) VALUES (2,'2022-11-07','09:05:00',73.28,11.72,85.00,'DOME751202',321);
INSERT INTO Ventas (NumV,Fecha,Hora,Subtotal,IVA,Total,Clientes_RFC,Personal_NumSS) VALUES (3,'2022-07-11','09:10:00',43.10,6.90,50.00,'CARH810911',456);
INSERT INTO Ventas (NumV,Fecha,Hora,Subtotal,IVA,Total,Clientes_RFC,Personal_NumSS) VALUES (4,'2023-01-17','09:21:00',159.48,25.52,185.00,NULL,456);

/*Insert en productosv*/
INSERT INTO productosv (Cantidad,PrecioV,Subtotal_Prod,Ventas_NumV,Productos_CodProd) VALUES (1,35.00,35.00,1,1);
INSERT INTO productosv (Cantidad,PrecioV,Subtotal_Prod,Ventas_NumV,Productos_CodProd) VALUES (2,20.00,40.00,1,3);
INSERT INTO productosv (Cantidad,PrecioV,Subtotal_Prod,Ventas_NumV,Productos_CodProd) VALUES (3,13.00,39.00,1,8);
INSERT INTO productosv (Cantidad,PrecioV,Subtotal_Prod,Ventas_NumV,Productos_CodProd) VALUES (1,45.00,45.00,2,2);
INSERT INTO productosv (Cantidad,PrecioV,Subtotal_Prod,Ventas_NumV,Productos_CodProd) VALUES (2,20.00,40.00,2,5);
INSERT INTO productosv (Cantidad,PrecioV,Subtotal_Prod,Ventas_NumV,Productos_CodProd) VALUES (2,25.00,50.00,3,4);
INSERT INTO productosv (Cantidad,PrecioV,Subtotal_Prod,Ventas_NumV,Productos_CodProd) VALUES (1,35.00,35.00,4,1);
INSERT INTO productosv (Cantidad,PrecioV,Subtotal_Prod,Ventas_NumV,Productos_CodProd) VALUES (3,20.00,60.00,4,3);
INSERT INTO productosv (Cantidad,PrecioV,Subtotal_Prod,Ventas_NumV,Productos_CodProd) VALUES (3,10.00,30.00,4,6);
INSERT INTO productosv (Cantidad,PrecioV,Subtotal_Prod,Ventas_NumV,Productos_CodProd) VALUES (4,15.00,60.00,4,7);

/*Insert en compras*/
INSERT INTO Compras (FechaHoraP,FechaHoraE,TipoPago,Subtotal,IVA,Total,Proveedores_RFC)
 VALUES ('2022-01-20 00:00:00','2022-01-21 00:00:00','Efectivo',2198.28,351.72,2550.00,'CCF911030');
INSERT INTO Compras (FechaHoraP,FechaHoraE,TipoPago,Subtotal,IVA,Total,Proveedores_RFC)
 VALUES ('2022-01-15 00:00:00','2022-01-15 00:00:00','Transferencia',1482.76,237.24,1720.00,'CPC650101');

 /*Insert en productosc*/
INSERT INTO productosc (Cantidad,PrecioC,Subtotal_Prod,Compras_NumC,Productos_CodProd) VALUES (50,7.00,350.00,1,6);
INSERT INTO productosc (Cantidad,PrecioC,Subtotal_Prod,Compras_NumC,Productos_CodProd) VALUES (50,12.00,600.00,1,7);
INSERT INTO productosc (Cantidad,PrecioC,Subtotal_Prod,Compras_NumC,Productos_CodProd) VALUES (50,10.00,500.00,1,8);
INSERT INTO productosc (Cantidad,PrecioC,Subtotal_Prod,Compras_NumC,Productos_CodProd) VALUES (50,10.00,500.00,1,9);
INSERT INTO productosc (Cantidad,PrecioC,Subtotal_Prod,Compras_NumC,Productos_CodProd) VALUES (50,12.00,600.00,1,10);
INSERT INTO productosc (Cantidad,PrecioC,Subtotal_Prod,Compras_NumC,Productos_CodProd) VALUES (20,13.00,260.00,2,11);
INSERT INTO productosc (Cantidad,PrecioC,Subtotal_Prod,Compras_NumC,Productos_CodProd) VALUES (20,13.00,260.00,2,12);
INSERT INTO productosc (Cantidad,PrecioC,Subtotal_Prod,Compras_NumC,Productos_CodProd) VALUES (20,13.00,260.00,2,13);
INSERT INTO productosc (Cantidad,PrecioC,Subtotal_Prod,Compras_NumC,Productos_CodProd) VALUES (20,13.00,260.00,2,14);
INSERT INTO productosc (Cantidad,PrecioC,Subtotal_Prod,Compras_NumC,Productos_CodProd) VALUES (20,17.00,340.00,2,15);
INSERT INTO productosc (Cantidad,PrecioC,Subtotal_Prod,Compras_NumC,Productos_CodProd) VALUES (20,17.00,340.00,2,16);

------------------ Segundo Bloque ---------------------
/*Insertar nuevos registro*/
INSERT INTO Clientes (RFC,Nombre,ApePaterno,ApeMaterno,Calle,Num,Colonia,CP,Alcaldia)
VALUES ('RIJL0007','Edgar','Rivera','Jimenez','Cerrada',45,'Sta cruz',09700,'Iztapalapa');

INSERT INTO Proveedores (RFC,NomEmpresa,NombreRepresentante,ApeP_Representante,TelContacto,DiaPedido,DiaEntrega,TipoPago)
VALUES ('AAA122345','Neztle','Oscar','Luna','55444422','Miercoles','Jueves','Transferencia');

INSERT INTO Personal (NumSS,Nombre,ApePaterno,ApeMaterno,TelPersonal,TelCasa,FechaContrato,FecuenciaPago,SueldoBase,Puesto,h_entrada,h_salida)
VALUES (120,'Luis','Garcia','Nava',55112233,99887766,'2018-07-12','Semana',1600.00,'Ayudante','07:31:34','12:38:14');

-- 2. query
SELECT
    P.NumSS AS 'Número de Seguro Social',
    CONCAT(P.Nombre, ' ', P.ApePaterno, ' ', P.ApeMaterno) AS 'Nombre Completo',
    COUNT(V.NumV) AS 'Número de Ventas Registradas',
    SUM(V.Total) AS 'Monto Total de Ventas'
FROM
    Personal P
LEFT JOIN
    Ventas V ON P.NumSS = V.Personal_NumSS
GROUP BY
    P.NumSS, P.Nombre, P.ApePaterno, P.ApeMaterno
ORDER BY
    P.NumSS;
