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
  <style>
    body {
      padding: 20px;
    }
    .form-container {
      max-width: 400px;
      margin: auto;
    }
    .form-group {
      margin-bottom: 20px;
    }
    .error-message {
      color: red;
    }
  </style>
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
<script>
  $(document).ready(function() {
    $('#loginForm').submit(function(event) {
      var identificador = $('#identificador').val();
      var contrasena = $('#contrasena').val();
      var isValid = true;

      // Validación de identificador
      var identificadorRegex = /^[A-Z]{3}\d{3}$/; // Expresión regular para 3 letras mayúsculas seguidas de 3 números
      if (!identificadorRegex.test(identificador)) {
        $('#identificadorError').text('El identificador debe tener 3 letras mayúsculas seguidas de 3 números (Ejemplo: ABC123)');
        isValid = false;
      } else {
        $('#identificadorError').text('');
      }

      // Validación de contraseña
      if (contrasena.trim() == '') {
        $('#contrasenaError').text('Ingrese su contraseña');
        isValid = false;
      } else {
        $('#contrasenaError').text('');
      }

      if (!isValid) {
        event.preventDefault(); // Evitar envío del formulario si hay errores
      }
    });
  });
</script>
</body>
</html>
