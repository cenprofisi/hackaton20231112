package persistencia;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Curso;

public class CursoDAO {

    public List<Curso> obtenerCursos() {
        List<Curso> cursos = new ArrayList<>();
        Connection conexion = ConexionDB.obtenerConexion();
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            String query = "SELECT id_curso, nombre FROM cursos";
            ps = conexion.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                Curso curso = new Curso();
                curso.setId(rs.getInt("id_curso"));
                curso.setNombre(rs.getString("nombre"));
                cursos.add(curso);
            }
        } catch (SQLException e) {
            System.out.println("Error al obtener cursos: " + e.getMessage());
        } finally {
            // Cerrar ResultSet, PreparedStatement y la conexión
        }

        return cursos;
    }

    public List<Curso> obtenerCursosPorCiclo(int idCiclo) {
        List<Curso> cursos = new ArrayList<>();
        Connection conexion = ConexionDB.obtenerConexion();
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            String query = "SELECT c.Codigo, c.nombre, c.cantidad_alumnos, "
                    + "IFNULL(pe.nombre, '') as plan_estudios_nombre, "
                    + "IFNULL(s.nombre, '') as seccion "
                    + "FROM cursos c "
                    + "LEFT JOIN plan_estudios pe ON c.id_plan_estudios = pe.id_plan_estudios "
                    + "LEFT JOIN seccion s ON c.id_seccion = s.id_seccion "
                    + "WHERE c.id_ciclo = ?";
            ps = conexion.prepareStatement(query);
            ps.setInt(1, idCiclo);
            rs = ps.executeQuery();

            while (rs.next()) {
                Curso curso = new Curso();
                curso.setCodigo(rs.getString("Codigo"));
                curso.setNombre(rs.getString("nombre"));
                curso.setCantidadAlumnos(rs.getInt("cantidad_alumnos"));
                curso.setPlanEstudios(rs.getString("plan_estudios_nombre"));
                curso.setSeccion(rs.getString("seccion"));
                cursos.add(curso);
            }
        } catch (SQLException e) {
            System.out.println("Error al obtener cursos por ciclo: " + e.getMessage());
        } finally {
            // Cerrar ResultSet, PreparedStatement y la conexión
        }

        return cursos;
    }

    public boolean actualizarSeccionCurso(String codigoCurso, String nuevaSeccion) {
        Connection conexion = ConexionDB.obtenerConexion();
        PreparedStatement ps = null;

        try {
            String query = "UPDATE cursos SET id_seccion = (SELECT id_seccion FROM seccion WHERE nombre = ?) WHERE Codigo = ?";
            ps = conexion.prepareStatement(query);
            ps.setString(1, nuevaSeccion);
            ps.setString(2, codigoCurso);
            int filasAfectadas = ps.executeUpdate();
            return filasAfectadas > 0;
        } catch (SQLException e) {
            System.out.println("Error al actualizar la sección del curso: " + e.getMessage());
            return false;
        } finally {
            // Cerrar PreparedStatement y la conexión
        }
    }

    public boolean asignarSeccionACurso(String codigoCurso, String nuevaSeccion) {
        Connection conexion = ConexionDB.obtenerConexion();
        PreparedStatement ps = null;

        try {
            String query = "UPDATE cursos SET id_seccion = (SELECT id_seccion FROM seccion WHERE nombre = ?) WHERE Codigo = ?";
            ps = conexion.prepareStatement(query);
            ps.setString(1, nuevaSeccion);
            ps.setString(2, codigoCurso);
            int filasAfectadas = ps.executeUpdate();
            return filasAfectadas > 0;
        } catch (SQLException e) {
            System.out.println("Error al asignar la sección al curso: " + e.getMessage());
            return false;
        } finally {
            // Cerrar PreparedStatement y la conexión
        }
    }

    public boolean eliminarSeccionDeCurso(String codigoCurso) {
        Connection conexion = ConexionDB.obtenerConexion();
        PreparedStatement ps = null;

        try {
            String query = "UPDATE cursos SET id_seccion = NULL WHERE Codigo = ?";
            ps = conexion.prepareStatement(query);
            ps.setString(1, codigoCurso);
            int filasAfectadas = ps.executeUpdate();
            return filasAfectadas > 0;
        } catch (SQLException e) {
            System.out.println("Error al eliminar la sección del curso: " + e.getMessage());
            return false;
        } finally {
            // Cerrar PreparedStatement y la conexión
        }
    }

}
