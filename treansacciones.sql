-- ----------------borra contratos-----------------

START TRANSACTION;
   DELETE FROM contrato;
   select * from contrato;
rollback;
select * from contrato;

-- -----------------------------------------

SET SQL_SAFE_UPDATES = 0;

-- -----------------------aumenta salario----------------------

sTART TRANSACTION;
   SAVEPOINT A;
   update contrato set con_salario = con_salario + 0.1*con_salario;
   select con_id, con_salario from contrato;
   select * from contrato;
   rollback to savepoint A;
select con_id, con_salario from contrato;

-- --------------------------------actualiza proveedor--------------------
select * from  proveedor;


START TRANSACTION;
    UPDATE proveedor SET prov_nombre='espumados sociedad anonima' WHERE prov_id=8600366495;
    UPDATE proveedor SET prov_nombre='confortflex' WHERE prov_id=900592366;
    select * from  proveedor;
ROLLBACK;

-- -------------------------50 porciento de descuento--------------------------------
select * from precio;

START TRANSACTION;
update precio set prec_costo = prec_costo/2  WHERE prec_pro_id=10 ;
update precio set prec_costo = prec_costo/2  WHERE prec_pro_id=11 ;
update precio set prec_costo = prec_costo/2  WHERE prec_pro_id=12 ;
update precio set prec_costo = prec_costo/2  WHERE prec_pro_id=13 ;
update precio set prec_costo = prec_costo/2  WHERE prec_pro_id=14 ;
update precio set prec_costo = prec_costo/2  WHERE prec_pro_id=16 ;
ROLLBACK;


-- -----------------------------------------------------------










