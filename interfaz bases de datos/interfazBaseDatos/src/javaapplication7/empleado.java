/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package javaapplication7;


import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.swing.JOptionPane;
import java.sql.*;
import java.awt.*;
import javax.swing.*;
import java. *;
import java.util.*;

/**
 *
 * @author usuario
 */
public class empleado extends javax.swing.JFrame {

    /**
     * Creates new form empleado
     */
    public empleado() {
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

        jButton1 = new javax.swing.JButton();
        jButton2 = new javax.swing.JButton();
        jButton3 = new javax.swing.JButton();
        jButton4 = new javax.swing.JButton();
        jButton5 = new javax.swing.JButton();
        jButton8 = new javax.swing.JButton();
        jButton9 = new javax.swing.JButton();
        jButton10 = new javax.swing.JButton();
        jScrollPane1 = new javax.swing.JScrollPane();
        jTextArea1 = new javax.swing.JTextArea();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        jButton1.setLabel("CANTIDAD MATERIAL");
        jButton1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton1ActionPerformed(evt);
            }
        });

        jButton2.setLabel("MENOS MATERIALES");
        jButton2.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton2ActionPerformed(evt);
            }
        });

        jButton3.setLabel("INVENTARIO MATERIAL");
        jButton3.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton3ActionPerformed(evt);
            }
        });

        jButton4.setLabel("DETALLES MATERIAL");
        jButton4.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton4ActionPerformed(evt);
            }
        });

        jButton5.setLabel("MATERIAL POR MES");
        jButton5.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton5ActionPerformed(evt);
            }
        });

        jButton8.setLabel("AGREGAR PRODUCTO");
        jButton8.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton8ActionPerformed(evt);
            }
        });

        jButton9.setLabel("ASIGNAR MATERIAL");
        jButton9.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton9ActionPerformed(evt);
            }
        });

        jButton10.setLabel("SALIR");
        jButton10.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton10ActionPerformed(evt);
            }
        });

        jTextArea1.setColumns(20);
        jTextArea1.setRows(5);
        jScrollPane1.setViewportView(jTextArea1);

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addComponent(jButton1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(jButton2, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(jButton3, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(jButton4, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(jButton5, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(jButton8, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(jButton9, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(jButton10, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                .addGap(18, 18, 18)
                .addComponent(jScrollPane1, javax.swing.GroupLayout.DEFAULT_SIZE, 334, Short.MAX_VALUE)
                .addContainerGap())
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
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
                        .addGap(4, 4, 4)
                        .addComponent(jButton8)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(jButton9)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(jButton10)))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void jButton1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton1ActionPerformed
        // VISTA 1 
        try{
         Statement cmd = conexion.conexion.createStatement();
         ResultSet rcmd = cmd.executeQuery ("select * from inventario_material");
         String datos = "";
         while (rcmd.next())
         {
             datos = datos +" CANTIDAD:"+ rcmd.getString("invM_nombre")+
                     " CANTIDAD: "+ rcmd.getInt("invN_cantidad") +
                     "\n"; 
         } 
          jTextArea1.setText(datos);
       }catch (SQLException ex) {
        JOptionPane.showMessageDialog(null, "Imposible cargar vista ...Error.", "Error", JOptionPane.ERROR_MESSAGE);
        System.out.println(ex);
        }
    }//GEN-LAST:event_jButton1ActionPerformed

    private void jButton4ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton4ActionPerformed
        // VISTA 4 
        try{
         Statement cmd = conexion.conexion.createStatement();
         ResultSet rcmd = cmd.executeQuery ("select * from inventario_material_prop");
         String datos = "";
         while (rcmd.next())
         {
             datos = datos +" NOMBRE:"+ rcmd.getString("invm_nombre")+
                     " DETALLES: "+ rcmd.getString  ("detalles") +
                     "\n"; 
         } 
          jTextArea1.setText(datos);
       }catch (SQLException ex) {
        JOptionPane.showMessageDialog(null, "Imposible cargar vista ...Error.", "Error", JOptionPane.ERROR_MESSAGE);
        System.out.println(ex);
        }
    }//GEN-LAST:event_jButton4ActionPerformed

    private void jButton2ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton2ActionPerformed
        // VISTA 2 
        try{
         Statement cmd = conexion.conexion.createStatement();
         ResultSet rcmd = cmd.executeQuery ("select * from Menos_Materiales");
         String datos = "";
         while (rcmd.next())
         {
             datos = datos +" CANTIDAD:"+ rcmd.getString("pro_nombre")+
                     " Total: "+ rcmd.getInt("count(fab_invM_id)") +
                     "\n"; 
         } 
          jTextArea1.setText(datos);
       }catch (SQLException ex) {
        JOptionPane.showMessageDialog(null, "Imposible cargar vista ...Error.", "Error", JOptionPane.ERROR_MESSAGE);
        }
    }//GEN-LAST:event_jButton2ActionPerformed

    private void jButton3ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton3ActionPerformed
        // VISTA 3 
        try{
         Statement cmd = conexion.conexion.createStatement();
         ResultSet rcmd = cmd.executeQuery ("select * from inventario_material_can");
         String datos = "";
         while (rcmd.next())
         {
             datos = datos +" TIPO MATERIAL:"+ rcmd.getString("invM_tipo")+
                     " CATIDAD: "+ rcmd.getInt("cant") +
                     "\n"; 
         } 
          jTextArea1.setText(datos);
       }catch (SQLException ex) {
        JOptionPane.showMessageDialog(null, "Imposible cargar vista ...Error.", "Error", JOptionPane.ERROR_MESSAGE);
        }
    }//GEN-LAST:event_jButton3ActionPerformed

    private void jButton5ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton5ActionPerformed
        // VISTA 5 GASTADO MATERIAL POR MES  
        try{
         Statement cmd = conexion.conexion.createStatement();
         ResultSet rcmd = cmd.executeQuery ("select * from can_mat");
         String datos = "";
         while (rcmd.next())
         {
             datos = datos +" MES:"+ rcmd.getInt("mes")+
                     " CATIDAD: "+ rcmd.getInt("count(cantidad_material)") +
                     "\n"; 
         } 
          jTextArea1.setText(datos);
       }catch (SQLException ex) {
        JOptionPane.showMessageDialog(null, "Imposible cargar vista ...Error.", "Error", JOptionPane.ERROR_MESSAGE);
        }
    }//GEN-LAST:event_jButton5ActionPerformed

    private void jButton8ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton8ActionPerformed
        // procedimiento 1
        try {        
           
            String idinventarioP = JOptionPane.showInputDialog(null, "Por favor digite el nuevo di del inventario", null, WIDTH);
            String idproducto = JOptionPane.showInputDialog(null, "Por favor digite el id del producto", null, WIDTH);
            String cantidad = JOptionPane.showInputDialog(null, "Por favor digite la cantidad que desea registrar", null, WIDTH);
            
            int idInvPro = Integer.parseInt(idinventarioP);
            int idPro = Integer.parseInt(idproducto);
            int Cant = Integer.parseInt(cantidad);
            
            CallableStatement cmd = conexion.conexion.prepareCall("{call crear_producto_empleado (?,?,?)}");
            cmd.setInt(1,idInvPro);
            cmd.setInt(2,idPro);
            cmd.setInt(3,Cant);
            System.out.println(idInvPro);
            cmd.execute();
            System.out.println(idInvPro);
            cmd.close();
            String datos = "el prodcuto se ha restrado correctamente ";
            jTextArea1.setText(datos);
        } catch (SQLException ex) {
        JOptionPane.showMessageDialog(null, "Imposible cargar valor ...Error.", "Error", JOptionPane.ERROR_MESSAGE);
        System.out.println(ex);
        }
    }//GEN-LAST:event_jButton8ActionPerformed

    private void jButton9ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton9ActionPerformed
        // procedimiento 2
        try {        
           
            String idfabrica = JOptionPane.showInputDialog(null, "Por favor digite el id de la fabrica", null, WIDTH);
            String idInvPro = JOptionPane.showInputDialog(null, "Por favor digite el id del inventario producto", null, WIDTH);
            String idEmpleado = JOptionPane.showInputDialog(null, "Por favor digite el id del empleado", null, WIDTH);
            String idInvMat = JOptionPane.showInputDialog(null, "Por favor digite el id del inventario material", null, WIDTH);
            String cantidad = JOptionPane.showInputDialog(null, "Por favor digite la cantidad que utilizo", null, WIDTH);
            
            int idfab = Integer.parseInt(idfabrica);
            int idinvpro = Integer.parseInt(idInvPro);
            int idEmp = Integer.parseInt(idEmpleado);
            int idinvmat = Integer.parseInt(idInvMat);
            int Cant = Integer.parseInt(cantidad);
            
            CallableStatement cmd = conexion.conexion.prepareCall("{call material_utilizado (?,?,?,?,?)}");
            cmd.setInt(1,idfab);
            cmd.setInt(2,idinvpro);
            cmd.setInt(3,idEmp);
            cmd.setInt(4,idinvmat);
            cmd.setInt(5,Cant);
            System.out.println(idInvPro);
            cmd.execute();
            System.out.println(idInvPro);
            cmd.close();
            String datos = "el prodcuto se ha restrado correctamente ";
            jTextArea1.setText(datos);
        } catch (SQLException ex) {
        JOptionPane.showMessageDialog(null, "Imposible cargar valor ...Error.", "Error", JOptionPane.ERROR_MESSAGE);
        System.out.println(ex);
        }
    }//GEN-LAST:event_jButton9ActionPerformed

    private void jButton10ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton10ActionPerformed
        try {
        conexion.conexion.close();
        JOptionPane.showMessageDialog(null, "Cerrar conexión a base de datos "+conexion.server+" exitosa.", "Conexión cerrada", JOptionPane.INFORMATION_MESSAGE);
        System.exit(0);
        super.setVisible(false);        
        } catch (SQLException ex) {
        JOptionPane.showMessageDialog(null, "Imposible cerrar conexion con "+conexion.server+"...Error.", "Error", JOptionPane.ERROR_MESSAGE);
        }
    }//GEN-LAST:event_jButton10ActionPerformed

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
            java.util.logging.Logger.getLogger(empleado.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(empleado.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(empleado.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(empleado.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new empleado().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton jButton1;
    private javax.swing.JButton jButton10;
    private javax.swing.JButton jButton2;
    private javax.swing.JButton jButton3;
    private javax.swing.JButton jButton4;
    private javax.swing.JButton jButton5;
    private javax.swing.JButton jButton8;
    private javax.swing.JButton jButton9;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JTextArea jTextArea1;
    // End of variables declaration//GEN-END:variables
}