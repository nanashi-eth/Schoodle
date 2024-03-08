package com.nanashi.moodle.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "LogoutServlet", value = "/logout")
public class LogoutServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false); // false para evitar la creación de una nueva sesión si no existe

        if (session != null) {
            session.removeAttribute("usuario");
            session.invalidate(); // Invalida la sesión actual
        }

        // Redirige al usuario a la página de inicio de sesión
        response.sendRedirect(request.getContextPath() + "/index.jsp");
    }
}

