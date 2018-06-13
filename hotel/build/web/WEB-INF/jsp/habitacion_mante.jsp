<%-- 
*Nombre Archivo : habitacion_mante.jsp
*Creador Archivo: carranza-PC
*Fecha Creacion : 2017-11-10 02:32:50
--%>





<script src='complementos/js/jquery-3.2.1.min.js' type='text/javascript'></script>
<script src='complementos/js/principal.js' type='text/javascript'></script>
<%

    String id_habitacion = "";
    if (request.getParameter("id_habitacion") != null) {
        id_habitacion = request.getParameter("id_habitacion").toString();
    }
    String piso = "";
    if (request.getParameter("piso") != null) {
        piso = request.getParameter("piso").toString();
    }
    String nro = "";
    if (request.getParameter("nro") != null) {
        nro = request.getParameter("nro").toString();
    }
    String id_tipo_habitacion = "";
    if (request.getParameter("id_tipo_habitacion") != null) {
        id_tipo_habitacion = request.getParameter("id_tipo_habitacion").toString();
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

  function listatipo_habitacion(parametro,receptor){
                $.ajax({
                    url: "listahabitacion.htm",
                    type: 'POST',
                    data: {id:parametro},
                    success: function (data) {
                        document.getElementById(receptor).innerHTML=data;
                    }
                });
            }
    function guardar() {
        if ($('#txtEstado').prop('checked'))
            estado = 1;

        var parametros = {
            txtId_habitacion: $("#txtId_habitacion").val(),
            txtPiso: $("#txtPiso").val(),
            txtNro: $("#txtNro").val(),
            txtId_tipo_habitacion: $("#txtId_tipo_habitacion").val(),
            txtEstado: estado,
            txtUsuario_registra: 0,
            txtFecha_registro: $("#txtFecha_registro").val()
        };
        $.ajax({
            url: 'habitacion_tabla.htm',
            type: 'POST',
            data: parametros,
            success: function (data) {
                console.log(data);
                document.getElementById("mensaje").innerHTML = data.mensaje;
                $("#"+data.componente).focus();
            }
        });
    }


</script>


<div>
    <div class='container'>     
        <div class='form-control'>
            <div class='row'>  
                <div class='col-10'> 
                    <h3>Mantenimiento <small>habitacion</small></h3>
                </div>

            </div>    
        </div>
        <div class='row'>
            <div class='col-md-2'>&nbsp;<br></div>
            <div class='col-md-10'>
                <form class='form-horizontal' action=habitacion.htm role='form' method='post'>  <br>


                    <div class='form-group'>
                        <div class='row'>
                            <div class='col-sm-2'>
                                <label for='txtId_habitacion' class='col-sm-2 control-label'>Id_habitacion</label>
                                <div class='col-sm-10'>
                                    <input type='text' value = '<%=id_habitacion%>' class='form-control' id='txtId_habitacion' 
                                           readonly="readonly" name ='txtId_habitacion' >
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class='form-group'>
                        <div class='row'>
                            <div class='col-sm-2'>
                                <label for='txtNro' class='col-sm-2 control-label'>Nro_Cuarto</label>
                                <div class='col-sm-10'>
                                    <input type='text' value = '<%=nro%>' class='form-control' id='txtNro' 
                                           onkeypress="return soloNumero(event,this.value);" maxlength="1"    name ='txtNro' placeholder='Nro'>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class='form-group'>
                        <div class='row'>
                            <div class='col-sm-2'>
                                <label for='txtPiso' class='col-sm-2 control-label'>Piso</label>
                                <div class='col-sm-10'>
                                    <input type='text' value = '<%=piso%>' class='form-control' id='txtPiso' 
                                        onkeypress="return soloNumero(event,this.value);" maxlength="2"    name ='txtPiso' placeholder='piso'>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class='form-group'>
                        <div class='row'>
                            <div class='col-sm-4'>
                                <label for='txtId_tipo_habitacion' class='col-sm-2 control-label'>Id_tipo_habitacion</label>
                                <div class='col-sm-10'>
                                    <select class='form-control' id='txtId_tipo_habitacion' 
                                            name ='txtId_tipo_habitacion' ></select>
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
                            <a class='btn btn-default alert-primary' href="inicio.htm?page=habitacion_lista&titulo=habitacion" >Regresar</a>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>   
</div> 

    <script>
        listatipo_habitacion("", "txtId_tipo_habitacion"); 
    </script>
