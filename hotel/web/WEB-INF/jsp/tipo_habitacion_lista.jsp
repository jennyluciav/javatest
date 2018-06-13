<%-- 
*Nombre Archivo : Tipo_habitacion_lista.jsp
*Creador Archivo: carranza-PC
*Fecha Creacion : 2017-11-10 02:48:27
--%>


<%@page import="java.util.List"%>
<%@page import="bl.tipo_habitacionbl"%>
<%@page import="be.tipo_habitacionbe"%> 

<%
    List<tipo_habitacionbe> lista = new tipo_habitacionbl().getTipo_habitacion("");
%>

<script>
    
   function deshabilitar(id_tipo_habitacion,descripcion,precio,caracteristica,estado,usuario_registra,fecha_registro){
       
       var parametros = {   

txtId_tipo_habitacion:-id_tipo_habitacion,
txtDescripcion:descripcion,
txtPrecio:precio,
txtCaracteristica:caracteristica,
txtEstado:estado,
txtUsuario_registra:usuario_registra,
txtFecha_registro:fecha_registro
       }; 
       
        $.ajax({
            url: "tipo_habitacion_tabla.htm",
            type: 'POST', 
            data: parametros,
            success: function (data) { 
            console.log(data);
            location.reload();
            document.getElementById("mensaje").innerHTML = data.mensaje;
            
            }
        });
       
   }
   
     function editar(id_tipo_habitacion,descripcion,precio,caracteristica,estado,usuario_registra,fecha_registro){
       
       var parametros = {
txtId_tipo_habitacion:id_tipo_habitacion,
txtDescripcion:descripcion,
txtPrecio:precio,
txtCaracteristica:caracteristica,
txtEstado:estado,
txtUsuario_registra:usuario_registra,
txtFecha_registro:fecha_registro
       }; 
       
        $.ajax({
            url: "tipo_habitacion_tabla.htm",
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
                <h3>Mantenimiento <small>tipo_habitacion</small></h3>
                <h3><small id ="mensaje"></small></h3>
            </div>
            <div class="col-2">
                <a href="inicio.htm?page=tipo_habitacion_mante"  class="btn btn-outline-success">Agregar</a>
            </div>
        </div>    
    </div>

<table class="table table-bordered">
    <thead class="text-uppercase text-danger">
        <tr>
            <th> id_tipo_habitacion</th> ,<th> descripcion</th> ,<th> precio</th> ,<th> caracteristica</th> ,<th> estado</th> ,<th> usuario_registra</th> ,<th> fecha_registro</th> 
						<th>Opciones</th>
        </tr>
    </thead>
    <tbody>
        <%
            for(tipo_habitacionbe e:lista){
                %>
                <tr> 


<td><%=e.getId_tipo_habitacion()%></td>

<td><%=e.getDescripcion()%></td>

<td><%=e.getPrecio()%></td>

<td><%=e.getCaracteristica()%></td>

<td><%=e.getEstado()%></td>

<td><%=e.getUsuario_registra()%></td>

<td><%=e.getFecha_registro()%></td>

                    <td>
                        <a class="btn btn-outline-warning"  
                           href="inicio.htm?page=tipo_habitacion_mante&
id_tipo_habitacion=<%=e.getId_tipo_habitacion()%>&
descripcion=<%=e.getDescripcion()%>&
precio=<%=e.getPrecio()%>&
caracteristica=<%=e.getCaracteristica()%>&
estado=<%=e.getEstado()%>&
usuario_registra=<%=e.getUsuario_registra()%>&
fecha_registro=<%=e.getFecha_registro()%>&
">Editar</a>                            
                        
						<input type="button" class="btn btn-outline-danger" value="Eliminar"
                               onclick="if(confirm('Esta seguro de eliminar el Registro')) deshabilitar(


'<%=e.getId_tipo_habitacion()%>',
'<%=e.getDescripcion()%>',
'<%=e.getPrecio()%>',
'<%=e.getCaracteristica()%>',
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
