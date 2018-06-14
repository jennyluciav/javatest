<?php
date_default_timezone_set('America/Lima');

// controlladores
require_once "controllers/enlaces/enlacesController.php";
require_once "controllers/ingreso/ingresoController.php";
require_once "controllers/admin/adminController.php";
require_once "controllers/membresias/membresiasController.php";
require_once "controllers/matriculas/matriculasController.php";
require_once "controllers/ventas/VentasController.php";
require_once "controllers/clientes/clientesController.php";
require_once "controllers/productos/productosController.php";

// modelos
require_once "models/enlaces/enlacesModel.php";
require_once "models/ingreso/ingresoModel.php";
require_once "models/admin/adminModel.php";
require_once "models/membresias/membresiasModel.php";
require_once "models/matriculas/matriculasModel.php";
require_once "models/ventas/ventasModel.php";
require_once "models/clientes/clientesModel.php";
require_once "models/productos/productosModel.php";

$mvc = new MvcController();
$mvc->plantilla();
