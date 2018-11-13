-- PERMISOS --
FLUSH PRIVILEGES;

-- -------------------------------- vendedores -------------

 grant all on productos to 'VENDEDORES'@'localhost' identified by 'vendedor';
 grant all on nom_tel_cli to 'VENDEDORES'@'localhost' identified by 'vendedor';
 grant all on nom_tl_EmpFA to 'VENDEDORES'@'localhost' identified by 'vendedor';
 grant all on produ_prec to 'VENDEDORES'@'localhost' identified by 'vendedor';
 grant all on info_factu to 'VENDEDORES'@'localhost' identified by 'vendedor';
  grant all on PROCEDURE almacen.crear_factura to 'VENDEDORES'@'localhost' identified by 'vendedor';
  grant all on PROCEDURE almacen.adicionar_compra to 'VENDEDORES'@'localhost' identified by 'vendedor';
  grant all on PROCEDURE almacen.incertar_telefono to 'VENDEDORES'@'localhost' identified by 'vendedor';
-- crear_factura
select * from info_factu;
 call mostrar_producto_tipo("colchon"); 
-- -------------------------------- clientes -------------
 CALL mostrar_producto (10);
 grant all on procedure almacen.mostrar_producto  to 'CLIENTES'@'localhost' identified by '1234';
 grant all on procedure almacen.mostrar_producto_tipo   to 'CLIENTES'@'localhost' identified by '1234';
 grant all on producto_marca to 'CLIENTES'@'localhost' identified by '1234';
 grant all on produ_prec_can to 'CLIENTES'@'localhost' identified by '1234';
 grant all on nom_tl_EmpAL to 'CLIENTES'@'localhost' identified by '1234';
 grant all on pro_bases to 'CLIENTES'@'localhost' identified by '1234';
 grant all on pro_pillow to 'CLIENTES'@'localhost' identified by '1234';
 
-- ----------------------------------adm almacen --------------------

 grant all on invpro_cant_fecha to 'ADMIN_ALMACEN'@'localhost' identified by 'adalmacen';
 grant all on ini_fin_contrato to 'ADMIN_ALMACEN'@'localhost' identified by 'adalmacen';
 grant all on nom_tl_EmpAL to 'ADMIN_ALMACEN'@'localhost' identified by 'adalmacen';
 grant all on ventas_vende to 'ADMIN_ALMACEN'@'localhost' identified by 'adalmacen';
 grant all on prod_mede to 'ADMIN_ALMACEN'@'localhost' identified by 'adalmacen';
 grant all on procedure almacen.borrar_factura to 'ADMIN_ALMACEN'@'localhost' identified by 'adalmacen';
  grant all on procedure almacen.borrar_cliente to 'ADMIN_ALMACEN'@'localhost' identified by 'adalmacen';
  grant all on procedure almacen.incertar_precio to 'ADMIN_ALMACEN'@'localhost' identified by 'adalmacen';
  grant all on procedure almacen.incertar_producto to 'ADMIN_ALMACEN'@'localhost' identified by 'adalmacen';
grant all on procedure almacen.actualizar_nombre_producto to 'ADMIN_ALMACEN'@'localhost' identified by 'adalmacen';
grant all on procedure almacen.actualizar_tipo_producto to 'ADMIN_ALMACEN'@'localhost' identified by 'adalmacen';
grant all on procedure almacen.actualizar_marca_producto to 'ADMIN_ALMACEN'@'localhost' identified by 'adalmacen';
grant all on procedure almacen.borrar_comprado to 'ADMIN_ALMACEN'@'localhost' identified by 'adalmacen';
grant all on procedure almacen.borrar_comprado_poruno to 'ADMIN_ALMACEN'@'localhost' identified by 'adalmacen';
grant all on procedure almacen. borrar_precio to 'ADMIN_ALMACEN'@'localhost' identified by 'adalmacen';
grant all on procedure almacen.borrar_precio_producto  to 'ADMIN_ALMACEN'@'localhost' identified by 'adalmacen';

select * from comprado where com_fac_id = 208;  
select * from producto;

