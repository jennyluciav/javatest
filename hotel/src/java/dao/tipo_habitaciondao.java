/*
*Nombre Archivo : tipo_habitacionbe.java
*Nombre Clase   : tipo_habitacion
*Creador Archivo: ASMODEUS-AZAZEL
*Fecha Creacion : 2017-11-07 04:21:06
 */
package dao;

import java.sql.Date;
import be.tipo_habitacionbe;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class tipo_habitaciondao {

    public tipo_habitaciondao() {
    }

    public tipo_habitacionbe getTipo_habitacion(int id_tipo_habitacion) {
        tipo_habitacionbe obj = null;

        String sql = "select id_tipo_habitacion,descripcion,precio,caracteristica,estado,usuario_registra,fecha_registro from hotel.tipo_habitacion" + "where  id_tipo_habitacion = " + id_tipo_habitacion;
        Connection c = null;

        try {
            c = new data().getMysql();
            Statement st = c.createStatement();
            ResultSet rs = st.executeQuery(sql);
            rs.next();
            obj = new tipo_habitacionbe(rs.getInt("id_tipo_habitacion"), rs.getString("descripcion"), rs.getDouble("precio"), rs.getString("caracteristica"), rs.getInt("estado"), rs.getInt("usuario_registra"), rs.getDate("fecha_registro"));
            c.close();
            c = null;
        } catch (SQLException ex) {
            Logger.getLogger(tipo_habitaciondao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (c != null) {
                    c.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(tipo_habitaciondao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return obj;
    }

    public List<tipo_habitacionbe> getTipo_habitacion(String parametro1) {
        List<tipo_habitacionbe> obj = new ArrayList();

        String sql = "select id_tipo_habitacion,descripcion,precio,caracteristica,estado,usuario_registra,fecha_registro from hotel.tipo_habitacion where  id_tipo_habitacion like '%" + parametro1 + "%' and estado = 1";
        Connection c = null;

        try {
            c = new data().getMysql();
            Statement st = c.createStatement();
            ResultSet rs = st.executeQuery(sql);

            while (rs.next()) {
                obj.add(new tipo_habitacionbe(rs.getInt("id_tipo_habitacion"), rs.getString("descripcion"), rs.getDouble("precio"), rs.getString("caracteristica"), rs.getInt("estado"), rs.getInt("usuario_registra"), rs.getDate("fecha_registro")));
            }
            c.close();
            c = null;
        } catch (SQLException ex) {
            Logger.getLogger(tipo_habitaciondao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (c != null) {
                    c.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(tipo_habitaciondao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return obj;
    }

    public List<tipo_habitacionbe> getTipo_habitacion(String parametro1, String parametro2) {
        List<tipo_habitacionbe> obj = new ArrayList();

        String sql = "select id_tipo_habitacion,descripcion,precio,caracteristica,estado,usuario_registra,fecha_registro from hotel.tipo_habitacionwhere  id_tipo_habitacion like '%" + parametro1 + "%'";
        Connection c = null;

        try {
            c = new data().getMysql();
            Statement st = c.createStatement();
            ResultSet rs = st.executeQuery(sql);

            while (rs.next()) {
                obj.add(new tipo_habitacionbe(rs.getInt("id_tipo_habitacion"), rs.getString("descripcion"), rs.getDouble("precio"), rs.getString("caracteristica"), rs.getInt("estado"), rs.getInt("usuario_registra"), rs.getDate("fecha_registro")));
            }
            c.close();
            c = null;
        } catch (SQLException ex) {
            Logger.getLogger(tipo_habitaciondao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (c != null) {
                    c.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(tipo_habitaciondao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return obj;
    }

    public int addTipo_habitacion(tipo_habitacionbe obj) {
        String sql = " insert into hotel.tipo_habitacion"
                + "   select coalesce((select max(id_tipo_habitacion)from hotel.tipo_habitacion),0)+1,'" + obj.getDescripcion() + "'," + obj.getPrecio() + ",'" + obj.getCaracteristica() + "'," + obj.getEstado() + "," + obj.getUsuario_registra() + ",'" + obj.getFecha_registro() + "'";
        Connection c = null;
        int r = 0;

        try {
            c = new data().getMysql();
            Statement st = c.createStatement();
            r = st.executeUpdate(sql);
            c.close();
            c = null;
        } catch (SQLException ex) {
            Logger.getLogger(tipo_habitaciondao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (c != null) {
                    c.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(tipo_habitaciondao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return r;
    }

    public int updateTipo_habitacion(tipo_habitacionbe obj) {
        String sql = " update hotel.tipo_habitacion  set descripcion='" + obj.getDescripcion() + "',precio=" + obj.getPrecio() + ",caracteristica='" + obj.getCaracteristica() + "',estado=" + obj.getEstado() + ",usuario_registra=" + obj.getUsuario_registra() + ",fecha_registro='" + obj.getFecha_registro() + "' where id_tipo_habitacion=" + obj.getId_tipo_habitacion() + ";";
        Connection c = null;
        int r = 0;

        try {
            c = new data().getMysql();
            Statement st = c.createStatement();
            r = st.executeUpdate(sql);
            c.close();
            c = null;
        } catch (SQLException ex) {
            Logger.getLogger(tipo_habitaciondao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (c != null) {
                    c.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(tipo_habitaciondao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return 1;
    }

    public int deshabilitarTipo_habitacion(tipo_habitacionbe obj) {
        String sql = " update hotel.tipo_habitacion  set estado = 0 where id_tipo_habitacion=" + -1 * obj.getId_tipo_habitacion() + ";";

        Connection c = null;
        int r = 0;

        try {
            c = new data().getMysql();
            Statement st = c.createStatement();
            r = st.executeUpdate(sql);
            c.close();
            c = null;
        } catch (SQLException ex) {
            Logger.getLogger(tipo_habitaciondao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (c != null) {
                    c.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(tipo_habitaciondao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return 1;
    }
}
