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
    public String username;
    public String clave;
    public int tipo;
    public float salario;
    public static Usuario LoggedUser;

    public static ArrayList<Usuario> GetAll() throws ClassNotFoundException, SQLException, InstantiationException, IllegalAccessException {
        ocon = new Conexion();
        ResultSet rs = ocon.consultar("*", "usuario");
        ArrayList<Usuario> usuarios = new ArrayList<>();
        while (rs.next()) {
            Usuario item = new Usuario();
            item.id_usuario = rs.getInt("id_usuario");
            item.nombre = rs.getString("nombre");
            item.apellido = rs.getString("apellido");
            item.username = rs.getString("username");
            item.clave = rs.getString("clave");
            item.salario = rs.getInt("salario");
            item.tipo = rs.getInt("tipo");
            usuarios.add(item);
        }
        return usuarios;
    }

    public static int Add(Usuario item) throws ClassNotFoundException, SQLException, InstantiationException, IllegalAccessException {
        ocon = new Conexion();
        String query = "insert into usuario(nombre,apellido,username,clave,salario,tipo) values('" + item.nombre + "','" + item.apellido + "','" + item.username + "','" + item.clave + "'," + item.salario + "," + 0 + ");";
        int resp = ocon.agregar(query);
        return resp;
    }

    public static void update(Usuario item) throws ClassNotFoundException, InstantiationException, IllegalAccessException, SQLException {
        ocon = new Conexion();
        String query = "update usuario set nombre='" + item.nombre + "',apellido='" + item.apellido + "',username = '" + item.username + "',clave = '" + item.clave + "',salario=" + item.salario + " where id_usuario="+item.id_usuario;
        ocon.DoQuery2(query);
    }

    public static Usuario GetById(int id) throws ClassNotFoundException, SQLException, InstantiationException, IllegalAccessException {
        ocon = new Conexion();
        ResultSet rs = ocon.consultar("*", "usuario where id_usuario="+id);
        Usuario item = new Usuario();
        while (rs.next()) {

            item.id_usuario = rs.getInt("id_usuario");
            item.nombre = rs.getString("nombre");
            item.apellido = rs.getString("apellido");
            item.username = rs.getString("username");
            item.clave = rs.getString("clave");
            item.salario = rs.getInt("salario");
            item.tipo = rs.getInt("tipo");
        }
        return item;
    }

    public static int Delete(int id) throws ClassNotFoundException, SQLException, InstantiationException, IllegalAccessException {
        ocon = new Conexion();
        return ocon.eliminar("usuario", "id_usuario=" + id);
    }

    public static boolean Login(String username, String clave) throws ClassNotFoundException, InstantiationException, IllegalAccessException, SQLException {
        ocon = new Conexion();
        String query = "select * from usuario where username='" + username + "' and clave='" + clave + "';";
        ResultSet rs = ocon.DoQuery(query);
        rs.last();
        int fila = rs.getRow();
        if (fila <= 0) {
            return false;
        }
        rs.first();
        Usuario item = new Usuario();
        item.id_usuario = rs.getInt("id_usuario");
        item.nombre = rs.getString("nombre");
        item.apellido = rs.getString("apellido");
        item.username = rs.getString("username");
        item.clave = rs.getString("clave");
        item.salario = rs.getFloat("salario");
        item.tipo = rs.getInt("tipo");
        Usuario.LoggedUser = item;
        return true;
    }
    public static float GetSalario(int id)throws ClassNotFoundException, InstantiationException, IllegalAccessException, SQLException{
        ocon = new Conexion();
        String query = "select salario from usuario where id_usuario="+id+";";
        ResultSet rs = ocon.DoQuery(query);
        return rs.getInt("salario");
    }
}
