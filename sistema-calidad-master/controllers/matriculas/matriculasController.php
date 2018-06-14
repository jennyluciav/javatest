<?php

class MatriculasController
{

    public static function getMatriculasControllers()
    {

        $respuesta = MatriculasModel::getMatriculaModel('matricula');

        return $respuesta;
    }

    public function registroMatriculasController()
    {

        if (isset($_POST['agragarpro'])) {

            $datosController = array(
                'idCliente' => $_POST['idCliente'],
                'precioProducto' => $_POST['precioProducto'],
                'idMembresia' => $_POST['idMembresia'],
                'idAdmin' => $_POST['idAdmin'],
                'fechaInicio' => date('Y-m-d ', strtotime($_POST['fechaInicio'])),
                'fechaFin' => date('Y-m-d ', strtotime($_POST['fechaFin'])),
                'fechaMatricula' => date('Y-m-d ', strtotime($_POST['fechaMatricula'])),
            );

            $respuesta = MatriculasModel::registroMatriculaModel($datosController, 'matricula');

            if ($respuesta == 'success') {
                header('location:okMatriculas');
            } else {
                header('location:membresias');

            }
        }

    }

    //
    // INVENTARIO
    //
    public function validarMatriculaController($validarMatricula)
    {
        $datosController = $validarMatricula;
        $respuesta = MatriculasModel::validarMatriculaModel($datosController, 'matricula');
        if ($respuesta) {
            echo 1;
        } else {
            echo 0;
        }
    }

    public function deleteMatriculasController()
    {
        if (isset($_GET['idProd'])) {
            $idProd = $_GET['idProd'];

            $respuesta = MatriculasModel::deleteMatriculasModel($idProd, 'matricula');

            if ($respuesta == 'success') {
                header('location:okMatrDelete');
            }

        }
    }

    public static function editarMatriculasController()
    {
        $datosController = $_GET['idMatrEdit'];

        $respuesta = MatriculasModel::editarMatriculasModel($datosController, 'matricula');
        return $respuesta;

    }

    public function actualizarMatriculasController()
    {

        if (isset($_POST['editarProd'])) {
            $datosController = array(
                'fechaInicio' => date('Y-m-d ', strtotime($_POST['fechaInicio'])),
                'fechaFin' => date('Y-m-d ', strtotime($_POST['fechaFin'])),
                'idCliente' => $_POST['idCliente'],
                'idAdmin' => $_POST['idAdmin'],
                'precioMatricula' => $_POST['precioMatricula'],
                'idMembresia' => $_POST['idMembresia'],
                'idMatricula' => $_POST['idMatricula'],
            );

            $respuesta = MatriculasModel::actualizarMatriculasModel($datosController, 'matricula');

            if ($respuesta == 'success') {

                header('location:editadoMatr');
            }
        }
    }

}
