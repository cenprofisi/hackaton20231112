package view;
import java.awt.Color;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.swing.DefaultComboBoxModel;
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableCellRenderer;
import javax.swing.table.DefaultTableModel;
import model.Curso;
import model.CursoHorario;
import model.Seccion;
import persistencia.CursoDAO;
import persistencia.HorarioDAO;
import persistencia.SeccionDAO;
public class JFrameAsignacionHorarios extends javax.swing.JFrame {
    private final CursoDAO cursoDAO = new CursoDAO();
    private final SeccionDAO seccionDAO = new SeccionDAO();
    private final HorarioDAO horarioDAO = new HorarioDAO();
    private List<CursoHorario> cursosHorarios; // Assuming you have a class to represent CursoHorario
    private DefaultTableModel tableModel;
    public JFrameAsignacionHorarios() {
        initComponents();
        initTable();
        cargarCursos(); // Load courses when the frame is initialized
        cargarSecciones(); 
        cargarHorarios();
        cargarDias();  // Add this line to load days

    }
    private void initTable() {
        // Initialize the JTable
        tableModel = (DefaultTableModel) jTable1.getModel();
    }
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jLabel1 = new javax.swing.JLabel();
        jLabel2 = new javax.swing.JLabel();
        cmbCurso = new javax.swing.JComboBox<>();
        cmbHorario = new javax.swing.JComboBox<>();
        jLabel3 = new javax.swing.JLabel();
        jScrollPane1 = new javax.swing.JScrollPane();
        jTable1 = new javax.swing.JTable();
        jLabel4 = new javax.swing.JLabel();
        cmbSeccion = new javax.swing.JComboBox<>();
        jLabel5 = new javax.swing.JLabel();
        cmbdia = new javax.swing.JComboBox<>();
        jButtonAgregar = new javax.swing.JButton();
        jButtonBorrar = new javax.swing.JButton();
        btnRetroceder = new javax.swing.JButton();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        jLabel1.setText("Asignación de Horarios");

        jLabel2.setText("Curso");

        cmbCurso.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "Selecciona" }));
        cmbCurso.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                cmbCursoActionPerformed(evt);
            }
        });

        cmbHorario.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "Selecciona" }));
        cmbHorario.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                cmbHorarioActionPerformed(evt);
            }
        });

        jLabel3.setText("Horario");

        jTable1.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {
                {"8am - 10am", null, null, null, null, null, null},
                {"10am - 12pm", null, null, null, null, null, null},
                {"12pm - 2pm", null, null, null, null, null, null},
                {"2pm - 4pm", null, null, null, null, null, null},
                {"4pm - 6pm", null, null, null, null, null, null},
                {"6pm - 8pm", null, null, null, null, null, null},
                {"8pm - 10pm", null, null, null, null, null, null}
            },
            new String [] {
                "Hora", "Lunes", "Martes", "Miércoles", "Jueves", "Viernes", "Sábado"
            }
        ));
        jScrollPane1.setViewportView(jTable1);

        jLabel4.setText("Sección");

        cmbSeccion.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "Selecciona" }));
        cmbSeccion.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                cmbSeccionActionPerformed(evt);
            }
        });

        jLabel5.setText("Día");

        cmbdia.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "Selecciona" }));
        cmbdia.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                cmbdiaActionPerformed(evt);
            }
        });

        jButtonAgregar.setText("Agregar");
        jButtonAgregar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButtonAgregarActionPerformed(evt);
            }
        });

        jButtonBorrar.setText("Borrar");
        jButtonBorrar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButtonBorrarActionPerformed(evt);
            }
        });

        btnRetroceder.setText("Retroceder");
        btnRetroceder.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnRetrocederActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jScrollPane1)
            .addGroup(layout.createSequentialGroup()
                .addGap(40, 40, 40)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                        .addComponent(jLabel1)
                        .addGroup(layout.createSequentialGroup()
                            .addComponent(jLabel2, javax.swing.GroupLayout.PREFERRED_SIZE, 37, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addGap(151, 151, 151)))
                    .addGroup(layout.createSequentialGroup()
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jLabel3)
                            .addComponent(jLabel4))
                        .addGap(27, 27, 27)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(layout.createSequentialGroup()
                                .addComponent(cmbHorario, javax.swing.GroupLayout.PREFERRED_SIZE, 121, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addGap(60, 60, 60)
                                .addComponent(jLabel5)
                                .addGap(28, 28, 28)
                                .addComponent(cmbdia, javax.swing.GroupLayout.PREFERRED_SIZE, 121, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addGap(104, 104, 104)
                                .addComponent(jButtonAgregar)
                                .addGap(73, 73, 73)
                                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                    .addComponent(btnRetroceder)
                                    .addComponent(jButtonBorrar)))
                            .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                                .addComponent(cmbCurso, javax.swing.GroupLayout.PREFERRED_SIZE, 120, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addComponent(cmbSeccion, javax.swing.GroupLayout.PREFERRED_SIZE, 121, javax.swing.GroupLayout.PREFERRED_SIZE)))))
                .addContainerGap(165, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(22, 22, 22)
                .addComponent(jLabel1)
                .addGap(2, 2, 2)
                .addComponent(btnRetroceder, javax.swing.GroupLayout.PREFERRED_SIZE, 32, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 48, Short.MAX_VALUE)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel2)
                    .addComponent(cmbCurso, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(23, 23, 23)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jLabel4, javax.swing.GroupLayout.Alignment.TRAILING)
                    .addComponent(cmbSeccion, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(18, 18, 18)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel3)
                    .addComponent(cmbHorario, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel5)
                    .addComponent(cmbdia, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jButtonAgregar)
                    .addComponent(jButtonBorrar))
                .addGap(42, 42, 42)
                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 427, javax.swing.GroupLayout.PREFERRED_SIZE))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void cmbCursoActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_cmbCursoActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_cmbCursoActionPerformed

    private void cmbHorarioActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_cmbHorarioActionPerformed

        }//GEN-LAST:event_cmbHorarioActionPerformed


