<%-- 
    Document   : persona
    Created on : 09-nov-2017, 15:42:04
    Author     : luis alberto
--%>

<%@page import="be.personabe"%>
<%@page import="bl.personabl"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%

    String[] mensaje = new String[3];

    String id_persona = "0";
    if (request.getParameter("txtId_persona") != null) {
        id_persona = request.getParameter("txtId_persona").toString();
       
    }
    String nombre = request.getParameter("txtNombre");
    String tipo_documento = (request.getParameter("txtTipo_documento"));
    String documento = request.getParameter("txtDocumento");
    String telefono = request.getParameter("txtTelefono");
    String correo_electronico = request.getParameter("txtCorreo_electronico");
    String estado = (request.getParameter("txtEstado"));
    int usuario_registra = 0;
    if (id_persona.equals(""))
            id_persona = "0";
    if (nombre.equals("")) {
        mensaje[0] = "Ingrese datos correctos";
        mensaje[1] = "txtNombre";
        mensaje[2] = "Warning";

    } else if (String.valueOf(tipo_documento).equals("")) {
        mensaje[0] = "Ingrese datos correctos";
        mensaje[1] = "txtTipo_documento";
        mensaje[2] = "Warning";

    } else if (documento.equals("")) {
        mensaje[0] = "Ingrese datos correctos";
        mensaje[1] = "txtDocumento";
        mensaje[2] = "Warning";

    } else {
        personabl obj = new personabl();
        // Deprecated
        java.util.Date now = new java.util.Date();
        java.sql.Date fecha_registro = new java.sql.Date(now.getTime());
        personabe e = new personabe();
        
        
        e.setId_persona(Integer.valueOf(id_persona));
        e.setNombre(nombre);
        e.setTipo_documento(Integer.valueOf(tipo_documento));
        e.setDocumento(documento);
        e.setTelefono(telefono);
        e.setCorreo_electronico(correo_electronico);
        e.setEstado(Integer.valueOf(estado));
        e.setUsuario_registra(Integer.valueOf(usuario_registra));
        e.setFecha_registro(fecha_registro);

        Integer resul = 0;

        if (Integer.valueOf(id_persona) == 0) {
            resul = obj.addPersona(e);
        } else if (Integer.valueOf(id_persona) > 0) {
            resul = obj.updatePersona(e);
        } else if (Integer.valueOf(id_persona) < 0) {
            resul = obj.deshabilitarPersona(e);
        }

        if (resul > 0) {
            mensaje[0] = "Se guardaron los datos Correctamente";
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