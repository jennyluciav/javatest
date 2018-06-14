<?php

// require_once 'models/conexion.php';
class ClientesModel
{

    public static function getClientesModel($tabla)
    {
        $sql = Conexion::conectar()->prepare("SELECT * FROM $tabla WHERE  estado=1");

        $sql->execute();
        return $sql->fetchAll();
        $sql->close();
    }
    public static function getClientesModelNoActivo($tabla)
    {
        $sql = Conexion::conectar()->prepare("SELECT * FROM $tabla ta
        WHERE  estado=0");

        $sql->execute();
        return $sql->fetchAll();
        $sql->close();
    }

    public static function validarClienteModel($datosModel, $tabla)
    {

        $sql = Conexion::conectar()->prepare("SELECT dni FROM $tabla WHERE dni = :dni");
        $sql->bindParam(':dni', $datosModel);

        $sql->execute();

        return $sql->fetch();

        $sql->close();
    }
    public static function getClientesModelId($datosModel, $tabla)
    {
        $sql = Conexion::conectar()->prepare("SELECT * FROM $tabla
         WHERE idCliente= $datosModel");

        $sql->execute();
        return $sql->fetchAll();
        $sql->close();
    }

    public static function registrarClientesModel($datosModel, $tabla)
    {
        $sql = Conexion::conectar()->prepare("INSERT INTO $tabla (nombreCliente,apellidoCliente,telefono,sexo,fechaNacimiento,edad,direccion,dni)
            VALUES(:nombreCliente,:apellidoCliente,:telefono,:sexo,:fechaNacimiento,:edad,:direccion,:dni)");
        $sql->bindParam(":nombreCliente", $datosModel['nombreCliente']);
        $sql->bindParam(":apellidoCliente", $datosModel['apellidoCliente']);
        $sql->bindParam(":telefono", $datosModel['telefono']);
        $sql->bindParam(":sexo", $datosModel['sexo']);
        $sql->bindParam(":fechaNacimiento", $datosModel['fechaNacimiento']);
        $sql->bindParam(":edad", $datosModel['edad']);
        $sql->bindParam(":direccion", $datosModel['direccion']);
        $sql->bindParam(":dni", $datosModel['dni']);

        if ($sql->execute()) {
            return 'success';
        }

        $sql->close();
    }

    public static function editClientesModel($datosModel, $tabla)
    {
        $sql = Conexion::conectar()->prepare("SELECT * FROM $tabla ta
         WHERE idCliente = :idCliente");

        $sql->bindParam(':idCliente', $datosModel);

        $sql->execute();
        return $sql->fetchAll();
        $sql->close();

    }

    public static function actualizarClientesModel($datosModel, $tabla)
    {
        $sql = Conexion::conectar()->prepare("UPDATE  $tabla SET nombreCliente= :nombreCliente,apellidoCliente=:apellidoCliente,telefono=:telefono,sexo=:sexo,fechaNacimiento=:fechaNacimiento,direccion=:direccion,dni=:dni,edad=:edad WHERE idCliente=:idCliente");

        $sql->bindParam(":nombreCliente", $datosModel['nombreCliente']);
        $sql->bindParam(":apellidoCliente", $datosModel['apellidoCliente']);
        $sql->bindParam(":telefono", $datosModel['telefono']);
        $sql->bindParam(":sexo", $datosModel['sexo']);
        $sql->bindParam(":fechaNacimiento", $datosModel['fechaNacimiento']);
        $sql->bindParam(":direccion", $datosModel['direccion']);
        $sql->bindParam(":dni", $datosModel['dni']);
        $sql->bindParam(":edad", $datosModel['edad']);
        $sql->bindParam(":idCliente", $datosModel['idCliente']);

        if ($sql->execute()) {
            return 'success';
        }

        $sql->close();
    }

    public static function bajaClientesModel($datosModel, $tabla)
    {
        $sql = Conexion::conectar()->prepare("UPDATE  $tabla SET estado= 0 WHERE idCliente=:idCliente");

        $sql->bindParam(":idCliente", $datosModel);

        if ($sql->execute()) {
            return 'success';
        }

        $sql->close();
    }

    public static function altaClientesModel($datosModel, $tabla)
    {
        $sql = Conexion::conectar()->prepare("UPDATE  $tabla SET estado= 1 WHERE idCliente=:idCliente");

        $sql->bindParam(":idCliente", $datosModel);

        if ($sql->execute()) {
            return 'success';
        }

        $sql->close();
    }
}
