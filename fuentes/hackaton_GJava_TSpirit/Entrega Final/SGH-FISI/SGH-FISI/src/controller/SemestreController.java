
package controller;

import java.util.List;
import model.Semestre;
import persistencia.SemestreDAO;

public class SemestreController {

    private SemestreDAO semestreDAO;

    public SemestreController() {
        this.semestreDAO = new SemestreDAO();
    }

    public List<Semestre> obtenerSemestres() {
        return semestreDAO.obtenerSemestres();
    }

    public boolean agregarSemestre(Semestre semestre) {
        return semestreDAO.agregarSemestre(semestre);
    }

    public boolean actualizarSemestre(int idSemestre, int anio, String cicloAcademico) {
        Semestre semestre = new Semestre();
        semestre.setId(idSemestre);
        semestre.setAnio(anio);
        semestre.setCicloAcademico(cicloAcademico);
        return semestreDAO.actualizarSemestre(semestre);
    }

    public boolean eliminarSemestre(int idSemestre) {
        return semestreDAO.eliminarSemestre(idSemestre);
    }

    public boolean existeSemestre(int anio, String cicloAcademico) {
        List<Semestre> semestres = obtenerSemestres();
        for (Semestre semestre : semestres) {
            if (semestre.getAnio() == anio && semestre.getCicloAcademico().equals(cicloAcademico)) {
                return true;
            }
        }
        return false;
    }
}
