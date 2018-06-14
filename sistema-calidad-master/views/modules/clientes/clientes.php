<?php session_start();
if (!$_SESSION["nombreAdmin"]) {
    header("location:ingreso");exit();
}
?>
<section class="jumbotron text-center" style="background-color: transparent; margin-bottom: 0px;">
    <div class="container">
        <h1 class="jumbotron-heading">Clientes</h1>
        <p class="lead text-muted">Aquí podras gestionar los clientes como edicion de informacion y busqueda del mismo.</p>
        <p>
            <a href="clientes" class="btn btn-primary">Lista de Clientes</a>
            <a href="agragarclientes" class="btn btn-secondary">Agregar cliente nuevo</a>
        </p>
    </div>
</section>
<div class="album text-muted">
      <div class="container">
<?php
if (isset($_GET['action'])) {
    if ($_GET['action'] == 'okClientes') {
        echo '<div id="oks" class="alert alert-success alert-dismissible fade show" role="alert">
        <button aria-label="Close" class="close" data-dismiss="alert" type="button">
            <span aria-hidden="true">
                ×
            </span>
        </button>
        <strong>
            Enorabuena!
        </strong>
        El Cliente fue agregado correctamente.
        </div>';
        echo '<meta http-equiv="Refresh" content="4;URL = clientes" >';
    }
    if ($_GET['action'] == 'alta') {
        echo '<div id="oks" class="alert alert-success alert-dismissible fade show" role="alert">
        <button aria-label="Close" class="close" data-dismiss="alert" type="button">
            <span aria-hidden="true">
                ×
            </span>
        </button>
        <strong>
            Enorabuena!
        </strong>
        El Cliente fue dado de alta correctamente al sistema.
        </div>';
        echo '<meta http-equiv="Refresh" content="4;URL = clientes" >';
    }
    if ($_GET['action'] == 'okClientesEdit') {
        echo '<div id="oks" class="alert alert-success alert-dismissible fade show" role="alert">
        <button aria-label="Close" class="close" data-dismiss="alert" type="button">
            <span aria-hidden="true">
                ×
            </span>
        </button>
        <strong>
            Enorabuena!
        </strong>
        El Cliente fue editado correctamente.
        </div>';
        echo '<meta http-equiv="Refresh" content="4;URL = clientes" >';
    }
    if ($_GET['action'] == 'editadoCat') {
        echo '
        <div class="alert alert-success alert-dismissible fade show" id="oks" role="alert">
            <button aria-label="Close" class="close" data-dismiss="alert" type="button">
                <span aria-hidden="true">
                    ×
                </span>
            </button>
            <strong>
                Enorabuena!
            </strong>
            La Categoria fue Editada correctamente al Sistema.
        </div>';
        echo '<meta content="4; URL = clientes" http-equiv="Refresh"> ';
    }
    if ($_GET['action'] == 'baja') {
        echo '
        <div class="alert alert-success alert-dismissible fade show" id="oks" role="alert">
            <button aria-label="Close" class="close" data-dismiss="alert" type="button">
                <span aria-hidden="true">
                    ×
                </span>
            </button>
            <strong>
                Enorabuena!
            </strong>
            El cliente fue dado de baja correctamente del sistema.
        </div>
        ';
        echo '
        <meta content="4;
        URL = clientes" http-equiv="Refresh">
            ';
    }
}
?>
<!-- Comiensa clientes list -->

            <?php if (isset($_GET['action'])): ?>
            <?php if ($_GET['action'] == 'clientes' or $_GET['action'] == 'okClientes' or $_GET['action'] == 'baja' or $_GET['action'] == 'alta' or $_GET['action'] == 'verClientes' or $_GET['action'] == 'okClientesEdit'): ?>
                <div class="jumbotron text-center" style="padding: 1rem 2rem;">
                    <h1>Lista de Clientes</h1>
                </div>
                <?php
                    $cli = ClientesController::getClientesController();
                ?>
                <table class="table table-striped table-sm" id="tablas">
                    <thead class="bg-primary text-white">
                        <tr>
                            <td class="text-lg-center">Nombres</td>
                            <td class="text-lg-center">Apellidos</td>
                            <td class="text-lg-center">DNI</td>
                            <td class="text-lg-center">Fecha de Nacimiento</td>
                            <td class="text-lg-center">Edad</td>
                            <td class="text-lg-center">Acciones</td>
                        </tr>
                    </thead>
                    <?php foreach ($cli as $key): ?>
                        <tr>
                            <td class="text-lg-left"><?php echo $key['nombreCliente'] ?></td>
                            <td class="text-lg-left"><?php echo $key['apellidoCliente'] ?></td>
                            <td class="text-lg-left"><?php echo $key['dni'] ?></td>
                            <td class="text-lg-left"><?php echo date("Y-m-d", strtotime($key['fechaNacimiento'])) ?></td>
                            <td class="text-lg-left"><?php echo $key['edad'] ?></td>
                            <td class="text-lg-center">
                                <a href="index.php?action=verClientes&idCliente=<?php echo $key['idCliente'] ?>"> <i class="fa fa-eye"></i></a>
                                <a href="index.php?action=editClientes&idCliente=<?php echo $key['idCliente'] ?>"> <i class="fa fa-edit"></i></a>
                                <a href="index.php?action=clientes&id=<?php echo $key['idCliente'] ?>"> <i class="fa fa-trash"></i></a>
                            </td>

                        </tr>
                    <?php endforeach?>
                </table>
                <?php endif?>
                <?php if ($_GET['action'] == 'agragarclientes'): ?>
                    <div class="jumbotron text-center" style="padding: 1rem 2rem;">
                        <h1>Agregar Clientes</h1>
                    </div>
                    <form method="post" id="form-validate" onsubmit="return validarclientes()">
                        <script type="text/javascript">
                            $(document).ready(function(){
                                $(".datepicker").datepicker({
                                    dateFormat: 'yy-mm-dd',
                                    yearRange: '1940:2018',
                                    changeYear: true
                                }); 

                                function getAge(dateString) {
                                    var today = new Date();
                                    var birthDate = new Date(dateString);
                                    var age = today.getFullYear() - birthDate.getFullYear();
                                    var m = today.getMonth() - birthDate.getMonth();
                                    if (m < 0 || (m === 0 && today.getDate() < birthDate.getDate())) {
                                    age--;
                                    }
                                    return age;
                                }

                                $("#fechaNacimiento").change(function(){
                                    var birthDate = $(this).val();
                                    var todayDate = new Date(); 
                                    $('.edad').val(getAge(birthDate));
                                    var edad = $('.edad').val();
                                    console.log(edad);
                                    $('#edad').val(edad);
                                    console.log($('#edad').val());
                                });

                            })
                        </script>
                        <div class="row" class="agregarcliente">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="nombreCliente">Nombre </label>
                                    <input type="text" class="form-control" id="nombreCliente" placeholder="Nombre Cliente" name="nombreCliente"  data-validacion-tipo="requerido|min:3">
                                  </div>
                            </div>
                            <div class="col-md-4">
                               <div class="form-group">
                                <label for="exampleInputPassword1">Apellido </label>
                                <input type="text" class="form-control" id="apellidoCliente" placeholder="Apellido Cliente" name="apellidoCliente" data-validacion-tipo="requerido|min:3">
                              </div>
                            </div>
                            <div class="col-md-4">
                              <div class="form-group">
                                <label for="exampleInputPassword1">Telefono </label>
                                <input type="number" class="form-control" id="telefono" placeholder="Telefono" name="telefono" data-validacion-tipo="requerido|min:9|max:9">
                              </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                              <div class="form-group">
                                <label for="sexo">Sexo </label>
                                <div class="row">
                                    <div class="col-md-6">
                                        <input type="radio" name="sexo" value="femenino" data-validacion-tipo="requerido" required="" checked=""> Femenino 
                                    </div>
                                    <div class="col-md-6">
                                        <input type="radio" name="sexo" value="masculino" data-validacion-tipo="requerido" required=""> Masculino
                                    </div>
                                </div>
                              </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group" id="form">
                                    <div class="form-group">
                                        <label for="fechaNacimiento">Fecha de Nacimiento </label>
                                        <input readonly type="text" name="fechaNacimiento" id="fechaNacimiento" class="form-control datepicker fechaNacimiento" placeholder="Ingrese fecha de nacimiento" data-validacion-tipo="requerido" />
                                    </div>
                                </div>
                                <span id="pro">
                                </span>
                            </div>
                            <div class="col-md-4">
                              <div class="form-group">
                                <label for="edad">Edad </label>
                                <input type="text" class="form-control edad"  name="edadDefault" data-validacion-tipo="requerido" disabled>
                              </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                              <div class="form-group">
                                <label for="exampleInputPassword1">Dirección </label>
                                <input type="text" class="form-control" id="direccion" placeholder="Dirección" name="direccion" data-validacion-tipo="requerido|min:3">
                              </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group"  id="form">
                                    <label for="exampleInputPassword1">DNI o CARNET EXT.</label>
                                <input class="form-control" id="dni"  name="dni" type="number" placeholder="DNI o CARNET EXT." data-validacion-tipo="requerido|min:8|max:12">
                                <span id="cli"></span>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="exampleInputPassword1" class="" style="color: transparent;">Agregar cliente</label>
                                    <input class="btn btn-danger btn-block" id="button" name="agragarclientes" type="submit" value="Agregar Cliente">
                                </div>
                            </div>
                        </div>
                        </div>
                        <input type="hidden" id="edad" name="edad">
                    </form>
                    <script>
                        $(document).ready(function(){
                            $("#form-validate").submit(function(){
                                return $(this).validate();
                            });
                        })
                    </script>
                </div>
            </div>
            <?php endif?>
            <?php endif?>

                    <!-- editar Clientes -->
                    <!-- editar Clientes -->
                    <!-- editar Clientes -->

            <?php if ($_GET['action'] == 'editClientes'): ?>
                <div class="jumbotron" style="padding: 1rem 2rem;">
                    <h1>Editar clientes</h1>
                </div>
                <?php $edit = ClientesController::editClientesController();?>
            <?php foreach ($edit as $value): ?>
            <?php endforeach?>

                <form method="post" id="form-validate" onsubmit="return validarclientes()">
                    <script type="text/javascript">
                        $(document).ready(function(){
                            $(".datepicker").datepicker({
                                dateFormat: 'yy-mm-dd',
                                yearRange: '1940:2017',
                                changeYear: true
                            }); 

                            function getAge(dateString) {
                                var today = new Date();
                                var birthDate = new Date(dateString);
                                var age = today.getFullYear() - birthDate.getFullYear();
                                var m = today.getMonth() - birthDate.getMonth();
                                if (m < 0 || (m === 0 && today.getDate() < birthDate.getDate())) {
                                age--;
                                }
                                return age;
                            }

                            $("#fechaNacimiento").change(function(){
                                var birthDate = $(this).val();
                                var todayDate = new Date(); 
                                $('.edad').val(getAge(birthDate));
                                var edad = $('.edad').val();
                                console.log(edad);
                                $('#edad').val(edad);
                                console.log($('#edad').val());
                            });
                        })
                    </script>
                    <div class="row">
                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="exampleInputPassword1">Nombre Cliente</label>
                                <input type="text" class="form-control" id="exampleInputPassword1" name="nombreCliente" value="<?php echo $value['nombreCliente'] ?>"  data-validacion-tipo="requerido|min:3">
                              </div>
                        </div>
                        <div class="col-md-4">
                           <div class="form-group">
                            <label for="exampleInputPassword1">Apellido Cliente</label>
                            <input type="text" class="form-control" id="exampleInputPassword1" name="apellidoCliente"  value="<?php echo $value['apellidoCliente'] ?>" data-validacion-tipo="requerido|min:3">
                          </div>
                        </div>
                        <div class="col-md-4">
                          <div class="form-group">
                            <label for="exampleInputPassword1">Telefono</label>
                            <input type="text" class="form-control" id="exampleInputPassword1" name="telefono" value="<?php echo $value['telefono'] ?>" data-validacion-tipo="requerido|min:9|max:9">
                          </div>
                        </div>
                        
                    </div>

                    <div class="row">
                        <div class="col-md-4">
                          <fieldset class="form-group">
                              <label>Sexo</label>
                              <div class="">
                                <div class="form-check form-check-inline">
                                  <label class="form-check-label">
                                    <input class="form-check-input" type="radio" name="sexo" <?php if (isset($value['sexo']) && $value['sexo']=="femenino") echo "checked";?> value="femenino" checked>
                                    Femenino
                                  </label>
                                </div>
                                <div class="form-check form-check-inline">
                                  <label class="form-check-label">
                                    <input class="form-check-input" type="radio" name="sexo" <?php if (isset($value['sexo']) && $value['sexo']=="masculino") echo "checked";?> value="masculino">
                                    Masculino
                                  </label>
                                </div>
                              </div>
                            </fieldset>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group" id="form">
                                <div class="form-group">
                                    <label for="fechaNacimiento">Fecha de Nacimiento</label>
                                    <input readonly type="text" id="fechaNacimiento" name="fechaNacimiento" value="<?php echo date("Y-m-d", strtotime($value['fechaNacimiento'])) ?>" class="form-control datepicker" placeholder="Ingrese fecha de nacimiento" data-validacion-tipo="requerido" />
                                </div>
                            </div>
                            <span id="pro">
                            </span>
                        </div>
                        <div class="col-md-4">
                          <div class="form-group">
                            <label for="edad">Edad</label>
                            <input type="text" class="form-control edad" name="edad" value="<?php echo $value['edad'] ?>" disabled>
                          </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4">
                          <div class="form-group">
                            <label for="exampleInputPassword1">Dirección</label>
                            <input type="text" class="form-control" id="exampleInputPassword1" name="direccion" value="<?php echo $value['direccion'] ?>" data-validacion-tipo="requerido|min:3">
                          </div>
                        </div>
                      
                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="dni">DNI</label>
                            <input class="form-control"  name="dni" type="number" value="<?php echo $value['dni'] ?>" data-validacion-tipo="requerido|min:8|max:12">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                     
                      <div class="col-md-6">
                      <div class="form-group">
                            <label for="exampleInputPassword1" class="label"></label>
                        <input class="btn btn-outline-danger btn-block" id="button" name="editarClientes" type="submit" value="Editar Cliente">
                    </div>
                    </div>
                    </div>
                    <input type="hidden" name="idCliente" value="<?php echo $value['idCliente'] ?>">
                    <input type="hidden" name="edad" id="edad" value="<?php echo $value['edad'] ?>">
                </form>
                <script>
                    $(document).ready(function(){
                        $("#form-validate").submit(function(){
                            return $(this).validate();
                        });
                    })
                </script>
            </div>
        </div>
        <?php endif?>

                    <?php

$reg = new ClientesController();
$reg->registrarClientesController();
$reg->editClientesController();
$reg->actualizarClientesController();
$reg->bajaClientesController();
$reg->altaClientesController();
?>
                </div>
            </div>
