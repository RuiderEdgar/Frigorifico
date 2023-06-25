USE FrigorificoDB;

CREATE TABLE Distribuidor (
    id_distribuidor int Not Null IDENTITY(1,1) Primary key,
    nombre_distribuidor varchar(40),
    direccion_distribuidor varchar(40),
    correo_distribuidor varchar(20),
    receptor_autorizado varchar(40)
)
Select * From Distribuidor;

CREATE TABLE Entrega(
    id_entrega int NOT NULL IDENTITY(1,1) Primary key,
    fecha_entrega varchar(10), --dd/mm/aaaa
    hora_salida varchar(5), --hh/mm
    camion int, --numero del camion asignado
    piezas_entrega int --numero de piezas entregadas
)
Select * From Entrega;

CREATE TABLE Cliente(
    id_cliente int Not Null Identity(1,1) primary Key,
    nombres_cliente varchar (20),
    direccion_cliente varchar(40),
    ruc_cliente varchar(13),
    correo_cliente varchar(20)
)
Select * From Cliente;

CREATE TABLE Carniceria(
    id_carniceria int Not Null Identity(1,1) primary Key,
    nombre_carcineria varchar(20),
    direccion_carniceria VARCHAR (40),
    ruc_carniceria varchar(13),
    correo_carniceria VARCHAR (20)
)
Select * From Carniceria;

CREATE TABLE Pedido(
    id_pedido int Not Null IDENTITY(1,1) Primary key,
    numero_piezas int,
    lugar_entrega varchar(10),
    peso_aprox float(2),
    id_entrega1 int not null,
    id_cliente1 int not null,
    id_distribuidor1 int not null,
    id_carniceria1 int not null,
    FOREIGN KEY (id_entrega1) REFERENCES Entrega(id_entrega),
    FOREIGN KEY (id_cliente1) REFERENCES Cliente(id_cliente),
    FOREIGN KEY (id_distribuidor1) REFERENCES Distribuidor(id_distribuidor),
    FOREIGN KEY (id_carniceria1) REFERENCES Carniceria(id_carniceria)
)
Select * From Pedido;

CREATE TABLE Corte(
    id_corte int not null identity(1, 1) PRIMARY KEY,
    tipo_corte varchar(25),
    nombre_corte varchar(25),
    peso_corte float(2),
    fecha_corte varchar(10), --dd/mm/aaaa
)
Select * From Corte;

CREATE TABLE Pedido_Corte(
    id_pedido1 int not null,
    id_corte1 int not null,
    Foreign key (id_pedido1) References Pedido(id_pedido),
    Foreign key (id_corte1) References Corte(id_corte)
)
Select * From Pedido_Corte;
