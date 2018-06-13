
create table Hotel.persona(
	id_persona int primary key not null,
	nombre varchar(150) not null,
	tipo_documento int not null,
	documento varchar(15) not null,
	telefono varchar(25),
	correo_electronico varchar(100),
	estado int,
	usuario_registra int,
	fecha_registro datetime
);

use hotel ;
create table Hotel.usuario (
	id_usuario int primary key not null,
	id_persona int not null ,
	logueo varchar(50),
	clave varchar(50),
    tipo_nivel int,
	estado int,
	usuario_registra int,
	fecha_registro datetime,
    foreign key (id_persona) references persona(id_persona)
);

use hotel ;
create table Hotel.tipo_habitacion(
	id_tipo_habitacion int primary key not null,
    descripcion varchar(30) not null,
    precio double not null,
    caracteristica varchar(500),
    estado int,
	usuario_registra int,
	fecha_registro datetime
);

use hotel ;
create table Hotel.habitacion(
	id_habitacion int primary key not null,
    piso int not null,
    id_tipo_habitacion int not null,
	estado int,
	usuario_registra int,
	fecha_registro datetime,
	foreign key (id_tipo_habitacion) references tipo_habitacion(id_tipo_habitacion)
);

use hotel ;
create table Hotel.reserva_habitacion (
	id_reserva int primary key not null,
    id_habitacion int not null,
    id_persona int not null,
    fecha_reserva datetime not null,
    fecha_reserva_limite datetime not null,
    fecha_estadia_inicio datetime not null,
    fecha_estadia_fin datetime not null,
    estado int not null,
	usuario_registra int,
	fecha_registro datetime 
);


use hotel ;
create table Hotel.detalle_reserva_habitacion(
	id_detalle_reserva_habitacion int primary key not null,
	id_reserva int not null,
    id_catalogo int not null,/*el registro guarda el este campo el id de habitacion dependiendo el tipo de registro*/
    cantidad int,
    igv double,
    tipo_registro int not null, /* campo que define si va a la tabla catalogo= 1 a la tabla habitacion = 0 */
    estado int not null,
	usuario_registra int,
	fecha_registro datetime ,
	foreign key (id_reserva) references reserva_habitacion(id_reserva)    
 );

use hotel ;
create table Hotel.catalogo(
	id_catalogo int primary key  not null,
	id_catalogo_categoria int not null,
	descripcion varchar(50),
    precio double not null,
	estado int not null,
	usuario_registra int,
	fecha_registro datetime
);