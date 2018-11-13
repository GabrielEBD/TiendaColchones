
package javaapplication7;
import static java.awt.image.ImageObserver.*;
import java.sql.*;
import javax.swing.*;


public class conexion {
    static Connection conexion;
    static String bd="almacen";
    static String user="root";
    static String password="lobodehierro97@";
    static String host="localhost";
    static String server="jdbc:mysql://"+host+"/"+bd+"?noAccessToProcedureBodies=true";
    
public static void main(String[] args) { 
    try {  
        user = JOptionPane.showInputDialog(null, "ingrese nombre de usuario", null, WIDTH);
        password = JOptionPane.showInputDialog(null, "ingrese contraseña de usuario", null, WIDTH);
        Class.forName("com.mysql.jdbc.Driver");
        conexion = DriverManager.getConnection(server,user,password);
        JOptionPane.showMessageDialog(null, "la Conexión a la base de datos "+server+" es exitosa.", "Conexión exitosa", JOptionPane.INFORMATION_MESSAGE);
        if (user.equals("CLIENTES") ){
            cliente cliente1 = new cliente();
            cliente1.setVisible(true);
        } else if(user.equals("VENDEDORES")) {
                vendedor vendedor1 = new vendedor();
                vendedor1.setVisible(true);   
        } else if (user.equals("EMPLEADO_FABRICA")){
                empleado empleado1 = new empleado();
                empleado1.setVisible(true);
        } else if (user.equals("ADMI_INVENTARIO")){
                admInventario administrador = new admInventario();
                administrador.setVisible(true);
        } else if (user.equals("ADMIN_ALMACEN")){
                admAlmacen administrador = new admAlmacen();
                administrador.setVisible(true);
        } else if (user.equals("GERENCIA")){
                gerencia gerente = new gerencia();
                gerente.setVisible(true);
        }
    } catch (ClassNotFoundException ex) {  
        JOptionPane.showMessageDialog(null, "la Conexión a la base de datos "+server+" presento error.", "Conexión fallida", JOptionPane.INFORMATION_MESSAGE);  
     
    } catch (SQLException ex) {    
        JOptionPane.showMessageDialog(null, "la Conexión a la base de datos "+server+" no es posible.", "Conexión fallida", JOptionPane.INFORMATION_MESSAGE);
    }
}
}












//Espacio para realizar consultas, agregar registros, eliminar registros, etc...  
//desconectar
  /*  try { 
        conexion.close();
        System.out.println("Cerrar conexion con "+server+" ... OK");
    } catch (SQLException ex) {
        System.out.println("Imposible cerrar conexion ... FAIL");
} 
} 
 */