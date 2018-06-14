<?php

// require_once 'models/conexion.php';

class MatriculasModel
{

    public static function getMatriculaModel($tabla)
    {
        $sql = Conexion::conectar()->prepare("SELECT * FROM $tabla ta JOIN administrador admin ON ta.idAdmin=admin.idAdmin
        JOIN clientes cl ON ta.idCliente=cl.idCliente
        JOIN membresias cat ON ta.idMembresia=cat.idMembresia");

        //$sql = Conexion::conectar()->prepare("SELECT * FROM $tabla WHERE  estado=1");
        $sql->execute();

        return $sql->fetchAll();
        $sql->close();
    }

    public static function validarMatriculaModel($datosModel, $tabla)
    {

        $sql = Conexion::conectar()->prepare("SELECT idMatricula FROM $tabla WHERE idMatricula = :idMatricula");
        $sql->bindParam(':idMatricula', $datosModel);

        $sql->execute();

        return $sql->fetch();

        $sql->close();
    }

    public static function registroMatriculaModel($datosModel, $tabla)
    {

        $sql = Conexion::conectar()->prepare("INSERT INTO $tabla (idCliente,idMembresia,idAdmin,fechaInicio,fechaFin,fechaMatricula)
            VALUES(:idCliente,:idMembresia,:idAdmin,:fechaInicio,:fechaFin,:fechaMatricula)");
        $sql->bindParam(':idCliente', $datosModel['idCliente']);
        $sql->bindParam(':idMembresia', $datosModel['idMembresia']);
        $sql->bindParam(':idAdmin', $datosModel['idAdmin']);
        $sql->bindParam(':fechaInicio', $datosModel['fechaInicio']);
        $sql->bindParam(':fechaFin', $datosModel['fechaFin']);
        $sql->bindParam(':fechaMatricula', $datosModel['fechaMatricula']);

        if ($sql->execute()) {
            return 'success';
        } else {
            return 'Error';
        }
        

        $sql->close();
    }
    //////
    //  INVENTARIO.
    //////

    public static function getInventarioModel($tabla)
    {
        $sql = Conexion::conectar()->prepare("SELECT * FROM $tabla ta JOIN matricula pro ON ta.idMatricula = pro.idMatricula  ");
        $sql->execute();
        return $sql->fetchAll();
        $sql->close();
    }

    public static function agregarInventarioModel($datosModel, $tabla)
    {

        $sql = Conexion::conectar()->prepare(" UPDATE $tabla SET cantidadIngresada=:cantidadIngresada,precioVenta=:precioVenta WHERE idMatricula =:idMatricula");

        $sql->bindParam(':cantidadIngresada', $datosModel['cantidad']);
        $sql->bindParam(':precioVenta', $datosModel['precioVenta']);
        $sql->bindParam(':idMatricula', $datosModel['idMatricula']);
        if ($sql->execute()) {
            return 'success';
        } else {
            return 'Error';
        }

        $sql->close();
    }

    public function deleteMatriculasModel($datosModel, $tabla)
    {
        $sql = Conexion::conectar()->prepare("DELETE FROM $tabla WHERE idMatricula = :idMatricula");
        $sql->bindParam(':idMatricula', $datosModel);

        if ($sql->execute()) {
            return 'success';
        }

        $sql->close();
    }

    public static function editarMatriculasModel($datosModel, $tabla)
    {
        $sql = Conexion::conectar()->prepare("SELECT * FROM $tabla ta
        JOIN administrador admin ON ta.idAdmin=admin.idAdmin
        JOIN clientes cl ON ta.idCliente=cl.idCliente
        JOIN membresias cat ON ta.idMembresia=cat.idMembresia
        WHERE idMatricula = :idMatricula");
        $sql->bindParam(":idMatricula", $datosModel);
        $sql->execute();
        return $sql->fetchAll();
        $sql->close();
    }

    public static function actualizarMatriculasModel($datosModel, $tabla)
    {

        $sql = Conexion::conectar()->prepare("UPDATE $tabla SET
            fechaInicio=:fechaInicio,fechaFin=:fechaFin,
            idMembresia =:idMembresia,idAdmin=:idAdmin,idCliente=:idCliente,idMatricula=:idMatricula
            WHERE idMatricula = :idMatricula");
        $sql->bindParam(':fechaInicio', $datosModel['fechaInicio']);
        $sql->bindParam(':fechaFin', $datosModel['fechaFin']);
        $sql->bindParam(':idMembresia', $datosModel['idMembresia']);
        $sql->bindParam(':idMatricula', $datosModel['idMatricula']);
        $sql->bindParam(':idAdmin', $datosModel['idAdmin']);
        $sql->bindParam(':idCliente', $datosModel['idCliente']);

        if ($sql->execute()) {
            return 'success';
        } else {
            return "Error";
        }
        $sql->close();
    }

}
