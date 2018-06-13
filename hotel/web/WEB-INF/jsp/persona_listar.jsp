<%@page import="bl.personabl"%>
<%@page import="be.personabe"%>
<%@page import="java.util.List"%>
<%
    String parametro1 = request.getParameter("nro");
    String parametro2 = request.getParameter("tipo");
    List<personabe> lista = new personabl().getPersona(parametro2,parametro1);
    
    String[] mensaje = new String[3];
    mensaje[0]="";
    mensaje[1]="";
    mensaje[2]="";
if (lista.size()>0){
    mensaje[0]="Nro de Documento ya esta Registrado";
    mensaje[1]="txtDocumento";
    mensaje[2]="1";
}

%>
  

{"mensaje":"<%=mensaje[0]%>", "componente":"<%=mensaje[1]%>", "estado": "<%=mensaje[2]%>"}

<%
    // Returns all employees (active and terminated) as json.
    response.setContentType("application/json");
%>