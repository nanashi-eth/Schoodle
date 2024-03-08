<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>Iniciar Sesión</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <!-- Material Design Icons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
  <link rel="stylesheet" href="css/styles.css">
</head>
<body>
<div class="container">
  <div class="form-container">
    <h2 class="mb-4">Iniciar Sesión</h2>
    <!-- Aquí incluir la información del autor -->
    <p class="text-muted">Autor: Jose Benitez Romero</p>
    <form id="loginForm" action="login" method="post">
      <div class="form-group">
        <input type="text" class="form-control" name="identificador" id="identificador" placeholder="Identificador" required>
        <small id="identificadorError" class="form-text error-message"></small>
      </div>
      <div class="form-group">
        <input type="password" class="form-control" name="contrasena" id="contrasena" placeholder="Contraseña" required>
        <small id="contrasenaError" class="form-text error-message"></small>
      </div>
      <button type="submit" class="btn btn-primary btn-block">Iniciar Sesión</button>
    </form>
  </div>
</div>

<!-- Bootstrap JS and jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="js/script.js"></script>
</body>
</html>
