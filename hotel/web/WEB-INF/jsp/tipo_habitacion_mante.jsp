<%-- 
*Nombre Archivo : tipo_habitacion_mante.jsp
*Creador Archivo: carranza-PC
*Fecha Creacion : 2017-11-10 02:49:24
--%>
 


<script src="complementos/js/jquery-3.2.1.min.js" type="text/javascript"></script>
<script src="complementos/js/principal.js" type="text/javascript"></script>
<script src="complementos/js/js_numeric.js" type="text/javascript"></script>
<%

    String id_tipo_habitacion = "";
    if (request.getParameter("id_tipo_habitacion") != null) {
        id_tipo_habitacion = request.getParameter("id_tipo_habitacion").toString();
    }
    String descripcion = "";
    if (request.getParameter("descripcion") != null) {
        descripcion = request.getParameter("descripcion").toString();
    }
    String precio = "";
    if (request.getParameter("precio") != null) {
        precio = request.getParameter("precio").toString();
    }
    String caracteristica = "";
    if (request.getParameter("caracteristica") != null) {
        caracteristica = request.getParameter("caracteristica").toString();
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
            txtId_tipo_habitacion: $("#txtId_tipo_habitacion").val(),
            txtDescripcion: $("#txtDescripcion").val(),
            txtPrecio: $("#txtPrecio").val(),
            txtCaracteristica: $("#txtCaracteristica").val(),
            txtEstado: estado,
            txtUsuario_registra: 0,
            txtFecha_registro: $("#txtFecha_registro").val()
        };
        $.ajax({
            url: 'tipo_habitacion_tabla.htm',
            type: 'POST',
            data: parametros,
            success: function (data) {
                console.log(data);
                document.getElementById("mensaje").innerHTML = data.mensaje;
            }
        });
    }

    $(document).ready(function () {
        $('#txtPrecio').numeric( {negative: false}); 
    });

</script>


<div>
    <div class='container'>     
        <div class='form-control'>
            <div class='row'>  
                <div class='col-10'> 
                    <h3>Mantenimiento <small>tipo_habitacion</small></h3>
                </div>

            </div>    
        </div>
        <div class='row'>
            <div class='col-md-2'>&nbsp;<br></div>
            <div class='col-md-10'>
                <form class='form-horizontal' action=tipo_habitacion.htm role='form' method='post'>  <br>


                    <div class='form-group'>
                        <div class='row'>
                            <div class='col-sm-2'>
                                <label for='txtId_tipo_habitacion' class='col-sm-2 control-label'>Id_tipo_habitacion</label>
                                <div class='col-sm-10'>
                                    <input type='text' value = '<%=id_tipo_habitacion%>' class='form-control' id='txtId_tipo_habitacion' 
                                           readonly="readonly" name ='txtId_tipo_habitacion' >
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class='form-group'>
                        <div class='row'>
                            <div class='col-sm-6'>
                                <label for='txtDescripcion' class='col-sm-2 control-label'>Descripcion</label>
                                <div class='col-sm-10'>
                                    <input type='text' value = '<%=descripcion%>' class='form-control' id='txtDescripcion' 
                                         onkeypress="return soloLetras(event,this.value);"  name ='txtDescripcion' placeholder='descripcion'>
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
                        </div>
                    </div>
                    <div class='form-group'>
                        <div class='row'>
                            <div class='col-sm-6'>
                                <label for='txtCaracteristica' class='col-sm-2 control-label'>Caracteristica</label>
                                <div class='col-sm-10'>
                                    <input type='text' value = '<%=caracteristica%>' class='form-control' id='txtCaracteristica' 
                                           name ='txtCaracteristica' placeholder='caracteristica'>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class='form-group'>
                        <div class='row'>
                            <div class='col-sm-12'>
                                <label for='txtEstado' class='col-sm-4 control-label'>&nbsp;</label>
                                <p>Estado&nbsp;&nbsp;&nbsp;<small><input type='checkbox' checked  id='txtEstado' name='txtEstado'  accesskey=""></small></p>
                            </div>
                        </div>
                    </div>


                    <div class='form-group'>

                        <p id = 'mensaje' class="text-center text-danger"> </p>

                        <div class='col-sm-offset-2 col-sm-10'>
                            <button type='submit' onclick="guardar();return false" class='btn btn-default alert-primary'>Grabar</button>
                            <a class='btn btn-default alert-primary' href="inicio.htm?page=tipo_habitacion_lista&titulo=tipo_habitacion" >Regresar</a>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>   
</div> 
