/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author bryan
 */
public class horas_usuario {
    static Conexion ocon;
    public int id_horas_usuario;
    public int id_usuario;
    public String fecha;
    public float HorasTrabajadas;
    public float salario_hora;
    
    public ArrayList<horas_usuario> GetHorasByUsuario(int id)throws ClassNotFoundException, InstantiationException, IllegalAccessException, SQLException{
        ocon = new Conexion();
        ResultSet rs = ocon.consultar("*", "horas_usuario where id_usuario="+id);
        ArrayList<horas_usuario> horas = new ArrayList<>();
        while (rs.next()) {
            horas_usuario item = new horas_usuario();
            item.id_usuario=rs.getInt("id_usuario");
            item.id_horas_usuario=rs.getInt("id_horas_usuario");
            item.fecha=rs.getString("fecha");
            item.HorasTrabajadas=rs.getFloat("horas_trabajadas");
            item.salario_hora=rs.getFloat("salario_hora");
            horas.add(item);
        }
        return horas;
    }
    public static int Add(horas_usuario item)throws ClassNotFoundException, SQLException, InstantiationException, IllegalAccessException{
        ocon = new Conexion();
        String query = "insert into horas_usuario(id_usuario,fecha,horas_trabajadas,salario_hora) values("+item.id_usuario+",'"+item.fecha+"',"+item.HorasTrabajadas+","+Usuario.GetSalario(item.id_usuario)+");";
        int resp = ocon.agregar(query);
        return resp;
    }
     public static void update(horas_usuario item) throws ClassNotFoundException, InstantiationException, IllegalAccessException, SQLException{
        ocon = new Conexion();
        String query = "update usuario set fecha='"+item.fecha+"',horas_trabajadas='"+item.HorasTrabajadas+"',salario_horas = '"+item.salario_hora+"'";
        ocon.DoQuery2(query);
    }
     public static int Delete(int id)throws ClassNotFoundException, SQLException, InstantiationException, IllegalAccessException{
        ocon = new Conexion();
        return ocon.eliminar("horas_usuario", "id_horas_usuario="+id);
    }
    
}
