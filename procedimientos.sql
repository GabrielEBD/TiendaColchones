-- vendedor -- cliente 
drop procedure if exists mostrar_producto ;
delimiter $
create procedure mostrar_producto (id int) 
	begin
		select pro_nombre, pro_tipo, pro_marca, pro_cantidad, prec_costo from producto
        inner join precio on (pro_id = prec_pro_id) where id = pro_id group by pro_nombre order by prec_fecha desc;
    end $
delimiter ;

select * from producto;
call mostrar_producto(10);

drop procedure if exists mostrar_producto_tipo;

delimiter $
create procedure mostrar_producto_tipo (tipo varchar(45)) 
	begin
		select pro_nombre, pro_tipo, pro_marca, pro_cantidad, prec_costo from
        producto inner join precio on (pro_id = prec_pro_id) where tipo = pro_tipo
        group by pro_nombre order by prec_fecha desc;
    end $
delimiter ;

drop procedure if exists crear_factura;
-- crea uan factura con cliente y el telefono-------------------------------------------------------------
 delimiter $
 create procedure crear_factura (
		facid int,
        clid bigint,
        clinom varchar(45),
        clidic varchar(45),
        clitel bigint,
        empid bigint
        )
	begin
		declare fecha datetime;
        select now() into fecha;
        insert into cliente values (clid,clinom,clidic);
		insert into factura values (facid,fecha,empid,clid);
        insert into telefono(tel_numero,tel_cli_numeroDocumento_nit) values (clitel,clid);
    end$
 delimiter ;
 -- adiciona a la factura las compras realizadas===========================================================================
 select now() into @var;
 select numero_fac() into @var;
 call crear_factura(@var,45,'juan','calle 35',78965422,1022409274);
 select * from empleado;
 select @var;
 
 drop procedure if exists adicionar_compra;
 delimiter $
 create procedure adicionar_compra (idfac int, idpro int,cantidad int)
	begin
		declare fecha datetime;
        select now() into fecha;
		insert into comprado values (idfac, fecha, idpro, cantidad);
    end$
 delimiter ;
 
 set @var = 0;
 select numero_fac2() into @var;
 call adicionar_compra (@var,010,1);
 select * from comprado;
 
 drop procedure if exists incertar_telefono;
 delimiter $
 create procedure incertar_telefono(empid bigint, clid bigint, tel bigint) -- =====================================================
	begin
		if (empid = 0) then
			insert into telefono(tel_numero,tel_cli_numeroDocumento_nit) values (tel,clid);
		elseif (clid = 0) then
			insert into telefono(tel_numero,tel_emp_numeroDocumento) values (tel,empid);
		end if;
    end $
 delimiter ;
 
 call incertar_telefono (1022409274, 0,8794654321);
 select * from telefono;
 -- crear trigger para reducir inventario en cada compra 
 
 -- -----EMPLEADO FABRICA --------------------------------------------------------------------------
 
 drop procedure if exists crear_producto_empleado;
  delimiter $
 create procedure crear_producto_empleado (
		invid int,
        proid int,
        cantidad int
        )
	begin
		declare fecha datetime;
        select now() into fecha;
        insert into inventarioProducto(invP_id, invP_cantidadIngreso, invP_fecha, invP_pro_id) 
			values (invid,cantidad,fecha,proid);
    end$
 delimiter ;
 select siguiente_inv_producto () into @var;
 call crear_producto_empleado (@var,010,1);
 select * from inventarioProducto;
 select @var;
 
 -- ----------------------------------
 drop procedure if exists material_utilizado;
 delimiter $
 create procedure material_utilizado (fabricaId int, idinvP int, idemp int, idinvM int, cant int)
	begin
		declare fecha datetime;
        select now() into fecha;
		insert into fabrica values (fabricaId, fecha, cant, idinvM, idinvP, idemp);
	end $
 delimiter ;
 set @id2 = 0;
 select ultimo_inv_producto () into @var;
 select @var;
 select sig_id_fabrica () into @id2;
 select @id2;
  call material_utilizado (@id2, @var, 7659458, 202, 1);
 select @var;
 select * from fabrica;
 select * from inventarioMaterial;
 -- =============ADMINISTRADOR INVENTARIO===================================================================
 
 drop procedure if exists ingreso_producto_proveedor;
 delimiter $
 create procedure ingreso_producto_proveedor (invproid int, provid bigint, proid int, cantidad int )
	begin
		declare fecha datetime;
        select now() into fecha;
        insert into inventarioProducto values (invproid, cantidad, fecha, proid, provid);
	end$
 delimiter ;
 -- con repercusion en la cantidad actual del producto
 SELECT * FROM inventarioProducto;
 
 drop procedure if exists eliminar_inventario_id_producto;
 delimiter $
 create procedure eliminar_inventario_id_producto (id int, tipo_ingreso varchar(45)) -- por id del inventario
	begin
		declare num int;
        declare num2 int;
        
		if (tipo_ingreso = 'empleado') then
        
			select invP_pro_id into num from inventarioProducto where invP_id = id;
            select invP_cantidadIngreso into num2 from inventarioProducto where invP_id = id;
            
            update producto set pro_cantidad = pro_cantidad - num2 where num = pro_id;
            
			delete from inventarioProducto where invP_id = id;
            delete from fabrica where id = fab_invP_id; 
            
        elseif (tipo_ingreso = 'proveedor') then 
        
			select invP_pro_id into num from inventarioProducto where invP_id = id;
            select invP_cantidadIngreso into num2 from inventarioProducto where invP_id = id;
            
            update producto set pro_cantidad = pro_cantidad - num2 where num = pro_id;
            
			delete from inventarioProducto where invP_id = id;
		end if;
        
	end $
 delimiter ;
 
 set @var = 'proveedor';
 call eliminar_inventario_id_producto(16,@var);
 select * from inventarioProducto;


 
 -- sin repercusiones en la cantidad actual del producto
 
 drop procedure if exists eliminar_inventario_id;
  delimiter $
 create procedure eliminar_inventario_id (id int, tipo_ingreso varchar(45)) -- por id del inventario
	begin
		declare num int;
        declare num2 int;

		if (tipo_ingreso = 'empleado') then
            delete from inventarioProducto where invP_id = id;
		delete from fabrica where id = fab_invP_id; 
        elseif (tipo_ingreso = 'proveedor') then 
			delete from inventarioProducto where invP_id = id;
		end if;

	end $
 delimiter ;
 
 drop procedure if exists ingreso_material_proveedor;
 delimiter $
 create procedure ingreso_material_proveedor (provid bigint,matid int, cantidad int)
	begin
		declare fecha datetime; 
        select now() into fecha;
        
		
        insert into provee values (fecha, cantidad, matid, provid);
        update inventarioMaterial set invN_cantidad = invN_cantidad + cantidad where matid = invM_id; -- esto en lugar al triger
        
        
    end $
 delimiter ;
 -- eiminacion con repercucion en la cantidad de inventariomaterial
 
 drop procedure if exists eliminar_registro_inventario_menos_inventario;
 delimiter $
 create procedure eliminar_registro_inventario_menos_inventario (fecha datetime, provid bigint, matid int)
	begin
		declare num int;
        select pre_cantidad into num from provee 
			where (pre_fecha = fecha) and (provid = pre_prov_id) and (matid = pre_invM_id);
		
        
        
        delete from provee where (pre_fecha = fecha) and (provid = pre_prov_id) and (matid = pre_invM_id);
        update inventarioMaterial set invN_cantidad = invN_cantidad - num where (matid = invM_id);
        
        
    end $
 delimiter ;
 
 -- sin repercucion en la cantidad de inventariomaterial
 drop procedure if exists eliminar_registro_inventario;
 delimiter $
 create procedure eliminar_registro_inventario (fecha datetime, provid bigint, matid int)
	begin
		SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
			delete from provee where (pre_fecha = fecha) and (provid = pre_prov_id) and (matid = pre_invM_id);
		SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
    end $
 delimiter ;
 -- solo por fecha
 drop procedure if exists eliminar_registro_inventario_fecha;
 delimiter $
 create procedure eliminar_registro_inventario_fecha (fecha datetime)
	begin
		SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
			delete from provee where (pre_fecha = fecha);
        SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
	end $
 delimiter ;
 -- solo por material
 drop procedure if exists eliminar_registro_inventario_material;
 delimiter $
 create procedure eliminar_registro_inventario_material ( matid int)
	begin
		
			delete from provee where(matid = pre_invM_id);
        
	end $
 delimiter ;
 
 select * from inventarioProducto;
 
 -- ================== ADMINISTRADOR ALMACEN ===================================================================