select * FROM prod_mede;
SET @OLD_SQL_SAFE_UPDATES=@@SQL_SAFE_UPDATES ,SQL_SAFE_UPDATES = 0;
delete from telefono where tel_numero > 8.794654321E9;
select * from telefono;

-- --------------------------------------empleado fabrica-------------------------------------
 
 grant all on inventario_material to 'EMPLEADO_FABRICA'@'localhost'IDENTIFIED BY 'fabrica';
 grant all on Menos_Materiales to 'EMPLEADO_FABRICA'@'localhost'IDENTIFIED BY 'fabrica';
 grant all on inventario_material_can to 'EMPLEADO_FABRICA'@'localhost'IDENTIFIED BY 'fabrica';
 grant all on inventario_material_prop to 'EMPLEADO_FABRICA'@'localhost'IDENTIFIED BY 'fabrica';
 grant all on procedure can_mat to 'EMPLEADO_FABRICA'@'localhost'IDENTIFIED BY 'fabrica';
 grant all on procedure almacen.can_mat to 'EMPLEADO_FABRICA'@'localhost'IDENTIFIED BY 'fabrica';
 grant all on procedure almacen.material_utilizado to 'EMPLEADO_FABRICA'@'localhost'IDENTIFIED BY 'fabrica';

select * from can_mat;
-- ------------------------------------------administrador inventario--------------------------------- 
 
 grant all on administrador_de_inventario1 to 'ADMI_INVENTARIO'@'localhost'IDENTIFIED BY 'adainventario';
 grant all on administrador_de_inventario2 to 'ADMI_INVENTARIO'@'localhost'IDENTIFIED BY 'adainventario';
 grant all on productosVendidos_menorproveedor3 to 'ADMI_INVENTARIO'@'localhost'IDENTIFIED BY 'adainventario';
 grant all on basecamasVendidosPrimerMes1 to 'ADMI_INVENTARIO'@'localhost'IDENTIFIED BY 'adainventario';
 grant all on prov_tipo to 'ADMI_INVENTARIO'@'localhost'IDENTIFIED BY 'adainventario';
  grant all on PROCEDURE almacen.ingreso_producto_proveedor to 'ADMI_INVENTARIO'@'localhost'IDENTIFIED BY 'adainventario';
  grant all on PROCEDURE almacen.ingreso_material_proveedor to 'ADMI_INVENTARIO'@'localhost'IDENTIFIED BY 'adainventario';
grant all on PROCEDURE almacen.eliminar_registro_inventario_menos_inventario to 'ADMI_INVENTARIO'@'localhost'IDENTIFIED BY 'adainventario';
grant all on PROCEDURE almacen.eliminar_registro_inventario_material to 'ADMI_INVENTARIO'@'localhost'IDENTIFIED BY 'adainventario';



select * from prov_tipo;
-- ------------------------------------gerencia--------------------------------------- 

 grant all on empleados to 'GERENCIA'@'localhost'IDENTIFIED BY 'gerente';
 grant all on contratos to 'GERENCIA'@'localhost'IDENTIFIED BY 'gerente';
 grant all on nom_tel_cli_dir to 'GERENCIA'@'localhost'IDENTIFIED BY 'gerente';
 grant all on can_factus to 'GERENCIA'@'localhost'IDENTIFIED BY 'gerente';
 grant all on nom_tele to 'GERENCIA'@'localhost'IDENTIFIED BY 'gerente';
 grant all on procedure almacen.contratar_presona to 'GERENCIA'@'localhost'IDENTIFIED BY 'gerente';
 grant all on procedure almacen.terminar_contrato_despido to 'GERENCIA'@'localhost'IDENTIFIED BY 'gerente';
 grant all on procedure almacen.fechaFin_contrato to 'GERENCIA'@'localhost'IDENTIFIED BY 'gerente';
 
 grant all on procedure almacen.nuevo_contrato to 'GERENCIA'@'localhost'IDENTIFIED BY 'gerente';
 
 nuevo_contrato
 
 SELECT * FROM empleado; 
 
 DELETE FROM telefono where tel_numero > 90000000;
 
 
 
 
 
 
 