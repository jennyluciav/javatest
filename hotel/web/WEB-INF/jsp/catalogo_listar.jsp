<%-- 
*Nombre Archivo : Catalogo_lista.jsp
*Creador Archivo: carranza-PC
*Fecha Creacion : 2017-11-09 21:05:39
--%>


<%@page import="java.util.List"%>
<%@page import="bl.catalogobl"%>
<%@page import="be.catalogobe"%> 

<%
    List<catalogobe> lista = new catalogobl().getCatalogo("");
%>

<script>

    function deshabilitar(id_catalogo, id_catalogo_categoria, descripcion, precio, estado, usuario_registra, fecha_registro) {

        var parametros = {
            txtId_catalogo: -id_catalogo,
            txtId_catalogo_categoria: id_catalogo_categoria,
            txtDescripcion: descripcion,
            txtPrecio: precio,
            txtEstado: estado,
            txtUsuario_registra: 0,
            txtFecha_registro: fecha_registro
        };

        $.ajax({
            url: "catalogo_tabla.htm",
            type: 'POST',
            data: parametros,
            success: function (data) {
                console.log(data); 
                document.getElementById("mensaje").innerHTML = data.mensaje;

            }
        });

    }

    function editar(id_catalogo, id_catalogo_categoria, descripcion, precio, estado, usuario_registra, fecha_registro) {

        var parametros = {
            txtId_catalogo: id_catalogo,
            txtId_catalogo_categoria: id_catalogo_categoria,
            txtDescripcion: descripcion,
            txtPrecio: precio,
            txtEstado: estado,
            txtUsuario_registra: 0,
            txtFecha_registro: fecha_registro
        };

        $.ajax({
            url: "catalogo_tabla.htm",
            type: 'POST',
            data: parametros,
            success: function (data) {
                console.log(data); 
                document.getElementById("mensaje").innerHTML = data.mensaje;

            }
        });

    }

</script>


<div class="container">

    <div class="form-control">
        <div class="row">  
            <div class="col-10"> 
                <h3>Mantenimiento <small>Contenedor</small></h3>
                <h3><small id ="mensaje"></small></h3>
            </div>
            <div class="col-2">
                <a href="inicio.htm?page=catalogo_mante"  class="btn btn-outline-success">Agregar</a>
            </div>
        </div>    
    </div>

    <table class="table table-bordered">
        <thead class="text-uppercase text-danger">
            <tr>
                <th> id</th> <th> id_categoria</th> <th> descripcion</th> <th> precio</th> <th> estado</th> 
                <th> usuario_registra</th> <th> fecha_registro</th> 
                <th>Opciones</th>
            </tr>
        </thead>
        <tbody>
            <%
                for (catalogobe e : lista) {
            %>
            <tr> 


                <td><%=e.getId_catalogo()%></td>
                <td><%=e.getId_catalogo_categoria()%></td>
                <td><%=e.getDescripcion()%></td>
                <td><%=e.getPrecio()%></td>
                <td><%=e.getEstado()%></td>
                <td><%=e.getUsuario_registra()%></td>
                <td><%=e.getFecha_registro()%></td>

                <td>
                    <a class="btn btn-outline-warning"  
                       href="inicio.htm?page=catalogo_mante&id_catalogo=<%=e.getId_catalogo()%>&id_catalogo_categoria=<%=e.getId_catalogo_categoria()%>&descripcion=<%=e.getDescripcion()%>&precio=<%=e.getPrecio()%>&estado=<%=e.getEstado()%>&usuario_registra=<%=e.getUsuario_registra()%>&fecha_registro=<%=e.getFecha_registro()%>&">Editar</a>
                    <input type="button" class="btn btn-outline-danger" value="Eliminar"
                           onclick="if (confirm('Esta seguro de eliminar el Registro'))
                                       deshabilitar(
                                               '<%=e.getId_catalogo()%>',
                                               '<%=e.getId_catalogo_categoria()%>',
                                               '<%=e.getDescripcion()%>',
                                               '<%=e.getPrecio()%>',
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
