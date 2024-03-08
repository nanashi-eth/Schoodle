package com.nanashi.moodle.servlets;

import com.nanashi.moodle.dao.AlumnoDAO;
import com.nanashi.moodle.pojos.Alumno;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(name = "LoginServlet", value = "/login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String identificador = request.getParameter("identificador");
        String contrasena = request.getParameter("contrasena");

        AlumnoDAO alumnoDAO = new AlumnoDAO();
        Alumno alumno = alumnoDAO.validarCredenciales(identificador, contrasena);

        if (alumno != null) {
            // Si se encontró un alumno con las credenciales proporcionadas, iniciar sesión
            HttpSession httpSession = request.getSession();
            httpSession.setAttribute("usuario", alumno.getNombre() + " " + alumno.getApellido());
            httpSession.setAttribute("id", alumno.getId());
            response.sendRedirect(request.getContextPath() + "/home.jsp");
        } else {
            // Si las credenciales son incorrectas, redirigir al usuario a una página de error de inicio de sesión
            response.sendRedirect(request.getContextPath() + "/loginError.jsp");
        }
    }
}