drop procedure if exists borrar_factura;
delimiter $
create procedure borrar_factura (id int)
	begin
		
			delete from factura where fac_id = id;
			delete from comprado where com_fac_id = id;
        
    end$
delimiter ;

call borrar_factura (205);
select *from factura;
select * from comprado where com_fac_id = 205;
select * from producto; -- producto 22


drop procedure if exists borrar_cliente;
delimiter $
create procedure borrar_cliente (id bigint)
	begin
		
			delete from cliente where id = cli_numeroDocumento_nit;
			delete from telefono where id = tel_cli_numeroDocumento_nit;
        
    end$
delimiter ;

drop procedure if exists incertar_producto;
delimiter $
create procedure incertar_producto (id int, nombre varchar(45), tipo varchar(45), marca varchar(45), cantidad int)
	begin
		insert into producto values (id,nombre,tipo,marca,cantidad);
    end$
delimiter ;
--                ----------------=============================================================
drop procedure if exists incertar_precio;
delimiter $
create procedure incertar_precio (id int, precio int)
	begin
		declare fecha date; 
        select curdate() into fecha;
		insert into precio values (precio, fecha, id);
    end$
delimiter ;
-- tipo marca 

drop procedure if exists actualizar_nombre_producto;
delimiter $
create procedure actualizar_nombre_producto (id int, nombre varchar (45))
	begin 
		
			update producto set pro_nombre = nombre where id = pro_id;
		
    end$
