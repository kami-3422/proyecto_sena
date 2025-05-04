package proyectosena;

import javax.swing.JFrame;
import proyectosena.Vista.LoginVista;

public class ProyectoSena {

    public static void main(String[] args) {
        javax.swing.SwingUtilities.invokeLater(() -> {
            JFrame ventana = new JFrame("Proyecto SENA");
            ventana.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
            ventana.setSize(1000, 1000);
            ventana.setLocationRelativeTo(null);

            ventana.setContentPane(new LoginVista(ventana));

            ventana.setVisible(true);
        });
    }
}

