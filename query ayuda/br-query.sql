
use rokagym_db;
drop PROCEDURE if exists rokagym_db.proc_bl_get;
create PROCEDURE rokagym_db.proc_bl_get(in p_tabla VARCHAR(50))  
BEGIN
/*creamos la cabecera*/

select CONCAT("/*",CHAR(10),
"*Nombre Archivo : ",p_tabla,"br.java",CHAR(10),
"*Nombre Clase   : ",p_tabla,CHAR(10),
"*Creador Archivo: ",@@hostname ,CHAR(10),
"*Fecha Creacion : ",now() ,CHAR(10),
"*/",char(10),char(10)) 
union all 
 

select CONCAT("package br;",char(10) 
,"import be.",p_tabla,"be;",char(10)
,"import dao.",p_tabla,"dao;",char(10) 
,"import java.util.List;",char(10))
 

union all 
/*creamos la clase*/
select CONCAT("public class ",p_tabla,"br {",char(10))
union all  
   
select CONCAT("public ",p_tabla,"br (){}",char(10))

union all 

select CONCAT("public ",p_tabla,"be get",CONCAT(UCASE(LEFT(p_tabla, 1)),LCASE(SUBSTRING(p_tabla, 2))),"( ",(select CONCAT(data_type , " " , COLUMN_NAME)  
				from information_schema.COLUMNS 
				where TABLE_SCHEMA = 'rokagym_db' AND table_name = p_tabla and column_key = 'PRI'),"){" ,

"
return new ",p_tabla,"dao().get",CONCAT(UCASE(LEFT(p_tabla, 1)),LCASE(SUBSTRING(p_tabla, 2))),"(",(select CONCAT(  COLUMN_NAME)  
				from information_schema.COLUMNS 
				where TABLE_SCHEMA = 'rokagym_db' AND table_name = p_tabla and column_key = 'PRI'),");"
, " 
    }",char(10))
union all


select CONCAT("public List<",p_tabla,"be> get",CONCAT(UCASE(LEFT(p_tabla, 1)),LCASE(SUBSTRING(p_tabla, 2))),"( String parametro1){"  
,"
return new ",p_tabla,"dao().get",CONCAT(UCASE(LEFT(p_tabla, 1)),LCASE(SUBSTRING(p_tabla, 2))),"(parametro1);
"
 , " 
    }")


union all


select CONCAT("public List<",p_tabla,"be> get",CONCAT(UCASE(LEFT(p_tabla, 1)),LCASE(SUBSTRING(p_tabla, 2))),"( String parametro1,String parametro2){" ,
"
 return new ",p_tabla,"dao().get",CONCAT(UCASE(LEFT(p_tabla, 1)),LCASE(SUBSTRING(p_tabla, 2))),"(parametro1, parametro2);
"

 , " 
    }" )


union all


select CONCAT("public int add",CONCAT(UCASE(LEFT(p_tabla, 1)),LCASE(SUBSTRING(p_tabla, 2))),"( ",p_tabla,"be obj){" , 
"
 return new ",p_tabla,"dao().add",CONCAT(UCASE(LEFT(p_tabla, 1)),LCASE(SUBSTRING(p_tabla, 2))),"(obj);
","
    }" )


union all


select CONCAT("public int update",CONCAT(UCASE(LEFT(p_tabla, 1)),LCASE(SUBSTRING(p_tabla, 2))),"( ",p_tabla,"be obj){" ,
"
return new ",p_tabla,"dao().update",CONCAT(UCASE(LEFT(p_tabla, 1)),LCASE(SUBSTRING(p_tabla, 2))),"(obj);
"

, " 
    }", "
}" ) 
 ;
         
END;
call rokagym_db.proc_bl_get('usuario');
/*BR*/