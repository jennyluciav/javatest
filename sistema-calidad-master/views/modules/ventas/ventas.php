<?php session_start();if (!$_SESSION["nombreAdmin"]) {header("location:ingreso");exit();}?>
<section class="jumbotron text-center" style="background-color: transparent; margin-bottom: 0px;">
    <div class="container">
        <h1 class="jumbotron-heading">Ventas</h1>
        <p class="lead text-muted">Aquí podras gestionar las ordenes de venta de productos</p>
        <p>
            <a href="ventas" class="btn btn-primary">Agregar Orden de Compra</a>
            <a href="factura" class="btn btn-primary">Recibos</a>
            <a href="reportes" class="btn btn-primary">Reportes</a>
        </p>
    </div>
</section>
<div class="album text-muted">
    <div class="container">
        <!-- Comienza la tabla de ventas -->
<?php if ($_GET['action'] == 'okVentas') {
    echo ' <div id="oks" class="alert alert-success alert-dismissible fade show" role="alert">
<button aria-label="Close" class="close" data-dismiss="alert" type="button">
    <span aria-hidden="true">
        ×
    </span>
</button>
<strong>
    El producto fue agregado al carrito correctamente.
</strong>

</div>';
    echo " <meta HTTP-EQUIV = 'Refresh'CONTENT = '3; URL=ventas' /  > ";
}
if ($_GET['action'] == 'okBorradoVentas') {
    echo '
<div  class="alert alert-warning alert-dismissible fade show" role="alert">
<button aria-label="Close" class="close" data-dismiss="alert" type="button">
    <span aria-hidden="true">
        ×
    </span>
</button>
<strong>
    El producto fue borrado del carrito correctamente.
</strong>

</div>';
    echo " <meta HTTP-EQUIV = 'Refresh'CONTENT = '3; URL=ventas' /  > ";

}
?>
        <!-- Formulario de ventas -->
        <?php if (isset($_GET['action'])): ?>
        <?php if ($_GET['action'] == 'ventas' or $_GET['action'] == 'enviaPrueba' or $_GET['action'] == 'okBorradoVentas' or $_GET['action'] == 'okVentas'): ?>
        <div class="row" style="padding-bottom: 20px; border-bottom: 1px solid #bfbfbf;">
            <div class="col-md-8">
                <?php $ven = ProductosController::getInventarioController();
                $array = array();?>
                <?php foreach ($ven as $key): ?>
                <?php $prod = $key['idProducto'] . ' - ' . $key['nombreProducto'];
                array_push($array, $prod);?>
                <?php endforeach?>
                <div class="row">
                    <?php 
                        $get = VentasController::getTempController();
                        if(empty($get)):
                    ?>
                    <!-- aqui va el select sin value -->
                    <div class="col-md-12 col-sm-12">
                        <div class="form-group">
                            <label class="">
                                Cliente
                            </label>
                            <div class="input-group">
                                <span class="input-group-addon">
                                    <i class="fa fa-search fa-fw" aria-hidden="true">
                                    </i>
                                </span>
                                <?php $cli = ClientesController::getClientesController();?>
                                <select style="width:100%;"  class="chosen-select form-control"  id="clientes">
                                    <option value="">
                                        Buscar cliente
                                    </option>
                                    <?php foreach ($cli as $cliente): ?>
                                    <option value=" <?php echo $cliente['idCliente']; ?> ">
                                        <?php echo $cliente['nombreCliente'], ' ' . $cliente['apellidoCliente'], ' ' . $cliente['idCliente']; ?>
                                    </option>
                                    <?php endforeach?>
                                </select>
                            </div>
                        </div>
                    </div>
                    <?php else: ?>
                    <?php foreach ($get as $key): ?>
                        <!-- <div class="alert alert-info">Cliente: <?php echo $key['nombreCliente'] . ' ' . $key['apellidoCliente'] ?></div>  -->
                    <?php endforeach?>
                    <!-- aqui va el select con value con el nombre del cliente -->
                    <div class="col-md-12 col-sm-12">
                        <div class="form-group">
                            <label class="">
                                Cliente
                            </label>
                            <div class="input-group">
                                <span class="input-group-addon">
                                    <i class="fa fa-search fa-fw" aria-hidden="true">
                                    </i>
                                </span>
                                <select style="width:100%;"  class="chosen-select form-group"  id="clientes" disabled="">
                                    <option value=" <?php echo $key['idCliente']; ?> ">
                                        <?php echo $key['nombreCliente'] . ' ' . $key['apellidoCliente']; ?>
                                    </option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <?php endif ?>
                </div>
                <div class="row">
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label class="">
                                Producto
                            </label>
                            <div class="input-group">
                                <span class="input-group-addon">
                                    <i class="fa fa-search fa-fw" aria-hidden="true">
                                    </i>
                                </span>
                                <input type="text" class="form-control" name="" id="producto" placeholder="Buscar Productos:"/>
                            </div>
                        </div> 
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label class="">
                                Cantidad
                            </label>
                            <input type="number" name="cantidad" id="cantidad" class="form-control" placeholder="Ingrese cantidad"/>
                        </div>
                    </div>
                </div>
                <br>
                <input type="hidden" value="A" name="Factura" id="Factura" readonly/>
            </div>
            <!-- Fin Formulario de ventas -->
            <!--Formulario del precio Ventas -->
            <div class="col-md-4">
                <form method="post">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="">
                                    <!-- Sub Total -->
                                    Total
                                </label>
                                <div class="input-group">
                                    <span class="input-group-addon">
                                        <i class="fa fa-mone fa-fw" aria-hidden="true">
                                        
                                        </i>S/.
                                    </span>
                                    <input class="form-control text-md-center " type="text" placeholder="0.00" id="disabledTextInput" name="totalVenta" readonly required=""/>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="" style="color: transparent;">Calcular precio</label>
                                <div class="input-group">
                                    <button type="button" id="aceptar" class="btn btn-outline-primary btn-block btn-block">
                                        Calcular precio
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="">
                                    Fecha
                                </label>
                                <div class="input-group">
                                    <span class="input-group-addon">
                                        <i class="fa fa-calendar-o fa-fw" aria-hidden="true">
                                        </i>
                                    </span>
                                    <input class="form-control" type="text" value="<?php echo date('d-m-Y'); ?> " name="fechaVenta" id="fecha" readonly/>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="">
                                    Nro de Fac.
                                </label>
                                <div class="input-group">
                                    <span class="input-group-addon">
                                        <i class="fa fa-sort-numeric-descfa - fw" aria-hidden="true">
                                        </i>N°
                                    </span>
                                    <?php $idFact = VentasController::getFecturaController();?>
                                    <?php foreach ($idFact as $key): ?>
                                    <input class="form-control text-md-center " type="text" id="numFac" name="numFac" value="<?php echo $key['total'] + 1; ?>" readonly/>
                                    <?php endforeach?>
                                </div>
                            </div>
                        </div>
                    </div>
                    <br>
                    <button type="submit" class="btn btn-outline-danger btn-block" name="post" id="post">
                        Agregar producto
                    </button>
                    <input type="hidden" name="idProducto" id="idProducto"/>
                    <input type="hidden" name="nombreProducto" id="nombreProducto"/>
                    <input type="hidden" name="idCliente" id="idCliente"/>
                    <input type="hidden" name="cantidad" id="cant"/>
                    <input type="hidden" name="precioVenta" id="precioVenta"/>
                    <input type="hidden" name="tipoFactura" id="tipoFactura"/>
                </form>
            </div>
        <!-- Fin Formulario de precio ventas -->
        </div>
        <?php endif?>
        <?php if ($_GET['action'] == 'ventas' or $_GET['action'] == 'okVentas' or $_GET['action'] == 'borrarVenta' or $_GET['action'] == 'enviaPrueba' or $_GET['action'] == 'okBorradoVentas'): ?>
        <br>
        <br>
        <?php 
            $get = VentasController::getTempController();
            if(!empty($get)):
        ?>
        <div class="row">
            <div class="col-md-8">
                <table class="table table-bordered table-sm" id="ventas">
                    <thead class="bg-primary text-white table-bordered">
                        <tr>
                            <th class="text-md-center">
                                Producto
                            </th>
                            <th class="text-md-center">
                                Cantidad
                            </th>
                            <th class="text-md-center">
                                Precio
                            </th>
                             <th class="text-md-center">
                                Total
                            </th>

                            <th class="text-md-center">Borrar</th>
                        </tr>
                    </thead>
                    <?php $get = VentasController::getTempController();?>
                    <?php foreach ($get as $key): ?>
                    <tbody>
                        <tr>
                            <td align="center">
                                <?php echo $key['nombreProducto'] ?>
                            </td>
                            <td align="center">
                                <?php echo $key['cantidad'] ?>
                            </td>
                            <td align="center" width="50">
                                <?php echo $key['precioVenta'] ?>
                            </td>
                             <td align="center" width="50">
                                <?php echo $key['totalVenta'] ?>
                            </td>

                            <td align="center">
                                <a href="index.php?action=borrarVenta&idTemp=<?php echo $key['idTemp'] ?> &idProducto=<?php echo $key['idProducto'] ?>&cantidad=<?php echo $key['cantidad'] ?> ">
                                    <i class="fa fa-trash-o btn btn-secondary text-danger"></i>
                                    </a>
                            </td>
                            <?php
                            $total = $total + $key['totalVenta'];
                            $total = number_format($total, 2, ',', '');
                            ?>

                        </tr>
                    </tbody>
                    <?php endforeach?>
                </table>
            </div>
            <!-- segunda mitad de la tabla de ventas -->
            <div class="col-md-4">
                <div class="alert alert-info" style="padding: 20px;">
                    <h2 class="text-center">Detalles</h2><br>
                    <h5><strong>Cliente: </strong> <span class="right"><?php echo $key['nombreCliente'] . ' ' . $key['apellidoCliente'] ?></span></h5>
                    <?php echo ' <h5 class=""><strong>Total:</strong>' . '<span class="right"> S/.' . $total . '</span></h5> '; ?>
                </div>
                <form  method="post">
                    <?php if (!empty($total)): ?>
                   <center> <?php require 'btn.php';?></center>
                    <?php endif?>
                    <?php $idFact = VentasController::getFecturaController();?>
                    <?php foreach ($idFact as $key): ?>
                    <input class="form-control text-md-center ventas" type="hidden" id="numFac" name="numFac" value="<?php echo $key['total'] + 1; ?>" readonly/>
                    <?php endforeach?>
                </form>
            </div>
        </div>
        <?php endif ?>
        <br>
        
        <?php endif?>

