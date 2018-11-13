-- PERMISOS --
FLUSH PRIVILEGES;

-- -------------------------------- vendedores -------------

 grant all on productos to 'VENDEDORES'@'localhost' identified by 'vendedor';
 grant all on nom_tel_cli to 'VENDEDORES'@'localhost' identified by 'vendedor';
 grant all on nom_tl_EmpFA to 'VENDEDORES'@'localhost' identified by 'vendedor';
 grant all on produ_prec to 'VENDEDORES'@'localhost' identified by 'vendedor';
 grant all on info_factu to 'VENDEDORES'@'localhost' identified by 'vendedor';
GRANT EXECUTE ON PROCEDURE mostrar_producto  TO 'VENDEDORES'@'localhost' identified by 'vendedor';
GRANT EXECUTE ON PROCEDURE  mostrar_producto_tipo TO 'VENDEDORES'@'localhost' identified by 'vendedor';
GRANT EXECUTE ON PROCEDURE  crear_factura TO 'VENDEDORES'@'localhost' identified by 'vendedor';
GRANT EXECUTE ON PROCEDURE  adicionar_compra TO 'VENDEDORES'@'localhost' identified by 'vendedor';
GRANT EXECUTE ON PROCEDURE  incertar_telefono TO 'VENDEDORES'@'localhost' identified by 'vendedor';

-- -------------------------------- clientes -------------

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
 GRANT EXECUTE ON PROCEDURE  borrar_factura TO 'ADMIN_ALMACEN'@'localhost' identified by 'adalmacen';
 GRANT EXECUTE ON PROCEDURE  borrar_cliente TO 'ADMIN_ALMACEN'@'localhost' identified by 'adalmacen';
 GRANT EXECUTE ON PROCEDURE incertar_producto TO 'ADMIN_ALMACEN'@'localhost' identified by 'adalmacen';
 GRANT EXECUTE ON PROCEDURE incertar_precio TO 'ADMIN_ALMACEN'@'localhost' identified by 'adalmacen';
GRANT EXECUTE ON PROCEDURE actualizar_nombre_producto TO 'ADMIN_ALMACEN'@'localhost' identified by 'adalmacen';
GRANT EXECUTE ON PROCEDURE actualizar_tipo_producto TO 'ADMIN_ALMACEN'@'localhost' identified by 'adalmacen';
GRANT EXECUTE ON PROCEDURE actualizar_marca_producto TO 'ADMIN_ALMACEN'@'localhost' identified by 'adalmacen';
GRANT EXECUTE ON PROCEDURE borrar_comprado  TO 'ADMIN_ALMACEN'@'localhost' identified by 'adalmacen';
GRANT EXECUTE ON PROCEDURE borrar_comprado  TO 'ADMIN_ALMACEN'@'localhost' identified by 'adalmacen';
GRANT EXECUTE ON PROCEDURE borrar_precio TO 'ADMIN_ALMACEN'@'localhost' identified by 'adalmacen';
GRANT EXECUTE ON PROCEDURE borrar_precio_fecha TO 'ADMIN_ALMACEN'@'localhost' identified by 'adalmacen';
GRANT EXECUTE ON PROCEDURE borrar_precio_producto TO 'ADMIN_ALMACEN'@'localhost' identified by 'adalmacen';

-- --------------------------------------empleado fabrica-------------------------------------
 
 grant all on inventario_material to 'EMPLEADO_FABRICA'@'localhost'IDENTIFIED BY 'fabrica';
 grant all on Menos_Materiales to 'EMPLEADO_FABRICA'@'localhost'IDENTIFIED BY 'fabrica';
 grant all on inventario_material_can to 'EMPLEADO_FABRICA'@'localhost'IDENTIFIED BY 'fabrica';
 grant all on inventario_material_prop to 'EMPLEADO_FABRICA'@'localhost'IDENTIFIED BY 'fabrica';
 grant all on can_mat to 'EMPLEADO_FABRICA'@'localhost'IDENTIFIED BY 'fabrica';
