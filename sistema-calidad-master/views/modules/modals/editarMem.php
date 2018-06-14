<!-- Modal -->
<div aria-hidden="true" aria-labelledby="exampleModalLabel" class="modal fade" id="editarMem" role="dialog" tabindex="-1">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">
                    <i class="fa fa-edit">
                    </i>
                    Editar Membresia
                </h5>
                <span aria-hidden="true">
                    ×
                </span>
            </div>
 <div class="modal-body">
    <form method="post" id="form-validate">
        <?php $mem = membresiasController::editarMembresiaController();?>
        <?php foreach ($mem as $resp): ?>
         <div class="form-group">
            <label for="recipient-name" class="form-control-label">Nombre de Membresia:</label>
            <input type="text" class="form-control" id="recipient-name" name="nombreMembresia" value="<?php echo $resp['nombreMembresia'] ?> " data-validacion-tipo="requerido|min:2">
        </div>
        <div class="form-group">
            <label for="recipient-name" class="form-control-label" style="padding-top: 10px;">Costo Membresia:</label>
            <input type="number" class="form-control" id="recipient-name" name="costoMembresia" value="<?php echo (int)$resp['costoMembresia'] ?>" data-validacion-tipo="requerido|numero|max:3|min:2">
        </div>
        <div class="form-group">
            <label for="recipient-name" class="form-control-label" style="padding-top: 10px;">Costo Membresia:</label>
            <input type="number" class="form-control" id="recipient-name" name="mesesMembresia" value="<?php echo $resp['mesesMembresia'] ?>" data-validacion-tipo="requerido|numero|max:2|min:1">
        </div>
        <input type="hidden" name="idMembresia" value="<?php echo $resp['idMembresia']; ?>">
        <?php endforeach?>
        <div class="modal-footer">
            <button type="submit" class="btn btn-primary" name="editarMem">Guardar</button>
            <button type="button" class="btn btn-danger" data-dismiss="modal">Cerrar</button>
        </div>
    </form>
        </div>
 </div>
    </div>
</div>
<?php

$actualizarMem = new membresiasController();
$actualizarMem->actualizarMembresiaController();

?>
