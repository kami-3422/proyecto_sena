
package proyectosena.Vista;
import proyectosena.Modelo.ConexionBD;
import javax.swing.*;
import java.awt.event.ActionEvent;
import java.sql.Connection;
import java.sql.PreparedStatement;

public class FormularioVista extends javax.swing.JPanel {

    public FormularioVista() {
        initComponents();
    }

 
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        cmbCategoria = new javax.swing.JComboBox<>();
        cmbPrioridad = new javax.swing.JComboBox<>();
        txtUbicacion = new javax.swing.JTextField();
        txtDescripcion = new javax.swing.JTextField();
        txtFechaCreacion = new javax.swing.JTextField();
        btnGuardar = new javax.swing.JButton();

        cmbCategoria.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "Item 1", "Item 2", "Item 3", "Item 4" }));

        cmbPrioridad.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "Item 1", "Item 2", "Item 3", "Item 4" }));

        txtUbicacion.setText("Ubicacion");

        txtDescripcion.setText("Descripcion");

        txtFechaCreacion.setText("Fecha Creacion");

        btnGuardar.setText("Guardar Reporte");
        btnGuardar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnGuardarActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(this);
        this.setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(138, 138, 138)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(btnGuardar)
                    .addComponent(txtFechaCreacion, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(txtDescripcion, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(txtUbicacion, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(cmbPrioridad, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(cmbCategoria, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addContainerGap(146, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(24, 24, 24)
                .addComponent(cmbCategoria, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(18, 18, 18)
                .addComponent(cmbPrioridad, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(28, 28, 28)
                .addComponent(txtUbicacion, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(28, 28, 28)
                .addComponent(txtDescripcion, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(27, 27, 27)
                .addComponent(txtFechaCreacion, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(18, 18, 18)
                .addComponent(btnGuardar)
                .addContainerGap(24, Short.MAX_VALUE))
        );
    }// </editor-fold>//GEN-END:initComponents

    private void btnGuardarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnGuardarActionPerformed

    try {
        String categoria = cmbCategoria.getSelectedItem().toString();
        String prioridad = cmbPrioridad.getSelectedItem().toString();
        String ubicacion = txtUbicacion.getText();
        String descripcion = txtDescripcion.getText();
        String fecha = txtFechaCreacion.getText(); // YYYY-MM-DD

        int idUsuario = 1;
        int idCategoria = obtenerIdCategoria(categoria);
        int idPrioridad = obtenerIdPrioridad(prioridad);
        int idEstado = 1;
        int idUbicacion = 1;
        int idNotificacion = 1;
        int idAsignacion = 1;

        Connection con = ConexionBD.getConexion();
        String sql = "INSERT INTO reportes (Id_usuario_reporte, Id_categoria_reporte, Id_prioridad_reporte, Id_estado_reporte, Id_ubicacion_reporte, Id_notificacion_reporte, Id_asignacion_reporte, Descripcion_reporte, Fechacreacion_reporte) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, idUsuario);
        ps.setInt(2, idCategoria);
        ps.setInt(3, idPrioridad);
        ps.setInt(4, idEstado);
        ps.setInt(5, idUbicacion);
        ps.setInt(6, idNotificacion);
        ps.setInt(7, idAsignacion);
        ps.setString(8, descripcion);
        ps.setString(9, fecha);

        int filas = ps.executeUpdate();
        if (filas > 0) {
            JOptionPane.showMessageDialog(this, "✅ Reporte guardado en la base de datos.");
        } else {
            JOptionPane.showMessageDialog(this, "❌ No se pudo guardar el reporte.");
        }

        ps.close();
        con.close();
    } catch (Exception e) {
        e.printStackTrace();
        JOptionPane.showMessageDialog(this, "❌ Error al guardar: " + e.getMessage());
    }
    }//GEN-LAST:event_btnGuardarActionPerformed


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnGuardar;
    private javax.swing.JComboBox<String> cmbCategoria;
    private javax.swing.JComboBox<String> cmbPrioridad;
    private javax.swing.JTextField txtDescripcion;
    private javax.swing.JTextField txtFechaCreacion;
    private javax.swing.JTextField txtUbicacion;
    // End of variables declaration//GEN-END:variables

    private int obtenerIdCategoria(String categoriaTexto) {
    switch (categoriaTexto.toLowerCase()) {
        case "infraestructura": return 1;
        case "tecnología": return 2;
        case "seguridad": return 3;
        default: return 0;
    }
}

private int obtenerIdPrioridad(String prioridadTexto) {
    switch (prioridadTexto.toLowerCase()) {
        case "alta": return 1;
        case "media": return 2;
        case "baja": return 3;
        default: return 0;
    }
}

}
