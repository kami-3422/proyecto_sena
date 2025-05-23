
package proyectosena.Vista;

import javax.swing.JFrame;
import proyectosena.Controlador.LoginControlador;
import proyectosena.Modelo.Usuario;
import java.awt.Dimension;


public class LoginVista extends javax.swing.JPanel {
    
private JFrame ventanaPrincipal;
public LoginVista(JFrame ventana) {
    this.ventanaPrincipal = ventana;
    initComponents();

    LoginControlador loginControlador = new LoginControlador(this, ventanaPrincipal);
}
    public LoginVista() {
        initComponents();
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jLabel1 = new javax.swing.JLabel();
        txtUsuario = new javax.swing.JTextField();
        jLabel2 = new javax.swing.JLabel();
        txtContrasena = new javax.swing.JPasswordField();
        btnLogin = new javax.swing.JButton();
        lblMensaje = new javax.swing.JLabel();

        setPreferredSize(new java.awt.Dimension(1000, 1000));

        jLabel1.setText("Usuario:");

        txtUsuario.setColumns(20);
        txtUsuario.setPreferredSize(new java.awt.Dimension(200, 30));

        jLabel2.setText("Contraseña:");

        txtContrasena.setText("jPasswordField1");
        txtContrasena.setPreferredSize(new java.awt.Dimension(200, 30));
        txtContrasena.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txtContrasenaActionPerformed(evt);
            }
        });

        btnLogin.setText("Iniciar Sesión");
        btnLogin.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnLoginActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(this);
        this.setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(247, 247, 247)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(btnLogin)
                    .addComponent(txtContrasena, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel1)
                    .addComponent(txtUsuario, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                        .addComponent(lblMensaje)
                        .addComponent(jLabel2)))
                .addContainerGap(152, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(47, 47, 47)
                .addComponent(jLabel1)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(txtUsuario, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(53, 53, 53)
                .addComponent(lblMensaje)
                .addGap(48, 48, 48)
                .addComponent(jLabel2)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(txtContrasena, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(46, 46, 46)
                .addComponent(btnLogin)
                .addContainerGap(82, Short.MAX_VALUE))
        );
    }// </editor-fold>//GEN-END:initComponents

    private void btnLoginActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnLoginActionPerformed
       String usuario = txtUsuario.getText();
String contrasena = String.valueOf(txtContrasena.getPassword());

Usuario u = new Usuario(usuario, contrasena);

if (u.validar()) {
    // Login exitoso
    lblMensaje.setText("✔ Bienvenido " + usuario);
    
    // Aquí puedes cambiar al panel del formulario (FormularioVista)
    // Ejemplo (si usas CardLayout o JFrame con setContentPane):
    // JFrame frame = (JFrame) SwingUtilities.getWindowAncestor(this);
    // frame.setContentPane(new FormularioVista());
    // frame.revalidate();

} else {
    lblMensaje.setText("❌ Usuario o contraseña incorrectos.");
}

    }//GEN-LAST:event_btnLoginActionPerformed

    private void txtContrasenaActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txtContrasenaActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_txtContrasenaActionPerformed


    // Variables declaration - do not modify//GEN-BEGIN:variables
    public javax.swing.JButton btnLogin;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel lblMensaje;
    public javax.swing.JPasswordField txtContrasena;
    public javax.swing.JTextField txtUsuario;
    // End of variables declaration//GEN-END:variables
}
