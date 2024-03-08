<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.nanashi.moodle.pojos.Tarea" %>
<% response.setHeader("Cache-Control", "no-store");
    // Verificar si el usuario ha iniciado sesión
    String usuario = (String) session.getAttribute("usuario");
    if (usuario == null) {
        response.sendRedirect("index.jsp");
    }
    else if ((List<Tarea>) request.getAttribute("tareasCompletadas") == null && ((List<Tarea>) request.getAttribute("tareasCompletadas")).isEmpty()) {
        response.sendRedirect("home.jsp");
    }
    else{
        List<Tarea> tareasCompletadas = (List<Tarea>) request.getAttribute("tareasCompletadas");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lista de Tareas</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Material Design Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" href="css/styles.css">
</head>
<body>
<div class="container">
    <h2>Lista de Tareas</h2>
    <hr>
    <div class="row">
        <section class="col-md-6">
            <h3>Tareas Completadas</h3>
            <hr>
            <%
                for (Tarea tarea : tareasCompletadas) {
            %>
            <div class="task card">
                <img src="images/<%= tarea.getImagen() %>" alt="Imagen de la tarea" class="card-img-top">
                <div class="card-body">
                    <h5 class="card-title"><%= tarea.getTitulo() %></h5>
                    <p class="card-text"><%= tarea.getDescripcion() %></p>
                    <a href="detalleTarea.jsp?id=<%= tarea.getId() %>" class="btn btn-primary">Ver Detalles</a>
                </div>
            </div>
            <% } %>
        </section>
        <section class="col-md-6">
            <h3>Tareas Pendientes</h3>
            <hr>
            <%
                List<Tarea> tareasPendientes = (List<Tarea>) request.getAttribute("tareasPendientes");
                for (Tarea tarea : tareasPendientes) {
            %>
            <div class="task card">
                <img src="images/<%= tarea.getImagen() %>" alt="Imagen de la tarea" class="card-img-top">
                <div class="card-body">
                    <h5 class="card-title"><%= tarea.getTitulo() %></h5>
                    <p class="card-text"><%= tarea.getDescripcion() %></p>
                    <p class="card-text">Fecha de Entrega: <%= tarea.getFechaEntrega() %></p>
                    <a href="detalleTarea.jsp?id=<%= tarea.getId() %>" class="btn btn-primary">Ver Detalles</a>
                </div>
            </div>
            <% } %>
        </section>
    </div>
</div>
<hr>
<footer>
    <div class="container">
        <div class="row">
            <div class="col-md-12 text-center">
                <a href="logout" class="btn btn-primary">Cerrar sesion</a>
            </div>
        </div>
    </div>
</footer>

<!-- Bootstrap JS and jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
<%}%>
