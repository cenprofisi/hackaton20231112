package controller;

import persistencia.UsuarioDAO;

public class LoginController {
    private UsuarioDAO usuarioDAO = new UsuarioDAO();

    public String autenticar(String nombreUsuario, String contrasena) {
        return usuarioDAO.obtenerRol(nombreUsuario, contrasena);
    }
}