<!--Fin Formulario del precio Ventas -->
<?php if ($_GET['action'] == 'factura' or $_GET['action'] == 'okBorradoFactura'): ?>
<?php if ($_GET['action'] == 'okBorradoFactura') {
    echo ' <div id="oks" class="alert alert-warning alert-dismissible fade show" role="alert">
<button aria-label="Close" class="close" data-dismiss="alert" type="button">
<span aria-hidden="true">
×
</span>
</button>
<strong>
Enorabuena!
</strong>
La Factura fue borrada correctamente.
</div>';

}
?>
<table class="table table-bordered table-sm" id="tablas">
    <thead class="bg-primary text-white">
    <tr>
    <td>
        Nro Fac.
    </td>
    <td>
        Fecha
    </td>
    <td>
        Cliente
    </td>
    <td>
        Total
    </td>
    <td>
        Acción
    </td>
    </tr>
    </thead>
<?php $fac = VentasController::getVentasController()?>
<?php foreach ($fac as $key): ?>
      <tr>
      <td align="center">
      <?php echo $key['numFac'] ?>
      </td>
      <td align="center">
      <?php echo date('d-m-Y', strtotime($key['fechaVenta'])) ?>
      </td>
      <td align="center">
      <?php echo $key['nombreCliente'] . ' ' . $key['apellidoCliente'] ?>
      </td>
      <td align="center">
      <?php echo $key['totalVenta'] ?>
      </td>
      <td align="center">
      <a href=" #" onclick="abrirVentana('tcpdf/pdf/factura.php?numFac= <?php echo $key['numFac'] ?> ')" class="btn btn-outline-info btn-sm">
          <i class="fa fa-download">
          </i>
      </a>
      <a href="index.php?action=factura&deleteFactura= <?php echo $key['numFac'] ?> " class="btn btn-outline-danger btn-sm">
          <i class="fa fa-trash">
          </i>
      </a>
      </td>
      <?php endforeach?>
      </tr>
      </table>
