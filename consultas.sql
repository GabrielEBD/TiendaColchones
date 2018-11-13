select * from producto;
select * from cliente;
select * from  empleado;
select * from telefono;
select * from empleadoalmacen;
select * from empleadofabrica;
select * from factura;
select * from comprado;
select * from inventariomaterial;
select * from proveedor;
select * from fabrica;
select * from provee;
select * from precio;
select * from inventarioproducto;
select * from contrato;

-- 1 cunatos colchnes vendi cada vendedor 
select emp_nombreApellido, sum(com_cantidad) from (
	(comprado inner join factura on (
		com_fac_id = fac_id)) inner join empleadoAlmacen on ( 
				emA_emp_numeroDocumento =fac_emA_numeroDocumento)) inner join empleado on (
						emA_emp_numeroDocumento = emp_numeroDocumento)
order by emp_nombreApellido ;
 
    -- 2 cual es producto menos vendido
select pro_nombre, sum(com_cantidad) from comprado inner join producto on (pro_id=com_pro_id)
	group by pro_nombre order by  sum(com_cantidad) asc  limit 1 ;

-- 3 cual es el proveedor que mas provee en agosto 
select prov_nombre from (proveedor inner join inventarioProducto on (prov_id = invP_prov_id)) inner join provee on (prov_id = pre_prov_id)
	where month(invP_fecha) = '08' group by prov_nombre order by sum(pre_cantidad) + sum(invP_cantidadIngreso) desc limit 1;

   -- 4 la venta mas alta 
select fac_id, fac_fecha,sum(prec_costo) from ((precio inner join producto on (prec_pro_id  = pro_id)) inner join comprado on (com_pro_id = pro_id)) inner join factura on(fac_id = com_fac_id)
	where month(fac_fecha) = '01' group by fac_id order by sum(prec_costo) desc limit 1 ; 

   -- 5 el producto que mas materiales contiene
select pro_nombre,count(fab_invM_id) from (fabrica join inventarioProducto on (fab_invP_id = invP_id)) join producto on (pro_id =  invP_pro_id)
	group by pro_nombre order by count(fab_invM_id)  desc  limit 1  ;

    -- 6 cleinte que se llamen igual al vendedor
select emp_nombreApellido from ((empleado join empleadoAlmacen on (emp_numeroDocumento = emA_emp_numeroDocumento)) join factura on (emA_emp_numeroDocumento = fac_emA_numeroDocumento)) join cliente on (fac_cli_numeroDocumento_nit = cli_numeroDocumento_nit)
	where cli_nombre = emp_nombreApellido;                                                             

    -- 7 numero de x colchon vendido por x persona en x mes
select pro_nombre, fac_fecha, emp_nombreApellido from producto, comprado, factura, empleadoAlmacen, empleado
	where (pro_id = com_pro_id) and (com_fac_id = fac_id) and (fac_emA_numeroDocumento = emA_emp_numeroDocumento) and (emA_emp_numeroDocumento = emp_numeroDocumento);

    --  8 numero de colchone comprados en el ultimo mes por un valor de 500.000 resotados 
select sum(com_cantidad),month(com_fecha) from (precio join producto on (prec_pro_id = pro_id)) join comprado on (pro_id = com_pro_id)
	where prec_costo > 500000 and month(com_fecha) = '09';
    
-- 9 espaldar mas vendidos en el primer trimesstre del año en curso por el empleado con mas salsario 
select pro_nombre from producto, comprado, factura, empleadoAlmacen, empleado, contrato where (pro_id = com_pro_id) and (com_fac_id = fac_id) and (fac_emA_numeroDocumento = emA_emp_numeroDocumento) and (emA_emp_numeroDocumento = emp_numeroDocumento) and (emp_numeroDocumento = con_emp_numeroDocumento) and
	month(fac_fecha) >= '01' and  month(fac_fecha) <= '03' and pro_nombre like '%espaldar%' order by con_salario desc limit 1;                                      
    
 -- 10 producto que se se vendio por mas 500000  fabricaso en el segundo trimeste del año
select  pro_nombre  from ((fabrica join inventarioProducto on (fab_invP_id = invP_id)) join producto on (pro_id =  invP_pro_id)) join precio on (prec_pro_id = pro_id)
    where month(fab_fecha) >= '04' and month(fab_fecha) <= '07' group by pro_id having  sum(prec_costo) > 500000 ;                                         

    --  11  numero de basecamas vendidos en el primer mes del año
select count(com_cantidad), pro_nombre from (producto inner join comprado on (pro_id = com_pro_id))  
	where pro_nombre like 'base%' and month(com_fecha) = '01'  group by pro_nombre like 'base&' ;
 
    -- 12 numero de productos proveidos en abril del presente año por el mayor proveedor 
