package view;

import java.util.List;
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableModel;
import model.Ciclo;
import model.Curso;
import model.Seccion;
import persistencia.CursoDAO;
import persistencia.SeccionDAO;
import persistencia.CicloDAO;

public class JFrameAsignacionGrupos extends javax.swing.JFrame {

    private final CursoDAO cursoDAO = new CursoDAO();
    private final SeccionDAO seccionDAO = new SeccionDAO();
    private final CicloDAO cicloDAO = new CicloDAO();

    public JFrameAsignacionGrupos() {
        initComponents();
        cargarCursos();
        cargarSecciones();
        cargarCiclos();
    }

    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jLabel1 = new javax.swing.JLabel();
        jLabel2 = new javax.swing.JLabel();
        jLabel3 = new javax.swing.JLabel();
        cmbSeccion = new javax.swing.JComboBox<>();
        btnAgregar = new javax.swing.JButton();
        btnRetroceder = new javax.swing.JButton();
        cmbCiclo = new javax.swing.JComboBox<>();
        jLabel4 = new javax.swing.JLabel();
        jScrollPane1 = new javax.swing.JScrollPane();
        tblSecciones = new javax.swing.JTable();
        btnBuscar = new javax.swing.JButton();
        btnEditar = new javax.swing.JButton();
        btnEliminar = new javax.swing.JButton();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        jLabel1.setText("Asignación de Secciones");

        jLabel2.setText("Selecciona una fila para Asignar, Editar o Eliminar una sección");

        jLabel3.setText("Sección");

