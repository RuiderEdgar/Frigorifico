--contrainst para las tablas de:

--Personal
Alter table Personal
add constraint CHK_FrecuenciaPago check(FrecuenciaPago = 'Semana' or FrecuenciaPago = 'Quincena')