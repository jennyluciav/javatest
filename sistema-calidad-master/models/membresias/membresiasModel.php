<?php

// require_once "models/conexion.php";

class membresiasModel
{

    public static function getMembresiasModel($tabla)
    {

        $sql = Conexion::conectar()->prepare("SELECT *  FROM $tabla");
        $sql->execute();
        return $sql->fetchAll();

        $sql->close();
    }

    public static function agregarMembresiasModel($datosModel, $tabla)
    {

        $sql = Conexion::conectar()->prepare("INSERT INTO $tabla (nombreMembresia,costoMembresia,mesesMembresia)VALUES(:nombreMembresia, :costoMembresia, :mesesMembresia)");
        $sql->bindParam(':nombreMembresia', $datosModel['nombreMembresia']);
        $sql->bindParam(':costoMembresia', $datosModel['costoMembresia']);
        $sql->bindParam(':mesesMembresia', $datosModel['mesesMembresia']);

        if ($sql->execute()) {
            return 'success';
        }

        $sql->close();

    }

    public static function validarMembresiaModel($datosModel, $tabla)
    {

        $sql = Conexion::conectar()->prepare("SELECT nombreMembresia FROM $tabla WHERE nombreMembresia = :nombreMembresia");
        $sql->bindParam(':nombreMembresia', $datosModel);

        $sql->execute();

        return $sql->fetch();

        $sql->close();
    }

    public static function deleteMembresiaModel($datosModel, $tabla)
    {

        $sql = Conexion::conectar()->prepare("DELETE FROM $tabla WHERE idMembresia = :idMembresia");
        $sql->bindParam(':idMembresia', $datosModel);

        if ($sql->execute()) {
            return 'success';
        }
        $sql->close();
    }

    public static function editarMembresiaModel($datosModel, $tabla)
    {
        $sql = Conexion::conectar()->prepare("SELECT * FROM $tabla WHERE idMembresia = :idMembresia");
        $sql->bindParam(":idMembresia", $datosModel);
        $sql->execute();

        return $sql->fetchAll();
        $sql->close();
    }

    public static function actualizarMembresiaModel($datosModel, $tabla)
    {

        $sql = Conexion::conectar()->prepare("UPDATE $tabla SET nombreMembresia = :nombreMembresia, costoMembresia = :costoMembresia, mesesMembresia = :mesesMembresia WHERE idMembresia = :idMembresia");
        $sql->bindParam(':nombreMembresia', $datosModel['nombreMembresia']);
        $sql->bindParam(':costoMembresia', $datosModel['costoMembresia']);
        $sql->bindParam(':mesesMembresia', $datosModel['mesesMembresia']);
        $sql->bindParam(':idMembresia', $datosModel['idMembresia']);

        if ($sql->execute()) {
            return 'success';
        } else {
            return "Error";
        }
        $sql->close();
    }

}
