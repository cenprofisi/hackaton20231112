package persistencia;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Seccion;

public class SeccionDAO {

    public List<Seccion> obtenerSecciones() {
        List<Seccion> secciones = new ArrayList<>();
        Connection conexion = ConexionDB.obtenerConexion();
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            String query = "SELECT id_seccion, nombre FROM seccion";
            ps = conexion.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                Seccion seccion = new Seccion();
                seccion.setId(rs.getInt("id_seccion"));
                seccion.setNombre(rs.getString("nombre"));
                secciones.add(seccion);
            }
        } catch (SQLException e) {
            System.out.println("Error al obtener secciones: " + e.getMessage());
        } finally {
            // Cerrar ResultSet, PreparedStatement y la conexión
        }

        return secciones;
    }

    public boolean agregarSeccion(Seccion seccion) {
        Connection conexion = ConexionDB.obtenerConexion();
        PreparedStatement ps = null;

        try {
            String query = "INSERT INTO seccion (nombre) VALUES (?)";
            ps = conexion.prepareStatement(query);
            ps.setString(1, seccion.getNombre());
            int filasAfectadas = ps.executeUpdate();
            return filasAfectadas > 0;
        } catch (SQLException e) {
            System.out.println("Error al agregar sección: " + e.getMessage());
            return false;
        } finally {
            // Cerrar PreparedStatement y la conexión
        }
    }

    public boolean editarSeccion(Seccion seccion) {
        Connection conexion = ConexionDB.obtenerConexion();
        PreparedStatement ps = null;

        try {
            String query = "UPDATE seccion SET nombre = ? WHERE id_seccion = ?";
            ps = conexion.prepareStatement(query);
            ps.setString(1, seccion.getNombre());
            ps.setInt(2, seccion.getId());
            int filasAfectadas = ps.executeUpdate();
            return filasAfectadas > 0;
        } catch (SQLException e) {
            System.out.println("Error al editar sección: " + e.getMessage());
            return false;
        } finally {
            // Cerrar PreparedStatement y la conexión
        }
    }

    public boolean eliminarSeccion(int idSeccion) {
        Connection conexion = ConexionDB.obtenerConexion();
        PreparedStatement ps = null;

        try {
            String query = "DELETE FROM seccion WHERE id_seccion = ?";
            ps = conexion.prepareStatement(query);
            ps.setInt(1, idSeccion);
            int filasAfectadas = ps.executeUpdate();
            return filasAfectadas > 0;
        } catch (SQLException e) {
            System.out.println("Error al eliminar sección: " + e.getMessage());
            return false;
        } finally {
            // Cerrar PreparedStatement y la conexión
        }
    }

}
