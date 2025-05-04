package proyectosena.Modelo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConexionBD {

    private static final String URL = "jdbc:mysql://localhost:3306/proyecto_sena";
    private static final String USER = "root";  
    private static final String PASSWORD = "";  

    private static Connection conexion;

   
    public static Connection getConexion() {
        if (conexion == null) {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conexion = DriverManager.getConnection(URL, USER, PASSWORD);
                System.out.println("✅ Conexión exitosa a la base de datos.");
            } catch (ClassNotFoundException | SQLException e) {
                System.err.println("❌ Error al conectar: " + e.getMessage());
            }
        }
        return conexion;
    }

  
    public static void cerrarConexion() {
        try {
            if (conexion != null && !conexion.isClosed()) {
                conexion.close();
                System.out.println("🔒 Conexión cerrada.");
            }
        } catch (SQLException e) {
            System.err.println("❌ Error al cerrar conexión: " + e.getMessage());
        }
    }
}
