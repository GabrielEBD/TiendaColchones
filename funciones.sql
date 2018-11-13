 --  vendedor---------------------
 -- coloca el sig numero de factura
 delimiter $
 create function numero_fac ()
	returns int
    begin
		declare num int;
        set num = 0;
        select fac_id into num from factura order by fac_id desc limit 1;
        set num = num +1;
        return num;
	end$
 delimiter ;
  -- devuelve el ultimo nuero dde factura
 delimiter $
 create function numero_fac2 ()
	returns int
    begin
		declare num int;
        set num = 0;
        select fac_id into num from factura order by fac_id desc limit 1;
        return num;
	end$
 delimiter ;
 
  delimiter $
 create function siguiente_inv_producto ()
	returns int
    begin
		declare num int;
        set num = 0;
        select invP_id into num from inventarioProducto order by invP_id desc limit 1;
        set num = num +1;
        return num;
	end$
 delimiter ;
 -- ==========================================================
 
 delimiter $
 create function ultimo_inv_producto ()
	returns int
    begin
		declare num int;
        set num = 0;
        select invP_id into num from inventarioProducto order by invP_id desc limit 1;
        return num;
	end$
 delimiter ;
 
 delimiter $
 create function sig_id_fabrica ()
	returns int
    begin
		declare num int;
        set num = 0;
        select fab_id into num from fabrica order by fab_id desc limit 1;
        set num = num +1;
        return num;
	end$
 delimiter ; 
 
 
  delimiter $
 create function numero_contrato ()
	returns int
    begin
		declare num int;
        set num = 0;
        select con_id into num from contrato order by con_id desc limit 1;
        set num = num +1;
        return num;
	end$
 delimiter ; 

delimiter $
create function id_ultimo_contrato (idempleado bigint)
	returns int
    begin
		declare numero int;
        select con_id into numero from contrato where idempleado = con_emp_numeroDocumento
			and (con_fechaFin = null);
	return numero;
    end$
delimiter ;



delimiter $
create function numero_de_contratos (idempleado bigint) 
	returns int
	begin
	declare numero int;
        select con_id into numero from contrato where idempleado = con_emp_numeroDocumento;
        set numero = found_rows();
	return numero;
	end$
delimiter ;
