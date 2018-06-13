<%@page import="bl.habitacionbl"%>
<%@page import="be.habitacionbe"%>
<%@page import="bl.catalogobl"%>
<%@page import="be.catalogobe"%>
<%@page import="bl.personabl"%>
<%@page import="be.personabe"%>
<%@page import="bl.tipo_habitacionbl"%>
<%@page import="be.tipo_habitacionbe"%> 
<%@page import="java.util.List"%>
<%

    String tipo = request.getParameter("tipo");
    switch (tipo) {
        case "1":
            String parametro = request.getParameter("id");
            List<catalogobe> lista = new catalogobl().getCatalogo(parametro);
            for (catalogobe e : lista) {
                %>
                <option value="<%=e.getId_catalogo()%>-<%=e.getPrecio()%>"><%=e.getDescripcion()%></option>
                <%
                }
            break;
        case "2":
                List<personabe> lista1 = new personabl().getPersona("");

                for (personabe e : lista1) {
                        %>
                        <option value="<%=e.getId_persona()%>"><%=e.getNombre()%></option>
                        <%
                    }
            break;
        case "3":
                List<tipo_habitacionbe> lista2 = new tipo_habitacionbl().getTipo_habitacion("");
 
                for(tipo_habitacionbe e:lista2){
                    %>
                    <option value="<%=e.getId_tipo_habitacion()%>"><%=e.getDescripcion()%></option>
                    <%
                }
     
            break;
        case "4":
                List<habitacionbe> lista3 = new habitacionbl().getHabitacion("");
 
                for(habitacionbe e:lista3){
                    %>
                    <option value="<%=e.getId_habitacion()%>"><%=e.getPiso()%></option>
                    <%
                }
            break;
        default:
            break;
    }
%>
