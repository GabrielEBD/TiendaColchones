/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package javaapplication7;
import java.sql.*;
import java.awt.*;
import javax.swing.*;
import java. *;

/**
 *
 * @author usuario
 */
public  class cliente extends javax.swing.JFrame {

    /**
     * Creates new form cliente
     */
    public cliente() {
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

        jScrollPane1 = new javax.swing.JScrollPane();
        jTextArea1 = new javax.swing.JTextArea();
        jButton1 = new javax.swing.JButton();
        jButton2 = new javax.swing.JButton();
        jButton3 = new javax.swing.JButton();
        jButton4 = new javax.swing.JButton();
        jButton5 = new javax.swing.JButton();
        jButton6 = new javax.swing.JButton();
        jButton7 = new javax.swing.JButton();
        jButton8 = new javax.swing.JButton();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        jTextArea1.setColumns(20);
        jTextArea1.setRows(5);
        jScrollPane1.setViewportView(jTextArea1);

        jButton1.setLabel("MARCAS");
        jButton1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton1ActionPerformed(evt);
            }
        });

        jButton2.setLabel("COSTOS");
        jButton2.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton2ActionPerformed(evt);
            }
        });

        jButton3.setLabel("EMPLEADOS");
        jButton3.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton3ActionPerformed(evt);
            }
        });

        jButton4.setLabel("BASES");
        jButton4.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton4ActionPerformed(evt);
            }
        });

        jButton5.setLabel("PILLOWS");
        jButton5.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton5ActionPerformed(evt);
            }
        });

        jButton6.setLabel("producto por tipo");
        jButton6.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton6ActionPerformed(evt);
            }
        });

        jButton7.setLabel("producto por marca");
        jButton7.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton7ActionPerformed(evt);
            }
        });

        jButton8.setLabel("salir");
        jButton8.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton8ActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jButton1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(jButton2, javax.swing.GroupLayout.DEFAULT_SIZE, 160, Short.MAX_VALUE)
                    .addComponent(jButton3, javax.swing.GroupLayout.DEFAULT_SIZE, 160, Short.MAX_VALUE)
                    .addComponent(jButton4, javax.swing.GroupLayout.DEFAULT_SIZE, 160, Short.MAX_VALUE)
                    .addComponent(jButton5, javax.swing.GroupLayout.DEFAULT_SIZE, 160, Short.MAX_VALUE)
                    .addComponent(jButton6, javax.swing.GroupLayout.DEFAULT_SIZE, 160, Short.MAX_VALUE)
                    .addComponent(jButton7, javax.swing.GroupLayout.DEFAULT_SIZE, 160, Short.MAX_VALUE)
                    .addComponent(jButton8, javax.swing.GroupLayout.DEFAULT_SIZE, 160, Short.MAX_VALUE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 279, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap())
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jScrollPane1)
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(jButton1)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(jButton2)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(jButton3)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(jButton4)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(jButton5)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(jButton6, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(jButton7)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(jButton8)
                        .addGap(0, 0, Short.MAX_VALUE)))
                .addContainerGap())
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void jButton1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton1ActionPerformed
       try{
           // VISTA1
         Statement cmd = conexion.conexion.createStatement();
         ResultSet rcmd = cmd.executeQuery ("select * from producto_marca");
         String datos = "";
         while (rcmd.next())
         {
             datos = datos +"NOMBRE:"+ rcmd.getString("pro_nombre")+" MARCA: "+ rcmd.getString("pro_marca") + "\n"; 
         } 
          jTextArea1.setText(datos);
       }catch (SQLException ex) {
        JOptionPane.showMessageDialog(null, "Imposible cargar vista ...Error.", "Error", JOptionPane.ERROR_MESSAGE);
        }  
    }//GEN-LAST:event_jButton1ActionPerformed

    private void jButton2ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton2ActionPerformed
       try{
           // VISTA 2
         Statement cmd = conexion.conexion.createStatement();
         ResultSet rcmd = cmd.executeQuery ("select * from produ_prec_can");
         String datos = "";
         while (rcmd.next())
         {
             datos = datos +"NOMBRE: "+ rcmd.getString("pro_nombre")+" CANTIDAD: "+ rcmd.getInt("pro_cantidad") + " COSTO: " + rcmd.getInt("prec_costo") +"\n"; 
         } 
          jTextArea1.setText(datos);
       }catch (SQLException ex) {
        JOptionPane.showMessageDialog(null, "Imposible cargar vista ...Error.", "Error", JOptionPane.ERROR_MESSAGE);
        }  
    }//GEN-LAST:event_jButton2ActionPerformed

    private void jButton3ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton3ActionPerformed
       try{
           //VISTA 3
         Statement cmd = conexion.conexion.createStatement();
         ResultSet rcmd = cmd.executeQuery ("select * from nom_tl_EmpAL");
         String datos = "";
         while (rcmd.next())
         {
             datos = datos +"NOMBRE: "+ rcmd.getString("emp_nombreApellido")+ " TELEFONO:" + rcmd.getInt("tel_numero") +"\n"; 
         } 
          jTextArea1.setText(datos);
       }catch (SQLException ex) {
        JOptionPane.showMessageDialog(null, "Imposible cargar vista ...Error.", "Error", JOptionPane.ERROR_MESSAGE);
        } 
    }//GEN-LAST:event_jButton3ActionPerformed

    private void jButton4ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton4ActionPerformed
        try{
            //VISTA 4
         Statement cmd = conexion.conexion.createStatement();
         ResultSet rcmd = cmd.executeQuery ("select * from pro_bases");
         String datos = "";
         while (rcmd.next())
         {
             datos = datos +"NOMBRE DE BASES: "+ rcmd.getString("pro_nombre") +"\n"; 
         } 
          jTextArea1.setText(datos);
       }catch (SQLException ex) {
        JOptionPane.showMessageDialog(null, "Imposible cargar vista ...Error.", "Error", JOptionPane.ERROR_MESSAGE);
        } 
    }//GEN-LAST:event_jButton4ActionPerformed

    private void jButton5ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton5ActionPerformed
        try{
            //VISTA 5
         Statement cmd = conexion.conexion.createStatement();
         ResultSet rcmd = cmd.executeQuery ("select * from pro_pillow");
         String datos = "";
         while (rcmd.next())
         {
             datos = datos +"NOMBRE DE PILLOW: "+ rcmd.getString("pro_nombre") +"\n"; 
         } 
          jTextArea1.setText(datos);
       }catch (SQLException ex) {
        JOptionPane.showMessageDialog(null, "Imposible cargar vista ...Error.", "Error", JOptionPane.ERROR_MESSAGE);
        } 
    }//GEN-LAST:event_jButton5ActionPerformed

    private void jButton6ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton6ActionPerformed
        try {        
            //PROCEDIMIENTO 1
            String id = JOptionPane.showInputDialog(null, "Por favor digite el id del producto que desea ver", null, WIDTH);       
            int entero = Integer.parseInt(id); 
            //ResultSet rcmd = cmd.executeQuery ("call mostrar_producto("+entero+");");
            ResultSet rcmd;
            CallableStatement cmd = conexion.conexion.prepareCall("{call mostrar_producto (?)}",ResultSet.FETCH_FORWARD,ResultSet.TYPE_SCROLL_SENSITIVE);
            cmd.setInt(1,entero);
            cmd.execute();
            System.out.println(entero);
            rcmd = cmd.getResultSet(); 
            System.out.println(entero);
        
            String datos = " ";
            while (rcmd.next()){
                datos = datos +"NOMBRE: "+ rcmd.getString("pro_nombre")+
                     " CANTIDAD: "+ rcmd.getInt("pro_cantidad") +
                     " COSTO: " + rcmd.getInt("prec_costo") +
                     "\n"; 
            }
            cmd.close();
            rcmd.close();
            jTextArea1.setText(datos);
        } catch (SQLException ex) {
        JOptionPane.showMessageDialog(null, "Imposible cargar valor ...Error.", "Error", JOptionPane.ERROR_MESSAGE);
        System.out.println(ex);
        }
    }//GEN-LAST:event_jButton6ActionPerformed

    private void jButton7ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton7ActionPerformed
        try {        
            String tipo = JOptionPane.showInputDialog(null, "Por favor digite el tipo de producto que desea ver", null, WIDTH);        
            ResultSet rcmd;
            CallableStatement cmd = conexion.conexion.prepareCall("{call mostrar_producto_tipo (?)}",ResultSet.FETCH_FORWARD,ResultSet.TYPE_SCROLL_SENSITIVE);
            cmd.setString(1,tipo);
            cmd.execute();
            rcmd = cmd.getResultSet(); 
            String datos = " ";
            while (rcmd.next()){
                datos = datos +"NOMBRE: "+ rcmd.getString("pro_nombre")+
                        " MARCA: "+ rcmd.getString("pro_marca")+
                     " CANTIDAD: "+ rcmd.getInt("pro_cantidad") +
                     " COSTO: " + rcmd.getInt("prec_costo") +
                     "\n"; 
            }
            cmd.close();
            rcmd.close();
            jTextArea1.setText(datos);
        } catch (SQLException ex) {
        JOptionPane.showMessageDialog(null, "Imposible cargar valor ...Error.", "Error", JOptionPane.ERROR_MESSAGE);
        System.out.println(ex);
        }
    }//GEN-LAST:event_jButton7ActionPerformed

    private void jButton8ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton8ActionPerformed
        try {
        conexion.conexion.close();
        JOptionPane.showMessageDialog(null, "Cerrar conexión a base de datos "+conexion.server+" exitosa.", "Conexión cerrada", JOptionPane.INFORMATION_MESSAGE);
        System.exit(0);
        super.setVisible(false);        
        } catch (SQLException ex) {
        JOptionPane.showMessageDialog(null, "Imposible cerrar conexion con "+conexion.server+"...Error.", "Error", JOptionPane.ERROR_MESSAGE);
        }
    }//GEN-LAST:event_jButton8ActionPerformed

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(cliente.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(cliente.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(cliente.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(cliente.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new cliente().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton jButton1;
    private javax.swing.JButton jButton2;
    private javax.swing.JButton jButton3;
    private javax.swing.JButton jButton4;
    private javax.swing.JButton jButton5;
    private javax.swing.JButton jButton6;
    private javax.swing.JButton jButton7;
    private javax.swing.JButton jButton8;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JTextArea jTextArea1;
    // End of variables declaration//GEN-END:variables
}
