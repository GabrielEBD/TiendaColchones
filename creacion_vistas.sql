-- VISTAS --

-- ususario=vendedor ------------------------------------------------------------------------------

-- 1. muestra el producto y la cantidad en existencia --
CREATE VIEW productos AS SELECT pro_nombre, pro_cantidad FROM producto;
select * from productos;

-- 2. muestra el nombre y el telefono de los clientes--
CREATE VIEW nom_tel_cli AS SELECT cli_nombre, tel_numero FROM cliente, telefono
where (cli_numeroDocumento_nit = tel_cli_numeroDocumento_nit);
select * from nom_tel_cli;

-- 3. muestra el nombre y el telefono de los empeados de fabrica --
CREATE VIEW nom_tl_EmpFA AS SELECT emp_nombreApellido, tel_numero FROM
(empleado inner join empleadofabrica on (emp_numeroDocumento = emF_emp_numeroDocumento)) inner join telefono on
(emp_numeroDocumento = tel_emp_numeroDocumento);
select * from nom_tl_EmpFA;

-- 4. muestra el producto y el precio --
CREATE VIEW produ_prec AS SELECT pro_nombre, prec_costo FROM producto, precio where (pro_id = prec_pro_id);
select * from produ_prec;

-- 5. muestra la informacion de una factura (id, fecha , vendedor)--
CREATE VIEW info_factu AS SELECT  emp_nombreApellido,fac_id , fac_fecha  FROM 
(empleado inner join empleadoalmacen on (emp_numeroDocumento = ema_emp_numeroDocumento)) inner join factura on
(emp_numeroDocumento = fac_emA_numeroDocumento) ;
select * from info_factu;

-- ususario= clientes --------------------------------------------------------------------------------

-- 1. muestra el producto y la marca --
CREATE VIEW producto_marca AS SELECT pro_nombre, pro_marca FROM producto;
select * from producto_marca;

-- 2. muestra el producto, la cantidad en existencia y el precio --
CREATE VIEW produ_prec_can AS SELECT pro_nombre, pro_cantidad, prec_costo FROM producto, precio where (pro_id = prec_pro_id);
select * from produ_prec_can;


-- 3. muestra los nombres y telefonos de los vendedores --
CREATE VIEW nom_tl_EmpAL AS SELECT emp_nombreApellido, tel_numero FROM
(empleado inner join empleadoalmacen on (emp_numeroDocumento = ema_emp_numeroDocumento)) inner join telefono on
(emp_numeroDocumento = tel_emp_numeroDocumento);
select * from nom_tl_Empal;

-- 4. muestra los productos que son bases y sus medidas --
CREATE VIEW pro_bases AS SELECT pro_nombre FROM producto where pro_nombre like 'base%' ;
select * from pro_bases;

-- 5. muestra los productos que son pillow y su canntidad ---
CREATE VIEW pro_pillow AS SELECT pro_nombre FROM producto where pro_nombre like 'pillow%';
select * from pro_pillow;


-- ususario=adm de almacen------------------------------------------------------------------------------

-- 1. muestra la cantidad y la fecha de ingreso de inventario producto --
CREATE VIEW invpro_cant_fecha AS SELECT  invP_cantidadIngreso , invP_fecha, pro_nombre  FROM
inventarioProducto ,producto where (pro_id = invP_pro_id);
select * from invpro_cant_fecha;

-- 2. muestra la fecha de inicio y fin del contratro de los empleados de almacen--
CREATE VIEW ini_fin_contrato AS SELECT  con_fechaInicio, con_fechaFin , emp_nombreApellido  FROM
(empleado inner join empleadoalmacen on (emp_numeroDocumento = ema_emp_numeroDocumento)) inner join contrato on
(emp_numeroDocumento = con_emp_numeroDocumento);
select * from ini_fin_contrato;

-- 3. muestra el nombre y el telefono de los empeados de almacen --
CREATE VIEW nom_tl_EmpAL AS SELECT emp_nombreApellido, tel_numero FROM
(empleado inner join empleadoalmacen on (emp_numeroDocumento = ema_emp_numeroDocumento)) inner join telefono on
(emp_numeroDocumento = tel_emp_numeroDocumento);
select * from nom_tl_Empal;

-- 4. muestra la cantidad de ventas de cada vendedor --
CREATE VIEW ventas_vende AS SELECT  emp_nombreApellido, sum(com_cantidad) from ((comprado inner join factura 
on (com_fac_id = fac_id)) inner join empleadoAlmacen on ( emA_emp_numeroDocumento =fac_emA_numeroDocumento)) 
inner join empleado on (emA_emp_numeroDocumento = emp_numeroDocumento)
 group by emp_nombreApellido ;
select * from ventas_vende;

