<?php

class ClientesController
{

    public static function getClientesController()
    {
        $respuesta = ClientesModel::getClientesModel('clientes');
        return $respuesta;
    }

    public function getClientesSelectController()
    {
        $respuesta = ClientesModel::getClientesModel('clientes');

        foreach ($respuesta as $key) {
            echo '
            <option value="' . $key['idCliente'] . '">' . ucwords($key['nombreCliente']) . '  /  ' . ucwords($key['dni']) . ' </option>
          ';
        }
    }
    
    public function validarClienteController($validarCliente)
    {
        $datosController = $validarCliente;
        $respuesta = ClientesModel::validarClienteModel($datosController, 'clientes');

        if ($respuesta) {
            echo 1;
        } else {
            echo 0;
        }
    }
    public static function getClientesControllerNoActivo()
    {
        $respuesta = ClientesModel::getClientesModelNoActivo('clientes');
        return $respuesta;
    }

    public static function getClientesControllerId()
    {
        $datosController = $_GET['idCliente'];
        $respuesta = ClientesModel::getClientesModelId($datosController, 'clientes');
        return $respuesta;
    }

    public function registrarClientesController()
    {
        if (isset($_POST['agragarclientes'])) {
            $datosController = array(
                'nombreCliente' => $_POST['nombreCliente'],
                'apellidoCliente' => $_POST['apellidoCliente'],
                'telefono' => $_POST['telefono'],
                'sexo' => $_POST['sexo'],
                'fechaNacimiento' => date('Y-m-d ', strtotime($_POST['fechaNacimiento'])),
                'edad' => $_POST['edad'],
                'direccion' => $_POST['direccion'],
                'dni' => $_POST['dni'],
            );
            $respuesta = ClientesModel::registrarClientesModel($datosController, 'clientes');
            if ($respuesta == 'success') {
                header('location:okClientes');
            }
        }
    }

    public static function editClientesController()
    {
        $datosController = $_GET['idCliente'];

        $respuesta = ClientesModel::editClientesModel($datosController, 'clientes');

        return $respuesta;
    }

    public function actualizarClientesController()
    {
        if (isset($_POST['editarClientes'])) {
            $datosController = array('nombreCliente' => $_POST['nombreCliente'],
                'nombreCliente' => $_POST['nombreCliente'],
                'apellidoCliente' => $_POST['apellidoCliente'],
                'telefono' => $_POST['telefono'],
                'sexo' => $_POST['sexo'],
                'fechaNacimiento' => date('Y-m-d ', strtotime($_POST['fechaNacimiento'])),
                'edad' => $_POST['edad'],
                'direccion' => $_POST['direccion'],
                'dni' => $_POST['dni'],
                'idCliente' => $_POST['idCliente'],
            );
            $respuesta = ClientesModel::actualizarClientesModel($datosController, 'clientes');
            if ($respuesta == 'success') {
                header('location:okClientesEdit');
            }
        }
    }

    public static function bajaClientesController()
    {
        if (isset($_GET['id'])) {

            $datosController = $_GET['id'];

            $respuesta = ClientesModel::bajaClientesModel($datosController, 'clientes');
            if ($respuesta == 'success') {
                header('location:baja');

            }
        }
    }

    public static function altaClientesController()
    {
        if (isset($_GET['idAlta'])) {

            $datosController = $_GET['idAlta'];

            $respuesta = ClientesModel::altaClientesModel($datosController, 'clientes');
            if ($respuesta == 'success') {
                header('location:alta');

            }
        }
    }

}
