

use rokagym_db;
drop PROCEDURE if exists rokagym_db.proc_listar_mante_get;
create PROCEDURE rokagym_db.proc_listar_mante_get(in p_tabla VARCHAR(50))  
BEGIN



select CONCAT("<%-- ",CHAR(10),
"*Nombre Archivo : ",CONCAT(UCASE(LEFT(p_tabla, 1)),LCASE(SUBSTRING(p_tabla, 2))),"_lista.jsp",CHAR(10), 
"*Creador Archivo: ",@@hostname ,CHAR(10),
"*Fecha Creacion : ",now() ,CHAR(10),
"--%>",char(10),char(10)) 
union all 

select CONCAT("<%@page import=""java.util.List""%>
<%@page import=""br.",p_tabla,"br""%>
<%@page import=""be.",p_tabla,"be""%> 

<%
    List<",p_tabla,"be> lista = new ",p_tabla,"br().get",CONCAT(UCASE(LEFT(p_tabla, 1)),LCASE(SUBSTRING(p_tabla, 2))),"("""");
%>

<script>
    
   function deshabilitar(",(select GROUP_CONCAT( COLUMN_NAME )  from information_schema.COLUMNS where TABLE_SCHEMA = 'rokagym_db'  and  table_name = p_tabla),"){
       
       var parametros = {   
",(select GROUP_CONCAT( CONCAT( char(10),"txt",CONCAT(UCASE(LEFT(COLUMN_NAME, 1)),LCASE(SUBSTRING(COLUMN_NAME, 2))),":", case when COLUMN_KEY = 'PRI' then "-" else "" end   ,COLUMN_NAME ))  from information_schema.COLUMNS where TABLE_SCHEMA = 'rokagym_db'  and  table_name = p_tabla),"
       }; 
       
        $.ajax({
            url: """,p_tabla,"_tabla.htm"",
            type: 'POST', 
            data: parametros,
            success: function (data) { 
            console.log(data);
            location.reload();
            document.getElementById(""mensaje"").innerHTML = data.mensaje;
            
            }
        });
       
   }
   
     function editar(",(select GROUP_CONCAT( COLUMN_NAME )  from information_schema.COLUMNS where TABLE_SCHEMA = 'rokagym_db'  and  table_name = p_tabla),"){
       
       var parametros = {",(select GROUP_CONCAT( CONCAT( char(10),"txt",CONCAT(UCASE(LEFT(COLUMN_NAME, 1)),LCASE(SUBSTRING(COLUMN_NAME, 2))),":", COLUMN_NAME ))  from information_schema.COLUMNS where TABLE_SCHEMA = 'rokagym_db'  and  table_name = p_tabla),"
       }; 
       
        $.ajax({
            url: """,p_tabla,"_tabla.htm"",
            type: 'POST', 
            data: parametros,
            success: function (data) { 
            console.log(data);
            location.reload();
            document.getElementById(""mensaje"").innerHTML = data.mensaje;
            
            }
        });
       
   }

</script>


<div class=""container"">

    <div class=""form-control"">
        <div class=""row"">  
            <div class=""col-10""> 
                <h3>Mantenimiento <small>",p_tabla,"</small></h3>
                <h3><small id =""mensaje""></small></h3>
            </div>
            <div class=""col-2"">
                <a href=""inicio.htm?page=",p_tabla,"_mante""  class=""btn btn-outline-success"">Agregar</a>
            </div>
        </div>    
    </div>")
union all
select CONCAT("
<table class=""table table-bordered"">
    <thead class=""text-uppercase text-danger"">
        <tr>
            ",(select GROUP_CONCAT( CONCAT("<th> ", COLUMN_NAME ,"</th> "))  from information_schema.COLUMNS where TABLE_SCHEMA = 'rokagym_db'  and  table_name = p_tabla),"
						<th>Opciones</th>
        </tr>
    </thead>
    <tbody>
        <%
            for(",p_tabla,"be e:lista){
                %>
                <tr> 
")


union all
select ( CONCAT( char(10),"<td><%=e.get",CONCAT(UCASE(LEFT(COLUMN_NAME, 1)),LCASE(SUBSTRING(COLUMN_NAME, 2))),"()%></td>" ))  from information_schema.COLUMNS where TABLE_SCHEMA = 'rokagym_db'  and  table_name = p_tabla



union all 
select CONCAT("
                    <td>
                        <a class=""btn btn-outline-warning""  
                           href=""inicio.htm?page=",p_tabla,"_mante&")
 
union all
select ( CONCAT( COLUMN_NAME,"=<%=e.get",CONCAT(UCASE(LEFT(COLUMN_NAME, 1)),LCASE(SUBSTRING(COLUMN_NAME, 2))),"()%>&" ))  from information_schema.COLUMNS where TABLE_SCHEMA = 'rokagym_db'  and  table_name =  p_tabla

union all 
select CONCAT(
""">Editar</a>                            
                        
						<input type=""button"" class=""btn btn-outline-danger"" value=""Eliminar""
                               onclick=""if(confirm('Esta seguro de eliminar el Registro')) deshabilitar(

",
(select GROUP_CONCAT( CONCAT(char(10),"'<%=e.get",CONCAT(UCASE(LEFT(COLUMN_NAME, 1)),LCASE(SUBSTRING(COLUMN_NAME, 2))),"()%>'" ))  from information_schema.COLUMNS where TABLE_SCHEMA = 'rokagym_db'  and  table_name = p_tabla)
,
")"">
 
                    </td>
                </tr>
                <%
            }
        %>
    </tbody>
</table>                    
</div>
","");

     
END;
call rokagym_db.proc_listar_mante_get('cliente');
/*Listas*(