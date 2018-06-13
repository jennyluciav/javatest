<%-- 
*Nombre Archivo : Usuario_lista.jsp
*Creador Archivo: carranza-PC
*Fecha Creacion : 2017-11-10 01:44:01
--%>


<%@page import="java.util.List"%>
<%@page import="bl.usuariobl"%>
<%@page import="be.usuariobe"%> 

<%
    List<usuariobe> lista = new usuariobl().getUsuario("");
%>

<script>

    function deshabilitar(id_usuario, id_persona, logueo, clave, tipo_nivel, estado, usuario_registra, fecha_registro) {

        var parametros = {
            txtId_usuario: -id_usuario,
            txtId_persona: id_persona,
            txtLogueo: logueo,
            txtClave: clave,
            txtTipo_nivel: tipo_nivel,
            txtEstado: estado,
            txtUsuario_registra: usuario_registra,
            txtFecha_registro: fecha_registro
        };

        $.ajax({
            url: "usuario_tabla.htm",
            type: 'POST',
            data: parametros,
            success: function (data) {
                console.log(data);
                location.reload();
                document.getElementById("mensaje").innerHTML = data.mensaje;

            }
        });

    }

    function editar(id_usuario, id_persona, logueo, clave, tipo_nivel, estado, usuario_registra, fecha_registro) {

        var parametros = {
            txtId_usuario: id_usuario,
            txtId_persona: id_persona,
            txtLogueo: logueo,
            txtClave: clave,
            txtTipo_nivel: tipo_nivel,
            txtEstado: estado,
            txtUsuario_registra: usuario_registra,
            txtFecha_registro: fecha_registro
        };

        $.ajax({
            url: "usuario_tabla.htm",
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
                <h3>Mantenimiento <small>usuario</small></h3>
                <h3><small id ="mensaje"></small></h3>
            </div>
            <div class="col-2">
                <a href="inicio.htm?page=usuario_mante"  class="btn btn-outline-success">Agregar</a>
            </div>
        </div>    
    </div>

    <table class="table table-bordered">
        <thead class="text-uppercase text-danger">
            <tr>
                <th> id_usuario</th> ,<th> id_persona</th> ,<th> logueo</th> ,<th> clave</th> ,<th> tipo_nivel</th> ,<th> estado</th> ,<th> usuario_registra</th> ,<th> fecha_registro</th> 
                <th>Opciones</th>
            </tr>
        </thead>
        <tbody>
            <%
                for (usuariobe e : lista) {
            %>
            <tr> 


                <td><%=e.getId_usuario()%></td>

                <td><%=e.getId_persona()%></td>

                <td><%=e.getLogueo()%></td>

                <td><%=e.getClave()%></td>

                <td><%=e.getTipo_nivel()%></td>

                <td><%=e.getEstado()%></td>

                <td><%=e.getUsuario_registra()%></td>

                <td><%=e.getFecha_registro()%></td>

                <td>
                    <a class="btn btn-outline-warning"  
                       href="inicio.htm?page=usuario_mante&
id_usuario=<%=e.getId_usuario()%>&
id_persona=<%=e.getId_persona()%>&
logueo=<%=e.getLogueo()%>&
clave=<%=e.getClave()%>&
tipo_nivel=<%=e.getTipo_nivel()%>&
estado=<%=e.getEstado()%>&
usuario_registra=<%=e.getUsuario_registra()%>&
fecha_registro=<%=e.getFecha_registro()%>&
                       ">Editar</a>                            

                    <input type="button" class="btn btn-outline-danger" value="Eliminar"
                           onclick="if (confirm('Esta seguro de eliminar el Registro'))
                                       deshabilitar(
                                               '<%=e.getId_usuario()%>',
                                               '<%=e.getId_persona()%>',
                                               '<%=e.getLogueo()%>',
                                               '<%=e.getClave()%>',
                                               '<%=e.getTipo_nivel()%>',
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