private void cargarDias() {
    // Assuming the days are hardcoded in the table and not dynamic
    String[] dias = {"Lunes", "Martes", "Miércoles", "Jueves", "Viernes", "Sábado"};
    DefaultComboBoxModel<String> model = new DefaultComboBoxModel<>(dias);
    cmbdia.setModel(model);
}

    private void cmbSeccionActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_cmbSeccionActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_cmbSeccionActionPerformed

    private void cmbdiaActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_cmbdiaActionPerformed
    

    }//GEN-LAST:event_cmbdiaActionPerformed

    private void jButtonAgregarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButtonAgregarActionPerformed
      updateTable();  // TODO add your handling code here:
    }//GEN-LAST:event_jButtonAgregarActionPerformed

    private void jButtonBorrarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButtonBorrarActionPerformed
        // TODO add your handling code here:
           // Get the selected row and column indices
    int selectedRow = jTable1.getSelectedRow();
    int selectedColumn = jTable1.getSelectedColumn();

    // Check if a cell is selected and it's not in the first column
    if (selectedRow != -1 && selectedColumn != -1 && selectedColumn > 0) {
        // Clear the value in the selected cell
        jTable1.setValueAt(null, selectedRow, selectedColumn);

        // Optionally, you can reset the background color to the default
        jTable1.getColumnModel().getColumn(selectedColumn).setCellRenderer(new DefaultTableCellRenderer());

        // Notify the table model that the data has changed
        tableModel.fireTableCellUpdated(selectedRow, selectedColumn);
    } else {
        // Display a message indicating that no valid cell is selected
        JOptionPane.showMessageDialog(this, "Please select a valid cell (excluding the first column) to delete.", "No Valid Cell Selected", JOptionPane.WARNING_MESSAGE);
    }
    }//GEN-LAST:event_jButtonBorrarActionPerformed

    private void btnRetrocederActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnRetrocederActionPerformed
        // TODO add your handling code here:
        this.dispose();
        JFrameMain main = new JFrameMain();
        main.setVisible(true);
    }//GEN-LAST:event_btnRetrocederActionPerformed
private void updateTable() {
    // Check if both horario and dia are selected
   if (cmbHorario.getSelectedIndex() != 0 && cmbdia.getSelectedIndex() != 0) {
        // Get the selected horario and dia
        String selectedHorario = cmbHorario.getSelectedItem().toString();
        String selectedDia = cmbdia.getSelectedItem().toString();

        // Find the indices in the tables
        int horarioIndex = horarioDAO.obtenerHorarioIndex(selectedHorario);
        int diaIndex = Arrays.asList("Lunes", "Martes", "Miércoles", "Jueves", "Viernes", "Sábado").indexOf(selectedDia);

        // Update the corresponding cell in the table
        if (horarioIndex != -1 && diaIndex != -1) {
    jTable1.getCellRenderer(horarioIndex, diaIndex + 1).getTableCellRendererComponent(jTable1,
            null, false, false, horarioIndex, diaIndex + 1).setBackground(Color.GREEN);
        }
   }
}
    private void cargarCursos() {
        List<Curso> cursos = cursoDAO.obtenerCursos();
        for (Curso curso : cursos) {
            cmbCurso.addItem(curso.getNombre());
        }
    }
    private void cargarSecciones() {
        // Assuming seccionDAO is a class to retrieve Seccion objects from a database
        List<Seccion> secciones = seccionDAO.obtenerSecciones();
        for (Seccion seccion : secciones) {
            cmbSeccion.addItem(seccion.getNombre());
        }
    }
    
    private void cargarHorarios() {
        List<CursoHorario> horarios = horarioDAO.obtenerHorarios();
        for (CursoHorario horario : horarios) {
            cmbHorario.addItem(horario.getHorario());
        }
    }

    public static void main(String args[]) {

        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new JFrameAsignacionHorarios().setVisible(true);
            }
        });
    }


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnRetroceder;
    private javax.swing.JComboBox<String> cmbCurso;
    private javax.swing.JComboBox<String> cmbHorario;
    private javax.swing.JComboBox<String> cmbSeccion;
    private javax.swing.JComboBox<String> cmbdia;
    private javax.swing.JButton jButtonAgregar;
    private javax.swing.JButton jButtonBorrar;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JTable jTable1;
    // End of variables declaration//GEN-END:variables


}