        cmbSeccion.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                cmbSeccionActionPerformed(evt);
            }
        });

        btnAgregar.setText("Asignar Grupo");
        btnAgregar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnAgregarActionPerformed(evt);
            }
        });

        btnRetroceder.setText("Retroceder");
        btnRetroceder.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnRetrocederActionPerformed(evt);
            }
        });

        cmbCiclo.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "Seleccione" }));
        cmbCiclo.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                cmbCicloActionPerformed(evt);
            }
        });

        jLabel4.setText("Ciclo");

        tblSecciones.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {
                {null, null, null, null, null},
                {null, null, null, null, null},
                {null, null, null, null, null},
                {null, null, null, null, null}
            },
            new String [] {
                "código", "Nombre", "Cantidad Alumnos", "Plan de Estudios", "Sección"
            }
        ));
        jScrollPane1.setViewportView(tblSecciones);

        btnBuscar.setText("Buscar");
        btnBuscar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnBuscarActionPerformed(evt);
            }
        });

        btnEditar.setText("Editar Grupo");
        btnEditar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnEditarActionPerformed(evt);
            }
        });

        btnEliminar.setText("Eliminar Grupo");
        btnEliminar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnEliminarActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(23, 23, 23)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jScrollPane1)
                    .addGroup(layout.createSequentialGroup()
                        .addGap(12, 12, 12)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(layout.createSequentialGroup()
                                .addComponent(jLabel4, javax.swing.GroupLayout.PREFERRED_SIZE, 37, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addGap(31, 31, 31)
                                .addComponent(cmbCiclo, javax.swing.GroupLayout.PREFERRED_SIZE, 120, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addGap(34, 34, 34)
                                .addComponent(btnBuscar)
                                .addGap(35, 35, 35)
                                .addComponent(btnRetroceder))
                            .addGroup(layout.createSequentialGroup()
                                .addComponent(jLabel2)
                                .addGap(26, 26, 26)
                                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                    .addComponent(jLabel3)
                                    .addGroup(layout.createSequentialGroup()
                                        .addGap(67, 67, 67)
                                        .addComponent(cmbSeccion, javax.swing.GroupLayout.PREFERRED_SIZE, 121, javax.swing.GroupLayout.PREFERRED_SIZE)))
                                .addGap(18, 18, 18)
                                .addComponent(btnAgregar)
                                .addGap(18, 18, 18)
                                .addComponent(btnEditar)
                                .addGap(18, 18, 18)
                                .addComponent(btnEliminar)))
                        .addGap(0, 0, Short.MAX_VALUE)))
                .addContainerGap())
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                .addContainerGap(494, Short.MAX_VALUE)
                .addComponent(jLabel1)
                .addGap(370, 370, 370))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(20, 20, 20)
                .addComponent(jLabel1)
                .addGap(16, 16, 16)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(cmbCiclo, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel4)
                    .addComponent(btnBuscar)
                    .addComponent(btnRetroceder))
                .addGap(18, 18, 18)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel2)
                    .addComponent(jLabel3)
                    .addComponent(cmbSeccion, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(btnAgregar)
                    .addComponent(btnEditar)
                    .addComponent(btnEliminar))
                .addGap(54, 54, 54)
                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 307, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(85, Short.MAX_VALUE))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void cmbSeccionActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_cmbSeccionActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_cmbSeccionActionPerformed

    private void btnAgregarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnAgregarActionPerformed
        // TODO add your handling code here:
        //String cursoSeleccionado = cmbCurso.getSelectedItem().toString();
        String seccionSeleccionada = cmbSeccion.getSelectedItem().toString();

        int filaSeleccionada = tblSecciones.getSelectedRow();
        if (filaSeleccionada != -1) {
            DefaultTableModel modelo = (DefaultTableModel) tblSecciones.getModel();
            modelo.setValueAt(seccionSeleccionada, filaSeleccionada, 4); // Suponiendo que 4 es la columna de sección
            // Asignar la sección a la base de datos usando el método correspondiente de CursoDAO
            String codigoCurso = obtenerCodigoCursoDesdeTabla(filaSeleccionada);
            boolean asignacionExitosa = cursoDAO.asignarSeccionACurso(codigoCurso, seccionSeleccionada);

            if (asignacionExitosa) {
                JOptionPane.showMessageDialog(null, "Sección asignada al curso en la base de datos");
            } else {
                JOptionPane.showMessageDialog(null, "Error al asignar la sección al curso en la base de datos");
            }
        } else {
            JOptionPane.showMessageDialog(null, "Por favor, seleccione una fila para agregar la sección.");
        }
    }//GEN-LAST:event_btnAgregarActionPerformed

    private void btnRetrocederActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnRetrocederActionPerformed
        // TODO add your handling code here:
        this.dispose();
        JFrameMain main = new JFrameMain();
        main.setVisible(true);
    }//GEN-LAST:event_btnRetrocederActionPerformed

    private void cmbCicloActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_cmbCicloActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_cmbCicloActionPerformed

    private void btnBuscarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnBuscarActionPerformed
        String nombreCicloSeleccionado = cmbCiclo.getSelectedItem().toString();
        Ciclo cicloSeleccionado = null;

        for (Ciclo ciclo : cicloDAO.obtenerCiclos()) {
            if (ciclo.getNombre().equals(nombreCicloSeleccionado)) {
                cicloSeleccionado = ciclo;
                break;
            }
        }

        if (cicloSeleccionado != null) {
            int idCicloSeleccionado = cicloSeleccionado.getIdCiclo();
            cargarCursosPorCiclo(idCicloSeleccionado);
        } else {
            JOptionPane.showMessageDialog(null, "Ciclo no encontrado");
        }
    }//GEN-LAST:event_btnBuscarActionPerformed

    private void btnEditarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnEditarActionPerformed
        // TODO add your handling code here:
        int filaSeleccionada = tblSecciones.getSelectedRow();

        if (filaSeleccionada != -1) {
            String codigoCurso = obtenerCodigoCursoDesdeTabla(filaSeleccionada);
            String seccionSeleccionada = cmbSeccion.getSelectedItem().toString(); // Nueva sección seleccionada

            boolean actualizacionExitosa = cursoDAO.actualizarSeccionCurso(codigoCurso, seccionSeleccionada);

            if (actualizacionExitosa) {
                DefaultTableModel modelo = (DefaultTableModel) tblSecciones.getModel();
                modelo.setValueAt(seccionSeleccionada, filaSeleccionada, 4); // Suponiendo que 4 es la columna de sección
                JOptionPane.showMessageDialog(null, "Sección actualizada en la base de datos");
            } else {
                JOptionPane.showMessageDialog(null, "Error al actualizar la sección en la base de datos");
            }
        } else {
            JOptionPane.showMessageDialog(null, "Por favor, seleccione una fila para editar la sección.");
        }
    }//GEN-LAST:event_btnEditarActionPerformed

    private void btnEliminarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnEliminarActionPerformed
        // TODO add your handling code here:
        int filaSeleccionada = tblSecciones.getSelectedRow();
        if (filaSeleccionada != -1) {
            DefaultTableModel modelo = (DefaultTableModel) tblSecciones.getModel();
            modelo.setValueAt("", filaSeleccionada, 4); // Suponiendo que 4 es la columna de sección
            // Eliminar la sección del curso en la base de datos usando el método correspondiente de CursoDAO
            String codigoCurso = obtenerCodigoCursoDesdeTabla(filaSeleccionada);
            boolean eliminacionExitosa = cursoDAO.eliminarSeccionDeCurso(codigoCurso);

            if (eliminacionExitosa) {
                JOptionPane.showMessageDialog(null, "Sección eliminada del curso en la base de datos");
            } else {
                JOptionPane.showMessageDialog(null, "Error al eliminar la sección del curso en la base de datos");
            }
        } else {
            JOptionPane.showMessageDialog(null, "Por favor, seleccione una fila para eliminar la sección.");
        }
    }//GEN-LAST:event_btnEliminarActionPerformed

    public static void main(String args[]) {

        java.awt.EventQueue.invokeLater(() -> {
            new JFrameAsignacionGrupos().setVisible(true);
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnAgregar;
    private javax.swing.JButton btnBuscar;
    private javax.swing.JButton btnEditar;
    private javax.swing.JButton btnEliminar;
    private javax.swing.JButton btnRetroceder;
    private javax.swing.JComboBox<String> cmbCiclo;
    private javax.swing.JComboBox<String> cmbSeccion;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JTable tblSecciones;
    // End of variables declaration//GEN-END:variables

    private void cargarCursos() {
        List<Curso> cursos = cursoDAO.obtenerCursos();
    }

    private void cargarCursosPorCiclo(int idCiclo) {
        List<Curso> cursos = cursoDAO.obtenerCursosPorCiclo(idCiclo);
        //cmbCurso.removeAllItems(); // Limpiamos el combo box de cursos
        DefaultTableModel modelo = (DefaultTableModel) tblSecciones.getModel();
        modelo.setRowCount(0);

        for (Curso curso : cursos) {
            modelo.addRow(new Object[]{curso.getCodigo(), curso.getNombre(), curso.getCantidadAlumnos(), curso.getPlanEstudios(), curso.getSeccion()});
        }
    }

    private void cargarSecciones() {
        List<Seccion> secciones = seccionDAO.obtenerSecciones();
        secciones.forEach(seccion -> cmbSeccion.addItem(seccion.getNombre()));
    }

    private void cargarCiclos() {
        // Limpiamos el combo box antes de agregar los nuevos elementos
        cmbCiclo.removeAllItems();

        // Obtenemos la lista de ciclos
        List<Ciclo> ciclos = cicloDAO.obtenerCiclos();

        // Agregamos instancias de Ciclo al combo box
        for (Ciclo ciclo : ciclos) {
            cmbCiclo.addItem(ciclo.toString());
        }
    }

    private String obtenerCodigoCursoDesdeTabla(int filaSeleccionada) {
        return tblSecciones.getValueAt(filaSeleccionada, 0).toString();
    }
}