<?php endif;?>
<?php endif?>
<!-- comienza los Reportes -->
<?php if ($_GET['action'] == 'reportes'): ?>
<!-- <h3 class="alert alert-info">Ventas Diarias</h3> -->
    <div class="row">
        <div class="col-md-6 mx-md-auto">

           <span class="text-danger">Elegir una Fecha:</span>
           <form method="post">
            <input type="text" name="fecha" class="form-control" id="datepicker">
            <div class="clearfix"><br> </div>

            <center><input type="submit" name="ventaDiarias" class="btn btn-outline-primary" value="Consultar"></center>
            <div class="clearfix"><br> </div>
           </form>
        </div>
        <div class="col-md-9 top">
         <h4 class="alert alert-warning">Ventas Diarias</h4>

<?php $ventaDiarias = VentasController::ventasDiariasController()?>
<table class="table table-striped table-sm" id='tablas'>
    <thead class="bg-primary text-white">
        <tr>
            <td>Nombre y Apellido</td>
            <td>Nombre del Producto</td>
            <td>Nro y tipo de Factura</td>
            <td>Monto total</td>
        </tr>
    </thead>
        <?php if (isset($_POST['ventaDiarias'])): ?>
        <?php foreach ($ventaDiarias as $key): ?>
            <?php $total = $total + $key['totalVenta']?>
    <tr>
        <td align="center"> <?php echo $key['nombreCliente'] . ' ' . $key['apellidoCliente'] ?></td>
        <td align="center"><?php echo $key['nombreProducto'] ?></td>
        <td align="center"><?php echo 'Nro: ' . $key['numFac'] . ' ' . 'Tipo:' . $key['tipoFactura'] ?></td>
        <td align="center"><?php echo '$' . $key['totalVenta'] ?></td>
    </tr>
        <?php endforeach?>
       <?php endif?>
