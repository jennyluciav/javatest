<%-- 
    Document   : menu.jsp
    Created on : 09-nov-2017, 3:31:23
    Author     : luis alberto
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
 <nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">Sistema Hoteles</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="inicio.htm">Inicio</a></li>
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Mantenimiento  </a>
        <ul class="dropdown-menu">
           <li><a href="inicio.htm?page=persona_lista&titulo=personsa">Persona</a></li>
            <li><a href="inicio.htm?page=usuario_lista&titulo=usuario">Usuario</a></li> 
            <li class="divider"></li>
            <li><a href="inicio.htm?page=habitacion_lista&titulo=habitacion">Habitacion</a></li>
            <li><a href="inicio.htm?page=tipo_habitacion_lista&titulo=habitacion">Tipo Habitacion</a></li> 
            <li class="divider"></li>
            <li><a href="inicio.htm?page=catalogo_listar&titulo=Contenedor">Contenedor</a></li> 
        </ul>
      </li>
      
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle">Recepcion  </a>
                                <ul class="dropdown-menu">
                                    <li><a href="inicio.htm?page=reserva_habitacion_lista&titulo=habitacion">Reserva Habitacion</a></li> 
                                    <li class="divider"></li>
                                    <li><a href="#">Cancelar Reserva</a></li> 
                                </ul>
                            </li>
      <li class="dropdown">
                                <a href="#" class="dropdown-toggle">Caja  </a>
                                <ul class="dropdown-menu">
                                    <li><a href="#">Apertura Caja</a></li>
                                    <li><a href="#">Cierre Caja</a></li> 
                                    <li class="divider"></li>
                                    <li><a href="#">Pago</a></li>
                                    <li class="divider"></li>
                                    <li><a href="#">Cuadre Caja</a></li> 
                                </ul>
                            </li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle">Reporte  </a>
                                <ul class="dropdown-menu">
                                    <li><a href="#">Huesped Alojados</a></li> 
                                    <li class="divider"></li>
                                    <li><a href="#">Habitaciones Frecuentes</a></li>
                                    <li><a href="#">Record Clientes </a></li>
                                    <li class="divider"></li>
                                    <li><a href="#">Ingreso Caja</a></li> 
                                </ul>
                            </li>
    </ul>
       <ul class="nav navbar-nav navbar-right">
                            <li><p class="lead" style="color: white">Usuario : ${requestScope.valor}</p></li> 
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle">Configuracion  </a>
                                <ul class="dropdown-menu">
                                    <li><a href="#">Manual de Usuario</a></li>
                                    <li class="divider"></li>
                                    <li><a href="#">Cambiar Clave</a></li>
                                    <li class="divider"></li>
                                    <li><a href="index.htm">Salir</a></li>
                                </ul>
                            </li>
                        </ul>
  </div>
</nav>
 
