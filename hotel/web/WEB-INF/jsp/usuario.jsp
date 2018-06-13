<%-- 
*Nombre Archivo : Usuario.jsp
*Creador Archivo: carranza-PC
*Fecha Creacion : 2017-11-10 01:52:15
--%>




<%@page import="be.usuariobe"%>
<%@page import="bl.usuariobl"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%

    String[] mensaje = new String[4];

    String id_usuario = request.getParameter("txtId_usuario");
    String id_persona = request.getParameter("txtId_persona");
    String logueo = request.getParameter("txtLogueo");
    String clave = request.getParameter("txtClave");
    String tipo_nivel = request.getParameter("txtTipo_nivel");
    String estado = request.getParameter("txtEstado");
    String usuario_registra = request.getParameter("txtUsuario_registra");
    //  String fecha_registro = request.getParameter("txtFecha_registro");
    if (String.valueOf(id_usuario).equals("")) {
        id_usuario = "0";
    }
    if (String.valueOf(id_persona).equals("")) {
        mensaje[0] = "Ingrese datos correctos";
        mensaje[1] = "txtId_persona";
        mensaje[2] = "Warning";

    } else {
        usuariobl obj = new usuariobl();
        // Deprecated
        java.util.Date now = new java.util.Date();
        java.sql.Date fecha_registro = new java.sql.Date(now.getTime());
        usuariobe e = new usuariobe();

        e.setId_usuario(Integer.valueOf(id_usuario));
        e.setId_persona(Integer.valueOf(id_persona));
        e.setLogueo(logueo);
        e.setClave(clave);
        e.setTipo_nivel(Integer.valueOf(tipo_nivel));
        e.setEstado(Integer.valueOf(estado));
        e.setUsuario_registra(Integer.valueOf(usuario_registra));
        e.setFecha_registro(fecha_registro);

        Integer resul = 0;

        if (Integer.valueOf(id_usuario) == 0) {
            resul = obj.addUsuario(e);
            mensaje[0] = "Se guardaron los datos Correctamente";
        } else if (Integer.valueOf(id_usuario) > 0) {
            resul = obj.updateUsuario(e);
            mensaje[0] = "Se Actualizaron los datos Correctamente";
        } else if (Integer.valueOf(id_usuario) < 0) {
            resul = obj.deshabilitarUsuario(e);
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

{"mensaje":"<%=mensaje[0]%>", "componente":"<%=mensaje[1]%>", "estado": "<%=mensaje[3]%>"}

<%
    // Returns all employees (active and terminated) as json.
    response.setContentType("application/json");
%>