select  count(invP_cantidadIngreso), invP_fecha, prov_nombre from (producto inner join inventarioProducto on (pro_id = invP_pro_id)) inner join proveedor on (invP_prov_id = prov_id) 
	where prov_id in (select prov_id from proveedor inner join inventarioProducto on (invP_prov_id = prov_id) where month (invP_fecha) = '08' group by prov_id order by sum(invP_cantidadIngreso) desc)
		group by prov_id order by count(invP_cantidadIngreso) desc limit 1 ;     


--  13  ESTAS DOS SON COMO UNA SOLA !!!!!
-- nombre de los productos vendidos en el mes 7
select pro_nombre from producto where pro_id in (select pro_id from producto, comprado where pro_id = com_pro_id and  month(com_fecha) = '07' group by pro_id order by sum(com_cantidad) desc);                                                        
-- nombre, id y total del producto mas ventido en el mes 7 
select pro_nombre,pro_id,sum(com_cantidad) from producto, comprado where pro_id = com_pro_id and  month(com_fecha) = '07' group by pro_id order by sum(com_cantidad) desc limit 1;                    
-- ------------------------------------------------------------------------------------------------------------
--  14 cantidad y nombre del producto base vendido en el mes 1 y del producto pillow en el mes 3 
(select count(com_cantidad), pro_nombre from (producto inner join comprado on (pro_id = com_pro_id))  
	where pro_nombre like 'base%' and month(com_fecha) = '01'  group by pro_nombre like 'base&' 
)
union
(select count(com_cantidad), pro_nombre from (producto inner join comprado on (pro_id = com_pro_id))  
	where pro_nombre like 'pillow%' and month(com_fecha) = '03'  group by pro_nombre like 'pillow&' 
);

-- 15 el nombre del empleado, y el mes en quefabrico un numero de productos menor a 20 pero mayor a 1 en esos meses
 select emp_nombreApellido,sum(invP_cantidadIngreso), month(invP_fecha) from ((empleado inner join empleadoFabrica on (emF_emp_numeroDocumento = emp_numeroDocumento)) inner join fabrica on (emF_emp_numeroDocumento = fab_emF_emp_numeroDocumento)) inner join inventarioProducto on (fab_invP_id = invP_id)
	where month(invP_fecha) >= '01' and month(invP_fecha) <= '07' group by emp_numeroDocumento having sum(invP_cantidadIngreso) > 1 and sum(invP_cantidadIngreso) < 20;                     
 
 -- 16 me muestra el promedio de ventas por dia en el emes de enero, el mes la fecha presisa de la compra y la cantidad
 (select sum(com_cantidad)/30,month(com_fecha) from comprado where month(com_fecha) = '01')
 union
 (select com_fecha, sum(com_cantidad) from comprado where month(com_fecha) = '01' group by com_fecha);

  -- 17 el cliente que mas mas conpras tiene (facturas) y mas productos a comprado
 select cli_nombre, count(fac_id) as compras, sum(com_cantidad) as productos from (cliente inner join factura on (cli_numeroDocumento_nit = fac_cli_numeroDocumento_nit)) inner join comprado on (fac_id = com_fac_id)
	group by cli_nombre order by count(fac_id) desc , sum(com_cantidad) desc limit 1;


 -- 18 cantidad del producto vendido que mas se aya comprado al proveedor
select  sum(com_cantidad), pro_nombre from ((producto inner join inventarioProducto on (pro_id = invP_pro_id)) inner join proveedor on (prov_id = invP_prov_id))inner join comprado on (pro_id = com_pro_id)                               
	 where invP_prov_id is not null group by pro_id order by sum(invP_cantidadIngreso) desc limit 1; 
 
 -- 19 materales del productos menos mendido en los ultmos dos meses
select invM_nombre, pro_nombre ,sum(com_cantidad) from (((inventarioMaterial inner join fabrica on (invM_id = fab_invM_id)) inner join inventarioProducto on (fab_invP_id = invP_id)) inner join producto on (pro_id = invP_pro_id)) inner join comprado on (com_pro_id = pro_id)
	where month(com_fecha) >= '07' and month(com_fecha) <= '09' group by fab_id order by sum(com_cantidad) desc;
 
 -- 20 numero de telefonos que tiene los epleados y los clientes
select cli_nombre, count(telefono.tel_id) as telefonoCliente, emp_nombreApellido, count(r.tel_id) as telefonoEmpleado from cliente, empleado, telefono, telefono as r 
	where cli_numeroDocumento_nit = telefono.tel_cli_numeroDocumento_nit and emp_numeroDocumento = r.tel_emp_numeroDocumento 
		group by cli_nombre, emp_nombreApellido;
 