GRANT EXECUTE ON PROCEDURE  incertar_telefono TO 'EMPLEADO_FABRICA'@'localhost'IDENTIFIED BY 'fabrica';
 GRANT EXECUTE ON PROCEDURE  material_utilizado TO 'EMPLEADO_FABRICA'@'localhost'IDENTIFIED BY 'fabrica';
 
-- ------------------------------------------administrador inventario--------------------------------- 
 
 grant all on administrador_de_inventario1 to 'ADMI_INVENTARIO'@'localhost'IDENTIFIED BY 'adainventario';
 grant all on administrador_de_inventario2 to 'ADMI_INVENTARIO'@'localhost'IDENTIFIED BY 'adainventario';
 grant all on productosVendidos_menorproveedor to 'ADMI_INVENTARIO'@'localhost'IDENTIFIED BY 'adainventario';
 grant all on basecamasVendidosPrimerMes to 'ADMI_INVENTARIO'@'localhost'IDENTIFIED BY 'adainventario';
 grant all on prov_tipo to 'ADMI_INVENTARIO'@'localhost'IDENTIFIED BY 'adainventario';
 GRANT EXECUTE ON PROCEDURE  ingreso_producto_proveedor TO 'ADMI_INVENTARIO'@'localhost'IDENTIFIED BY 'adainventario';
 GRANT EXECUTE ON PROCEDURE  eliminar_inventario_id_producto TO 'ADMI_INVENTARIO'@'localhost'IDENTIFIED BY 'adainventario';
 GRANT EXECUTE ON PROCEDURE  eliminar_inventario_id TO 'ADMI_INVENTARIO'@'localhost'IDENTIFIED BY 'adainventario';
 GRANT EXECUTE ON PROCEDURE  ingreso_material_proveedor TO 'ADMI_INVENTARIO'@'localhost'IDENTIFIED BY 'adainventario';
 GRANT EXECUTE ON PROCEDURE  eliminar_registro_inventario_menos_inventario TO 'ADMI_INVENTARIO'@'localhost'IDENTIFIED BY 'adainventario';
  GRANT EXECUTE ON PROCEDURE  eliminar_registro_inventario TO 'ADMI_INVENTARIO'@'localhost'IDENTIFIED BY 'adainventario';
   GRANT EXECUTE ON PROCEDURE  eliminar_registro_inventario_fecha TO 'ADMI_INVENTARIO'@'localhost'IDENTIFIED BY 'adainventario';
   GRANT EXECUTE ON PROCEDURE  eliminar_registro_inventario_material TO 'ADMI_INVENTARIO'@'localhost'IDENTIFIED BY 'adainventario';
   

-- ------------------------------------gerencia--------------------------------------- 

 grant all on empleados to 'GERENCIA'@'localhost'IDENTIFIED BY 'gerente';
 grant all on contratos to 'GERENCIA'@'localhost'IDENTIFIED BY 'gerente';
 grant all on nom_tel_cli_dir to 'GERENCIA'@'localhost'IDENTIFIED BY 'gerente';
 grant all on can_factus to 'GERENCIA'@'localhost'IDENTIFIED BY 'gerente';
 grant all on nom_tele to 'GERENCIA'@'localhost'IDENTIFIED BY 'gerente';
 GRANT EXECUTE ON PROCEDURE contratar_presona TO 'GERENCIA'@'localhost'IDENTIFIED BY 'gerente';
 GRANT EXECUTE ON PROCEDURE terminar_contrato_despido TO 'GERENCIA'@'localhost'IDENTIFIED BY 'gerente';
 GRANT EXECUTE ON PROCEDURE fechaFin_contrato TO 'GERENCIA'@'localhost'IDENTIFIED BY 'gerente';
 GRANT EXECUTE ON PROCEDURE nuevo_contrato TO 'GERENCIA'@'localhost'IDENTIFIED BY 'gerente';
 