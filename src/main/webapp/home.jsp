<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*, com.nanashi.moodle.dao.AlumnoDAO, com.nanashi.moodle.dao.TareaDAO, com.nanashi.moodle.pojos.Alumno, com.nanashi.moodle.pojos.Tarea" %>
<%
    // Verificar si el usuario ha iniciado sesión
    String usuario = (String) session.getAttribute("usuario");
    if (usuario == null) {
        response.sendRedirect("login.jsp"); // Redirigir al usuario a la página de inicio de sesión si no ha iniciado sesión
    }

    // Obtener el alumno actual
    AlumnoDAO alumnoDAO = new AlumnoDAO();
    Alumno alumno = alumnoDAO.obtenerAlumnoPorId((String) session.getAttribute("id"));

    // Obtener el número de tareas pendientes y completadas
    TareaDAO tareaDAO = new TareaDAO();
    List<Tarea> tareasPendientes = tareaDAO.obtenerTareasPendientes(alumno);
    List<Tarea> tareasCompletadas = tareaDAO.obtenerTareasCompletadas(alumno);
%>
<!DOCTYPE html>
<html>
<head>
    <title>Home</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Material Design Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        body {
            padding: 20px;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Bienvenido, <%= usuario %></h2>
    <hr>
    <!-- Card con los datos del usuario -->
    <div class="card">
        <div class="card-body">
            <h5 class="card-title">Datos del usuario</h5>
            <p class="card-text">Nombre: <%= alumno.getNombre() %></p>
            <p class="card-text">Email: <%= alumno.getEmail() %></p>
        </div>
    </div>
    <hr>
    <!-- Mostrar número de tareas pendientes y completadas -->
    <div class="row">
        <div class="col-md-6">
            <h3>Tareas Pendientes: <%= tareasPendientes.size() %></h3>
            <h3>Tareas Completadas: <%= tareasCompletadas.size() %></h3>
        </div>
    </div>
    <hr>
    <!-- Enlaces a las páginas siguientes -->
    <div class="row">
        <div class="col-md-6">
            <h3>Acceso a tus tareas:</h3>
            <ul>
                <li><a href="tareas?vista=lista">Tabla</a></li>
                <li><a href="pagina2.jsp">Lista</a></li>
            </ul>
        </div>
    </div>
</div>

<!-- Bootstrap JS and jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
