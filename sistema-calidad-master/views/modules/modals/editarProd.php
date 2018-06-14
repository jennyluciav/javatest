<!-- Modal Editar Productos -->

<div class="modal fade bd-example-modal-lg" id="editarProd" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">

  <div class="modal-dialog modal-md">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Editar Producto: <?php echo $key['nombreProducto'] ?></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
<?php $editarProd = ProductosController::editarProductosController();?>
<?php foreach ($editarProd as $key): ?>

		<form method="post" id="form-validate">

            <div class="form-group" id="form">
                <label for="nombreCategorias">
                    Nombre Productos
                </label>
                <input type="text" class="form-control" id="nombreProductos"   name="nombreProducto" value="<?php echo $key['nombreProducto'] ?>" data-validacion-tipo="requerido|min:3"/>
            </div>
            <span id="pro">
            </span>
            <div class="form-group">
                <label for="nombreCategorias">
                    Precio Productos ($ 2.50 )
                </label>
                <input type="text" class="form-control" id="precioCategorias" placeholder="precio del Producto"  name="precioProducto" value="<?php echo $key['precioProducto'] ?>" data-validacion-tipo="requerido|min:1"/>
            </div>
        <input type="hidden" name="idProducto" value="<?php echo $key['idProducto'] ?>">
        <div class="modal-footer">
          <input type="submit" name="editarProd" id="button" value="Guardar" class="btn btn-primary"/>
          <button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
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
</div>
<?php endforeach?>
