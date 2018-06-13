<%-- 
*Nombre Archivo : reserva_habitacion_mante.jsp
*Creador Archivo: carranza-PC
*Fecha Creacion : 2017-11-10 03:31:10
--%>



<script src='complementos/js/jquery-3.2.1.min.js' type='text/javascript'></script>
<script src='complementos/js/principal.js' type='text/javascript'></script>
<link href="complementos/css/datepicket.css" rel="stylesheet" type="text/css"/> 
<script src="complementos/js/jquery_ui_Datepicked.js" type="text/javascript"></script>
<%

    String id_reserva = "";
    if (request.getParameter("id_reserva") != null) {
        id_reserva = request.getParameter("id_reserva").toString();
    }
    String id_habitacion = "";
    if (request.getParameter("id_habitacion") != null) {
        id_habitacion = request.getParameter("id_habitacion").toString();
    }
    String id_persona = "";
    if (request.getParameter("id_persona") != null) {
        id_persona = request.getParameter("id_persona").toString();
    }
    String fecha_reserva = "";
    if (request.getParameter("fecha_reserva") != null) {
        fecha_reserva = request.getParameter("fecha_reserva").toString();
    }
    String fecha_reserva_limite = "";
    if (request.getParameter("fecha_reserva_limite") != null) {
        fecha_reserva_limite = request.getParameter("fecha_reserva_limite").toString();
    }
    String fecha_estadia_inicio = "";
    if (request.getParameter("fecha_estadia_inicio") != null) {
        fecha_estadia_inicio = request.getParameter("fecha_estadia_inicio").toString();
    }
    String fecha_estadia_fin = "";
    if (request.getParameter("fecha_estadia_fin") != null) {
        fecha_estadia_fin = request.getParameter("fecha_estadia_fin").toString();
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
            txtId_reserva: $("#txtId_reserva").val(),
            txtId_habitacion: $("#txtId_habitacion").val(),
            txtId_persona: $("#txtId_persona").val(),
            txtFecha_reserva: $("#txtFecha_reserva").val(),
            txtFecha_reserva_limite: $("#txtFecha_reserva_limite").val(),
            txtFecha_estadia_inicio: $("#txtFecha_estadia_inicio").val(),
            txtFecha_estadia_fin: $("#txtFecha_estadia_fin").val(),
            txtEstado: estado,
            txtUsuario_registra: 0,
            txtFecha_registro: $("#txtFecha_registro").val()
        };
        $.ajax({
            url: 'reserva_habitacion_tabla.htm',
            type: 'POST',
            data: parametros,
            success: function (data) {
                console.log(data);
                document.getElementById("mensaje").innerHTML = data.mensaje;
            }
        });
        
    } 
  $( function() {
    $( "#txtFecha_reserva" ).datepicker({ dateFormat: 'yy-mm-dd',minDate: new Date(), });
    $( "#txtFecha_reserva_limite" ).datepicker({ dateFormat: 'yy-mm-dd',minDate: new Date(), });
    $( "#txtFecha_estadia_inicio" ).datepicker({ dateFormat: 'yy-mm-dd',minDate: new Date(), });
    $( "#txtFecha_estadia_fin" ).datepicker({ dateFormat: 'yy-mm-dd',minDate: new Date(), });
  } ); 

</script>
 
<div>
    <div class='container'>     
        <div class='form-control'>
            <div class='row'>  
                <div class='col-10'> 
                    <h3>Mantenimiento <small>reserva habitacion</small></h3>
                </div>

            </div>    
        </div>
        <div class='row'>
            <div class='col-md-2'>&nbsp;<br></div>
            <div class='col-md-10'>
                <form class='form-horizontal' action=reserva_habitacion.htm role='form' method='post'>  <br>


                    <div class='form-group'>
                        <div class='row'>
                            <div class='col-sm-2'>
                                <label for='txtId_reserva' class='col-sm-2 control-label'>Id_reserva</label>
                                <div class='col-sm-10'>
                                    <input type='text' value = '<%=id_reserva%>' class='form-control' id='txtId_reserva' 
                                           readonly="readonly"  name ='txtId_reserva' >
                                </div>
                            </div>
                         
                            <div class='col-sm-4'>
                                <label for='txtId_habitacion' class='col-sm-2 control-label'>Id_habitacion</label>
                                <div class='col-sm-10'>
                                    <select class='form-control' id='txtId_habitacion' 
                                            name ='txtId_habitacion' ></select>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class='form-group'>
                        <div class='row'>
                            <div class='col-sm-6'>
                                <label for='txtId_persona' class='col-sm-2 control-label'>Id_persona</label>
                                <div class='col-sm-10'>
                                    <select class='form-control' id='txtId_persona' 
                                            name ='txtId_persona' ></select>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class='form-group'>
                        <div class='row'>
                            <div class='col-sm-2'>
                                <label for='txtFecha_reserva' class='col-sm-2 control-label'>Fecha_reserva</label>
                                <div class='col-sm-10'>
                                    <input type='text' value = '<%=fecha_reserva%>' class='form-control' id='txtFecha_reserva' 
                                           name ='txtFecha_reserva' placeholder='fecha_reserva'>
                                </div>
                            </div>
                         
                            <div class='col-sm-2'>
                                <label for='txtFecha_reserva_limite' class='col-sm-2 control-label'>Fecha_reserva_limite</label>
                                <div class='col-sm-10'>
                                    <input type='text' value = '<%=fecha_reserva_limite%>' class='form-control' id='txtFecha_reserva_limite' 
                                           name ='txtFecha_reserva_limite' placeholder='fecha_reserva_limite'>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class='form-group'>
                        <div class='row'>
                            <div class='col-sm-2'>
                                <label for='txtFecha_estadia_inicio' class='col-sm-2 control-label'>Fecha_estadia_inicio</label>
                                <div class='col-sm-10'>
                                    <input type='text' value = '<%=fecha_estadia_inicio%>' class='form-control' id='txtFecha_estadia_inicio' 
                                           name ='txtFecha_estadia_inicio' placeholder='fecha_estadia_inicio'>
                                </div>
                            </div>
                         
                            <div class='col-sm-2'>
                                <label for='txtFecha_estadia_fin' class='col-sm-2 control-label'>Fecha_estadia_fin</label>
                                <div class='col-sm-10'>
                                    <input type='text' value = '<%=fecha_estadia_fin%>' class='form-control' id='txtFecha_estadia_fin' 
                                           name ='txtFecha_estadia_fin' placeholder='fecha_estadia_fin'>
                                </div>
                            </div>
                        </div>
                    </div>
                        <div class='row'>
                            <div class='col-sm-12'>
                                <label for='txtEstado' class='col-sm-4 control-label'>&nbsp;</label>
                                <p>Estado&nbsp;&nbsp;&nbsp;<small><input type='checkbox' checked  id='txtEstado' name='txtEstado'  accesskey=""></small></p>
                            </div>
                        </div> 
                     
                     


                    <div class='form-group'>

                        <p id = 'mensaje' class="text-center text-danger"> </p>

                        <div class='col-sm-offset-2 col-sm-10'>
                            <button type='submit' onclick="guardar();
                                    return false" class='btn btn-default alert-primary'>Grabar</button>
                            <a class='btn btn-default alert-primary' href="inicio.htm?page=reserva_habitacion_lista&titulo=reserva_habitacion" >Regresar</a>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>   
</div> 
                                           
    <script>
        listacategorias(4,1, "txtId_habitacion");
        listacategorias(2,1, "txtId_persona");

    </script>

