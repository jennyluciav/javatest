<%-- 
*Nombre Archivo : Habitacion.jsp
*Creador Archivo: carranza-PC
*Fecha Creacion : 2017-11-10 02:35:47
--%>




<%@page import="be.habitacionbe"%>
<%@page import="bl.habitacionbl"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%

    String[] mensaje = new String[4];

    String id_habitacion = request.getParameter("txtId_habitacion");
    String nro = request.getParameter("txtNro");
    String piso = request.getParameter("txtPiso");
    String id_tipo_habitacion = request.getParameter("txtId_tipo_habitacion");
    String estado = request.getParameter("txtEstado");
    String usuario_registra = request.getParameter("txtUsuario_registra");
//String fecha_registro = request.getParameter("txtFecha_registro");
    if (String.valueOf(id_habitacion).equals("")) {
        id_habitacion = "0";
    }
    if (String.valueOf(piso).equals("")) {
        mensaje[0] = "Ingrese datos correctos";
        mensaje[1] = "txtPiso";
        mensaje[2] = "Warning";

    } else if (String.valueOf(id_tipo_habitacion).equals("")) {
        mensaje[0] = "Ingrese datos correctos";
        mensaje[1] = "txtId_tipo_habitacion";
        mensaje[2] = "Warning";

    } else {
        habitacionbl obj = new habitacionbl();
        // Deprecated
        java.util.Date now = new java.util.Date();
        java.sql.Date fecha_registro = new java.sql.Date(now.getTime());
        habitacionbe e = new habitacionbe();

        e.setId_habitacion(Integer.valueOf(id_habitacion));
        e.setNro(Integer.valueOf(nro));
        e.setPiso(Integer.valueOf(piso));
        e.setId_tipo_habitacion(Integer.valueOf(id_tipo_habitacion));
        e.setEstado(Integer.valueOf(estado));
        e.setUsuario_registra(Integer.valueOf(usuario_registra));
        e.setFecha_registro(fecha_registro);

        Integer resul = 0;

        if (Integer.valueOf(id_habitacion) == 0) {
            resul = obj.addHabitacion(e);
            mensaje[0] = "Se guardaron los datos Correctamente";
        } else if (Integer.valueOf(id_habitacion) > 0) {
            resul = obj.updateHabitacion(e);
            mensaje[0] = "Se Actualizaron los datos Correctamente";
        } else if (Integer.valueOf(id_habitacion) < 0) {
            resul = obj.deshabilitarHabitacion(e);
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