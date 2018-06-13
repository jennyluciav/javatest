<%-- 
*Nombre Archivo : Catalogo.jsp
*Creador Archivo: carranza-PC
*Fecha Creacion : 2017-11-10 00:09:34
--%>




<%@page import="be.catalogobe"%>
<%@page import="bl.catalogobl"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%

    String[] mensaje = new String[4];

    String id_persona = "0";
    if (request.getParameter("txtId_persona") != null) {
        id_persona = request.getParameter("txtId_persona").toString();

    }
    String id_catalogo = request.getParameter("txtId_catalogo");
    String id_catalogo_categoria = request.getParameter("txtId_catalogo_categoria");
    String descripcion = request.getParameter("txtDescripcion");
    String precio = request.getParameter("txtPrecio");
    String estado = request.getParameter("txtEstado");
    String usuario_registra = request.getParameter("txtUsuario_registra");
//String fecha_registro = request.getParameter("txtFecha_registro");
    if (String.valueOf(id_catalogo).equals("")) {
        id_catalogo = "0";
    }
    if (String.valueOf(id_catalogo_categoria).equals("")) {
        mensaje[0] = "Ingrese datos correctos";
        mensaje[1] = "txtId_catalogo_categoria";
        mensaje[2] = "Warning";

    } else if (String.valueOf(precio).equals("")) {
        mensaje[0] = "Ingrese datos correctos";
        mensaje[1] = "txtPrecio";
        mensaje[2] = "Warning";

    } else if (String.valueOf(estado).equals("")) {
        mensaje[0] = "Ingrese datos correctos";
        mensaje[1] = "txtEstado";
        mensaje[2] = "Warning";

    } else {
        catalogobl obj = new catalogobl();
        // Deprecated
        java.util.Date now = new java.util.Date();
        java.sql.Date fecha_registro = new java.sql.Date(now.getTime());
        catalogobe e = new catalogobe();

        e.setId_catalogo(Integer.valueOf(id_catalogo));
        e.setId_catalogo_categoria(Integer.valueOf(id_catalogo_categoria));
        e.setDescripcion(descripcion);
        e.setPrecio(Double.valueOf(precio));
        e.setEstado(Integer.valueOf(estado));
        e.setUsuario_registra(Integer.valueOf(usuario_registra));
        e.setFecha_registro(fecha_registro);

        Integer resul = 0;

        
        if (e.getId_catalogo() == 0) {
            resul = obj.addCatalogo(e);
            mensaje[0] = "Se guardaron los datos Correctamente";
        } else if (e.getId_catalogo() > 0) {
            resul  = obj.updateCatalogo(e);
            mensaje[0] = "Se Actualizaron los datos Correctamente";
        } else if (e.getId_catalogo() < 0) {
            resul = obj.deshabilitarCatalogo(e);
            mensaje[0] = "Se deshabilito los datos Correctamente";
        }


        if (resul > 0) { 
            mensaje[1] = "1";
            mensaje[2] = "Success";

        } else {
            mensaje[0] = "No se guardaron los datos Correctamente";
            mensaje[1] = "1";
            mensaje[2] = "Danger";
        }
    }

%>

{"mensaje":"<%=mensaje[0]%>", "componente":"<%=mensaje[1]%>", "estado": "<%=mensaje[2]%>", "query": "<%=mensaje[3]%>"}

<%
    // Returns all employees (active and terminated) as json.
    response.setContentType("application/json");
%>