<?php

session_start();

if (!$_SESSION["nombreAdmin"]) {

    header("location:ingreso");

    exit();

}

?>
<section class="jumbotron text-center" style="background-color: transparent; margin-bottom: 0px;">
    <div class="container">
        <h1 class="jumbotron-heading">Membresias</h1>
        <p class="lead text-muted">Aquí podras gestionar los tipos de membresias y los costos de cada uno, de igual manera crear nuevas membresias.</p>
        <p>
            <a href="membresias" class="btn btn-primary">Lista de Membresias</a>
            <a href="agragarMembresias" class="btn btn-secondary">Crear una membresia</a>
        </p>
    </div>
</section>
<div class="album text-muted">
      <div class="container">
<?php
if (isset($_GET['action'])) {
    if ($_GET['action'] == 'okMembresias') {
        echo '<div id="oks" class="alert alert-success alert-dismissible fade show" role="alert">
<button aria-label="Close" class="close" data-dismiss="alert" type="button">
    <span aria-hidden="true">
        ×
    </span>
</button>
La membresia fue agregada correctamente.
</div>';
        echo '<meta http-equiv="Refresh" content="4;URL = membresias" >';
    }
    if ($_GET['action'] == 'editadoMem') {
        echo '
    <div class="alert alert-success alert-dismissible fade show" id="oks" role="alert">
        <button aria-label="Close" class="close" data-dismiss="alert" type="button">
            <span aria-hidden="true">
                ×
            </span>
        </button>
        La membresia fue editada correctamente al Sistema.
    </div>';
        echo '<meta content="4; URL = membresias" http-equiv="Refresh"> ';
    }
    if ($_GET['action'] == 'DeletMembresias') {
        echo '
        <div class="alert alert-warning alert-dismissible fade show" id="oks" role="alert">
            <button aria-label="Close" class="close" data-dismiss="alert" type="button">
                <span aria-hidden="true">
                    ×
                </span>
            </button>
            La membresia fue borrada correctamente del sistema.
        </div>
        ';
        echo '
        <meta content="4;
        URL = membresias" http-equiv="Refresh">
            ';
    }
}
?>

            <?php if (isset($_GET['action'])): ?>
            <?php if ($_GET['action'] == 'membresias' or $_GET['action'] == 'okMembresias' or $_GET['action'] == 'DeletMembresias' or $_GET['action'] == 'editarMem' or $_GET['action'] == 'editadoMem'): ?>
                <div class="jumbotron text-center" style="padding: 1rem 2rem;">
                    <h1>Lista de Membresias</h1>
                </div>
                <table class="table table-striped table-sm" id="tablas">
                    <thead class="bg-primary text-white">
                        <tr>
                            <td>
                                Id Membresia
                            </td>
                            <td>
                                Nombre de Membresia
                            </td>
                            <td>
                                Costo
                            </td>
                            <td>
                                Tiempo
                            </td>
                            <td>
                                Acciones
                            </td>
                        </tr>
                    </thead>
                    <?php
                        $datos = new membresiasController();
                        $datos->getMembresiasController();
                        $datos->deleteMembresiaController();
                    ?>
                </table>
            <?php endif?>
            <?php if ($_GET['action'] == 'agragarMembresias'): ?>
                <div class="jumbotron text-center" style="padding: 1rem 2rem;">
                    <h1>Crear membresia</h1>
                </div>
                <form method="post" id="form-validate" onsubmit="return validarMembresias()">
                    <div class="form-group" id="form">
                        <label for="nombreMembresias">
                            Nombre de Membresia
                        </label>
                        <input class="form-control" id="nombreMembresias" name="nombreMembresia" placeholder="Nombre de Membresia" data-validacion-tipo="requerido|min:3" type="text">
                            <input name="" type="hidden">
                                <span id="mem">
                                </span>
                            </input>
                        </input>
                    </div>
                    <div class="form-group">
                        <label for="costoMembresia" style="padding-top: 10px;">
                            Costo Membresia
                        </label>
                        <input class="form-control" id="costoMembresia" name="costoMembresia" placeholder="Costo de Membresia" data-validacion-tipo="requerido|numero|max:3|min:2" type="text">
                    </div>
                   <input class="btn btn-primary btn-block" id="button" name="agragarMembresias" type="submit" value="Agregar Membresias">
                    </input>
                    
                </form>
            <?php endif?>
            <?php endif?>
            <?php
                $mem = new membresiasController();
                $mem->agregarMembresiasController();
            ?>
    </div>
</div>
