<?php

class membresiasController
{

    public function getMembresiasController()
    {

        $respuesta = membresiasModel::getMembresiasModel('membresias');
        foreach ($respuesta as $key) {
            echo '<tr>
             <td>' . $key['idMembresia'] . '</td>
             <td>' . $key['nombreMembresia'] . '</td>
             <td>' . $key['costoMembresia'] . '</td>
             <td>' . $key['mesesMembresia'] . ' meses</td>
             <td align="center"><a href="index.php?action=editarMem&idEditar=' . $key['idMembresia'] . '"><i class="fa fa-edit btn btn-outline-primary btn-sm"></i></a> <a href="index.php?action=membresias&id=' . $key['idMembresia'] . '"><i class="fa fa-trash  btn btn-outline-danger btn-sm"></i></a></td>
             </tr>';
        }
    }

    public function getMembresiasSelectController()
    {
        $respuesta = membresiasModel::getMembresiasModel('membresias');
        return $respuesta;
    }

    public function agregarMembresiasController()
    {
        if (isset($_POST['agragarMembresias'])) {
            $datosController = array('nombreMembresia' => $_POST['nombreMembresia'],
                'costoMembresia' => $_POST['costoMembresia'],
                'mesesMembresia' => $_POST['mesesMembresia']);

            $respuesta = membresiasModel::agregarMembresiasModel($datosController, 'membresias');

            if ($respuesta == 'success') {
                header('location:okMembresias');
            }
        }
    }

    public function validarMembresiaController($validarMembresia)
    {
        $datosController = $validarMembresia;
        $respuesta = membresiasModel::validarMembresiaModel($datosController, 'membresias');

        if ($respuesta) {
            echo 1;
        } else {
            echo 0;
        }
    }

    public function deleteMembresiaController()
    {

        if (isset($_GET['id'])) {
            $datosController = $_GET['id'];

            $respuesta = membresiasModel::deleteMembresiaModel($datosController, 'membresias');

            if ($respuesta == 'success') {

                header('location:DeletMembresias');
            }
        }
    }

    public static function editarMembresiaController()
    {
        $datosController = $_GET['idEditar'];

        $respuesta = membresiasModel::editarMembresiaModel($datosController, 'membresias');
        return $respuesta;

    }

    public function actualizarMembresiaController()
    {

        if (isset($_POST['editarMem'])) {
            $datosController = array('nombreMembresia' => $_POST['nombreMembresia'],
                'costoMembresia' => $_POST['costoMembresia'],
                'mesesMembresia' => $_POST['mesesMembresia'],
                'idMembresia' => $_POST['idMembresia'],
            );

            $respuesta = membresiasModel::actualizarMembresiaModel($datosController, 'membresias');

            if ($respuesta == 'success') {

                header('location:editadoMem');
            }
        }
    }

}
