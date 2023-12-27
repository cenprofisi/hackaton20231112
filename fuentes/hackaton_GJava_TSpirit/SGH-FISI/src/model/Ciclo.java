package model;

public class Ciclo {

    private int idCiclo;
    private String nombre;

    public int getIdCiclo() {
        return idCiclo;
    }

    public void setIdCiclo(int idCiclo) {
        this.idCiclo = idCiclo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    @Override
    public String toString() {
        return nombre; // Suponiendo que 'nombre' es un atributo que deseas mostrar en el JComboBox
    }
}
