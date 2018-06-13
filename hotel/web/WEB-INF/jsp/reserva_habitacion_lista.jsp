<%-- 
*Nombre Archivo : Reserva_habitacion_lista.jsp
*Creador Archivo: carranza-PC
*Fecha Creacion : 2017-11-10 03:33:23
--%>


<%@page import="java.util.List"%>
<%@page import="bl.reserva_habitacionbl"%>
<%@page import="be.reserva_habitacionbe"%> 

<%
    List<reserva_habitacionbe> lista = new reserva_habitacionbl().getReserva_habitacion("");
%>

<script>
    
   function deshabilitar(id_reserva,id_habitacion,id_persona,fecha_reserva,fecha_reserva_limite,fecha_estadia_inicio,fecha_estadia_fin,estado,usuario_registra,fecha_registro){
       
       var parametros = {   

txtId_reserva:-id_reserva,
txtId_habitacion:id_habitacion,
txtId_persona:id_persona,
txtFecha_reserva:fecha_reserva,
txtFecha_reserva_limite:fecha_reserva_limite,
txtFecha_estadia_inicio:fecha_estadia_inicio,
txtFecha_estadia_fin:fecha_estadia_fin,
txtEstado:estado,
txtUsuario_registra:usuario_registra,
txtFecha_registro:fecha_registro
       }; 
       
        $.ajax({
            url: "reserva_habitacion_tabla.htm",
            type: 'POST', 
            data: parametros,
            success: function (data) { 
            console.log(data);
            location.reload();
            document.getElementById("mensaje").innerHTML = data.mensaje;
            
            }
        });
       
   }
   
     function editar(id_reserva,id_habitacion,id_persona,fecha_reserva,fecha_reserva_limite,fecha_estadia_inicio,fecha_estadia_fin,estado,usuario_registra,fecha_registro){
       
       var parametros = {
txtId_reserva:id_reserva,
txtId_habitacion:id_habitacion,
txtId_persona:id_persona,
txtFecha_reserva:fecha_reserva,
txtFecha_reserva_limite:fecha_reserva_limite,
txtFecha_estadia_inicio:fecha_estadia_inicio,
txtFecha_estadia_fin:fecha_estadia_fin,
txtEstado:estado,
txtUsuario_registra:usuario_registra,
txtFecha_registro:fecha_registro
       }; 
       
        $.ajax({
            url: "reserva_habitacion_tabla.htm",
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
                <h3>Mantenimiento <small>reserva_habitacion</small></h3>
                <h3><small id ="mensaje"></small></h3>
            </div>
            <div class="col-2">
                <a href="inicio.htm?page=reserva_habitacion_mante"  class="btn btn-outline-success">Agregar</a>
            </div>
        </div>    
    </div>

<table class="table table-bordered">
    <thead class="text-uppercase text-danger">
        <tr>
            <th> id_reserva</th> ,<th> id_habitacion</th> ,<th> id_persona</th> ,<th> fecha_reserva</th> ,<th> fecha_reserva_limite</th> ,<th> fecha_estadia_inicio</th> ,<th> fecha_estadia_fin</th> ,<th> estado</th> ,<th> usuario_registra</th> ,<th> fecha_registro</th> 
						<th>Opciones</th>
        </tr>
    </thead>
    <tbody>
        <%
            for(reserva_habitacionbe e:lista){
                %>
                <tr> 


<td><%=e.getId_reserva()%></td>
<td><%=e.getId_habitacion()%></td>
<td><%=e.getId_persona()%></td>
<td><%=e.getFecha_reserva()%></td>
<td><%=e.getFecha_reserva_limite()%></td>
<td><%=e.getFecha_estadia_inicio()%></td>
<td><%=e.getFecha_estadia_fin()%></td>
<td><%=e.getEstado()%></td>
<td><%=e.getUsuario_registra()%></td>
<td><%=e.getFecha_registro()%></td>

                    <td>
                        <a class="btn btn-outline-warning"  
                           href="inicio.htm?page=reserva_habitacion_mante&
id_reserva=<%=e.getId_reserva()%>&
id_habitacion=<%=e.getId_habitacion()%>&
id_persona=<%=e.getId_persona()%>&
fecha_reserva=<%=e.getFecha_reserva()%>&
fecha_reserva_limite=<%=e.getFecha_reserva_limite()%>&
fecha_estadia_inicio=<%=e.getFecha_estadia_inicio()%>&
fecha_estadia_fin=<%=e.getFecha_estadia_fin()%>&
estado=<%=e.getEstado()%>&
usuario_registra=<%=e.getUsuario_registra()%>&
fecha_registro=<%=e.getFecha_registro()%>&
">Editar</a>                            
                        
						<input type="button" class="btn btn-outline-danger" value="Eliminar"
                               onclick="if(confirm('Esta seguro de eliminar el Registro')) deshabilitar(


'<%=e.getId_reserva()%>',
'<%=e.getId_habitacion()%>',
'<%=e.getId_persona()%>',
'<%=e.getFecha_reserva()%>',
'<%=e.getFecha_reserva_limite()%>',
'<%=e.getFecha_estadia_inicio()%>',
'<%=e.getFecha_estadia_fin()%>',
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
