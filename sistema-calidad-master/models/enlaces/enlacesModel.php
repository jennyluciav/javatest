<?php

class EnlacesPaginas
{

    public static function enlacesPaginasModel($get)
    {
        //
        // Páginas de los módulos
        //

        if ($get == "inicio" or $get == 'inicioUs') {

            $module = "views/modules/" . $get . ".php";

        } else if ($get == 'ini') {

            $module = "views/modules/inicio.php";

        } else if ($get == 'repetida') {

            $module = "views/repetida.php";

        }
        //
        // Fin de las Páginas
        // --------------------------------------------------------
        //

        //  //
        //  Páginas DE proveedores
        // --------------------------------------------------------

        else if ($get == "proveedores" or $get == 'okProv' or $get == 'okProvEdit') {

            $module = "views/modules/proveedores/proveedores.php";

        } else if ($get == "agragarproveedores" or $get == 'editarProv' or $get == 'Deletproveedores') {

            $module = "views/modules/proveedores/proveedores.php";

        }

        //
        //  FIN DE proveedores
        // --------------------------------------------------------
        //

        //  //
        //  Páginas DE Clientes
        // --------------------------------------------------------

        else if ($get == "clientes" or $get == 'okClientes' or $get == 'agragarclientes' or $get == 'editClientes' or $get == 'okClientesEdit' or $get == 'baja' or $get == 'alta') {

            $module = "views/modules/clientes/clientes.php";

        } else if ($get == "verClientes") {

            $module = "views/modules/clientes/verClientes.php";

        }

        //
        //  FIN DE clientes
        // --------------------------------------------------------
        //
        //  //
        //  Páginas DE ventas
        // --------------------------------------------------------

        else if ($get == "ventas" || $get == 'detalles' || $get == 'okVentas' || $get == 'borrarVenta' || $get == "enviarPrueba" || $get == 'factura' || $get == 'reportes') {

            $module = "views/modules/ventas/ventas.php";

        } else if ($get == "agragarventas" or $get == 'okBorradoVentas' or $get == 'okBorradoFactura' ) {

            $module = "views/modules/ventas/ventas.php";

        }

        //
        //  FIN DE ventas
        // --------------------------------------------------------
        //

        //  //
        //  Páginas DE Matriculas
        // --------------------------------------------------------

        else if ($get == "matriculas" or $get == 'okMatrDelete' or $get == 'editadoMatr') {

            $module = "views/modules/matriculas/matriculas.php";

        } else if ($get == "editarMatr") {

            $module = "views/modules/matriculas/editarMatr.php";

        } else if ($get == "agragarmatriculas") {

            $module = "views/modules/matriculas/matriculas.php";

        } else if ($get == "okMatriculas" or $get == "editadoMatr") {

            $module = "views/modules/matriculas/matriculas.php";

        }

        //
        //  FIN DE Matriculas
        // --------------------------------------------------------
        //
        //  Páginas DE MEMBRESIAS
        // --------------------------------------------------------

        else if ($get == "membresias") {

            $module = "views/modules/membresias/membresias.php";

        } else if ($get == "agragarMembresias") {

            $module = "views/modules/membresias/membresias.php";

        } else if ($get == "okMembresias" or $get == "editadoMem") {

            $module = "views/modules/membresias/membresias.php";

        } else if ($get == "DeletMembresias") {

            $module = "views/modules/membresias/membresias.php";

        } else if ($get == "editarMem") {

            $module = "views/modules/membresias/editarMem.php";

        }
        //
        // FIN DE LAS MEMBRESIAS
        //
        
        //
        //  Páginas DE Productos
        // --------------------------------------------------------

        else if ($get == "productos" or $get == 'okProdDelete' or $get == 'editadoProd') {

            $module = "views/modules/productos/productos.php";

        } else if ($get == "editarProd") {

            $module = "views/modules/productos/editarProd.php";

        } else if ($get == "agragarproductos") {

            $module = "views/modules/productos/productos.php";

        } else if ($get == "okInventarios") {

            $module = "views/modules/productos/productos.php";

        } else if ($get == "okProductos" or $get == "editadoPro" or $get == 'inventario') {

            $module = "views/modules/productos/productos.php";

        }

        //
        //  FIN DE Productos
        // --------------------------------------------------------
        //
        // Página del login
        //
        else if ($get == "index") {

            $module = "views/modules/ingreso/ingreso.php";

        } else if ($get == "sesion") {

            $module = "views/modules/ingreso/sesion.php";

        } else if ($get == "robot") {

            $module = "views/modules/ingreso/robot.php";

        }

        // -----------------------------------------------
        // Inicio de los Administradores

        else if ($get == "config") {

            $module = "views/modules/admin/config.php";

        } else if ($get == "cambio") {

            $module = "views/modules/admin/config.php";

        } else if ($get == "agregado") {

            $module = "views/modules/admin/config.php";

        } else if ($get == "delete" or $get == 'delet' or $get == 'editado') {

            $module = "views/modules/admin/config.php";

        } else if ($get == "editar") {

            $module = "views/modules/admin/editar.php";

        } else if ($get == "errorPass") {

            $module = "views/modules/modals/cambiarPass.php";

        }

        // -----------------------------------------------
        // Fin de los Administradores

        //
        // Páginas por default
        //
        else {

            $module = "views/modules/ingreso/ingreso.php";

        }

        return $module;

    }

}
