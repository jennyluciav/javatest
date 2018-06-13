<%-- 
*Nombre Archivo : Habitacion_lista.jsp
*Creador Archivo: carranza-PC
*Fecha Creacion : 2017-11-10 02:32:30
--%>


<%@page import="java.util.List"%>
<%@page import="bl.habitacionbl"%>
<%@page import="be.habitacionbe"%> 

<%
    List<habitacionbe> lista = new habitacionbl().getHabitacion("");
%>

<script>
    
   function deshabilitar(id_habitacion,nro,piso,id_tipo_habitacion,estado,usuario_registra,fecha_registro){
       
       var parametros = {   

txtId_habitacion:-id_habitacion,
txtNro:nro,
txtPiso:piso,
txtId_tipo_habitacion:id_tipo_habitacion,
txtEstado:estado,
txtUsuario_registra:usuario_registra,
txtFecha_registro:fecha_registro
       }; 
       
        $.ajax({
            url: "habitacion_tabla.htm",
            type: 'POST', 
            data: parametros,
            success: function (data) { 
            console.log(data);
            location.reload();
            document.getElementById("mensaje").innerHTML = data.mensaje;
            
            }
        });
       
   }
   
     function editar(id_habitacion,nro,piso,id_tipo_habitacion,estado,usuario_registra,fecha_registro){
       
       var parametros = {
txtId_habitacion:id_habitacion,
txtNro:nro,
txtPiso:piso,
txtId_tipo_habitacion:id_tipo_habitacion,
txtEstado:estado,
txtUsuario_registra:usuario_registra,
txtFecha_registro:fecha_registro
       }; 
       
        $.ajax({
            url: "habitacion_tabla.htm",
            type: 'POST', 
            data: parametros,
            success: function (data) { 
            console.log(data);
            location.reload();
            document.getElementById("mensaje").innerHTML = data.mensaje;
            
            }
        });
       
   }

</script>


<div class="container">

    <div class="form-control">
        <div class="row">  
            <div class="col-10"> 
                <h3>Mantenimiento <small>habitacion</small></h3>
                <h3><small id ="mensaje"></small></h3>
            </div>
            <div class="col-2">
                <a href="inicio.htm?page=habitacion_mante"  class="btn btn-outline-success">Agregar</a>
            </div>
        </div>    
    </div>

<table class="table table-bordered">
    <thead class="text-uppercase text-danger">
        <tr>
            <th> id_habitacion</th> ,<th> Nro</th>,<th> piso</th> ,<th> id_tipo_habitacion</th> ,<th> estado</th> ,<th> usuario_registra</th> ,<th> fecha_registro</th> 
						<th>Opciones</th>
        </tr>
    </thead>
    <tbody>
        <%
            for(habitacionbe e:lista){
                %>
                <tr> 


<td><%=e.getId_habitacion()%></td>

<td><%=e.getNro()%></td>
<td><%=e.getPiso()%></td>

<td><%=e.getId_tipo_habitacion()%></td>

<td><%=e.getEstado()%></td>

<td><%=e.getUsuario_registra()%></td>

<td><%=e.getFecha_registro()%></td>

                    <td>
                        <a class="btn btn-outline-warning"  
                           href="inicio.htm?page=habitacion_mante&
id_habitacion=<%=e.getId_habitacion()%>&
nro=<%=e.getNro()%>&
piso=<%=e.getPiso()%>&
id_tipo_habitacion=<%=e.getId_tipo_habitacion()%>&
estado=<%=e.getEstado()%>&
usuario_registra=<%=e.getUsuario_registra()%>&
fecha_registro=<%=e.getFecha_registro()%>&
">Editar</a>                            
                        
						<input type="button" class="btn btn-outline-danger" value="Eliminar"
                               onclick="if(confirm('Esta seguro de eliminar el Registro')) deshabilitar(


'<%=e.getId_habitacion()%>',
'<%=e.getNro()%>',
'<%=e.getPiso()%>',
'<%=e.getId_tipo_habitacion()%>',
'<%=e.getEstado()%>',
'<%=e.getUsuario_registra()%>',
'<%=e.getFecha_registro()%>')">
 
                    </td>
                </tr>
                <%
            }
        %>
    </tbody>
</table>                    
</div>
