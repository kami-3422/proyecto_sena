package proyectosena.Controlador;

import proyectosena.Modelo.Usuario;
import proyectosena.Vista.LoginVista;
import proyectosena.Vista.FormularioVista;
import javax.swing.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class LoginControlador {
    private LoginVista vista;
    private JFrame ventana;

    public LoginControlador(LoginVista vista, JFrame ventana) {
        this.vista = vista;
        this.ventana = ventana;

        this.vista.btnLogin.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                validarLogin();
            }
        });
    }

    private void validarLogin() {
        String usuario = vista.txtUsuario.getText();
        String clave = new String(vista.txtContrasena.getPassword());

        if (Usuario.validar(usuario, clave)) {


            JOptionPane.showMessageDialog(vista, "✅ Bienvenido, " + usuario);

            // Cambiar panel de LoginVista a FormularioVista
            ventana.setContentPane(new FormularioVista());
            ventana.revalidate();
            ventana.repaint();
        } else {
            JOptionPane.showMessageDialog(vista, "❌ Usuario o contraseña incorrectos");
        }
     }
     }

