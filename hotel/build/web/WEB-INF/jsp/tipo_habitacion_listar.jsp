<%@page import="bl.tipo_habitacionbl"%>
<%@page import="be.tipo_habitacionbe"%> 
<%@page import="java.util.List"%>
<%
    String parametro = request.getParameter("id");
    List<tipo_habitacionbe> lista = new tipo_habitacionbl().getTipo_habitacion(parametro);
%>

    <%
        for(tipo_habitacionbe e:lista){
            %>
            <option value="<%=e.getId_tipo_habitacion()%>"><%=e.getDescripcion()%></option>
            <%
        }
    %>
