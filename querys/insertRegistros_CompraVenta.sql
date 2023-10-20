use Compra_Venta;

declare @subT decimal(7,2);
select @subT = 1 * sum(PrecioV) from Productos  where CodProd in (5, 6, 7)

declare @iva decimal(7,2) = @subT * 0.16
declare @total decimal(7,2) = @subT * 1.16

insert into Ventas values(19, cast(GETDATE() as date), cast(GETDATE() as time), @subT, @iva, @total, 'DOME751202', 111);

SELECT * from Ventas where NumV = 19;