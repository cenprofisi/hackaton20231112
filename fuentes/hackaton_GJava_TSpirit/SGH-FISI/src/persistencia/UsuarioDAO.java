/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package persistencia;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import persistencia.ConexionDB;

public class UsuarioDAO {
    public boolean validarCredenciales(String nombreUsuario, String contrasena) {
        Connection conexion = ConexionDB.obtenerConexion();
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            String query = "SELECT * FROM usuarios WHERE nombre_usuario = ? AND password = ?";
            ps = conexion.prepareStatement(query);
            ps.setString(1, nombreUsuario);
            ps.setString(2, contrasena);

            rs = ps.executeQuery();

            return rs.next(); // Si encuentra resultados, las credenciales son válidas
        } catch (SQLException e) {
            System.out.println("Error al validar credenciales: " + e.getMessage());
            return false;
        } finally {
            // Cerrar ResultSet, PreparedStatement y la conexión
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (conexion != null) conexion.close();
            } catch (SQLException e) {
                System.out.println("Error al cerrar recursos: " + e.getMessage());
            }
        }
    }
}

