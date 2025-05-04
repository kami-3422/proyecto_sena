package proyectosena.Modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Usuario {

    private String nombreUsuario;
    private String contrasena;

    public Usuario(String nombreUsuario, String contrasena) {
        this.nombreUsuario = nombreUsuario;
        this.contrasena = contrasena;
    }

    // Método estático para validar directamente desde LoginControlador
    public static boolean validar(String nombreUsuario, String contrasena) {
        Connection conn = ConexionBD.getConexion();
        String sql = "SELECT * FROM usuarios WHERE Nombres_usuario = ? AND clave_usuario = ?";
        
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, nombreUsuario);
            stmt.setString(2, contrasena);
            ResultSet rs = stmt.executeQuery();
            return rs.next();  // Devuelve true si encontró un usuario válido
        } catch (SQLException e) {
            System.err.println("❌ Error al validar usuario: " + e.getMessage());
            return false;
        }
    }

    // (Opcional: puedes mantener este método si lo usas en otro lado)
    public boolean validar() {
        return validar(this.nombreUsuario, this.contrasena);
    }
}

