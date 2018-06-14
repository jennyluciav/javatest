<div class="modal fade bd-example-modal-lg" id="agregarInventario" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">

  <div class="modal-dialog modal-md">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Agregar stock</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
<form method="post" id="form-validate">

            <div class="form-group">
                <label for="nombreCategorias" class=''>
                   Nombre Productos
                </label>
                <select class="form-control" name="idProducto" id="idProducto" required="" data-validacion-tipo="requerido|min:1">
                    <option>
                        Elegir Producto 
                    </option>
                    <?php $a = ProductosController::getProductosControllers();?>
                    <?php foreach ($a as $key): ?>
                    <option value=" <?php echo $key['idProducto'] . ' / ' . $key['cantidadIngresada'] ?> ">
                        <?php echo $key['nombreProducto'] ?>
                    </option>
                    <?php endforeach?>
                </select>
            </div>

            <div class="form-group">
                <label for="cantidadIngresada" class="">
                    Cantidad de Unidades 
                </label>
                <input type="number" class="form-control" id="cantidadIngresada" placeholder="Cantidad de Unidades"  name="cantidadIngresada" data-validacion-tipo="requerido|min:1">
            </div>
            <div class="form-group">
                <label for="precioVenta" class="">
                    Precio de Venta 
                </label>
                <input type="text" class="form-control" id="precioVenta" placeholder="Precio de Venta"  name="precioVenta" data-validacion-tipo="requerido|min:1">
            </div>
            <div class="form-group">
                <label for="precioVenta" class="text-primary">
<br>
                </label>
                
            </div>
            <div class="modal-footer">
                <input type="submit" class="btn btn-primary"  name="agregarInventario" value="Agregar Stock" />
                <button type="button" class="btn btn-danger" data-dismiss="modal">Cerrar</button>
                <!-- <button type="button" class="btn btn-primary">Save changes</button> -->
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
  </div>
</div>


