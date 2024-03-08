<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.nanashi.moodle.pojos.Tarea, com.nanashi.moodle.dao.TareaDAO" %>
<%@ page import="java.util.List" %>
<%
    response.setHeader("Cache-Control", "no-store");
    // Verificar si el usuario ha iniciado sesión
    String usuario = (String) session.getAttribute("usuario");
    if (usuario == null) {
        response.sendRedirect("index.jsp");
    }
    // Obtener el ID de la tarea de los parámetros de la solicitud
    String tareaId = request.getParameter("id");

    // Obtener la tarea correspondiente del DAO utilizando el ID
    TareaDAO tareaDAO = new TareaDAO();
    Tarea tarea = tareaDAO.obtenerTareaPorId(Integer.parseInt(tareaId));
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Detalle de Tarea</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/styles.css">
</head>
<body>
<div class="container">
    <header>
        <h1>Detalle de Tarea</h1>
        <hr>
    </header>
    <section class="row">
        <article class="col-md-6">
            <div class="card">
                <div class="card-body">
                    <h2><%= tarea.getTitulo() %></h2>
                    <p><strong>Descripción:</strong> <%= tarea.getDescripcion() %></p>
                    <p><strong>Fecha de Entrega:</strong> <%= tarea.getFechaEntrega() %></p>
                    <p><strong>Completado:</strong> <%= tarea.getCompletadoo() == 1 ? "Sí" : "No" %></p>
                    <% if (tarea.getCompletadoo() == 1) { %>
                    <p><strong>Calificación:</strong> <%= tarea.getCalificacion() != null ? tarea.getCalificacion() : "" %></p>
                    <% } %>
                </div>
            </div>
        </article>
        <aside class="col-md-6">
            <div class="card">
                <img src="images/<%= tarea.getImagen() %>" alt="Imagen de la tarea" class="card-img-top">
            </div>
        </aside>
    </section>
    <hr>
    <footer>
        <a href="logout" class="btn btn-primary">Cerrar sesion</a>
    </footer>
</div>

<!-- Bootstrap JS and jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
