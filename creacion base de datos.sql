drop schema if exists Almacen;
create schema Almacen;
use Almacen;

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

create table producto(
	pro_id int primary key,
    pro_nombre varchar (45) not null,
    pro_tipo varchar (45) not null,
    pro_marca varchar (45) not null,
    pro_cantidad int not null 
)ENGINE = InnoDB;

create table cliente (
	cli_numeroDocumento_nit bigint primary key,
    cli_nombre varchar (45),
    cli_direccion varchar (45)
)ENGINE = InnoDB;

create table empleado (
	emp_numeroDocumento  bigint primary key,
    emp_nombreApellido varchar (50),
    emp_direccion varchar (45)
)ENGINE = InnoDB;

create table telefono (
	tel_id int primary key auto_increment,
    tel_numero bigint not null,
    tel_emp_numeroDocumento     bigint null,
    tel_cli_numeroDocumento_nit bigint null, 
    foreign key (tel_emp_numeroDocumento ) references empleado (emp_numeroDocumento ),
	foreign key (tel_cli_numeroDocumento_nit) references cliente (cli_numeroDocumento_nit)
)ENGINE = InnoDB;

create table empleadoAlmacen (
	emA_emp_numeroDocumento bigint primary key,
    foreign key (emA_emp_numeroDocumento) references empleado (emp_numeroDocumento)
)ENGINE = InnoDB;

create table empleadoFabrica (
	emF_emp_numeroDocumento bigint primary key,
    foreign key (emF_emp_numeroDocumento) references empleado (emp_numeroDocumento)
)ENGINE = InnoDB;

create table factura (
	fac_id bigint primary key,
    fac_fecha date not null,
    fac_emA_numeroDocumento bigint not null,
    fac_cli_numeroDocumento_nit bigint not null,
    foreign key (fac_emA_numeroDocumento) references empleadoAlmacen  (emA_emp_numeroDocumento),
    foreign key (fac_cli_numeroDocumento_nit) references cliente (cli_numeroDocumento_nit)
)ENGINE = InnoDB;

create table comprado (
    com_fac_id bigint not null,
    com_fecha datetime not null,
    com_pro_id int not null,
    com_cantidad int not null,
    foreign key (com_fac_id) references factura (fac_id),
    foreign key (com_pro_id) references producto (pro_id),
    primary key (com_fac_id,com_pro_id)
)ENGINE = InnoDB;

create table proveedor (
	prov_id bigint primary key,
    prov_nombre varchar (45),
    prov_direccion varchar (45),
    prov_tipo varchar (45)
)ENGINE = InnoDB;

create table inventarioMaterial (
	invM_id int primary key,
    invM_nombre varchar (45) not null,
    invM_tipo varchar (45) not null,
    invN_cantidad int not null,
    invM_propiedades varchar (50)
)ENGINE = InnoDB;

create table fabrica (
	fab_id int primary key,
    fab_fecha date not null,
    cantidad_material int not null,
    fab_invM_id int not null,
    fab_invP_id int not null,
    fab_emF_emp_numeroDocumento bigint not null,
    foreign key (fab_invM_id) references inventarioMaterial (invM_id),
    foreign key (fab_invP_id) references inventarioProducto (invP_id),
    foreign key (fab_emF_emp_numeroDocumento) references empleadoFabrica (emF_emp_numeroDocumento)
)ENGINE = InnoDB;

create table provee (
	pre_fecha date not null,
    pre_cantidad int not null,
    pre_invM_id int not null,
    pre_prov_id bigint not null,
    foreign key (pre_invM_id) references inventarioMaterial (invM_id),
    foreign key (pre_prov_id) references proveedor (prov_id),
    primary key (pre_prov_id,pre_invM_id,pre_fecha)
)ENGINE = InnoDB;

create table precio (
	prec_costo int not null,
    prec_fecha date not null,
    prec_pro_id int not null,
    foreign key (prec_pro_id) references producto (pro_id),
    primary key (prec_pro_id, prec_fecha)
)ENGINE = InnoDB;

create table inventarioProducto (
	invP_id int primary key not null,
    invP_cantidadIngreso int not null,
    invP_fecha date not null,
    invP_pro_id int not null, 
    invP_prov_id bigint null,
    foreign key (invP_pro_id) references producto (pro_id),
    foreign key (invP_prov_id) references proveedor (prov_id)
)ENGINE = InnoDB;

create table contrato (
	con_id int primary key,
    con_fechaInicio date not null,
    con_fechaFin date null,
    con_salario int not null,
    con_emp_numeroDocumento bigint not null,
    foreign key (con_emp_numeroDocumento) references empleado (emp_numeroDocumento)
)ENGINE = InnoDB;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
