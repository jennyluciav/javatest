<%-- 
*Nombre Archivo : catalogo_mante.jsp
*Creador Archivo: carranza-PC
*Fecha Creacion : 2017-11-09 23:58:47
--%>





<script src='complementos/js/jquery-3.2.1.min.js' type='text/javascript'></script>
<script src='complementos/js/principal.js' type='text/javascript'></script>
<%

    String id_catalogo = "";
    if (request.getParameter("id_catalogo") != null) {
        id_catalogo = request.getParameter("id_catalogo").toString();
    }
    String id_catalogo_categoria = "";
    if (request.getParameter("id_catalogo_categoria") != null) {
        id_catalogo_categoria = request.getParameter("id_catalogo_categoria").toString();
    }
    String descripcion = "";
    if (request.getParameter("descripcion") != null) {
        descripcion = request.getParameter("descripcion").toString();
    }
    String precio = "";
    if (request.getParameter("precio") != null) {
        precio = request.getParameter("precio").toString();
    }
    String estado = "";
    if (request.getParameter("estado") != null) {
        estado = request.getParameter("estado").toString();
    }
    String usuario_registra = "";
    if (request.getParameter("usuario_registra") != null) {
        usuario_registra = request.getParameter("usuario_registra").toString();
    }
    String fecha_registro = "";
    if (request.getParameter("fecha_registro") != null) {
        fecha_registro = request.getParameter("fecha_registro").toString();
    }

%> 
<script>
    limite = 8;

    function guardar() {
        if ($('#txtEstado').prop('checked'))
            estado = 1;

        var parametros = {
            txtId_catalogo: $("#txtId_catalogo").val(),
            txtId_catalogo_categoria: (($('#txtId_catalogo_categoria option:selected').val().split('-'))[0]), 
            txtDescripcion: $("#txtDescripcion").val(),
            txtPrecio: $("#txtPrecio").val(),
            txtEstado: estado,
            txtUsuario_registra: 0,
            txtFecha_registro: $("#txtFecha_registro").val()
        };
        $.ajax({
            url: 'catalogo_tabla.htm',
            type: 'POST',
            data: parametros,
            success: function (data) {
                console.log(data);
                document.getElementById("mensaje").innerHTML = data.mensaje;
            }
        });
    }


</script>


<div>
    <div class='container'>     
        <div class='form-control'>
            <div class='row'>  
                <div class='col-10'> 
                    <h3>Mantenimiento <small>catalogo</small></h3>
                </div>

            </div>    
        </div>
        <div class='row'>
            <div class='col-md-2'>&nbsp;<br></div>
            <div class='col-md-10'>
                <form class='form-horizontal' action=catalogo.htm role='form' method='post'>  <br>


                    <div class='form-group'>
                        <div class='row'>
                            <div class='col-sm-2'>
                                <label for='txtId_catalogo' class='col-sm-2 control-label'>Id_catalogo</label>
                                <div class='col-sm-10'>
                                    <input type='text' value = '<%=id_catalogo%>' class='form-control' id='txtId_catalogo' 
                                           readonly="readonly" name ='txtId_catalogo' placeholder=''>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class='form-group'>
                        <div class='row'>
                            <div class='col-sm-6'>
                                <label for='txtId_catalogo_categoria' class='col-sm-2 control-label'>catalogo_categoria</label>
                                <div class='col-sm-6'>
                                    <select class='form-control' id='txtId_catalogo_categoria' 
                                           name ='txtId_catalogo_categoria' >
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class='form-group'>
                        <div class='row'>
                            <div class='col-sm-10'>
                                <label for='txtDescripcion' class='col-sm-2 control-label'>Descripcion</label>
                                <div class='col-sm-10'>
                                    <input type='text' value = '<%=descripcion%>' class='form-control' id='txtDescripcion' 
                                           name ='txtDescripcion' placeholder='descripcion'>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class='form-group'>
                        <div class='row'>
                            <div class='col-sm-2'>
                                <label for='txtPrecio' class='col-sm-2 control-label'>Precio</label>
                                <div class='col-sm-10'>
                                    <input type='text' value = '<%=precio%>' class='form-control' id='txtPrecio' 
                                           name ='txtPrecio' placeholder='precio'>
                                </div>
                            </div> 
                            <div class='col-sm-2'>
                                <label for='txtEstado' class='col-sm-4 control-label'>&nbsp;</label>
                                <p>Estado&nbsp;&nbsp;&nbsp;<small><input type='checkbox' checked  id='txtEstado' name='txtEstado'  accesskey=""></small></p>
                            
                            </div>
                        </div>
                    </div> 


                    <div class='form-group'>

                        <p id = 'mensaje' class="text-center text-danger"> </p>

                        <div class='col-sm-offset-2 col-sm-10'>
                            <button type='submit' onclick="guardar();return false" class='btn btn-default alert-primary'>Grabar</button>
                            <a class='btn btn-default alert-primary' href="inicio.htm?page=catalogo_listar&titulo=catalogo" >Regresar</a>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>   
</div> 

    <script>
        listacategorias(0, "txtId_catalogo_categoria");

    </script>
