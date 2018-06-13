/*
*Nombre Archivo : personabe.java
*Nombre Clase   : persona
*Creador Archivo: ASMODEUS-AZAZEL
*Fecha Creacion : 2017-11-07 04:19:53
 */
package dao;

import java.sql.Date;
import be.personabe;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class personadao {

    public personadao() {
    }

    public personabe getPersona(int id_persona) {
        personabe obj = null;

        String sql = "select id_persona,nombre,tipo_documento,documento,telefono,correo_electronico,estado,usuario_registra,fecha_registro from hotel.persona where  id_persona = " + id_persona;
        Connection c = null;

        try {
            c = new data().getMysql();
            Statement st = c.createStatement();
            ResultSet rs = st.executeQuery(sql);
            rs.next();
            obj = new personabe(rs.getInt("id_persona"), rs.getString("nombre"), rs.getInt("tipo_documento"), rs.getString("documento"), rs.getString("telefono"), rs.getString("correo_electronico"), rs.getInt("estado"), rs.getInt("usuario_registra"), rs.getDate("fecha_registro"));
            c.close();
            c = null;
        } catch (SQLException ex) {
            Logger.getLogger(personadao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (c != null) {
                    c.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(personadao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return obj;
    }

    public List<personabe> getPersona(String parametro1) {
        List<personabe> obj = new ArrayList();

        String sql = "select id_persona,nombre,tipo_documento,documento,telefono,correo_electronico,estado,usuario_registra,fecha_registro from hotel.persona where  nombre like '%" + parametro1 + "%' and estado=1";
        Connection c = null;

        try {
            c = new data().getMysql();
            Statement st = c.createStatement();
            ResultSet rs = st.executeQuery(sql);

            while (rs.next()) {
                obj.add(new personabe(rs.getInt("id_persona"), rs.getString("nombre"), rs.getInt("tipo_documento"), rs.getString("documento"), rs.getString("telefono"), rs.getString("correo_electronico"), rs.getInt("estado"), rs.getInt("usuario_registra"), rs.getDate("fecha_registro")));
            }
            c.close();
            c = null;
        } catch (SQLException ex) {
            Logger.getLogger(personadao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (c != null) {
                    c.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(personadao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return obj;
    }

    public List<personabe> getPersona(String parametro1, String parametro2) {
        List<personabe> obj = new ArrayList();

        String sql = "select id_persona,nombre,tipo_documento,documento,telefono,correo_electronico,estado,usuario_registra,fecha_registro from hotel.persona where  tipo_documento =" + parametro1 + " and documento = '"+parametro2+"';";
        Connection c = null;

        try {
            c = new data().getMysql();
            Statement st = c.createStatement();
            ResultSet rs = st.executeQuery(sql);

            while (rs.next()) {
                obj.add(new personabe(rs.getInt("id_persona"), rs.getString("nombre"), rs.getInt("tipo_documento"), rs.getString("documento"), rs.getString("telefono"), rs.getString("correo_electronico"), rs.getInt("estado"), rs.getInt("usuario_registra"), rs.getDate("fecha_registro")));
            }
            c.close();
            c = null;
        } catch (SQLException ex) {
            Logger.getLogger(personadao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (c != null) {
                    c.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(personadao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return obj;
    }

    public int addPersona(personabe obj) {

        int r = 0;
        String sql = " insert into hotel.persona "
                + "select (select max(id_persona) from hotel.persona)+1 ,'" + obj.getNombre() + "'," + obj.getTipo_documento() + ",'" + obj.getDocumento() + "','" + obj.getTelefono() + "','" + obj.getCorreo_electronico() + "'," + obj.getEstado() + "," + obj.getUsuario_registra() + ",'" + obj.getFecha_registro() + "'";
        Connection c = null;
        
        c = new data().getMysql();

        try {
            c = new data().getMysql();
            Statement st = c.createStatement();
            r = st.executeUpdate(sql);
            c.close();
            c = null;
        } catch (SQLException ex) {
            Logger.getLogger(personadao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (c != null) {
                    c.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(personadao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return r;
    }

    public int updatePersona(personabe obj) {
        String sql = " update hotel.persona set nombre='" + obj.getNombre() + "',tipo_documento=" + obj.getTipo_documento() + ",documento='" + obj.getDocumento() + "',telefono='" + obj.getTelefono() + "',correo_electronico='" + obj.getCorreo_electronico() + "',estado=" + obj.getEstado() + ",usuario_registra=" + obj.getUsuario_registra() + ",fecha_registro='" + obj.getFecha_registro() + "' where id_persona=" + obj.getId_persona() + ";";
        Connection c = null;
        
        c = new data().getMysql();
        int r = 0;
        try {
            c = new data().getMysql();
            Statement st = c.createStatement();
            r = st.executeUpdate(sql);
            c.close();
            c = null;
        } catch (SQLException ex) {
            Logger.getLogger(personadao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (c != null) {
                    c.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(personadao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return r;
    }
    
    public int deshabilitarPersona(personabe obj) {
        String sql = " update hotel.persona  set estado = 0 where id_persona=" + -1*obj.getId_persona() + ";";
        Connection c = null;
        
        c = new data().getMysql();
        int r = 0;
        try {
            c = new data().getMysql();
            Statement st = c.createStatement();
            r = st.executeUpdate(sql);
            c.close();
            c = null;
        } catch (SQLException ex) {
            Logger.getLogger(personadao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (c != null) {
                    c.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(personadao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return r;
    }
}
