package com.nanashi.moodle.servlets;

import com.nanashi.moodle.dao.AlumnoDAO;
import com.nanashi.moodle.dao.TareaDAO;
import com.nanashi.moodle.pojos.Alumno;
import com.nanashi.moodle.pojos.Tarea;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "TareasServlet", value = "/tareas")
public class TareasServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String vista = request.getParameter("vista");
        if (vista == null || (!vista.equals("lista") && !vista.equals("tabla"))) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Parámetro 'vista' inválido");
            return;
        }

        // Obtener el ID del alumno de la sesión
        String idAlumno = (String) request.getSession().getAttribute("id");
        AlumnoDAO alumnoDAO = new AlumnoDAO();
        Alumno alumno = alumnoDAO.obtenerAlumnoPorId(idAlumno);

        if (alumno == null) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error al obtener los datos del alumno");
            return;
        }

        // Obtener todas las tareas del alumno
        TareaDAO tareaDAO = new TareaDAO();
        List<Tarea> tareas = tareaDAO.obtenerTodasLasTareas(alumno);
        List<Tarea> tareasCompletadas = tareaDAO.obtenerTareasCompletadas(alumno);
        List<Tarea> tareasPendientes = tareaDAO.obtenerTareasPendientes(alumno);

        if (tareas == null) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error al obtener las tareas del alumno");
            return;
        }

        // Redirigir a la página correspondiente según el valor de 'vista'
        // Redirigir a la página correspondiente según el valor de 'vista'
        if (vista.equals("lista")) {
            request.setAttribute("tareasCompletadas", tareasCompletadas);
            request.setAttribute("tareasPendientes", tareasPendientes);
            request.getRequestDispatcher("/lista.jsp").forward(request, response);
        } else { // vista.equals("tabla")
            request.setAttribute("tareas", tareas);
            request.getRequestDispatcher("/tabla.jsp").forward(request, response);
        }
    }
}
