<?php

require_once '../models/conexion.php';

// $clientenuevo = $_GET['clientenuevo'];

// $sql = Conexion::conectar()->prepare("SELECT * FROM matricula WHERE idCliente = '$clientenuevo' LIMIT 1");
// if ($sql->execute()) {

//     $matr = $sql->fetch(PDO::FETCH_OBJ);
//     $matr->status = 200;
//     $matr->clientenuevo = $clientenuevo;
//     echo json_encode($matr);
// }

$nombreProducto = $_GET['producto'];

$sql = Conexion::conectar()->prepare("SELECT * FROM inventario WHERE idProducto = '$nombreProducto' LIMIT 1");
if ($sql->execute()) {

    $prod = $sql->fetch(PDO::FETCH_OBJ);
    $prod->status = 200;
    $prod->nombre = $nombreProducto;
    echo json_encode($prod);
}
