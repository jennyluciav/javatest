
INSERT INTO hotel.persona
select 0,'ADMINISTRADOR',0,'12345678','525-0987','',1,0,NOW();

insert into hotel.usuario
select 0,0,'ADMINISTRADOR','123456',0,1,0,NOW();
 
insert into hotel.catalogo
select 0,0,'PADRE',0,1,0,now() 
union all 
select 1,0,'DOCUMENTO DE IDENTIDAD',0,1,0,now()
union all 
select 2,1,'DNI',8,1,0,now()
union all 
select 3,1,'RUC',11,1,0,now()
union all 
select 4,1,'CARNET EXTRANJERIA',15,1,0,now();

select * from hotel.persona