delimiter ;

drop procedure if exists actualizar_tipo_producto;
delimiter $
create procedure actualizar_tipo_producto (id int, tipo varchar (45))
	begin 
		
			update producto set pro_tipo = tipo where id = pro_id;
        
    end$
delimiter ;

drop procedure if exists actualizar_marca_producto;
delimiter $
create procedure actualizar_marca_producto (id int, marca varchar (45))
	begin 
			update producto set pro_marca = marca where id = pro_id;
	end$
delimiter ;
/*
 SET @OLD_SQL_SAFE_UPDATES=@@SQL_SAFE_UPDATES ,SQL_SAFE_UPDATES = 0;
 SET SQL_SAFE_UPDATES=@OLD_SQL_SAFE_UPDATES;
 */
drop procedure if exists borrar_comprado;
delimiter $
create procedure borrar_comprado (idfactura int) -- trigger para que buelva acolocar lo que se quito  cuando se borra compra
	begin
		
			delete from comprado where idfactura = com_fac_id;
        
	END$
delimiter ;
-- ==================== borrar de comprado individial

drop procedure if exists borrar_comprado_poruno;
delimiter $
create procedure borrar_comprado_poruno (idfactura int, proid int)
	begin
		
			delete from comprado where idfactura = com_fac_id and proid = com_pro_id;
	
    END$
delimiter ;
  -- borra los precios uno por uno
drop procedure if exists borrar_precio;
delimiter $
create procedure borrar_precio (proid int , fecha date)
	begin
		
			delete from precio where proid = prec_pro_id and fecha = prec_fecha;
        
    end$
delimiter ;


select * from precio;
 -- borra los precios por fecha 
