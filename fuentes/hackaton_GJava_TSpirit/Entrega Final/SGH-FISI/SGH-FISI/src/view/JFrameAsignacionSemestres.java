package view;

import java.util.List;
import javax.swing.table.DefaultTableModel;
import model.Semestre;
import javax.swing.JOptionPane;
import controller.SemestreController;

public class JFrameAsignacionSemestres extends javax.swing.JFrame {

    private DefaultTableModel semestreModel;
    private final SemestreController semestreController;
    private int idSemestreEditando = -1;

    public JFrameAsignacionSemestres() {
        initComponents();
        cmbAnio.setEnabled(false); // Desactiva el comboBox al inicio
        cmbCiclo.setEnabled(false);
        semestreController = new SemestreController();
        cargarSemestresEnTabla();

        btnEditar.addActionListener((java.awt.event.ActionEvent evt) -> {
            int filaSeleccionada = tblSemestre.getSelectedRow();
            if (filaSeleccionada != -1) {
                int idSemestre = (int) tblSemestre.getValueAt(filaSeleccionada, 0);
                String anio = String.valueOf(tblSemestre.getValueAt(filaSeleccionada, 1)); // Índice 1 para la columna "Año"
                String cicloAcademico = (String) tblSemestre.getValueAt(filaSeleccionada, 2); // Índice 2 para la columna "Ciclo Académico"

                // Establecer los valores seleccionados en los ComboBox
                cmbAnio.setSelectedItem(anio);
                cmbCiclo.setSelectedItem(cicloAcademico);

                // Habilitar la edición en los ComboBox
                cmbAnio.setEnabled(true);
                cmbCiclo.setEnabled(true);

                // Guardar el ID del semestre que se está editando
                idSemestreEditando = idSemestre;
            }
        });

        btnNuevo.addActionListener((java.awt.event.ActionEvent evt) -> {
            // Limpiar y deseleccionar el JComboBox
            cmbAnio.setSelectedIndex(-1); // -1 representa ningún elemento seleccionado
            cmbCiclo.setSelectedIndex(-1);

            // Habilitar el JComboBox para la selección
            cmbAnio.setEnabled(true);
            cmbCiclo.setEnabled(true);
        });

        btnGuardar.addActionListener((java.awt.event.ActionEvent evt) -> {
            if (cmbAnio.getSelectedIndex() == -1 || cmbCiclo.getSelectedIndex() == -1) {
                JOptionPane.showMessageDialog(null, "Por favor, selecciona un año y un ciclo académico.", "Campo Vacío", JOptionPane.WARNING_MESSAGE);
            } else {
                int anio = Integer.parseInt((String) cmbAnio.getSelectedItem());
                String cicloAcademico = (String) cmbCiclo.getSelectedItem();

                if (idSemestreEditando != -1) {
                    if (semestreController.existeSemestre(anio, cicloAcademico)) {
                        JOptionPane.showMessageDialog(null, "El semestre ya existe.", "Semestre Duplicado", JOptionPane.WARNING_MESSAGE);
                    } else {
                        int opcion = JOptionPane.showConfirmDialog(null, "¿Estás seguro que deseas actualizar este semestre?", "Confirmar actualización", JOptionPane.YES_NO_OPTION);

                        if (opcion == JOptionPane.YES_OPTION) {
                            semestreController.actualizarSemestre(idSemestreEditando, anio, cicloAcademico);
                            cargarSemestresEnTabla(); // Actualiza la tabla
                            cmbAnio.setEnabled(false);
                            cmbCiclo.setEnabled(false);
                            idSemestreEditando = -1;
                        } else {
                            JOptionPane.showMessageDialog(null, "La actualización ha sido cancelada.", "Aviso", JOptionPane.INFORMATION_MESSAGE);
                        }
                    }
                } else {
                    int opcion = JOptionPane.showConfirmDialog(null, "¿Deseas agregar este nuevo semestre?", "Confirmar adición", JOptionPane.YES_NO_OPTION);

                    if (opcion == JOptionPane.YES_OPTION) {
                        if (semestreController.existeSemestre(anio, cicloAcademico)) {
                            JOptionPane.showMessageDialog(null, "El semestre ya existe.", "Semestre Duplicado", JOptionPane.WARNING_MESSAGE);
                        } else {
                            Semestre semestre = new Semestre();
                            semestre.setAnio(anio);
                            semestre.setCicloAcademico(cicloAcademico);
                            semestreController.agregarSemestre(semestre);
                            cargarSemestresEnTabla(); // Actualiza la tabla
                            cmbAnio.setEnabled(false);
                            cmbCiclo.setEnabled(false);
                        }
                    } else {
                        JOptionPane.showMessageDialog(null, "La adición ha sido cancelada.", "Aviso", JOptionPane.INFORMATION_MESSAGE);
                    }
                }
            }
        });

        btnEliminar.addActionListener((java.awt.event.ActionEvent evt) -> {
            int filaSeleccionada = tblSemestre.getSelectedRow();
            if (filaSeleccionada != -1) {
                int idSemestre = (int) tblSemestre.getValueAt(filaSeleccionada, 0);
                int opcion = JOptionPane.showConfirmDialog(null, "¿Estás seguro que deseas eliminar este semestre?", "Confirmar eliminación", JOptionPane.YES_NO_OPTION);

                if (opcion == JOptionPane.YES_OPTION) {
                    semestreController.eliminarSemestre(idSemestre);
                    cargarSemestresEnTabla();
                    // No es necesario limpiar un JComboBox, ya que no se está usando para mostrar el semestre seleccionado
                } else {
                    JOptionPane.showMessageDialog(null, "La eliminación ha sido cancelada.", "Aviso", JOptionPane.INFORMATION_MESSAGE);
                }
            } else {
                JOptionPane.showMessageDialog(null, "Por favor, selecciona un semestre para eliminar.", "Sin selección", JOptionPane.WARNING_MESSAGE);
            }
        });

    }

