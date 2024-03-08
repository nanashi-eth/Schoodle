package com.nanashi.moodle.dao;

import com.nanashi.moodle.pojos.Alumno;
import com.nanashi.moodle.pojos.Tarea;
import com.nanashi.moodle.util.HibernateUtil;
import org.hibernate.Session;

import java.util.List;

public class TareaDAO {

    public List<Tarea> obtenerTareasPendientes(Alumno alumno) {
        try (Session session = HibernateUtil.getSession()) {
            return session.createQuery("FROM Tarea WHERE alumno = :alumno AND completado = false", Tarea.class)
                    .setParameter("alumno", alumno)
                    .getResultList();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public List<Tarea> obtenerTareasCompletadas(Alumno alumno) {
        try (Session session = HibernateUtil.getSession()) {
            return session.createQuery("FROM Tarea WHERE alumno = :alumno AND completado = true", Tarea.class)
                    .setParameter("alumno", alumno)
                    .getResultList();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }


    public List<Tarea> obtenerTodasLasTareas(Alumno alumno) {
        try (Session session = HibernateUtil.getSession()) {
            return session.createQuery("FROM Tarea WHERE alumno = :alumno", Tarea.class)
                    .setParameter("alumno", alumno)
                    .getResultList();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

}