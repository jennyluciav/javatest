/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import be.departamentobe;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Estudiante
 */
public class departamentodao {

    public departamentodao() {
    }
    public departamentobe getDepartamento(String cod){
        departamentobe obj = null;
        String sql="select iddepartamento, nombre from departamento where iddepartamento='"+cod+"'";
        Connection c=null;
        
        try {
            c = new data().getMysql();
            Statement st = c.createStatement();
            ResultSet rs = st.executeQuery(sql);
            rs.next();
            obj = new departamentobe(rs.getString("iddepartamento"), rs.getString("nombre"));
            c.close();
            c=null;
        } catch (SQLException ex) {
            Logger.getLogger(departamentodao.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally{
            try {
                if(c!=null){
                    c.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(departamentodao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
        return obj;
        
    }

    public List<departamentobe> getDepartamentos(String nom){
        List<departamentobe> obj = new ArrayList();
        String sql="select iddepartamento, nombre from departamento where nombre like '%"+nom+"%'";
        Connection c=null;
        try {
            c = new data().getMysql();
            Statement st = c.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while(rs.next()){
                obj.add(new departamentobe(rs.getString("iddepartamento"), rs.getString("nombre")));
            }
            c.close();
            c=null;
        } catch (SQLException ex) {
            Logger.getLogger(departamentodao.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally{
            try {
                if(c!=null){
                    c.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(departamentodao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
        return obj;
        
    }
    
}
