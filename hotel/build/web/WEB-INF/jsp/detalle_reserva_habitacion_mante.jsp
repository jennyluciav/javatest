<%-- 
*Nombre Archivo : detalle_reserva_habitacion_mante.jsp
*Creador Archivo: ASMODEUS-AZAZEL
*Fecha Creacion : 2017-11-07 17:47:14
--%>


<%@page contentType='text/html' pageEncoding='UTF-8'%>
<!DOCTYPE HTML PUBLIC '-//W3C//DTD HTML 4.01 Transitional//EN'
    'http://www.w3.org/TR/html4/loose.dtd'> 
<!DOCTYPE html>
<html lang='en'>
    <head>
        <meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
        <meta charset='utf-8'>
        <meta name='viewport' content='width=device-width, initial-scale=1, shrink-to-fit=no'>
        <meta name='description' content=''>
        <meta name='author' content=''> 
        <title>Sistemas De Hoteles</title> 
        <link href='complementos/bootstrap/dist/css/bootstrap.min.css' rel='stylesheet' type='text/css'/> 
    </head> 
    <body>

 
        <div>
            <div class='container'>    
                <div class='row text-center'>
                    <div class='form-control' >
                        <span class='glyphicon glyphicon-cloud ' style ='font-size: 10em;' >&#x2601;</span><br>
                        <span style ='font-size: 2em;'>Inicio Sesion</span>
                    </div>
                </div> 
                
                <div class='row'>
                    <div class='col-md-2'>&nbsp;</div>
                    <div class='col-md-10'>
                        <form class='form-horizontal' role='form'>


			    <div class='form-group'>
                                <label for='txtId_detalle_reserva_habitacion' class='col-sm-2 control-label'>Id_detalle_reserva_habitacion</label>
                                <div class='col-sm-10'>
                                    <input type='text' class='form-control' id='txtId_detalle_reserva_habitacion' placeholder='id_detalle_reserva_habitacion'>
                                </div>
                            </div>
			    <div class='form-group'>
                                <label for='txtId_reserva' class='col-sm-2 control-label'>Id_reserva</label>
                                <div class='col-sm-10'>
                                    <input type='text' class='form-control' id='txtId_reserva' placeholder='id_reserva'>
                                </div>
                            </div>
			    <div class='form-group'>
                                <label for='txtId_catalogo' class='col-sm-2 control-label'>Id_catalogo</label>
                                <div class='col-sm-10'>
                                    <input type='text' class='form-control' id='txtId_catalogo' placeholder='id_catalogo'>
                                </div>
                            </div>
			    <div class='form-group'>
                                <label for='txtCantidad' class='col-sm-2 control-label'>Cantidad</label>
                                <div class='col-sm-10'>
                                    <input type='text' class='form-control' id='txtCantidad' placeholder='cantidad'>
                                </div>
                            </div>
			    <div class='form-group'>
                                <label for='txtIgv' class='col-sm-2 control-label'>Igv</label>
                                <div class='col-sm-10'>
                                    <input type='text' class='form-control' id='txtIgv' placeholder='igv'>
                                </div>
                            </div>
			    <div class='form-group'>
                                <label for='txtTipo_registro' class='col-sm-2 control-label'>Tipo_registro</label>
                                <div class='col-sm-10'>
                                    <input type='text' class='form-control' id='txtTipo_registro' placeholder='tipo_registro'>
                                </div>
                            </div>
			    <div class='form-group'>
                                <label for='txtEstado' class='col-sm-2 control-label'>Estado</label>
                                <div class='col-sm-10'>
                                    <input type='text' class='form-control' id='txtEstado' placeholder='estado'>
                                </div>
                            </div>
			    <div class='form-group'>
                                <label for='txtUsuario_registra' class='col-sm-2 control-label'>Usuario_registra</label>
                                <div class='col-sm-10'>
                                    <input type='text' class='form-control' id='txtUsuario_registra' placeholder='usuario_registra'>
                                </div>
                            </div>
			    <div class='form-group'>
                                <label for='txtFecha_registro' class='col-sm-2 control-label'>Fecha_registro</label>
                                <div class='col-sm-10'>
                                    <input type='text' class='form-control' id='txtFecha_registro' placeholder='fecha_registro'>
                                </div>
                            </div>

										</form>
                    </div>
                </div>
            </div>   
        </div>
    </body>
</html>
