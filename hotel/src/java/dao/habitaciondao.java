/*
*Nombre Archivo : habitacionbe.java
*Nombre Clase   : habitacion
*Creador Archivo: ASMODEUS-AZAZEL
*Fecha Creacion : 2017-11-07 04:19:27
 */
package dao;

import java.sql.Date;
import be.habitacionbe;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class habitaciondao {

    public habitaciondao() {
    }

    public habitacionbe getHabitacion(int id_habitacion) {
        habitacionbe obj = null;

        String sql = "select id_habitacion,nro,piso,id_tipo_habitacion,estado,usuario_registra,fecha_registro from hotel.habitacion" + "where  id_habitacion = " + id_habitacion;
        Connection c = null;

        try {
            c = new data().getMysql();
            Statement st = c.createStatement();
            ResultSet rs = st.executeQuery(sql);
            rs.next();
            obj = new habitacionbe(rs.getInt("id_habitacion"), rs.getInt("nro"),rs.getInt("piso"), rs.getInt("id_tipo_habitacion"), rs.getInt("estado"), rs.getInt("usuario_registra"), rs.getDate("fecha_registro"));
            c.close();
            c = null;
        } catch (SQLException ex) {
            Logger.getLogger(habitaciondao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (c != null) {
                    c.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(habitaciondao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return obj;
    }

    public List<habitacionbe> getHabitacion(String parametro1) {
        List<habitacionbe> obj = new ArrayList();

        String sql = "select id_habitacion,nro,piso,id_tipo_habitacion,estado,usuario_registra,fecha_registro from hotel.habitacion where  id_habitacion like '%" + parametro1 + "%' and estado = 1;";
        Connection c = null;

        try {
            c = new data().getMysql();
            Statement st = c.createStatement();
            ResultSet rs = st.executeQuery(sql);

            while (rs.next()) {
                obj.add(new habitacionbe(rs.getInt("id_habitacion"), rs.getInt("nro"),rs.getInt("piso"), rs.getInt("id_tipo_habitacion"), rs.getInt("estado"), rs.getInt("usuario_registra"), rs.getDate("fecha_registro")));
            }
            c.close();
            c = null;
        } catch (SQLException ex) {
            Logger.getLogger(habitaciondao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (c != null) {
                    c.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(habitaciondao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return obj;
    }

    public List<habitacionbe> getHabitacion(String parametro1, String parametro2) {
        List<habitacionbe> obj = new ArrayList();

        String sql = "select id_habitacion,nro,piso,id_tipo_habitacion,estado,usuario_registra,fecha_registro from hotel.habitacionwhere  id_habitacion like '%" + parametro1 + "%'";
        Connection c = null;

        try {
            c = new data().getMysql();
            Statement st = c.createStatement();
            ResultSet rs = st.executeQuery(sql);

            while (rs.next()) {
                obj.add(new habitacionbe(rs.getInt("id_habitacion"), rs.getInt("nro"), rs.getInt("piso"), rs.getInt("id_tipo_habitacion"), rs.getInt("estado"), rs.getInt("usuario_registra"), rs.getDate("fecha_registro")));
            }
            c.close();
            c = null;
        } catch (SQLException ex) {
            Logger.getLogger(habitaciondao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (c != null) {
                    c.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(habitaciondao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return obj;
    }

    public int addHabitacion(habitacionbe obj) {
        String sql = " insert into hotel.habitacion"
                + "   select coalesce((select max(id_habitacion)from hotel.habitacion),0)+1," + obj.getNro()+ "," +obj.getPiso() + "," + obj.getId_tipo_habitacion() + "," + obj.getEstado() + "," + obj.getUsuario_registra() + ",'" + obj.getFecha_registro() + "';";
        Connection c = null;
        int r = 0;

        try {
            c = new data().getMysql();
            Statement st = c.createStatement();
            r = st.executeUpdate(sql);
            c.close();
            c = null;
        } catch (SQLException ex) {
            Logger.getLogger(habitaciondao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (c != null) {
                    c.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(habitaciondao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return r;
    }

    public int updateHabitacion(habitacionbe obj) {
        String sql = " update hotel.habitacion  set piso=" + obj.getNro()+ ",piso=" + obj.getPiso() + ",id_tipo_habitacion=" + obj.getId_tipo_habitacion() + ",estado=" + obj.getEstado() + ",usuario_registra=" + obj.getUsuario_registra() + ",fecha_registro='" + obj.getFecha_registro() + "' where id_habitacion=" + obj.getId_habitacion() + ";";
        Connection c = null;
        int r = 0;

        try {
            c = new data().getMysql();
            Statement st = c.createStatement();
            r = st.executeUpdate(sql);
            c.close();
            c = null;
        } catch (SQLException ex) {
            Logger.getLogger(habitaciondao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (c != null) {
                    c.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(habitaciondao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return 1;
    }

    public int deshabilitarHabitacion(habitacionbe obj) {
        String sql = " update hotel.habitacion  set estado = 0 where id_habitacion=" + -1 * obj.getId_habitacion() + ";";

        Connection c = null;
        int r = 0;

        try {
            c = new data().getMysql();
            Statement st = c.createStatement();
            r = st.executeUpdate(sql);
            c.close();
            c = null;
        } catch (SQLException ex) {
            Logger.getLogger(habitaciondao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (c != null) {
                    c.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(habitaciondao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return 1;
    }
}
