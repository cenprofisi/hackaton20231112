package persistencia;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Semestre;

public class SemestreDAO {

    public List<Semestre> obtenerSemestres() {
        List<Semestre> semestres = new ArrayList<>();
        Connection conexion = ConexionDB.obtenerConexion();
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            String query = "SELECT id_semestre, anio, ciclo_academico FROM semestre";
            ps = conexion.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                Semestre semestre = new Semestre();
                semestre.setId(rs.getInt("id_semestre"));
                semestre.setAnio(rs.getInt("anio"));
                semestre.setCicloAcademico(rs.getString("ciclo_academico"));
                semestres.add(semestre);
            }
        } catch (SQLException e) {
            System.out.println("Error al obtener semestres: " + e.getMessage());
        } finally {
            // Cerrar ResultSet, PreparedStatement y la conexión
        }

        return semestres;
    }

    public boolean agregarSemestre(Semestre semestre) {
        Connection conexion = ConexionDB.obtenerConexion();
        PreparedStatement ps = null;

        try {
            String query = "INSERT INTO semestre (anio, ciclo_academico) VALUES (?, ?)";
            ps = conexion.prepareStatement(query);
            ps.setInt(1, semestre.getAnio());
            ps.setString(2, semestre.getCicloAcademico());
            int filasAfectadas = ps.executeUpdate();
            return filasAfectadas > 0;
        } catch (SQLException e) {
            System.out.println("Error al agregar un semestre: " + e.getMessage());
            return false;
        } finally {
            // Cerrar PreparedStatement y la conexión
        }
    }

    public boolean actualizarSemestre(Semestre semestre) {
        Connection conexion = ConexionDB.obtenerConexion();
        PreparedStatement ps = null;

        try {
            String query = "UPDATE semestre SET anio = ?, ciclo_academico = ? WHERE id_semestre = ?";
            ps = conexion.prepareStatement(query);
            ps.setInt(1, semestre.getAnio());
            ps.setString(2, semestre.getCicloAcademico());
            ps.setInt(3, semestre.getId());
            int filasAfectadas = ps.executeUpdate();
            return filasAfectadas > 0;
        } catch (SQLException e) {
            System.out.println("Error al actualizar un semestre: " + e.getMessage());
            return false;
        } finally {
            // Cerrar PreparedStatement y la conexión
        }
    }

    public boolean eliminarSemestre(int idSemestre) {
        Connection conexion = ConexionDB.obtenerConexion();
        PreparedStatement ps = null;

        try {
            String query = "DELETE FROM semestre WHERE id_semestre = ?";
            ps = conexion.prepareStatement(query);
            ps.setInt(1, idSemestre);
            int filasAfectadas = ps.executeUpdate();
            return filasAfectadas > 0;
        } catch (SQLException e) {
            System.out.println("Error al eliminar un semestre: " + e.getMessage());
            return false;
        } finally {
            // Cerrar PreparedStatement y la conexión
        }
    }
}
