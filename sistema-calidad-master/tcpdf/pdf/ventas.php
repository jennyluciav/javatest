<?php
ob_clean();
require_once "../../controllers/ventas/VentasController.php";
require_once "../../models/ventas/VentasModel.php";
require_once '../../models/conexion.php';

class ImprimirVentas
{

    public function imprimirDetalles()
    {

/**
 * Creates an example PDF TEST document using TCPDF
 * @package com.tecnick.tcpdf
 * @abstract TCPDF - Example: Default Header and Footer
 * @author Nicola Asuni
 * @since 2008-03-04
 */

// Include the main TCPDF library (search for installation path).
        require_once 'tcpdf_include.php';

// create new PDF document
        $pdf = new TCPDF(PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false);

// set document information
        $pdf->SetCreator(PDF_CREATOR);
        $sql = Conexion::conectar()->prepare("SELECT numFac  FROM detalles ORDER BY numFac DESC LIMIT 1");
        $sql->execute();
        $result = $sql->fetchAll();
        foreach ($result as $resultado) {
            $a = $resultado['numFac'];
        }
        $respuesta = VentasController::imprimirVentasController($a);
        foreach ($respuesta as $key) {
            $numFac = $key['numFac'];
        }
        $sql = Conexion::conectar()->prepare("SELECT numFac FROM detalles WHERE numFac = $numFac");
        $sql->execute();
        $result = $sql->fetchAll();
        foreach ($result as $value) {

// set default header data
            $pdf->SetHeaderData(PDF_HEADER_LOGO, PDF_HEADER_LOGO_WIDTH, PDF_HEADER_TITLE . '  ' . $value['numFac'], PDF_HEADER_STRING, array(5, 64, 255), array(9, 64, 128));
        }
        $pdf->setFooterData(array(0, 64, 0), array(0, 64, 128));

// set header and footer fonts
        $pdf->setHeaderFont(array(PDF_FONT_NAME_MAIN, '', PDF_FONT_SIZE_MAIN));
        $pdf->setFooterFont(array(PDF_FONT_NAME_DATA, '', PDF_FONT_SIZE_DATA));

// set default monospaced font
        $pdf->SetDefaultMonospacedFont(PDF_FONT_MONOSPACED);

// set margins
        $pdf->SetMargins(PDF_MARGIN_LEFT, PDF_MARGIN_TOP, PDF_MARGIN_RIGHT);
        $pdf->SetHeaderMargin(PDF_MARGIN_HEADER);
        $pdf->SetFooterMargin(PDF_MARGIN_FOOTER);

// set auto page breaks
        $pdf->SetAutoPageBreak(true, PDF_MARGIN_BOTTOM);

// set image scale factor
        $pdf->setImageScale(PDF_IMAGE_SCALE_RATIO);

// set some language-dependent strings (optional)
        if (@file_exists(dirname(__FILE__) . '/lang/spa.php')) {
            require_once dirname(__FILE__) . '/lang/spa.php';
            $pdf->setLanguageArray($l);
        }

// ---------------------------------------------------------

// set default font subsetting mode
        $pdf->setFontSubsetting(true);

// Set font
        // dejavusans is a UTF-8 Unicode font, if you only need to
        // print standard ASCII chars, you can use core fonts like
        // helvetica or times to reduce file size.
        $pdf->SetFont('', '', 12, '', true);

// Add a page
        // This method has several options, check the source code documentation for more information.
        $pdf->AddPage();

// set text shadow effect
        $pdf->setTextShadow(array('enabled' => true, 'depth_w' => 0.2, 'depth_h' => 0.2, 'color' => array(196, 196, 196), 'opacity' => 1, 'blend_mode' => 'Normal'));

// Set some content to print
        $html = <<<EOD
        <div  style="border: 1px solid #c9c9c9">
       <table>
        <tr>
          <td style="width:540px">Cliente: $key[nombreCliente]   $key[apellidoCliente]</td>
        </tr>
         <!--<tr>
          <td style="width:540px">Tipo Factura : $key[tipoFactura]</td>
        </tr>-->

<tr>
            <td width="200px"></td>

            <td width="200px"></td>
        </tr>
        </table>
</div>
       <table>
         <tr>
         <td></td>
         </tr>
        </table>

   <table style="border: 1px solid #4AA0F1; text-align:center; line-height: 20px; font-size:23px">
        <tr>
            <td style="border: 1px solid #666;">Producto</td>
            <td style="border: 1px solid #666;">Cantidad</td>
            <td style="border: 1px solid #666;">Precio</td>
            <td style="border: 1px solid #666;">TOTAL</td>
        </tr>
    </table>
EOD;
        $numFac = $key['numFac'];
        $pdf->writeHTMLCell(0, 0, '', '', $html, 0, 1, 0, true, '', true);
        // $respuesta = Admin::imprimirController("administrador");
        // $respuesta = VentasController::imprimirVentasController($numFac);

        // foreach ($respuesta as $item) {
        // }
        $sql = Conexion::conectar()->prepare("SELECT * FROM detalles de JOIN productos pro ON de.idProducto=pro.idProducto WHERE numFac = $numFac");
        $sql->execute();
        $result = $sql->fetchAll();
        foreach ($result as $item) {
            $total = $total + $item[totalVenta];
            $html2 = <<<EOF



            <table style="border: 1px solid #333; text-align:center; line-height: 20px; font-size:18px">
                <tr>
                    <td style="border: 1px solid #666;">$item[nombreProducto]</td>
                    <td style="border: 1px solid #666;">$item[cantidad]</td>
                    <td style="border: 1px solid #666;">$item[precioVenta]</td>
                    <td style="border: 1px solid #666;">$item[totalVenta]</td>
                </tr>
            </table>

EOF;

// Print text using writeHTMLCell()
            $pdf->writeHTMLCell(0, 0, '', '', $html2, 0, 1, 0, true, '', true);
            // $pdf->writeHTML($html2, true, true, true, true, '');
        }
// ---------------------------------------------------------
        $total = number_format($total, 2, ',', ' ');
        $html3 = <<<EOD
<div  style="border: 1px solid #c9c9c9;padding:10px">


         <tr>
         <td></td>
         </tr>
        </table>



 <table style="text-align:center; font-size:20px;">
                 <tr>
                  <td></td>
                 <td>TOTAL :</td>
                    <td>S/. $total</td>
                </tr>
              </table>

</div>
      
EOD;

        $pdf->writeHTMLCell(0, 0, '', '', $html3, 0, 1, 0, true, '', true);

// Close and output PDF document
        // This method has several options, check the source code documentation for more information.
        Ob_end_clean();
        $pdf->Output('Factura Nro: ' . ' ' . $key['numFac'] . ' ' . $key['nombreCliente'] . '.pdf', 'I');
//============================================================+
        // END OF FILE
        //============================================================+

    }

}

$a = new ImprimirVentas();
$a->imprimirDetalles();