-- 5. muestra la cantidad de productos clasificados en tipo--
CREATE VIEW prod_mede AS SELECT  pro_tipo , count(pro_nombre) from producto group by pro_tipo ;
select * from prod_mede;


-- ususario=empleado de fabrica------------------------------------------------------------------------------

-- 1. Muestra nombre y cantidad del inventario material--
CREATE VIEW inventario_material AS SELECT invM_nombre, invN_cantidad FROM inventarioMaterial;
select * from inventario_Material1;

-- 2. Muestra el producto que menos materiales tiene--------------------------------
CREATE VIEW Menos_Materiales AS select pro_nombre,count(fab_invM_id) from (fabrica join inventarioProducto on (fab_invP_id = invP_id)) 
join producto on (pro_id =  invP_pro_id)group by pro_nombre order by count(fab_invM_id)  asc  limit 1  ;
select * from Menos_Materiales;

-- 3. muestra el inventario por tipo --
CREATE VIEW inventario_material_can AS SELECT invM_tipo, count(invN_cantidad) as cant FROM inventarioMaterial group by invM_tipo;
select * from inventario_material_can;

-- 4. muestra el nombre y los detalles(medidas, color) de los materiales--
CREATE VIEW inventario_material_prop AS SELECT invm_nombre, invM_propiedades as detalles FROM inventarioMaterial;
select * from inventario_material_prop;

-- 5. muestra la cantidad de material utilizado en cada mes-
CREATE VIEW can_mat AS SELECT month(fab_fecha) as mes, count(cantidad_material) FROM fabrica group by month(fab_fecha);
select * from can_mat;

SELECT * FROM FABRICA;
-- ususario= adm inventario------------------------------------------------------------------------------

-- 1. Muestra nombre y cantidad del inventario material */
CREATE VIEW administrador_de_inventario1 AS SELECT invM_nombre, invN_cantidad FROM inventarioMaterial;
select * from administrador_de_inventario1;

-- 2. Muestra id y cantidad de ingreso del inventario produto*/
CREATE VIEW administrador_de_inventario2 AS SELECT invP_cantidadIngreso, invP_id FROM inventarioProducto;
select * from administrador_de_inventario2;

-- 3. Muestra numero de productos proveidos en agosto por el menor proveedor*/
create view productosVendidos_menorproveedor3 as select  count(invP_cantidadIngreso), invP_fecha, prov_nombre from 
(producto inner join inventarioProducto on (pro_id = invP_pro_id)) inner join proveedor on (invP_prov_id = prov_id) 
where prov_id in (select prov_id from proveedor inner join inventarioProducto on (invP_prov_id = prov_id)  group by prov_id order by sum(invP_cantidadIngreso) desc)
group by prov_id order by count(invP_cantidadIngreso) asc  ;
select * from productosVendidos_menorproveedor3 ;
    
-- 4. Muestra numero de basecamas vendidos en el primer mes del año*/
create view basecamasVendidosPrimerMes1 as select count(com_cantidad), pro_nombre, com_fecha from (producto inner join comprado on (pro_id = com_pro_id))  
where pro_nombre like 'base%'  group by month(com_fecha), pro_nombre  like 'base&' ;
select * from basecamasVendidosPrimerMes1;

-- 5. muestra el nombre del proveedor y lo que provee --
CREATE VIEW prov_tipo AS SELECT prov_nombre, prov_tipo FROM proveedor;
select * from prov_tipo;


-- ------------------- Gerencia ------------------------------

-- 1.  Muestra nombre de los empleados de la empresa-------
CREATE VIEW empleados AS SELECT emp_nombreApellido FROM empleado;
select * from empleados;

-- 2. . Muestra la fecha del final de contrato de cada empleado----
CREATE VIEW contratos AS SELECT emp_nombreApellido , con_fechaFin FROM empleado join contrato 
on emp_numeroDocumento=con_emp_numeroDocumento;
select * from contratos;

-- 3. muestra la informacion del cliente(nmbre telefono y direccion)---------

CREATE VIEW nom_tel_cli_dir AS SELECT cli_nombre, cli_direccion, tel_numero FROM cliente, telefono
where (cli_numeroDocumento_nit = tel_cli_numeroDocumento_nit);
select * from nom_tel_cli_dir;

-- 4. muestra la cantidad de facturas por mes ---
CREATE VIEW can_factus AS SELECT month(fac_fecha) as mes, count(fac_id) as facturas FROM factura group by month(fac_fecha);
select * from can_factus;

-- 5. muestras el nombre y el telefono de clientes y empleados --
CREATE VIEW nom_tele AS SELECT cli_nombre, tel_numero FROM cliente, telefono
where (cli_numeroDocumento_nit = tel_cli_numeroDocumento_nit) union SELECT emp_nombreApellido, tel_numero FROM
empleado , telefono where (emp_numeroDocumento=tel_emp_numeroDocumento);
select * from nom_tele;