    private void cargarSemestresEnTabla() {
        semestreModel = new DefaultTableModel();
        semestreModel.addColumn("ID");
        semestreModel.addColumn("Año");
        semestreModel.addColumn("Ciclo Académico");
        semestreModel.addColumn("Año-Ciclo"); // Esta será tu nueva columna

        List<Semestre> semestres = semestreController.obtenerSemestres();

        for (Semestre semestre : semestres) {
            semestreModel.addRow(new Object[]{semestre.getId(), semestre.getAnio(), semestre.getCicloAcademico(), semestre.getAnio() + "-" + semestre.getCicloAcademico()});
        }

        tblSemestre.setModel(semestreModel);
    }

    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jScrollPane1 = new javax.swing.JScrollPane();
        jTable1 = new javax.swing.JTable();
        jLabel1 = new javax.swing.JLabel();
        btnNuevo = new javax.swing.JButton();
        btnEditar = new javax.swing.JButton();
        btnEliminar = new javax.swing.JButton();
        btnGuardar = new javax.swing.JButton();
        btnRetroceder = new javax.swing.JButton();
        jScrollPane2 = new javax.swing.JScrollPane();
        tblSemestre = new javax.swing.JTable();
        cmbAnio = new javax.swing.JComboBox<>();
        cmbCiclo = new javax.swing.JComboBox<>();
        jLabel2 = new javax.swing.JLabel();
        jLabel3 = new javax.swing.JLabel();

