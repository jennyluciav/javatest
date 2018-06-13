

use rokagym_db;
drop PROCEDURE if exists rokagym_db.proc_tabla_mante_get;
create PROCEDURE rokagym_db.proc_tabla_mante_get(in p_tabla VARCHAR(50))  
BEGIN



select CONCAT("<%-- ",CHAR(10),
"*Nombre Archivo : ",CONCAT(UCASE(LEFT(p_tabla, 1)),LCASE(SUBSTRING(p_tabla, 2))),".jsp",CHAR(10), 
"*Creador Archivo: ",@@hostname ,CHAR(10),
"*Fecha Creacion : ",now() ,CHAR(10),
"--%>",char(10),char(10)) 
union all 


select CONCAT(" 

<%@page import=""be.",p_tabla,"be""%>
<%@page import=""bl.",p_tabla,"bl""%>
<%@page contentType=""text/html"" pageEncoding=""UTF-8""%>

<%

    String[] mensaje = new String[4];

      ")

union all 

select concat("String ",COLUMN_NAME," = request.getParameter(""txt",CONCAT(UCASE(LEFT(COLUMN_NAME, 1)),LCASE(SUBSTRING(COLUMN_NAME, 2))),""");")
from information_schema.COLUMNS ,
    (SELECT @i:=0) AS foo
where TABLE_SCHEMA = 'rokagym_db' AND table_name = p_tabla


union all 

select cad from (
select  @i:=@i+1,
CONCAT(case when @i  >1 then 'else ' else '' end," if( ",(case when DATA_TYPE = 'VARCHAR' THEN "" ELSE 
CASE when DATA_TYPE = 'datetime' THEN "" else "String.valueOf(" end END ), " ",COLUMN_NAME,(case when DATA_TYPE = 'VARCHAR' THEN "" ELSE 
CASE when DATA_TYPE = 'datetime' THEN "" else ")" end END ),".equals("""") ){",
			case when COLUMN_KEY = 'PRI' then concat(COLUMN_NAME ," = ""0"" ;")
else 
concat("            mensaje[0] = ""Ingrese datos correctos"";
						mensaje[1] = ""txt",CONCAT(UCASE(LEFT(COLUMN_NAME, 1)),LCASE(SUBSTRING(COLUMN_NAME, 2))),""";
						mensaje[2] = ""Warning"";
				
        }") end ) cad
from information_schema.COLUMNS ,
    (SELECT @i:=0) AS foo
where TABLE_SCHEMA = 'rokagym_db' AND table_name = p_tabla
and is_nullable ='NO') as a
union all 
select concat(
"
  else {
        ",p_tabla,"bl obj = new ",p_tabla,"bl();
        // Deprecated
        java.util.Date now = new java.util.Date();
        java.sql.Date fecha_registro = new java.sql.Date(now.getTime());
        ",p_tabla,"be e = new ",p_tabla,"be();
")

union all 
(select CONCAT( "e.set",CONCAT(UCASE(LEFT(COLUMN_NAME, 1)),LCASE(SUBSTRING(COLUMN_NAME, 2))),"(",
(case when DATA_TYPE = 'VARCHAR' THEN "" ELSE 
CASE when DATA_TYPE = 'datetime' THEN "" else "Integer.valueOf(" end END ), " ",COLUMN_NAME,(case when DATA_TYPE = 'VARCHAR' THEN "" ELSE 
CASE when DATA_TYPE = 'datetime' THEN "" else ")" end END ),");"
)  from information_schema.COLUMNS where TABLE_SCHEMA = 'rokagym_db'  and  table_name = p_tabla)

union all 

select concat ("

        Integer resul = 0;
",(select concat("
        if (Integer.valueOf(",COLUMN_NAME,") == 0) {
            resul = obj.add",CONCAT(UCASE(LEFT(p_tabla, 1)),LCASE(SUBSTRING(p_tabla, 2))),"(e);
mensaje[0] = ""Se guardaron los datos Correctamente"";
        } else if (Integer.valueOf(",COLUMN_NAME,") > 0) {
            resul = obj.update",CONCAT(UCASE(LEFT(p_tabla, 1)),LCASE(SUBSTRING(p_tabla, 2))),"(e);
mensaje[0] = ""Se Actualizaron los datos Correctamente"";
        } else if (Integer.valueOf(",COLUMN_NAME,") < 0) {
            resul = obj.deshabilitar",CONCAT(UCASE(LEFT(p_tabla, 1)),LCASE(SUBSTRING(p_tabla, 2))),"(e);
mensaje[0] = ""Se deshabilitaron los datos Correctamente"";
        }
" ) from information_schema.COLUMNS where TABLE_SCHEMA = 'rokagym_db'  and  table_name = p_tabla and COLUMN_KEY = 'PRI')
,"
        if (resul > 0) {
            
            mensaje[1] = ""1"";
            mensaje[2] = ""Success"";

        } else {
            mensaje[0] = ""No se guardaron los datos Correctamente"";
            mensaje[1] = ""1"";
            mensaje[2] = ""Danger"";
        }
    }

%>

{""mensaje"":""<%=mensaje[0]%>"", ""componente"":""<%=mensaje[1]%>"", ""estado"": ""<%=mensaje[2]%>""}

<%
    // Returns all employees (active and terminated) as json.
    response.setContentType(""application/json"");
%>");
 


END;
call rokagym_db.proc_tabla_mante_get('cliente');
/*Javascript de ayuda*/