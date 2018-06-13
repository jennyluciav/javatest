use rokagym_db;
drop PROCEDURE if exists rokagym_db.proc_modelo_get;
create PROCEDURE rokagym_db.proc_modelo_get(in p_tabla VARCHAR(50))  
BEGIN
/*creamos la cabecera*/

select CONCAT("/*",CHAR(10),
"*Nombre Archivo : ",p_tabla,"be.java",CHAR(10),
"*Nombre Clase   : ",p_tabla,CHAR(10),
"*Creador Archivo: ",@@hostname ,CHAR(10),
"*Fecha Creacion : ",now() ,CHAR(10),
"*/",char(10),char(10)) 
union all 
 
/*creamos el packete*/

select CONCAT("package be;",char(10),"import java.sql.Date;",char(10))


union all 
/*creamos la clase*/
select CONCAT("public class ",p_tabla,"be {",char(10))
union all  
/*creamos las variables*/
select  CONCAT("private ",case when DATA_TYPE = 'VARCHAR' THEN "String" ELSE 
															CASE when DATA_TYPE = 'datetime' THEN 'Date' else DATA_TYPE end END ," ",COLUMN_NAME,"; ",char(10)) from information_schema.COLUMNS
where TABLE_SCHEMA = 'rokagym_db' and  table_name = p_tabla
 

/*creamos los constructores*/
union all 
select CONCAT("public ",p_tabla,"be (){}",char(10))

union all 
select CONCAT("public ",p_tabla,"be (",(select GROUP_CONCAT(CONCAT(case when DATA_TYPE = 'VARCHAR' THEN "String" ELSE 
																																												CASE when DATA_TYPE = 'datetime' THEN "Date" else DATA_TYPE end END ," ",COLUMN_NAME )) from information_schema.COLUMNS
																				where TABLE_SCHEMA = 'rokagym_db' and  table_name = p_tabla
																				group by table_name),"){",char(10))
union all 

select CONCAT("this.",COLUMN_NAME,"=",COLUMN_NAME,"; ",char(10)) from information_schema.COLUMNS
where TABLE_SCHEMA = 'rokagym_db' and  table_name = p_tabla
union all 
select CONCAT("}",char(10))
union all 

/*creamos los Get-Set */


select CONCAT("public ",case when DATA_TYPE = 'VARCHAR' THEN "String" ELSE CASE when DATA_TYPE = 'datetime' THEN "Date" else DATA_TYPE end END ,
" get",CONCAT(UCASE(LEFT(COLUMN_NAME, 1)),LCASE(SUBSTRING(COLUMN_NAME, 2))),"(){",char(10),
"return ",COLUMN_NAME,"; ",char(10),'}',char(10),
"public void set",CONCAT(UCASE(LEFT(COLUMN_NAME, 1)),LCASE(SUBSTRING(COLUMN_NAME, 2))),"("
,
case when DATA_TYPE = 'VARCHAR' THEN "String" ELSE CASE when DATA_TYPE = 'datetime' THEN "Date" else DATA_TYPE end END," ",
COLUMN_NAME
,"){",char(10),
"this.",COLUMN_NAME,"=",COLUMN_NAME,"; ",char(10),'}',char(10)
) from information_schema.COLUMNS
where TABLE_SCHEMA = 'rokagym_db' and  table_name = p_tabla
union all 
select CONCAT("}",char(10))
;


END
;
call rokagym_db.proc_modelo_get('usuario');
/*BE*/