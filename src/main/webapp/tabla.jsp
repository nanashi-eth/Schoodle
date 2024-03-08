<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.nanashi.moodle.pojos.Tarea" %>
<% response.setHeader("Cache-Control", "no-store");
    // Verificar si el usuario ha iniciado sesión
    String usuario = (String) session.getAttribute("usuario");
    if (usuario == null) {
        response.sendRedirect("index.jsp");
    } %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tabla de Tareas</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/styles.css">
</head>
<body>
<div class="container">
    <h2>Lista de Tareas</h2>
    <hr>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-striped table-bordered">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Título</th>
                    <th>Descripción</th>
                    <th>Fecha de Entrega</th>
                    <th>Completado</th>
                    <th>Calificación</th>
                </tr>
                </thead>
                <tbody>
                <%
                    List<Tarea> tareas = (List<Tarea>) request.getAttribute("tareas");
                    for (int i = 0; i < tareas.size(); i++) {
                        Tarea tarea = tareas.get(i);
                %>
                <tr class="<%= i % 2 == 0 ? "even-row" : "odd-row" %>">
                    <td><%= tarea.getId() %></td>
                    <td><%= tarea.getTitulo() %></td>
                    <td><%= tarea.getDescripcion() %></td>
                    <td><%= tarea.getFechaEntrega() %></td>
                    <td><%= tarea.getCompletadoo() == 1 ? "Sí" : "No" %></td>
                    <td><%= tarea.getCalificacion() != null ? tarea.getCalificacion() : " " %></td>
                </tr>
                <% } %>
                </tbody>
            </table>
        </div>
    </div>
</div>

<hr>

<footer>
    <a href="logout" class="btn btn-primary">Cerrar sesion</a>
</footer>

<!-- Bootstrap JS and jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