        jTable1.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {
                {null, null, null, null},
                {null, null, null, null},
                {null, null, null, null},
                {null, null, null, null}
            },
            new String [] {
                "Title 1", "Title 2", "Title 3", "Title 4"
            }
        ));
        jScrollPane1.setViewportView(jTable1);

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        jLabel1.setText("Asignación de Semestres");

        btnNuevo.setText("Nuevo");
        btnNuevo.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnNuevoActionPerformed(evt);
            }
        });

        btnEditar.setText("Editar");
        btnEditar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnEditarActionPerformed(evt);
            }
        });

        btnEliminar.setText("Eliminar");
        btnEliminar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnEliminarActionPerformed(evt);
            }
        });

        btnGuardar.setText("Guardar");
        btnGuardar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnGuardarActionPerformed(evt);
            }
        });

        btnRetroceder.setText("Retroceder");
        btnRetroceder.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnRetrocederActionPerformed(evt);
            }
        });

        tblSemestre.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {
                {null, null},
                {null, null},
                {null, null},
                {null, null}
            },
            new String [] {
                "id_semestre", "Año"
            }
        ));
        jScrollPane2.setViewportView(tblSemestre);

        cmbAnio.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "2020", "2021", "2022", "2023", "2024", "2025", "2026", "2027", "2028", "2029" }));
        cmbAnio.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                cmbAnioActionPerformed(evt);
            }
        });

        cmbCiclo.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "0", "1", "2", "3", "4", " " }));
        cmbCiclo.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                cmbCicloActionPerformed(evt);
            }
        });

        jLabel2.setText("Año");

        jLabel3.setText("Ciclo Académico");

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addGap(65, 65, 65)
                        .addComponent(btnRetroceder))
                    .addGroup(layout.createSequentialGroup()
                        .addGap(20, 20, 20)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jScrollPane2, javax.swing.GroupLayout.PREFERRED_SIZE, 488, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addGroup(layout.createSequentialGroup()
                                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                    .addComponent(btnNuevo)
                                    .addComponent(btnEditar))
                                .addGap(23, 23, 23)
                                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                    .addGroup(layout.createSequentialGroup()
                                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                            .addGroup(layout.createSequentialGroup()
                                                .addComponent(btnEliminar)
                                                .addGap(88, 88, 88)
                                                .addComponent(cmbAnio, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                                            .addGroup(layout.createSequentialGroup()
                                                .addGap(23, 23, 23)
                                                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                                                    .addComponent(jLabel2, javax.swing.GroupLayout.PREFERRED_SIZE, 37, javax.swing.GroupLayout.PREFERRED_SIZE)
                                                    .addComponent(jLabel1))))
                                        .addGap(18, 18, 18)
                                        .addComponent(jLabel3)
                                        .addGap(18, 18, 18)
                                        .addComponent(cmbCiclo, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                                    .addGroup(layout.createSequentialGroup()
                                        .addGap(6, 6, 6)
                                        .addComponent(btnGuardar)))))))
                .addContainerGap(29, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addGap(26, 26, 26)
                        .addComponent(jLabel1)
                        .addGap(15, 15, 15)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(btnEditar)
                            .addComponent(btnEliminar)
                            .addComponent(cmbAnio, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(cmbCiclo, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(jLabel2)
                            .addComponent(jLabel3))
                        .addGap(18, 18, 18)
                        .addComponent(btnNuevo))
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                        .addContainerGap()
                        .addComponent(btnGuardar)))
                .addGap(18, 18, 18)
                .addComponent(btnRetroceder)
                .addGap(18, 18, 18)
                .addComponent(jScrollPane2, javax.swing.GroupLayout.PREFERRED_SIZE, 176, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(24, Short.MAX_VALUE))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void btnEditarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnEditarActionPerformed
        // TODO add your handling code here:
        int filaSeleccionada = tblSemestre.getSelectedRow();
        if (filaSeleccionada != -1) {
            int idSemestre = (int) tblSemestre.getValueAt(filaSeleccionada, 0);
            String anio = String.valueOf((Integer) tblSemestre.getValueAt(filaSeleccionada, 1));
            String cicloAcademico = (String) tblSemestre.getValueAt(filaSeleccionada, 2);

            // Establecer los valores seleccionados en los ComboBox
            for (int i = 0; i < cmbAnio.getItemCount(); i++) {
                if (cmbAnio.getItemAt(i).equals(anio) && cmbCiclo.getItemAt(i).equals(cicloAcademico)) {
                    cmbAnio.setSelectedIndex(i);
                    cmbCiclo.setSelectedIndex(i);
                    break;
                }
            }

            // Habilitar la edición en los ComboBox
            cmbAnio.setEnabled(true);
            cmbCiclo.setEnabled(true);

            // Guardar el ID del semestre que se está editando
            idSemestreEditando = idSemestre;
        }
    }//GEN-LAST:event_btnEditarActionPerformed

    private void btnEliminarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnEliminarActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_btnEliminarActionPerformed

    private void btnNuevoActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnNuevoActionPerformed
        // TODO add your handling code here:
        // Habilitar la edición en el JComboBox
        cmbAnio.setSelectedIndex(-1); // Deseleccionar cualquier elemento seleccionado
        cmbCiclo.setSelectedIndex(-1); // Deseleccionar cualquier elemento seleccionado
        cmbAnio.setEnabled(true);
        cmbCiclo.setEnabled(true);
    }//GEN-LAST:event_btnNuevoActionPerformed

    private void btnGuardarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnGuardarActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_btnGuardarActionPerformed

    private void btnRetrocederActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnRetrocederActionPerformed
        // TODO add your handling code here:
        this.dispose();
        JFrameMain main = new JFrameMain();
        main.setVisible(true);

    }//GEN-LAST:event_btnRetrocederActionPerformed

    private void checkComboBoxes() {
        if (cmbAnio.getSelectedIndex() != -1 && cmbCiclo.getSelectedIndex() != -1) {
            btnGuardar.setEnabled(true);
        } else {
            btnGuardar.setEnabled(false);
        }
    }

    private void cmbAnioActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_cmbAnioActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_cmbAnioActionPerformed

    private void cmbCicloActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_cmbCicloActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_cmbCicloActionPerformed

    public static void main(String args[]) {

        java.awt.EventQueue.invokeLater(() -> {
            new JFrameAsignacionSemestres().setVisible(true);
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnEditar;
    private javax.swing.JButton btnEliminar;
    private javax.swing.JButton btnGuardar;
    private javax.swing.JButton btnNuevo;
    private javax.swing.JButton btnRetroceder;
    private javax.swing.JComboBox<String> cmbAnio;
    private javax.swing.JComboBox<String> cmbCiclo;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JScrollPane jScrollPane2;
    private javax.swing.JTable jTable1;
    private javax.swing.JTable tblSemestre;
    // End of variables declaration//GEN-END:variables
}
