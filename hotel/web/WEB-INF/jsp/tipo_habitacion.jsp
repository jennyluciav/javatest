<%-- 
*Nombre Archivo : Tipo_habitacion.jsp
*Creador Archivo: carranza-PC
*Fecha Creacion : 2017-11-10 02:54:59
--%>




<%@page import="be.tipo_habitacionbe"%>
<%@page import="bl.tipo_habitacionbl"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%

    String[] mensaje = new String[4];

    String id_tipo_habitacion = request.getParameter("txtId_tipo_habitacion");
    String descripcion = request.getParameter("txtDescripcion");
    String precio = request.getParameter("txtPrecio");
    String caracteristica = request.getParameter("txtCaracteristica");
    String estado = request.getParameter("txtEstado");
    String usuario_registra = request.getParameter("txtUsuario_registra");
    //String fecha_registro = request.getParameter("txtFecha_registro");
    if (String.valueOf(id_tipo_habitacion).equals("")) {
        id_tipo_habitacion = "0";
    }
    if (descripcion.equals("")) {
        mensaje[0] = "Ingrese datos correctos";
        mensaje[1] = "txtDescripcion";
        mensaje[2] = "Warning";

    } else if (String.valueOf(precio).equals("")) {
        mensaje[0] = "Ingrese datos correctos";
        mensaje[1] = "txtPrecio";
        mensaje[2] = "Warning";

    } else {
        tipo_habitacionbl obj = new tipo_habitacionbl();
        // Deprecated
        java.util.Date now = new java.util.Date();
        java.sql.Date fecha_registro = new java.sql.Date(now.getTime());
        tipo_habitacionbe e = new tipo_habitacionbe();

        e.setId_tipo_habitacion(Integer.valueOf(id_tipo_habitacion));
        e.setDescripcion(descripcion);
        e.setPrecio(Double.valueOf(precio));
        e.setCaracteristica(caracteristica);
        e.setEstado(Integer.valueOf(estado));
        e.setUsuario_registra(Integer.valueOf(usuario_registra));
        e.setFecha_registro(fecha_registro);

        Integer resul = 0;

        if (Integer.valueOf(id_tipo_habitacion) == 0) {
            resul = obj.addTipo_habitacion(e);
            mensaje[0] = "Se guardaron los datos Correctamente";
        } else if (Integer.valueOf(id_tipo_habitacion) > 0) {
            resul = obj.updateTipo_habitacion(e);
            mensaje[0] = "Se Actualizaron los datos Correctamente";
        } else if (Integer.valueOf(id_tipo_habitacion) < 0) {
            resul = obj.deshabilitarTipo_habitacion(e);
            mensaje[0] = "Se deshabilitaron los datos Correctamente";
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

{"mensaje":"<%=mensaje[0]%>", "componente":"<%=mensaje[1]%>", "estado": "<%=mensaje[2]%>"}

<%
    // Returns all employees (active and terminated) as json.
    response.setContentType("application/json");
%>