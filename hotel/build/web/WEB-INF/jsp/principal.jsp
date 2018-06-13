<%
String sUrlPage = "bienvenida.jsp";
  if (request.getParameter("page") != null) { 
    sUrlPage = request.getParameter("page").toString()+".jsp";
  }
  
 
%>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="icon" href="../../../../favicon.ico">

        <title>Sticky Footer Navbar Template for Bootstrap</title>

        <link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Lato:300,400">
        <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <!-- Bootstrap core CSS  --> 
        <link href="complementos/bootstrap/dist/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="complementos/css/bootstrap.css" rel="stylesheet" type="text/css"/>    

        <style>
            /* Sticky footer styles
    -------------------------------------------------- */


            .footer {
                position: absolute;
                bottom: 0;
                width: 100%;
                /* Set the fixed height of the footer here */
                height: 60px;
                line-height: 60px; /* Vertically center the text there */
                background-color: #f5f5f5;
            }


            /* Custom page CSS
            -------------------------------------------------- */
            /* Not required for template or sticky footer method. */

           

            .footer > .container {
                padding-right: 15px;
                padding-left: 15px;
            }
 

        </style>

    </head>

    <body>

        <jsp:include page="menu.jsp" />
        <div id="container"> 
          <jsp:include page="<%=sUrlPage%>" />
        </div>

        <footer class="footer">
            <div class="container text-right">
                <span class="text-muted ">Valverde's y Amigos.</span>
            </div>
        </footer>



    </body>
</html>



