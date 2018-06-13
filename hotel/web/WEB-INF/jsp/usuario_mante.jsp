<%-- 
*Nombre Archivo : usuario_mante.jsp
*Creador Archivo: carranza-PC
*Fecha Creacion : 2017-11-10 01:47:34
--%>





<%

    String id_usuario = "";
    if (request.getParameter("id_usuario") != null) {
        id_usuario = request.getParameter("id_usuario").toString();
    }
    String id_persona = "";
    if (request.getParameter("id_persona") != null) {
        id_persona = request.getParameter("id_persona").toString();
    }
    String logueo = "";
    if (request.getParameter("logueo") != null) {
        logueo = request.getParameter("logueo").toString();
    }
    String clave = "";
    if (request.getParameter("clave") != null) {
        clave = request.getParameter("clave").toString();
    }
    String tipo_nivel = "";
    if (request.getParameter("tipo_nivel") != null) {
        tipo_nivel = request.getParameter("tipo_nivel").toString();
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

<script src='complementos/js/jquery-3.2.1.min.js' type='text/javascript'></script>
<script src='complementos/js/principal.js' type='text/javascript'></script>
<script>
  
    limite = 8;

    function guardar() {
        if ($('#txtEstado').prop('checked'))
            estado = 1;

        var parametros = {
            txtId_usuario: $("#txtId_usuario").val(),
            txtId_persona: $("#txtId_persona").val(),
            txtLogueo: $("#txtLogueo").val(),
            txtClave: $("#txtClave").val(),
            txtTipo_nivel: $("#txtTipo_nivel").val(),
            txtEstado: estado,
            txtUsuario_registra: 0,
            txtFecha_registro: $("#txtFecha_registro").val()
        };
        $.ajax({
            url: 'usuario_tabla.htm',
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
                    <h3>Mantenimiento <small>usuario</small></h3>
                </div>

            </div>    
        </div>
        <div class='row'>
            <div class='col-md-2'>&nbsp;<br></div>
            <div class='col-md-10'>
                <form class='form-horizontal' action=usuario.htm role='form' method='post'>  <br>


                    <div class='form-group'>
                        <div class='row'>
                            <div class='col-sm-2'>
                                <label for='txtId_usuario' class='col-sm-2 control-label'>Id_usuario</label>
                                <div class='col-sm-10'>
                                    <input type='text' readonly="readonly" value = '<%=id_usuario%>' class='form-control' id='txtId_usuario' 
                                           name ='txtId_usuario' placeholder=''>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class='form-group'>
                        <div class='row'>
                            <div class='col-sm-6'>
                                <label for='txtId_persona' class='col-sm-2 control-label'>Id_persona</label>
                                <div class='col-sm-10'>
                                    <select  class='form-control' id='txtId_persona' 
                                             name ='txtId_persona' > </select>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class='form-group'>
                        <div class='row'>
                            <div class='col-sm-4'>
                                <label for='txtLogueo' class='col-sm-2 control-label'>Logueo</label>
                                <div class='col-sm-10'>
                                    <input type='text' value = '<%=logueo%>' class='form-control' id='txtLogueo' 
                                           name ='txtLogueo' placeholder='logueo'>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class='form-group'>
                        <div class='row'>
                            <div class='col-sm-4'>
                                <label for='txtClave' class='col-sm-2 control-label'>Clave</label>
                                <div class='col-sm-10'>
                                    <input type='password' value = '<%=clave%>' class='form-control' id='txtClave' 
                                           name ='txtClave' placeholder='clave'>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class='form-group'>
                        <div class='row'>
                            <div class='col-sm-2'>
                                <label for='txtTipo_nivel' class='col-sm-2 control-label'>Tipo_nivel</label>
                                <div class='col-sm-10'>
                                    <input type='text' value = '<%=tipo_nivel%>' class='form-control' id='txtTipo_nivel' 
                                           onkeypress="return soloNumero(event,this.value);" maxlength="1" name ='txtTipo_nivel' placeholder='tipo_nivel'>
                                </div>
                            </div> 
                            <div class='col-sm-12'>
                                <label for='txtEstado' class='col-sm-4 control-label'>&nbsp;</label>
                                <p>Estado&nbsp;&nbsp;&nbsp;<small><input type='checkbox' checked  id='txtEstado' name='txtEstado'  accesskey=""></small></p>
                            </div>
                        </div> 


                    <div class='form-group'>

                        <p id = 'mensaje' class="text-center text-danger"> </p>

                        <div class='col-sm-offset-2 col-sm-10'>
                            <button type='submit' onclick="guardar();return false" class='btn btn-default alert-primary'>Grabar</button>
                            <a class='btn btn-default alert-primary' href="inicio.htm?page=usuario_lista&titulo=usuario" >Regresar</a>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>   
</div> 

    <script> 
        listacategorias(2, 1, "txtId_persona");
    </script>
