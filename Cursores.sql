DELIMITER $$

CREATE PROCEDURE producto_masvendido()

BEGIN

-- Declaración de variables
DECLARE pronombre varchar(45);
DECLARE ACUMULADO INT;
DECLARE TEMPV INT DEFAULT 0;
DECLARE TEMPID INT DEFAULT 0;

-- Definición de la consulta
DECLARE producto_masvendido_cursor CURSOR FOR
select pro_nombre, sum(com_cantidad) from comprado inner join producto on (pro_id=com_pro_id)
	group by pro_nombre order by  sum(com_cantidad) desc  limit 1 ;


-- Declaración de un manejador de error tipo NOT FOUND
DECLARE CONTINUE HANDLER FOR NOT FOUND SET @hecho = TRUE;

-- Abrimos el cursor
OPEN producto_masvendido_cursor;

-- Comenzamos nuestro bucle de lectura
loop1: LOOP

-- Obtenemos la primera fila en la variables correspondientes
FETCH producto_masvendido_cursor INTO pronombre, ACUMULADO;

-- Si el cursor se quedó sin elementos,
-- entonces nos salimos del bucle
IF @hecho THEN
LEAVE loop1;
END IF;

-- Guardamos el acumulado de ventas y el nombre
-- si el producto actual tiene mejores resultados
IF ACUMULADO >= TEMPV THEN
SET TEMPV = ACUMULADO;
SET TEMPID = pronombre;
END IF;

END LOOP loop1;

-- Cerramos el cursor
CLOSE producto_masvendido_cursor;



END$$

DELIMITER ;
/*ikcknf*/
DELIMITER $$

CREATE PROCEDURE mayor_venta()

BEGIN

-- Declaración de variables
DECLARE facid int;
DECLARE ACUMULADO INT;
DECLARE facfecha datetime;

-- Definición de la consulta
DECLARE mayor_venta_cursor CURSOR FOR
select fac_id, fac_fecha,sum(prec_costo) from ((precio inner join producto on (prec_pro_id  = pro_id)) inner join comprado on (com_pro_id = pro_id)) inner join factura on(fac_id = com_fac_id)
group by fac_id order by sum(prec_costo) desc limit 1 ; 


-- Declaración de un manejador de error tipo NOT FOUND
DECLARE CONTINUE HANDLER FOR NOT FOUND SET @hecho = TRUE;

-- Abrimos el cursor
OPEN mayor_venta_cursor;

-- Comenzamos nuestro bucle de lectura
loop1: LOOP

-- Obtenemos la primera fila en la variables correspondientes
FETCH mayor_venta_cursor INTO facid , ACUMULADO, facfecha;

-- Si el cursor se quedó sin elementos,
-- entonces nos salimos del bucle
IF @hecho THEN
LEAVE loop1;
END IF;



END LOOP loop1;

-- Cerramos el cursor
CLOSE mayor_venta_cursor;


END$$

DELIMITER ;
/*tres*/
DELIMITER $$

CREATE PROCEDURE mayor_proveedor()

BEGIN

-- Declaración de variables
DECLARE provnombre varchar(45);
DECLARE sum INT;

-- Definición de la consulta
DECLARE mayor_proveedor_cursor CURSOR FOR
select prov_nombre, sum(pre_cantidad) + sum(invP_cantidadIngreso) from (proveedor inner join inventarioProducto on (prov_id = invP_prov_id)) inner join provee on (prov_id = pre_prov_id)
	 group by prov_nombre order by sum(pre_cantidad) + sum(invP_cantidadIngreso) desc limit 1;


-- Declaración de un manejador de error tipo NOT FOUND
DECLARE CONTINUE HANDLER FOR NOT FOUND SET @hecho = TRUE;

-- Abrimos el cursor
OPEN mayor_proveedor_cursor;

-- Comenzamos nuestro bucle de lectura
loop1: LOOP

-- Obtenemos la primera fila en la variables correspondientes
FETCH mayor_proveedor_cursor INTO provnombre , sum;

-- Si el cursor se quedó sin elementos,
-- entonces nos salimos del bucle
IF @hecho THEN
LEAVE loop1;
END IF;


END LOOP loop1;

-- Cerramos el cursor
CLOSE mayor_proveedor_cursor;



END$$

DELIMITER ;

