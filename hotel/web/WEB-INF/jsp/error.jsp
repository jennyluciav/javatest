<%-- 
    Document   : error
    Created on : 05-nov-2017, 8:45:12
    Author     : Estudiante
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        Ocurrio un error al realizar operación
        <hr>
        ${requestScope.mensaje}
    </body>
</html>
