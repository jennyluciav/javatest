<?php session_start();
if (!$_SESSION["nombreAdmin"]) {
    header("location:ingreso");exit();
}
?>
<section class="jumbotron text-center" style="background-color: transparent; margin-bottom: 0px;">
    <div class="container">
        <h1 class="jumbotron-heading">Productos</h1>
        <p class="lead text-muted">Aquí podras gestionar los productos y el stock de estas.</p>
        <p>
            <a href="productos" class="btn btn-primary">Lista de Productos</a>
            <a href="agragarproductos" class="btn btn-secondary">Nuevo producto</a>
            <a href="inventario" class="btn btn-secondary">Inventario</a>
        </p>
    </div>
</section>
<div class="album text-muted">
      <div class="container">
<?php if (isset($_GET['action'])) {

    if ($_GET['action'] == 'editadoProd') {
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
El Producto fue Editado correctamente al Sistema.
</div>
';
        echo "  <META HTTP-EQUIV='Refresh' CONTENT='4; URL=productos'/> ";
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
El Inventario fue agregado correctamente al sistema.
</div>
';
        echo "  <META HTTP-EQUIV='Refresh' CONTENT='4; URL=inventario'/> ";
    }
    if ($_GET['action'] == 'okProductos') {
        echo '<div id="oks"  class="alert alert-success alert-dismissible fade show" role="alert">
<button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">
        &times;
    </span>
</button>
<strong>
    Enorabuena!
</strong>
El Producto fue agregado correctamente al sistema.
</div>
';
        echo "  <META HTTP-EQUIV='Refresh' CONTENT='4; URL=productos'/> ";
    }
    if ($_GET['action'] == 'okProdDelete') {
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
El Prducto fue Borrado correctamente del sistema.
</div>
';
        echo "  <META HTTP-EQUIV='Refresh' CONTENT='4; URL=productos'/> ";
    }
}
?>

            <?php if (isset($_GET['action'])): ?>
            <?php if ($_GET['action'] == 'productos' or $_GET['action'] == 'okProductos' or $_GET['action'] == 'okProdDelete' or $_GET['action'] == 'editarProd' or $_GET['action'] == 'editadoProd'): ?>
            <div class="jumbotron text-center" style="padding: 1rem 2rem;">
                    <h1>Lista de Productos</h1>
                </div>
            <table class="table table-bordered table-sm" id="tablas">
                <thead class="badge-primary text-white">
                    <tr>
                        <td>
                            Producto
                        </td>
                        <td>
                            Precio<span class="text-danger">(*)</span>
                        </td>
                        <td>
                            Stock (U)
                        </td>
                        <td>
                            Acciones
                        </td>
                    </tr>
                </thead>
                <?php $get = ProductosController::getProductosControllers();?>
                <?php foreach ($get as $key): ?>
                <tr>
                    <td class='tooltips' data-toggle='tooltip' data-placement='top' title='id Producto :<?php echo $key['idProducto'] ?>'  >
                        <?php echo $key['nombreProducto'] ?>
                    </td>
                    <td>
                        S/.
                        <?php echo $key['precioProducto'] ?>
                    </td>
                     <td align="center">
                        <?php echo $key['cantidadIngresada'] ?>
                    </td>
                    <td align="center">
                        <a href="index.php?action=editarProd&idProEdit=<?php echo $key['idProducto'] ?> ">
                            <i class="fa fa-edit btn btn-outline-primary btn-sm">
                            </i>
                        </a>
                        <a href="index.php?action=productos&idProd=<?php echo $key['idProducto'] ?> ">
                            <i class="fa fa-trash  btn btn-outline-danger btn-sm">
                            </i>
                        </a>
                    </td>
                </tr>
                <?php endforeach?>
            </table>
        </div>
    </div>
</div>
<span class="text-danger">(*) <small>Es el Precio de Compra.</small></span>
<?php endif?>
<!-- Formulario de registro de los productos -->
<!-- ========================================== -->
<?php if ($_GET['action'] == 'agragarproductos'): ?>
<div class="jumbotron text-center" style="padding: 1rem 2rem;">
    <h1>Crear producto</h1>
</div>
<form method="post" id="form-validate">
    <div class="row">
        <div class="col-md-6">
            <div class="form-group" id="form">
                <label for="nombreCategorias">
                    Nombre Productos
                </label>
                <input type="text" class="form-control" id="nombreProductos" placeholder="Nombre del Producto"  name="nombreProducto" data-validacion-tipo="requerido|min:3"/>
            </div>
            <span id="pro">
            </span>
        </div>
        <div class="col-md-6">
            <div class="form-group">
                <label for="nombreCategorias">
                    Precio Productos (S/. 2.50 )
                </label>
                <input type="number" class="form-control" id="precioCategorias" placeholder="precio del Producto"  name="precioProducto" data-validacion-tipo="requerido|min:1"/>
            </div>
        </div>
        <div class="col-md-12">
            <input type="submit" name="agragarpro" id="button" value="Agregar Productos" class="btn btn-primary"/>
            <a href="productos" class="btn btn-danger">Cancelar</a>
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
<!-- Sección de inventarios -->
<?php if ($_GET['action'] == 'inventario' or $_GET['action'] == 'okInventarios'): ?>
<div class="jumbotron text-center" style="padding: 1rem 2rem;">
    <h1>Seccion de Inventarios</h1>
</div>
<?php require 'views/modules/modals/agregarInventario.php';?>
<div class="text-center">
    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#agregarInventario">
      Agregar Stock
    </button>
</div>
<div class="tablas">

  <table class="table table-bordered table-sm" id="tablas">
      <thead class="bg-primary text-white">
          <tr>
              <th class="text-md-center">Nombre Producto</th>
              <th class="text-md-center">Cantidad Stock</th>
              <th class="text-md-center">Precio Venta</th>
          </tr>
      </thead>
      <?php $inv = ProductosController::getInventarioController();?>
      <?php foreach ($inv as $inventario): ?>
          <tr>
              <td class="text-md-center"><?php echo $inventario['nombreProducto'] ?></td>
              <td class="text-md-center"><?php echo $inventario['cantidadIngresada'] ?></td>
              <td class="text-md-center"><?php echo $inventario['precioVenta'] ?></td>
          </tr>
      <?php endforeach?>
  </table>
</div>
</div>
</div>
<?php endif?>
<?php endif?>
<?php
$re = new ProductosController();
$re->registroProductosController();
$re->agregarInventarioController();
$re->deleteProductosController();
$re->actualizarProductosController();
?>
