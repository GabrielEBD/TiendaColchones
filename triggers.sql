-- trigger para que vuelva a colocar lo que se quito  cuando se borra compra
drop trigger recuento;
delimiter $
create trigger recuento before delete on comprado for each row
	begin
		declare cantidad int;
        declare num int;
        set cantidad = old.com_cantidad;
        set num = old.com_pro_id;
        update producto set pro_cantidad = pro_cantidad + cantidad where num = pro_id ;
    end$
delimiter ;

delete from comprado where com_fac_id = 209 ;
select * from comprado;
select * from producto;
select * from factura;


-- triger que cada vez que borre un inventario producto quite las extenciones si tiene, de la tabla fabrica

delimiter $
create trigger borrar_extencion before delete on inventarioProducto for each row 
	begin
		declare num int;
        set num = old.invP_id;
        delete from fabrica where num = fab_invP_id;
    end$
delimiter ;

delete from inventarioProducto where invP_id = 10 ;
select * from inventarioProducto;
select * from fabrica;


-- trifer suma el ingreso por rpoveedor a la contidad de producto

delimiter $
create trigger ingreso_cantidad after insert on inventarioProducto for each row
	begin
		declare cantidad int;
        declare producto int;
        set cantidad = new.invP_cantidadIngreso;
        set producto = new.invP_pro_id;
        update producto set pro_cantidad = pro_cantidad + cantidad where producto = pro_id;
	end$
delimiter ;

select * from producto;
insert into inventarioProducto values (45,1,'2015-08-21',083,798857106);