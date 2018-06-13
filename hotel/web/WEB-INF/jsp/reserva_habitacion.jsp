<%-- 
*Nombre Archivo : Reserva_habitacion.jsp
*Creador Archivo: carranza-PC
*Fecha Creacion : 2017-11-10 03:35:26
--%>




<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Date"%>
<%@page import="be.reserva_habitacionbe"%>
<%@page import="bl.reserva_habitacionbl"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%

    String[] mensaje = new String[4];

    String id_reserva = request.getParameter("txtId_reserva");
    String id_habitacion = request.getParameter("txtId_habitacion");
    String id_persona = request.getParameter("txtId_persona");
    String fecha_reserva = request.getParameter("txtFecha_reserva");
    String fecha_reserva_limite = request.getParameter("txtFecha_reserva_limite");
    String fecha_estadia_inicio = request.getParameter("txtFecha_estadia_inicio");
    String fecha_estadia_fin = request.getParameter("txtFecha_estadia_fin");
    String estado = request.getParameter("txtEstado");
    String usuario_registra = request.getParameter("txtUsuario_registra");
    //String fecha_registro = request.getParameter("txtFecha_registro");
    if (String.valueOf(id_reserva).equals("")) {
        id_reserva = "0";
    }
    if (String.valueOf(id_habitacion).equals("")) {
        mensaje[0] = "Ingrese datos correctos";
        mensaje[1] = "txtId_habitacion";
        mensaje[2] = "Warning";

    } else if (String.valueOf(id_persona).equals("")) {
        mensaje[0] = "Ingrese datos correctos";
        mensaje[1] = "txtId_persona";
        mensaje[2] = "Warning";

    } else if (fecha_reserva.equals("")) {
        mensaje[0] = "Ingrese datos correctos";
        mensaje[1] = "txtFecha_reserva";
        mensaje[2] = "Warning";

    } else if (fecha_reserva_limite.equals("")) {
        mensaje[0] = "Ingrese datos correctos";
        mensaje[1] = "txtFecha_reserva_limite";
        mensaje[2] = "Warning";

    } else if (fecha_estadia_inicio.equals("")) {
        mensaje[0] = "Ingrese datos correctos";
        mensaje[1] = "txtFecha_estadia_inicio";
        mensaje[2] = "Warning";

    } else if (fecha_estadia_fin.equals("")) {
        mensaje[0] = "Ingrese datos correctos";
        mensaje[1] = "txtFecha_estadia_fin";
        mensaje[2] = "Warning";

    } else if (String.valueOf(estado).equals("")) {
        mensaje[0] = "Ingrese datos correctos";
        mensaje[1] = "txtEstado";
        mensaje[2] = "Warning";

    } else {
        reserva_habitacionbl obj = new reserva_habitacionbl();
        // Deprecated
        java.util.Date now = new java.util.Date();
        java.sql.Date fecha_registro = new java.sql.Date(now.getTime());
        reserva_habitacionbe e = new reserva_habitacionbe();

        e.setId_reserva(Integer.valueOf(id_reserva));
        e.setId_habitacion(Integer.valueOf(id_habitacion));
        e.setId_persona(Integer.valueOf(id_persona));
        e.setFecha_reserva(fecha_registro);
        e.setFecha_reserva_limite(fecha_registro);
        e.setFecha_estadia_inicio(fecha_registro);
        e.setFecha_estadia_fin(fecha_registro);
        /*
        SimpleDateFormat simple= new SimpleDateFormat("yyyyMMdd");
        e.setFecha_reserva(obj.fecha(fecha_reserva));
        e.setFecha_reserva_limite(obj.fecha(fecha_reserva_limite));
        e.setFecha_estadia_inicio(obj.fecha(fecha_estadia_inicio));
        e.setFecha_estadia_fin(obj.fecha(fecha_estadia_fin));*/
        e.setEstado(Integer.valueOf(estado));
        e.setUsuario_registra(Integer.valueOf(usuario_registra));
        e.setFecha_registro(fecha_registro);

        Integer resul = 0;

        if (Integer.valueOf(id_reserva) == 0) {
            resul = obj.addReserva_habitacion(e);
            mensaje[0] = "Se guardaron los datos Correctamente";
        } else if (Integer.valueOf(id_reserva) > 0) {
            resul = obj.updateReserva_habitacion(e);
            mensaje[0] = "Se Actualizaron los datos Correctamente";
        } else if (Integer.valueOf(id_reserva) < 0) {
           // resul = obj.deshabilitarReserva_habitacion(e);
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

{"mensaje":"<%=mensaje[0]%>", "componente":"<%=mensaje[3]%>", "estado": "<%=mensaje[2]%>"}

<%
    // Returns all employees (active and terminated) as json.
    response.setContentType("application/json");
%>