</table>
        </div>
          <div class="col-md-3">
            <div class="alert alert-info" role="alert">
               <h5>  <strong> Ventas Total del dia <?php echo date("d-m-Y", strtotime($key['fechaVenta'])); ?>: <span class="text-gray-dark"> <i class="fa fa-usd"></i> <?php echo $total; ?></span></strong></h5>
            </div>
          </div>
        <?php endif?>
    </div>
<br><br><br>
</div>
    <!-- Final de los reporte -->
<!-- script para pasar los datos de los productos al formulario de vanta. -->
<script>
 $.datepicker.regional['es'] = {
 closeText: 'Cerrar',
 prevText: '< Ant',
 nextText: 'Sig >',
 currentText: 'Hoy',
 monthNames: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
 monthNamesShort: ['Ene','Feb','Mar','Abr', 'May','Jun','Jul','Ago','Sep', 'Oct','Nov','Dic'],
 dayNames: ['Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado'],
 dayNamesShort: ['Dom','Lun','Mar','Mié','Juv','Vie','Sáb'],
 dayNamesMin: ['Do','Lu','Ma','Mi','Ju','Vi','Sá'],
 weekHeader: 'Sm',
 dateFormat: 'yy/m/d',
 firstDay: 1,
 isRTL: false,
 showMonthAfterYear: false,
 yearSuffix: ''
 };
 $.datepicker.setDefaults($.datepicker.regional['es']);
  $( function() {
    $( "#datepicker" ).datepicker();
  } );
  </script>
