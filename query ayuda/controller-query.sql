use rokagym_db;
drop PROCEDURE if exists rokagym_db.proc_tabla_mante_get;
create PROCEDURE rokagym_db.proc_tabla_mante_get(in p_tabla VARCHAR(50))  
BEGIN

select CONCAT("/* ",CHAR(10),
"*Nombre Archivo : Control",CONCAT(UCASE(LEFT(p_tabla, 1)),LCASE(SUBSTRING(p_tabla, 2))),".jsp",CHAR(10), 
"*Creador Archivo: ",@@hostname ,CHAR(10),
"*Fecha Creacion : ",now() ,CHAR(10),
"*/",char(10),char(10)) 
union all 
 

select CONCAT("  
package controller; 

import be.",p_tabla,"be;
import br.",p_tabla,"br;
import java.sql.Date;
import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping(""/",p_tabla,".htm"")
public class ",CONCAT(LCASE(LEFT(p_tabla, 1)),LCASE(SUBSTRING(p_tabla, 2))),"Controller {
    
    @RequestMapping(method = RequestMethod.GET)
    public String entradaGET(Model m){
        return ""index"";
    }

    @RequestMapping(method = RequestMethod.POST)
public String respuesta(
" ,char(10)) 

union all    
	
select CONCAT( "	@RequestParam(""txt",CONCAT(UCASE(LEFT(COLUMN_NAME, 1)),LCASE(SUBSTRING(COLUMN_NAME, 2))),""") ",
(case when DATA_TYPE = 'VARCHAR' THEN "String" ELSE 
CASE when DATA_TYPE = 'datetime' THEN "Date" else DATA_TYPE end END )
," ",COLUMN_NAME,", ")
from information_schema.COLUMNS 
where TABLE_SCHEMA = 'rokagym_db' AND table_name = p_tabla
 union all
select  CONCAT("Model m){",char(10))

union all
select cad from (
select  @i:=@i+1,
CONCAT(case when @i  >1 then 'else ' else '' end," if( ",(case when DATA_TYPE = 'VARCHAR' THEN "" ELSE 
CASE when DATA_TYPE = 'datetime' THEN "" else "String.valueOf(" end END ), " ",COLUMN_NAME,(case when DATA_TYPE = 'VARCHAR' THEN "" ELSE 
CASE when DATA_TYPE = 'datetime' THEN "" else ")" end END ),".equals("""") ){
            m.addAttribute(""mensaje"",""Ingrese datos correctos"");
            m.addAttribute(""componente"",""txt",CONCAT(UCASE(LEFT(COLUMN_NAME, 1)),LCASE(SUBSTRING(COLUMN_NAME, 2))),""");
            return ""index"";
				
        }") cad
from information_schema.COLUMNS ,
    (SELECT @i:=0) AS foo
where TABLE_SCHEMA = 'rokagym_db' AND table_name = p_tabla
and is_nullable ='NO') as a
 union all
  
select CONCAT(" else{
            ",p_tabla,"br obj = new ",p_tabla,"br();
            ",p_tabla,"be e = new ",p_tabla,"be(",
(select GROUP_CONCAT( COLUMN_NAME )  from information_schema.COLUMNS where TABLE_SCHEMA = 'rokagym_db'  and  table_name = p_tabla),
");
            
            Integer resul =0;
            resul = obj.add",CONCAT(UCASE(LEFT(p_tabla, 1)),LCASE(SUBSTRING(p_tabla, 2))),"(e);

             if( resul>0){ 
                m.addAttribute(""mensaje"",""Se guardaron los datos Correctamente"");
                return ""principal"";
            }else{
                m.addAttribute(""mensaje"",""No se guardaron los datos Correctamente"");
                return ""index"";
            }
        }
    }
} "
,char(10)) ;
END;
call rokagym_db.proc_tabla_mante_get('usuario');
/*crear controlador*/