drop procedure if exists borrar_precio_fecha
delimiter $
create procedure borrar_precio_fecha (fecha date)
	begin
		SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
			delete from precio where fcha = prec_fecha;
		SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
    end$
delimiter ;
-- borra por producto los pecios 
drop procedure if exists borrar_precio_producto;
delimiter $
create procedure borrar_precio_producto (proid int)
	begin
		
			delete from precio where proid = prec_pro_id;
        
    end$
delimiter ;

-- ================================	 GERENCIA PERSONA =============================================================

drop procedure if exists contratar_presona;
delimiter $
create procedure contratar_presona(
	idpersona bigint,
	nombre varchar(50),
    direccion varchar (45),
    telefono bigint,
    cargo varchar (20),
    salario int,
    numeroContrato int
    )
    begin
		declare fecha datetime; 
        select now() into fecha;
        
		insert into empleado values (idpersona,nombre,direccion);
        
        insert into telefono(tel_numero, tel_emp_numeroDocumento) values (telefono, idpersona);
        
        insert into contrato(con_id, con_fechaInicio, con_salario, con_emp_numeroDocumento)
			values (numeroContrato, fecha, salario, idpersona);
        
        if (cargo = 'fabrica') then 
			insert into empleadoFabrica values (idpersona);
		elseif (cargo = 'almacen') then
			insert into empleadoAlmacen values (idpersona);
		end if;
    end$
delimiter ;
set @var = 0;
select numero_contrato () into @var;
CALL contratar_presona(78945609,'CARLitos','calle 26',78654008,'fabrica',400045,@var);
select @var;
drop procedure if exists terminar_contrato_despido;
delimiter $
create procedure terminar_contrato_despido (empleadoid bigint)
	begin
		declare fecha datetime; 
        
        select now() into fecha;
		update contrato set con_fechaFin = fecha where empleadoid = con_emp_numeroDocumento;
        
    end$
delimiter ;

select * FROM empleado;

drop procedure if exists fechaFin_contrato;
delimiter $
create procedure fechaFin_contrato (in empleadoid bigint, in fecha date, out validacion varchar(45))
	begin
		declare fecha1 datetime; 
        select now() into fecha1;
       
		if (fecha > fecha1) then
			update contrato set con_fechaFin = fecha where empleadoid = con_emp_numeroDocumento;
            set validacion = 'proceso completado correctamente';
		else 
			set validacion = 'fecha no valida, ingrese una fecha mayor';
		end if;
         
    end$
delimiter ;
select * from contrato;
call fechaFin_contrato (78945609,'2015-11-01',@var);
select @var;

drop procedure if exists nuevo_contrato;
delimiter $
create procedure nuevo_contrato (
    in fechafin date,
    in fechanueva date,
    in salario int,
    in idempledo bigint,
    out validacion varchar(155)
    )
begin
		declare num2 int;
		declare fecha1 date;
        declare numero int;
        select id_ultimo_contrato(idempledo) into numero;
        select curdate() into fecha1;
        
		if ((fechafin > fecha1) and (fechafin <= fechanueva)) then
			select numero_contrato() into num2;
            
			update contrato set con_fechaFin = fechafin where numero = con_id;
            
            insert into contrato(con_id,con_fechaInicio,con_salario,con_emp_numeroDocumento) 
            values (num2, fechanueva, salario, idempledo);
            
            set validacion ='se a realizado el proceso correctamente';
		else
			if (fechafin < fecha1) then
				set validacion = 'fecha de finalizacion de contrato no valida, ingrese una fecha mayor';
			elseif (fechafin > fechanueva) then 
				set validacion = 'incoherencia entre fechas, la ficha de fin de contrato no puede ser mayo a la del nuevo contrato';
			end if;
		end if;
        
end $
delimiter ;

select numero_contrato () into @var;
set @var2 = '';
call  nuevo_contrato ('2015-12-30','2016-06-30',500002,78945609,@var2);
select * from contrato;
select @var2;