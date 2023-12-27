package persistencia;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.CursoHorario;

public class HorarioDAO {

    public List<CursoHorario> obtenerHorarios() {
        List<CursoHorario> horarios = new ArrayList<>();
        Connection conexion = ConexionDB.obtenerConexion();
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            String query = "SELECT id_horario, hora FROM horarios";
            ps = conexion.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                CursoHorario horario = new CursoHorario();
                horario.setId(rs.getInt("id_horario"));
                horario.setHorario(rs.getString("hora"));
                horarios.add(horario);
            }
        } catch (SQLException e) {
            System.out.println("Error al obtener Horarios: " + e.getMessage());
        } finally {
            // Cerrar ResultSet, PreparedStatement y la conexión
        }

        return horarios;
    }
public int obtenerHorarioIndex(String selectedHorario) {
        List<CursoHorario> horarios = obtenerHorarios();

        for (int i = 0; i < horarios.size(); i++) {
            if (horarios.get(i).getHorario().equals(selectedHorario)) {
                return i;
            }
        }

        return -1; // Return -1 if the horario is not found
    }
 
}