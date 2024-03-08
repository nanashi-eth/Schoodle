package com.nanashi.moodle.dao;

import com.nanashi.moodle.pojos.Alumno;
import com.nanashi.moodle.util.HibernateUtil;
import org.hibernate.Session;

public class AlumnoDAO {

    public Alumno validarCredenciales(String id, String contrasena) {
        try (Session session = HibernateUtil.getSession()) {
            return session.createQuery("FROM Alumno WHERE id = :id AND contrasena = :contrasena", Alumno.class)
                    .setParameter("id", id)
                    .setParameter("contrasena", contrasena)
                    .uniqueResult();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }


    public Alumno obtenerAlumnoPorId(String id) {
        try (Session session = HibernateUtil.getSession()) {
            return session.get(Alumno.class, id);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
