<!-- Modal Editar Matriculas -->

<div class="modal fade bd-example-modal-lg" id="editarMatr" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">

  <div class="modal-dialog modal-md">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Editar Matrícula <?php echo $key['nombreCliente'] ?></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
<?php $editarMatr = MatriculasController::editarMatriculasController();?>
<?php foreach ($editarMatr as $key): ?>

		<form method="post">
            <script type="text/javascript">
                $(document).ready(function(){
                    var cantMeses=0;
                    console.log(cantMeses);
                    $("#idMembresia").chosen().change(function(){
                        // $("#fechaFin").removeAttr('disabled', 'disabled');
                        $("#fechaInicio").removeAttr('disabled', 'disabled');
                        
                    });
                    $("#fechaInicio").datepicker().change(function(){
                        var ee = $('#idMembresia').val();
                        console.log(ee);
                        cantMeses = parseInt($('option:selected', this).attr('myMonth'));
                            console.log(cantMeses);
                    })
                    $("#fechaInicio").datepicker({
                        dateFormat: "dd-mm-yy",
                        onSelect: function(dateText, instance) {
                            
                            cantMeses = parseInt($('option:selected', this).attr('myMonth'));
                            console.log(cantMeses);
                            date = $.datepicker.parseDate(instance.settings.dateFormat, dateText, instance.settings);
                            date.setMonth(date.getMonth() + cantMeses);
                            $("#fechaFin").datepicker("setDate", date);
                            $("#buttonSend").removeAttr('disabled', 'disabled');
                        }
                    });
                    $("#fechaFin").datepicker({
                        dateFormat: "dd-mm-yy"
                    });
                });
            </script>
    <div class="row">
        <div class="col-md-12">
            <div class="form-group" id="form">
                <div class="form-group">
                    <label for="exampleInputPassword1">Fecha de Inicio</label>
                    <input readonly type="text" ID="fechaInicio" name="fechaInicio" value="<?php echo date("d-m-Y", strtotime($key['fechaInicio'])) ?>" class="form-control datepicker fechaInicio">
                </div>
            </div>
            <span id="pro">
            </span>
        </div>
        <div class="col-md-12">
            <div class="form-group" id="form">
                <div class="form-group">
                    <label for="exampleInputPassword1">Fecha de Fin</label>
                    <input readonly type="text" id="fechaFin" name="fechaFin" value="<?php echo date("d-m-Y", strtotime($key['fechaFin'])) ?>" class="form-control datepicker fechaFin"/>
                </div>
            </div>
            <span id="pro">
            </span>
        </div>
        <div class="col-md-12">
            <div class="form-group">
                <label for="nombreMembresia">
                    Tipo de Membresía
                </label>
                <select  class="form-control"  name="idMembresia">
                    <option value="<?php echo $key['idMembresia'] ?>" myMonth="<?php echo $key['mesesMembresia'];?>" selected><?php echo $key['nombreMembresia'] ?></option>
                    <?php $mem = membresiasController::getMembresiasSelectController(); ?>
                    <?php foreach ($mem as $key): ?>
                    <option value=" <?php echo $key['idMembresia'] ?> " myMonth="<?php echo $key['mesesMembresia'];?>">
                        <?php echo $key['nombreMembresia']; ?>
                    </option>
                    <?php endforeach?>
                </select>
            </div>
        </div>
        <input type="hidden" name="idMatricula" value="<?php echo $key['idMatricula'] ?>">
        <input type="hidden" name="idCliente" value="<?php echo $key['idCliente'] ?>">
        <input type="hidden" name="idAdmin" value="<?php echo $key['idAdmin'] ?>">
        
    </div> 
    <div class="modal-footer">
            <input type="submit" name="editarProd" id="button" value="Guardar matricula" class="btn btn-primary"/>
            <button type="button" class="btn btn-danger " data-dismiss="modal">Salir</button>
        </div>
    </form>

       
      
    </div>
  </div>
</div>
<?php endforeach?>
