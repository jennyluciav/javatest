<?php session_start();
if (!$_SESSION["nombreAdmin"]) {
    header("location:ingreso");exit();
}
?>
<section class="jumbotron text-center" style="background-color: transparent; margin-bottom: 0px;">
    <div class="container">
        <h1 class="jumbotron-heading">Matricula</h1>
        <p class="lead text-muted">Aquí podras gestionar la matricula del cliente a una membresia.</p>
        <p>
            <a href="matriculas" class="btn btn-primary">Lista de Matriculas</a>
            <a href="agragarmatriculas" class="btn btn-secondary">Agregar nueva matricula</a>
        </p>
    </div>
</section>
<div class="album text-muted">
      <div class="container">

<?php if (isset($_GET['action'])) {
    if ($_GET['action'] == 'editadoMatr') {
        echo '
        <div id="oks" class="alert alert-success alert-dismissible fade show" role="alert">
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">
                &times;
            </span>
        </button>
        <strong>
            Enorabuena!
        </strong>
        La matricula fue Editado correctamente al Sistema.
        </div>
        ';
        echo "  <META HTTP-EQUIV='Refresh' CONTENT='4; URL=matriculas'/> ";
    }
    if ($_GET['action'] == 'okInventarios') {
        echo '<div id="oks"  class="alert alert-success alert-dismissible fade show" role="alert">
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">
                &times;
            </span>
        </button>
        <strong>
            Enorabuena!
        </strong>
        El Inventario fue agregada correctamente al sistema.
        </div>
        ';
        echo "  <META HTTP-EQUIV='Refresh' CONTENT='4; URL=inventario'/> ";
    }
    if ($_GET['action'] == 'okMatriculas') {
        echo '<div id="oks"  class="alert alert-success alert-dismissible fade show" role="alert">
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">
                &times;
            </span>
        </button>
        <strong>
            Enorabuena!
        </strong>
        La matricula fue agregada correctamente al sistema.
        </div>
        ';
        echo "  <META HTTP-EQUIV='Refresh' CONTENT='4; URL=matriculas'/> ";
    }
    if ($_GET['action'] == 'okMatrDelete') {
        echo '
        <div id="oks" class="alert alert-warning alert-dismissible fade show" role="alert">
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">
                &times;
            </span>
        </button>
        <strong>
            Enorabuena!
        </strong>
        La matrícula fue borrada correctamente del sistema.
        </div>
        ';
        echo "  <META HTTP-EQUIV='Refresh' CONTENT='4; URL=matriculas'/> ";
    }
}
?>
            <?php if (isset($_GET['action'])): ?>
            <?php if ($_GET['action'] == 'matriculas' or $_GET['action'] == 'okMatriculas' or $_GET['action'] == 'okMatrDelete' or $_GET['action'] == 'editarMatr' or $_GET['action'] == 'editadoMatr'): ?>
            <div class="jumbotron text-center" style="padding: 1rem 2rem;">
                <h1>Lista de Matriculas</h1>
            </div>
            <table class="table table-bordered table-sm" id="tablas">
                <thead class="badge-primary text-white">
                    <tr>
                        <td>
                            Nombre Cliente
                        </td>
                        <td>
                            Tipo Membresia
                        </td>
                        <td>
                            Precio
                        </td>
                        <td>
                            Meses
                        </td>
                        <td>
                            Fecha Inicio
                        </td>
                        <td>
                            Fecha Fin
                        </td>
                        <td>
                            Acciones
                        </td>
                    </tr>
                </thead>
                <?php $get = MatriculasController::getMatriculasControllers();?>
                <?php foreach ($get as $key):
                ?>
                <tr>
                    <td class='tooltips' data-toggle='tooltip' data-placement='top' title='id Matricula :<?php echo $key['idMatricula'] ?>'  >
                        <?php echo $key['nombreCliente'] ?>
                    </td>
                    <td>
                        <?php echo $key['nombreMembresia'] ?>
                    </td>
                    <td>
                        S/.
                        <?php echo $key['costoMembresia'] ?>
                    </td>
                    <td>
                        <?php echo $key['mesesMembresia'] ?>
                    </td>
                    <td>
                        <?php echo date("d-m-Y", strtotime($key['fechaInicio'])) ?>
                    </td>
                     <td align="center">
                        <?php echo date("d-m-Y", strtotime($key['fechaFin'])) ?>
                    </td>
                    <td align="center">
                        <a href="index.php?action=editarMatr&idMatrEdit=<?php echo $key['idMatricula'] ?> ">
                            <i class="fa fa-edit btn btn-outline-primary btn-sm">
                            </i>
                        </a>
                        <a href="index.php?action=matriculas&idMatr=<?php echo $key['idMatricula'] ?> ">
                            <i class="fa fa-trash  btn btn-outline-danger btn-sm">
                            </i>
                        </a>
                    </td>
                </tr>
                <?php endforeach?>
            </table>
    </div>
