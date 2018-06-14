<?php

require_once '../controllers/admin/adminController.php';
require_once '../controllers/membresias/membresiasController.php';
require_once '../controllers/matriculas/matriculasController.php';
require_once '../controllers/ventas/ventasController.php';
require_once '../controllers/clientes/clientesController.php';
require_once '../controllers/productos/productosController.php';

require_once '../models/admin/adminModel.php';
require_once '../models/membresias/membresiasModel.php';
require_once '../models/matriculas/matriculasModel.php';
require_once '../models/ventas/ventasModel.php';
require_once '../models/clientes/clientesModel.php';
require_once '../models/productos/productosModel.php';


require_once '../models/conexion.php';

class Ajax
{

    public $validarUsuario;
    public $validarMembresia;
    public $validarProveedor;
    public $validarMatricula;
    public $validarCliente;
    public $validarProducto;

    public function validarUsuarioAjax()
    {
        $datos = $this->validarUsuario;

        $respuesta = Admin::validarUsuarioController($datos);
        echo $respuesta;
    }

    public function validarMembresiaAjax()
    {
        $datos = $this->validarMembresia;

        $respuesta = membresiasController::validarMembresiaController($datos);
        echo $respuesta;
    }
    public function validarMatriculaAjax()
    {
        $datos = $this->validarMatricula;

        $respuesta = MatriculasController::validarMatriculaController($datos);
        echo $respuesta;
    }

    public function validarExistenciaAjax()
    {
        $datos = $this->validarExistencia;

        $respuesta = MatriculasController::validarMatriculaController($datos);
        echo $respuesta;
    }

    public function validarClienteAjax()
    {
        $datos = $this->validarCliente;

        $respuesta = ClientesController::validarClienteController($datos);
        echo $respuesta;
    }

    public function validarProductoAjax()
    {
        $datos = $this->validarProducto;

        $respuesta = ProductosController::validarProductoController($datos);
        echo $respuesta;
    }

}

if (isset($_POST['inputvalidarUsuario'])) {
    $a = new Ajax();
    $a->validarUsuario = $_POST['inputvalidarUsuario'];
    $a->validarUsuarioAjax();
}

if (isset($_POST['inputvalidarMembresia'])) {
    $c = new Ajax();
    $c->validarMembresia = $_POST['inputvalidarMembresia'];
    $c->validarMembresiaAjax();
}

if (isset($_POST['inputvalidarProveedor'])) {
    $c = new Ajax();
    $c->validarProveedor = $_POST['inputvalidarProveedor'];
    $c->validarProveedorAjax();
}

if (isset($_POST['inputvalidarMatricula'])) {
    $c = new Ajax();
    $c->validarMatricula = $_POST['inputvalidarMatricula'];
    $c->validarMatriculaAjax();
}

if (isset($_POST['inputvalidarCliente'])) {
    $a = new Ajax();
    $a->validarCliente = $_POST['inputvalidarCliente'];
    $a->validarClienteAjax();
}

if (isset($_POST['inputvalidarProducto'])) {
    $c = new Ajax();
    $c->validarProducto = $_POST['inputvalidarProducto'];
    $c->validarProductoAjax();
}