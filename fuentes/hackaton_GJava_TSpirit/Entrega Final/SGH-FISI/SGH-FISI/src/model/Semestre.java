package model;

public class Semestre {
    private int id;
    private int anio;
    private String cicloAcademico;
    // Getters y Setters
    
    // ID
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    // Año
    public int getAnio() {
        return anio;
    }

    public void setAnio(int anio) {
        this.anio = anio;
    }

    // Ciclo Académico
    public String getCicloAcademico() {
        return cicloAcademico;
    }

    public void setCicloAcademico(String cicloAcademico) {
        this.cicloAcademico = cicloAcademico;
    }
}
