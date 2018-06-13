<script src="complementos/js/jquery-3.2.1.min.js" type="text/javascript"></script>
<script src="complementos/js/principal.js" type="text/javascript"></script>
<script src="complementos/js/js_numeric.js" type="text/javascript"></script>

<%
    String id_persona = "";
    if (request.getParameter("id_persona") != null) {
        id_persona = request.getParameter("id_persona").toString();
    }
    String nombre = "";
    if (request.getParameter("nombre") != null) {
        nombre = request.getParameter("nombre").toString();
    }
    String tipo_documento = "";
    if (request.getParameter("tipo_documento") != null) {
        tipo_documento = request.getParameter("tipo_documento").toString();
    }
    String documento = "";
    if (request.getParameter("documento") != null) {
        documento = request.getParameter("documento").toString();
    }
    String telefono = "";
    if (request.getParameter("telefono") != null) {
        telefono = request.getParameter("telefono").toString();
    }

    String correo_electronico = "";
    if (request.getParameter("correo_electronico") != null) {
        correo_electronico = request.getParameter("correo_electronico").toString();
    }
    String estado = "1";
    if (request.getParameter("estado") != null) {
        estado = request.getParameter("estado").toString();
    }
%> 
<script>
    limite = 8;

    $(document).ready(function () {
        $('#txtTipo_documento').change(function () {
            $("#txtDocumento").val("");
            limite = (($('#txtTipo_documento option:selected').val().split('-'))[1]);
            $("#txtDocumento").attr('minlength', limite);
            $("#txtDocumento").attr('maxlength', limite);
            if (limite < 12)
                $('#txtDocumento').numeric( {negative: false});
            else {
                $("#txtDocumento").off();
            }
        });

    });
    
    function validarDNI(){ 
        console.log({nro: $("#txtDocumento").val().trim(),tipo:(($('#txtTipo_documento option:selected').val().split('-'))[0])});
         $.ajax({
            url: "listapersona.htm",
            type: 'POST',
            data: {nro: $("#txtDocumento").val().trim(),tipo:(($('#txtTipo_documento option:selected').val().split('-'))[0])},
            success: function (data) {
                console.log(data);
                document.getElementById("mensaje").innerHTML = data.mensaje;
                
                //if (data.componente!= null || (data.componente).trim() != "")
                //$("#"+data.componente).focus();
            }
        });
        
    }
    
    function guardar() {
        if ($('#txtEstado').prop('checked'))
            estado = 1;
        if ($("#txtCorreo_electronico").val().trim().length>0)
        if (!(caracteresCorreoValido($("#txtCorreo_electronico").val(), 'mensaje')   
                )){
            $("#mensaje").html('Correo Erroneo...');
            $("#mensaje").focus();
            return false;
        }
        
        if ($("#txtDocumento").val()!=limite )   
        {
            $("#mensaje").html('Correo Erroneo...');
            $("#mensaje").focus();
        }
        
        
        var parametros = {
            txtId_persona: $("#txtId_persona").val(),
            txtNombre: $("#txtNombre").val(),
            txtTipo_documento: (($('#txtTipo_documento option:selected').val().split('-'))[0]),
            txtDocumento: $("#txtDocumento").val(),
            txtTelefono: $("#txtTelefono").val(),
            txtCorreo_electronico: $("#txtCorreo_electronico").val(),
            txtEstado: estado,
            id_usuario: 0
        };

        $.ajax({
            url: "lista3.htm",
            type: 'POST',
            data: parametros,
            success: function (data) {
                console.log(data);
                document.getElementById("mensaje").innerHTML = data.mensaje;
                $("#"+data.componente).focus();
            }
        });
    }

    $(document).ready(function () {
        $('#txtDocumento').numeric( {negative: false});
        $("#txtDocumento").attr('minlength', limite);
        $("#txtDocumento").attr('maxlength', limite);
        $('#txtTelefono').numeric( {negative: false});
    });



</script>

<div>
    <div class='container'>     
        <div class="form-control">
            <div class="row">  
                <div class="col-10"> 
                    <h3>Mantenimiento <small>Persona </small></h3>
                </div>

            </div>    
        </div>
        <div class='row'>
            <div class='col-md-2'>&nbsp;<br></div>
            <div class='col-md-10'>

                <form class='form-horizontal' role='form' method='post'>
                    <br>
                    <div class='form-group'>
                        <div class="row">
                            <div class='col-sm-2'>
                                <label for='txtId_persona' class='col-sm-2 control-label'>Id_persona</label>
                                <input type='text' value = "<%=id_persona%>" readonly="readonly" class=' disabled form-control' id='txtId_persona' name='txtId_persona' >
                            </div>
                            <div class="col-sm-9">
                                <label for='txtNombre'  class='col-sm-2 control-label'>Nombre</label>
                                <div class='col-sm-10'>
                                    <input type='text' value = "<%=nombre%>" class='form-control' id='txtNombre' 
                                           onkeypress="return soloLetras(event,this.value);" name='txtNombre' placeholder='nombre'>
                                </div>
                            </div>
                        </div>
                        <div class='row'>
                            <div class='col-sm-2'>
                                <label for='txtTipo_documento'  class='col-sm-2 control-label'>Tipo_documento</label>
                                <select  class='form-control' id='txtTipo_documento'  name='txtTipo_documento'  >
                                </select>
                            </div>
                            <div class='col-sm-4'>
                                <label for='txtDocumento'  class='col-sm-2 control-label'>Documento</label>
                                <div class='col-sm-10'>
                                    <input type='text'onblur="return validarDNI();" class='form-control' value = "<%=documento%>"  id='txtDocumento' name='txtDocumento'   placeholder='documento'>
                                </div>
                            </div>
                            <div class='col-sm-4'>
                                <label for='txtTelefono' class='col-sm-2 control-label'>Telefono</label>
                                <div class='col-sm-7'>
                                    <input type='text' class='form-control' value = "<%=telefono%>" onkeypress="return soloNumero(event,this.value);" id='txtTelefono' maxlength="9" minlength="9" name='txtTelefono'  placeholder='telefono'>
                                </div>
                            </div>

                        </div> 
                        <div class='row'>
                            <div class='col-sm-6'>
                                <label for='txtCorreo_electronico' class='col-sm-2 control-label'>Correo_electronico</label>

                                <input type='text' class='form-control' value = "<%=correo_electronico%>"  id='txtCorreo_electronico' name='txtCorreo_electronico' placeholder='correo_electronico'>
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
                                <button type='submit' onclick="guardar();return false" class='btn btn-default alert-primary'>Grabar</button>
                                <a class='btn btn-default alert-primary' href="inicio.htm?page=persona_lista&titulo=persona" >Regresar</a>
                            </div>
                        </div>

                    </div>
                </form>
            </div>
        </div>   
    </div>  

    <script>
        listacategorias(1, 1, "txtTipo_documento");

    </script>
