package persistencia;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import persistencia.ConexionDB;

public class UsuarioDAO {

    public String validarCredenciales(String nombreUsuario, String contrasena) {
        Connection conexion = ConexionDB.obtenerConexion();
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            String query = "SELECT rol FROM usuarios WHERE nombre_usuario = ? AND password = ?";
            ps = conexion.prepareStatement(query);
            ps.setString(1, nombreUsuario);
            ps.setString(2, contrasena);

            rs = ps.executeQuery();

            if (rs.next()) {
                String rol = rs.getString("rol");
                return rol; // Si las credenciales son válidas, se devuelve el rol
            }
        } catch (SQLException e) {
            System.out.println("Error al validar credenciales: " + e.getMessage());
        } finally {
            // Cerrar ResultSet, PreparedStatement y la conexión
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (conexion != null) {
                    conexion.close();
                }
            } catch (SQLException e) {
                System.out.println("Error al cerrar recursos: " + e.getMessage());
            }
        }

        return null; // Si las credenciales no son válidas o hay errores, se retorna null
    }

    public String obtenerRol(String nombreUsuario, String contrasena) {
        Connection conexion = ConexionDB.obtenerConexion();
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            String query = "SELECT nombre_rol FROM usuarios u INNER JOIN roles r ON u.id_rol = r.id_rol WHERE u.nombre_usuario = ? AND u.password = ?";
            ps = conexion.prepareStatement(query);
            ps.setString(1, nombreUsuario);
            ps.setString(2, contrasena);

            rs = ps.executeQuery();

            if (rs.next()) {
                String nombreRol = rs.getString("nombre_rol");
                return nombreRol; // Devuelve el nombre del rol si las credenciales son válidas
            }
        } catch (SQLException e) {
            System.out.println("Error al obtener el rol: " + e.getMessage());
        } finally {
            // Cerrar ResultSet, PreparedStatement y la conexión
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (conexion != null) {
                    conexion.close();
                }
            } catch (SQLException e) {
                System.out.println("Error al cerrar recursos: " + e.getMessage());
            }
        }

        return null; // Retorna null si las credenciales son inválidas o hay un error
    }

}
