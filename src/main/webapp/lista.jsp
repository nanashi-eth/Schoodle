<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.nanashi.moodle.pojos.Tarea" %>
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
    <style>
        /* Agrega estilos adicionales según sea necesario */
        .task {
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Lista de Tareas</h2>
    <hr>
    <div class="row">
        <div class="col-md-6">
            <h3>Tareas Completadas</h3>
            <hr>
            <%
                List<Tarea> tareasCompletadas = (List<Tarea>) request.getAttribute("tareasCompletadas");
                for (Tarea tarea : tareasCompletadas) {
            %>
            <div class="task card">
                <img src="ruta/a/imagen/<%= tarea.getId() %>.jpg" alt="Imagen de la tarea" class="card-img-top">
                <div class="card-body">
                    <h5 class="card-title"><%= tarea.getTitulo() %></h5>
                    <p class="card-text"><%= tarea.getDescripcion() %></p>
                    <p class="card-text">Fecha de Entrega: <%= tarea.getFechaEntrega() %></p>
                    <a href="detalleTarea.jsp?id=<%= tarea.getId() %>" class="btn btn-primary">Ver Detalles</a>
                </div>
            </div>
            <% } %>
        </div>
        <div class="col-md-6">
            <h3>Tareas Pendientes</h3>
            <hr>
            <%
                List<Tarea> tareasPendientes = (List<Tarea>) request.getAttribute("tareasPendientes");
                for (Tarea tarea : tareasPendientes) {
            %>
            <div class="task card">
                <img src="ruta/a/imagen/<%= tarea.getId() %>.jpg" alt="Imagen de la tarea" class="card-img-top">
                <div class="card-body">
                    <h5 class="card-title"><%= tarea.getTitulo() %></h5>
                    <p class="card-text"><%= tarea.getDescripcion() %></p>
                    <p class="card-text">Fecha de Entrega: <%= tarea.getFechaEntrega() %></p>
                    <a href="detalleTarea.jsp?id=<%= tarea.getId() %>" class="btn btn-primary">Ver Detalles</a>
                </div>
            </div>
            <% } %>
        </div>
    </div>
</div>

<!-- Bootstrap JS and jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
