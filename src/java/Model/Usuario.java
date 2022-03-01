/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author bryan
 */
public class Usuario {
    static Conexion ocon;
    public int id_usuario;
    public String nombre;
    public String apellido;
    public int tipo;
    public float salario;
    
    public static ArrayList<Usuario> GetAll() throws ClassNotFoundException, SQLException, InstantiationException, IllegalAccessException{
        ocon = new Conexion();
        ResultSet rs = ocon.consultar("*", "usuario");
        ArrayList<Usuario> usuarios = new ArrayList<>();
        while (rs.next()) {
            Usuario item = new Usuario();
            item.id_usuario=rs.getInt("id_usuario");
            item.nombre=rs.getString("nombre");
            item.apellido=rs.getString("apellido");
            item.tipo=rs.getInt("tipo");
            item.salario=rs.getInt("salario");
            usuarios.add(item);
        }
        
        
        return usuarios;
    }
}