<script>
     $(function() {
     $("#post").attr('disabled', 'disabled');
     $("#aceptar").attr('disabled', 'disabled');
     $("#cantidad").attr('disabled', 'disabled');
     $("#producto").attr('disabled', 'disabled');
     // Habilita eleccion de producto
     $("#clientes").chosen().change(function(){
        $("#producto").removeAttr('disabled', 'disabled');
        var e = $(this).val();
        console.log(e);
     });
     if( !$('#clientes').val() == ''){
        $("#producto").removeAttr('disabled', 'disabled');
     }

     var items = <?=json_encode($array);?>;
     $('#producto').autocomplete({
         source: items,
         select: function(event, item) {
             var params = {
                 producto: item.item.value
             };
             $.get('views/productosAjax.php', params, function(respuesta) {
                 var json = JSON.parse(respuesta);
                 if (json.status == 200) {
                     var pro = $('#producto').val();
                     var cli = $('#clientes').val();
                     console.log(pro + ' ' + cli + ' ' + cant);
                     // Habilita cantidad de producto
                     if(!pro == '' && !cli == ''){
                        $("#cantidad").removeAttr('disabled', 'disabled');
                     }

                     $('#cantidad').change(function() {
                        var cant = $('#cantidad').val();
                        if(!pro == '' && !cli == '' && !cant == ''){
                            $("#aceptar").removeAttr('disabled', 'disabled');
                            $("#aceptar").removeClass('btn-outline-primary');
                            $("#aceptar").addClass('btn-primary');
                        }
                        // asignamos el valor de cantidad
                         
                         $("#aceptar").click(function() {
                             var cantidad = $('#cantidad').val();
                             $('#cant').val(cantidad);
                             // calculo matemático del precio * cantidad
                             var disabledTextInput = json.precioVenta * cantidad;
                             console.log(disabledTextInput);
                             $('#disabledTextInput').val(disabledTextInput.toFixed(2));
                             // sacamos el total
                             var total = json.precioVenta * cantidad;
                             $('#precioVenta').val(json.precioVenta);
                             $('#idProducto').val(json.idProducto);
                             $('#nombreProducto').val(json.nombre);
                             
                             var a = $('#clientes').val();
                             $('#idCliente').val(a);
                             console.log(a);
                              var tipoFac = $('#Factura').val();
                             $('#tipoFactura').val(tipoFac);
                             if (!a == '') {
                               $("#post").removeAttr('disabled', 'disabled');
                               $("#post").removeClass('btn-outline-danger');
                               $("#post").addClass('btn-danger');
                             }
                             console.log(json);
                         });

                         $("#post").click(function() {
                            var a = $('#clientes').val();
                            $("#clientes").val(a).trigger("change");
                         });

                     });
                 }
             });
             // fin del ajax
         }
     });
 });
 $('#enviar').click(function() {
      window.open('tcpdf/pdf/index.php',  "nuevo", "directories=no, location=no, menubar=no, scrollbars=yes, statusbar=no, tittlebar=no, width=900, height=800,left=220");

 });

function abrirVentana(url) {
    window.open(url, "Factura", "directories=no, location=no, menubar=no, scrollbars=yes, statusbar=no, tittlebar=no, width=900, height=800 ,left=220");
}
</script>
<?php $agr = new VentasController();
$agr->
    agregarVentaController();
$agr->
    borrarVentasController();
$agr->
    registrarVentasDetallesControllers();
$agr->
    borrarFacturaController();
$agr->
    cancelarVentaController();
?>

