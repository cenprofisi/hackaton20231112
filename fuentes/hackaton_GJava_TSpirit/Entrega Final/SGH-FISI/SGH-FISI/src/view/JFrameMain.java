package view;

public class JFrameMain extends javax.swing.JFrame {

    public JFrameMain() {
        initComponents();
        btnSemestre.setVisible(false);
        btnCursos.setVisible(false);
        btnEditarGrupos.setVisible(false);
        btnEditarHorarios.setVisible(false);
        btnEditarSalones.setVisible(false);
        btnVerSalones.setVisible(false);
        btnVerHorarios.setVisible(false);
        btnVerGrupos.setVisible(false);
    }

    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jButton1 = new javax.swing.JButton();
        jLabel1 = new javax.swing.JLabel();
        jLabel2 = new javax.swing.JLabel();
        jLabel3 = new javax.swing.JLabel();
        btnVerGrupos = new javax.swing.JButton();
        btnEditarGrupos = new javax.swing.JButton();
        btnVerHorarios = new javax.swing.JButton();
        btnEditarHorarios = new javax.swing.JButton();
        btnVerSalones = new javax.swing.JButton();
        btnEditarSalones = new javax.swing.JButton();
        jLabel4 = new javax.swing.JLabel();
        btnSalir = new javax.swing.JButton();
        jLabel5 = new javax.swing.JLabel();
        jLabel6 = new javax.swing.JLabel();
        btnSemestre = new javax.swing.JButton();
        btnCursos = new javax.swing.JButton();

        jButton1.setText("jButton1");

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        jLabel1.setText("Asignación de Grupos");

        jLabel2.setText("Asignación de Horarios");

        jLabel3.setText("Asignación de Salones");