</div>
<?php endif?>
<!-- Formulario de registro de las matriculas -->
<!-- ========================================== -->
<?php if ($_GET['action'] == 'agragarmatriculas'): ?>
<div class="jumbotron text-center" style="padding: 1rem 2rem;">
    <h1>Registrar Matricula</h1>
</div>
<form id="form-validate" method="post">
    <script type="text/javascript">
        $(document).ready(function(){
            $("#fechaFin").attr('disabled', 'disabled');
            $("#fechaInicio").attr('disabled', 'disabled');
            $("#buttonSend").attr('disabled', 'disabled');
            var cantMeses=0;
            $("#idMembresia").chosen().change(function(){
                // $("#fechaFin").removeAttr('disabled', 'disabled');
                $("#fechaInicio").removeAttr('disabled', 'disabled');
                cantMeses = parseInt($('option:selected', this).attr('myMonth'));
                console.log(cantMeses);
            });
            $("#fechaInicio").datepicker({
                dateFormat: "dd-mm-yy",
                onSelect: function(dateText, instance) {
                    date = $.datepicker.parseDate(instance.settings.dateFormat, dateText, instance.settings);
                    date.setMonth(date.getMonth() + cantMeses);
                    $("#fechaFin").datepicker("setDate", date);
                    $("#buttonSend").removeAttr('disabled', 'disabled');
                }
            });
            $("#fechaFin").datepicker({
                dateFormat: "dd-mm-yy"
            });
        })
    </script>
    <div class="row">
        <div class="col-md-6">
            <div class="form-group">
                <label for="nombreCategorias">
                    Nombre Cliente
                </label>
                <select class="form-control chosen-select" id="idClienteNuevo" name="idCliente" required="">
                    <option>
                        Elegir Cliente
                    </option>
                    <?php $b = new ClientesController();
                        $b->getClientesSelectController();
                    ?>
                </select>
            </div>
        </div>
        <div class="col-md-6">
            <div class="form-group">
                <label for="nombreCategorias">
                    Membresia
                </label>
                <select class="form-control chosen-select" id="idMembresia"  name="idMembresia" required="">
                    <option>
                        Elegir Membresia
                    </option>
                    <?php $mem = membresiasController::getMembresiasSelectController(); ?>
                    <?php foreach ($mem as $key): ?>
                    <option value=" <?php echo $key['idMatricula'];?> " myMonth="<?php echo $key['mesesMembresia'];?>">
                        <?php echo $key['nombreMembresia']; ?>
                    </option>
                    <?php endforeach?>
                </select>
            </div>
        </div>

        <div class="col-md-6">
            <div class="form-group" id="form">
                <div class="form-group">
                    <label for="exampleInputPassword1">Fecha de Inicio </label>
                    <input readonly type="text" id="fechaInicio" name="fechaInicio" value="<?php echo date('d-m-Y'); ?> " class="fechaInicio form-control" placeholder="Ingrese fecha de inicio" disabled="" required />
                </div>
            </div>
            <span id="pro">
            </span>
        </div>
        <div class="col-md-6">
            <div class="form-group" id="form">
                <div class="form-group">
                    <label for="fechaFin">Fecha de Fin </label>
                    <input readonly type="text" id="fechaFin" name="fechaFin" class="form-control" placeholder="Ingrese fecha de fin" disabled data-validacion-tipo="requerido" disabled="">
                </div>
            </div>
            <span id="pro">
            </span>
        </div>
        <div class="col-md-6">
            <div class="form-group" style="padding-top: 12px">
                <input type="hidden" id="idAdmin" name="idAdmin" value="1"/>
                <input type="hidden" id="cantMesMem" name="cantMesMem" value="1"/>
                <input type="hidden" name="fechaInicio" id="fechaInicio" value="<?php echo date('d-m-Y');  ?>">
                <input type="hidden" id="fechaMatricula" name="fechaMatricula" value="<?php echo date('d-m-Y'); ?> "/>
                <input type="submit" name="agragarpro" id="buttonSend" value="Guardar Matrícula" class="btn btn-primary"/>
            </div>
        </div>
    </form>
    <script>
        $(document).ready(function(){
            $("#form-validate").submit(function(){
                return $(this).validate();
            });
        })
    </script>
</div>
<?php endif?>
<!--  -->

<?php endif?>
<?php
$re = new MatriculasController();
$re->registroMatriculasController();
$re->deleteMatriculasController();
$re->actualizarMatriculasController();
?>