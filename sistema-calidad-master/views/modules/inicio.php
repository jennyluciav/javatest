<?php session_start();
if (!$_SESSION["nombreAdmin"]) 
    {
        header("location:ingreso");exit();
    } else if ($_SESSION['rol'] !== 'A') 
    {
        header('location:inicioUs');exit();
    }
?>
<body class="body">
    <div class="container">
        <h1 class="jumbotron-heading" style="padding-top: 50px">Hola <?php echo strtoupper($_SESSION['nombreAdmin']); ?></h1>
        <p class="lead text-muted">Aquí podras gestionar el sistema de tu gimnasio.</p>
        <!-- <div class="card bg-primary text-white">
            <div class="card-block">
                Esta sección es exclusiva para  el Administrador del sistema.
            </div>
        </div>
        <br/> -->
        <div class="row" style="padding-top: 30px">
            <div class="col-md-6">
                <div class="card card-inverse" style="background-color: #333; border-color: #333;">
                    <div class="card-block">
                        <h3 class="card-title">Clientes</h3>
                        <p class="card-text">Aquí podras gestionar los clientes como edicion de informacion y busqueda del mismo.</p>
                        <a href="clientes" class="btn btn-primary">Ir a Clientes</a>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="card card-inverse" style="background-color: #333; border-color: #333;">
                    <div class="card-block">
                        <h3 class="card-title">Matriculas</h3>
                        <p class="card-text">Aquí podras gestionar la matricula del cliente a una membresia.</p>
                        <a href="matriculas" class="btn btn-primary">Ir a Matriculas</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="row" style="padding-top: 30px">
            <div class="col-md-6">
                <div class="card card-inverse" style="background-color: #333; border-color: #333;">
                    <div class="card-block">
                        <h3 class="card-title">Membresias</h3>
                        <p class="card-text">Aquí podras gestionar los tipos de membresias y los costos de cada uno.</p>
                        <a href="membresias" class="btn btn-primary">Ir a Membresias</a>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="card card-inverse" style="background-color: #333; border-color: #333;">
                    <div class="card-block">
                        <h3 class="card-title">Productos</h3>
                        <p class="card-text">Aquí podras gestionar los productos y el stock de estas.</p>
                        <a href="membresias" class="btn btn-primary">Ir a Productos</a>
                    </div>
                </div>
            </div>
        </div> 
        <div class="row" style="padding-top: 30px">
            <div class="col-md-6">
                <div class="card card-inverse" style="background-color: #333; border-color: #333;">
                    <div class="card-block">
                        <h3 class="card-title">Ventas</h3>
                        <p class="card-text">Aquí podras generar tickets por compra de productos y matricula</p>
                        <a href="membresias" class="btn btn-primary">Ir a Ventas</a>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="card card-inverse" style="background-color: #333; border-color: #333;">
                    <div class="card-block">
                        <h3 class="card-title">Caja</h3>
                        <p class="card-text">Aquí podras efectuar el pago de los productos comprados por los clientes y matriculas</p>
                        <a href="membresias" class="btn btn-primary">Ir a Caja</a>
                    </div>
                </div>
            </div>
        </div> 
        <p>
            <?php echo md5('admin'); ?>
        </p> 
        
    </div>
    <?php $admin = new Admin();
$admin->
    fecha();
?>
</br>
</div>
</body>
