<%@page contentType='text/html' pageEncoding='UTF-8'%>
<!DOCTYPE HTML PUBLIC '-//W3C//DTD HTML 4.01 Transitional//EN'
    'http://www.w3.org/TR/html4/loose.dtd'> 
<!doctype html>
<html lang='en'>
    <head>
        <meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
        <meta charset='utf-8'>
        <meta name='viewport' content='width=device-width, initial-scale=1, shrink-to-fit=no'>
        <meta name='description' content=''>
        <meta name='author' content=''> 
        <title>Sistemas De Hoteles</title> 
        <link href='complementos/bootstrap/dist/css/bootstrap.min.css' rel='stylesheet' type='text/css'/>
        
        <script src="../../complementos/js/menuresponsive.js" type="text/javascript"></script>
<script src="complementos/js/principal.js" type="text/javascript"></script>

        
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
                        <form class='form-horizontal' action="validar.htm" role='form' method='post'>
                            <div class='form-group'>
                                <label for='txtusuario' class='col-sm-2 control-label'>Usuario</label>
                                <div class='col-sm-10'>
                                    <input type='text' class='form-control' id='txtUsuario' onkeypress="return soloLetras(event);" name='txtUsuario' placeholder='Usuario'>
                                </div>
                            </div>
                            <div class='form-group'>
                                <label for='txtClave' class='col-sm-2 control-label'>Clave</label>
                                <div class='col-sm-10'>
                                    <input type='password' class='form-control' id='txtClave'  name='txtClave' placeholder='Contraseña'>
                                </div>
                            </div>
                            <div class='form-group'>
                                <div class='col-sm-offset-2 col-sm-10'>
                                    <div class='checkbox'>
                                        <label>
                                            <input type='checkbox'> Recordarme
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class='form-group'> 
                                    <p class="text-center text-danger"> ${requestScope.mensaje}</p>
                                
                                <div class='col-sm-offset-2 col-sm-10'>
                                    <button type='submit' class='btn btn-default alert-primary'>Ingresar</button>
                                </div>
                            </div>
                            
                        </form>
                    </div>
                </div>
            </div> 
        </div>   
    </body>
</html>