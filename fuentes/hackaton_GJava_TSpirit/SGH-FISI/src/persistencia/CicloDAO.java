package persistencia;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Ciclo;

public class CicloDAO {

    public List<Ciclo> obtenerCiclos() {
        List<Ciclo> ciclos = new ArrayList<>();
        Connection conexion = ConexionDB.obtenerConexion();
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            String query = "SELECT id_ciclo, nombre FROM ciclos";
            ps = conexion.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                Ciclo ciclo = new Ciclo();
                ciclo.setIdCiclo(rs.getInt("id_ciclo"));
                ciclo.setNombre(rs.getString("nombre"));
                ciclos.add(ciclo);
            }
        } catch (SQLException e) {
            System.out.println("Error al obtener ciclos: " + e.getMessage());
        } finally {
            // Cerrar ResultSet, PreparedStatement y la conexión
        }

        return ciclos;
    }
}