        btnVerGrupos.setText("Ver");
        btnVerGrupos.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnVerGruposActionPerformed(evt);
            }
        });

        btnEditarGrupos.setText("Editar");
        btnEditarGrupos.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnEditarGruposActionPerformed(evt);
            }
        });

        btnVerHorarios.setText("Ver");
        btnVerHorarios.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnVerHorariosActionPerformed(evt);
            }
        });

        btnEditarHorarios.setText("Editar");
        btnEditarHorarios.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnEditarHorariosActionPerformed(evt);
            }
        });

        btnVerSalones.setText("Ver");
        btnVerSalones.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnVerSalonesActionPerformed(evt);
            }
        });

        btnEditarSalones.setText("Editar");
        btnEditarSalones.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnEditarSalonesActionPerformed(evt);
            }
        });

        jLabel4.setText("Menú Principal");

        btnSalir.setText("Salir");
        btnSalir.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnSalirActionPerformed(evt);
            }
        });

        jLabel5.setText("Cursos");

        jLabel6.setText("Semestres");

        btnSemestre.setText("Editar");
        btnSemestre.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnSemestreActionPerformed(evt);
            }
        });

        btnCursos.setText("Editar");
        btnCursos.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnCursosActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addGap(157, 157, 157)
                        .addComponent(jLabel4))
                    .addGroup(layout.createSequentialGroup()
                        .addGap(28, 28, 28)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(layout.createSequentialGroup()
                                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                                    .addComponent(jLabel1)
                                    .addComponent(jLabel2, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                                    .addComponent(jLabel3, javax.swing.GroupLayout.PREFERRED_SIZE, 124, javax.swing.GroupLayout.PREFERRED_SIZE))
                                .addGap(33, 33, 33)
                                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                    .addGroup(layout.createSequentialGroup()
                                        .addComponent(btnVerHorarios)
                                        .addGap(18, 18, 18)
                                        .addComponent(btnEditarHorarios))
                                    .addGroup(layout.createSequentialGroup()
                                        .addComponent(btnVerSalones)
                                        .addGap(18, 18, 18)
                                        .addComponent(btnEditarSalones))
                                    .addGroup(layout.createSequentialGroup()
                                        .addComponent(btnVerGrupos)
                                        .addGap(18, 18, 18)
                                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                            .addComponent(btnSemestre)
                                            .addComponent(btnEditarGrupos)
                                            .addComponent(btnCursos)))))
                            .addGroup(layout.createSequentialGroup()
                                .addGap(128, 128, 128)
                                .addComponent(btnSalir))
                            .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                                .addComponent(jLabel6, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                                .addComponent(jLabel5, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)))))
                .addContainerGap(53, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(24, 24, 24)
                .addComponent(jLabel4)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 15, Short.MAX_VALUE)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel6)
                    .addComponent(btnSemestre))
                .addGap(9, 9, 9)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel5)
                    .addComponent(btnCursos))
                .addGap(18, 18, 18)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel1)
                    .addComponent(btnVerGrupos)
                    .addComponent(btnEditarGrupos))
                .addGap(18, 18, 18)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jLabel2)
                    .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                        .addComponent(btnVerHorarios)
                        .addComponent(btnEditarHorarios)))
                .addGap(16, 16, 16)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel3)
                    .addComponent(btnVerSalones)
                    .addComponent(btnEditarSalones))
                .addGap(33, 33, 33)
                .addComponent(btnSalir)
                .addGap(21, 21, 21))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void btnVerGruposActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnVerGruposActionPerformed
        // TODO add your handling code here:
        this.dispose();
        JFrameAsignacionGrupos asignacionGrupos = new JFrameAsignacionGrupos();
        asignacionGrupos.setVisible(true);
    }//GEN-LAST:event_btnVerGruposActionPerformed

    private void btnEditarGruposActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnEditarGruposActionPerformed
        // TODO add your handling code here:
        this.dispose();
        JFrameAsignacionGrupos asignacionGrupos = new JFrameAsignacionGrupos();
        asignacionGrupos.setVisible(true);
    }//GEN-LAST:event_btnEditarGruposActionPerformed

    private void btnVerHorariosActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnVerHorariosActionPerformed
        // TODO add your handling code here:
        JFrameAsignacionHorarios horarios = new JFrameAsignacionHorarios();
        horarios.setVisible(true);
    }//GEN-LAST:event_btnVerHorariosActionPerformed

    private void btnEditarHorariosActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnEditarHorariosActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_btnEditarHorariosActionPerformed

    private void btnVerSalonesActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnVerSalonesActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_btnVerSalonesActionPerformed

    private void btnEditarSalonesActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnEditarSalonesActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_btnEditarSalonesActionPerformed

    private void btnSalirActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnSalirActionPerformed
        // TODO add your handling code here:
        this.dispose();
    }//GEN-LAST:event_btnSalirActionPerformed

    private void btnSemestreActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnSemestreActionPerformed
        // TODO add your handling code here:
        this.dispose();
        JFrameAsignacionSemestres semestre = new JFrameAsignacionSemestres();
        semestre.setVisible(true);
    }//GEN-LAST:event_btnSemestreActionPerformed

    private void btnCursosActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnCursosActionPerformed
        // TODO add your handling code here:
        this.dispose();
        JFrameAsignacionCursos cursos = new JFrameAsignacionCursos();
        cursos.setVisible(true);
    }//GEN-LAST:event_btnCursosActionPerformed

    public static void main(String args[]) {

        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new JFrameMain().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnCursos;
    private javax.swing.JButton btnEditarGrupos;
    private javax.swing.JButton btnEditarHorarios;
    private javax.swing.JButton btnEditarSalones;
    private javax.swing.JButton btnSalir;
    private javax.swing.JButton btnSemestre;
    private javax.swing.JButton btnVerGrupos;
    private javax.swing.JButton btnVerHorarios;
    private javax.swing.JButton btnVerSalones;
    private javax.swing.JButton jButton1;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel6;
    // End of variables declaration//GEN-END:variables

    public void configurarBotonesSegunRol(String rol) {
        switch (rol) {
            case "Administrador":
                mostrarBotonesAdmin();
                break;
            case "Usuario":
                mostrarBotonesUsuario();
                break;
            case "Moderador":
                mostrarBotonesModerador();
                break;
            // Agregar casos para otros roles si es necesario
            default:
            // Lógica por defecto si el rol no es reconocido
        }
    }

    // Método para mostrar botones específicos para Administrador
    public void mostrarBotonesAdmin() {
        btnVerGrupos.setVisible(true);
        btnEditarGrupos.setVisible(true);
        // Configurar otros botones para el rol de Administrador
    }

    // Método para mostrar botones específicos para Usuario
    public void mostrarBotonesUsuario() {
        btnVerHorarios.setVisible(true);
        btnEditarHorarios.setVisible(true);
        // Configurar otros botones para el rol de Usuario
    }

    // Método para mostrar botones específicos para Moderador
    public void mostrarBotonesModerador() {
        btnVerSalones.setVisible(true);
        btnEditarSalones.setVisible(true);
        // Configurar otros botones para el rol de Moderador
    }
}
