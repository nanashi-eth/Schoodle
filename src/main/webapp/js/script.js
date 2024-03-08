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