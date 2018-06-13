<%@page import="java.util.List"%>
<%@page import="bl.personabl"%>
<%@page import="be.personabe"%> 

<%
    List<personabe> lista = new personabl().getPersona("");
%>

<script>
    
   function deshabilitar(id_persona,nombre,tipo_documento,documento,telefono,correo_electronico,estado,usuario_registra,fecha_registro){
       
       var parametros = {
            txtId_persona : -id_persona,
            txtNombre  : nombre,
            txtTipo_documento : tipo_documento,
            txtDocumento : documento,
            txtTelefono : telefono,
            txtCorreo_electronico : correo_electronico,
            txtEstado : estado,
            id_usuario : 0   
       }; 
       
        $.ajax({
            url: "lista3.htm",
            type: 'POST', 
            data: parametros,
            success: function (data) { 
            console.log(data);
            location.reload();
            document.getElementById("mensaje").innerHTML = data.mensaje;
            
            }
        });
       
   }
   
     function editar(id_persona,nombre,tipo_documento,documento,telefono,correo_electronico,estado,usuario_registra,fecha_registro){
       
       var parametros = {
            txtId_persona : id_persona,
            txtNombre  : nombre,
            txtTipo_documento : tipo_documento,
            txtDocumento : documento,
            txtTelefono : telefono,
            txtCorreo_electronico : correo_electronico,
            txtEstado : estado,
            id_usuario : usuario_registra,
            fecha_registro:fecha_registro
       }; 
       
        $.ajax({
            url: "lista3.htm",
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
                <h3>Mantenimiento <small>Persona</small></h3>
                <h3><small id ="mensaje"></small></h3>
            </div>
            <div class="col-2">
                <a href="inicio.htm?page=persona_mante"  class="btn btn-outline-success">Agregar</a>
            </div>
        </div>    
    </div>
<table class="table table-bordered">
    <thead class="text-uppercase text-danger">
        <tr>
            <td>Código</td><td>Nombre</td><td>Documento</td><td>Telefono</td><td>Mantenimiento</td>
        </tr>
    </thead>
    <tbody>
        <%
            for(personabe e:lista){
                %>
                <tr>
                    <td><%=e.getId_persona()%></td>
                    <td><%=e.getNombre()%></td>
                    <td><%=e.getDocumento()%></td>
                    <td><%=e.getTelefono()%></td>
                    <td>
                        <a class="btn btn-outline-warning"  
                           href="inicio.htm?page=persona_mante&id_persona=<%=e.getId_persona()%>&nombre=<%=e.getNombre()%>&tipo_documento=<%=e.getTipo_documento()%>&documento=<%=e.getDocumento()%>&telefono=<%=e.getTelefono()%>)&correo_electronico=<%=e.getCorreo_electronico()%>&estado=<%=e.getEstado()%>&usuario_registra=<%=e.getUsuario_registra()%>&fecha_registro=<%=e.getFecha_registro()%>">Editar</a>                            
                        
                        
                        <input type="button" class="btn btn-outline-danger" value="Eliminar"
                               onclick="if(confirm('Esta seguro de eliminar el Registro')) deshabilitar('<%=e.getId_persona()%>',
                                           '<%=e.getNombre()%>',
                                           '<%=e.getTipo_documento()%>',
                                           '<%=e.getDocumento()%>',
                                           '<%=e.getTelefono()%>)',
                                           '<%=e.getCorreo_electronico()%>',
                                           '<%=e.getEstado()%>',
                                           '<%=e.getUsuario_registra()%>',
                                           '<%=e.getFecha_registro()%>');">
                    </td>
                </tr>
                <%
            }
        %>
    </tbody>
</table>                    
                            
                            
                            
</div>                   
        
        