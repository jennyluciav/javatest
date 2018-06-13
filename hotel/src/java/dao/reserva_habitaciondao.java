/*
*Nombre Archivo : reserva_habitacionbe.java
*Nombre Clase   : reserva_habitacion
*Creador Archivo: ASMODEUS-AZAZEL
*Fecha Creacion : 2017-11-07 04:20:30
 */
package dao;

import java.sql.Date;
import be.reserva_habitacionbe;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class reserva_habitaciondao {

    public reserva_habitaciondao() {
    }

    public reserva_habitacionbe getReserva_habitacion(int id_reserva) {
        reserva_habitacionbe obj = null;

        String sql = "select id_reserva,id_habitacion,id_persona,fecha_reserva,fecha_reserva_limite,fecha_estadia_inicio,fecha_estadia_fin,estado,usuario_registra,fecha_registro from hotel.reserva_habitacion" + "where  id_reserva = " + id_reserva;
        Connection c = null;

        try {
            c = new data().getMysql();
            Statement st = c.createStatement();
            ResultSet rs = st.executeQuery(sql);
            rs.next();
            obj = new reserva_habitacionbe(rs.getInt("id_reserva"), rs.getInt("id_habitacion"), rs.getInt("id_persona"), rs.getDate("fecha_reserva"), rs.getDate("fecha_reserva_limite"), rs.getDate("fecha_estadia_inicio"), rs.getDate("fecha_estadia_fin"), rs.getInt("estado"), rs.getInt("usuario_registra"), rs.getDate("fecha_registro"));
            c.close();
            c = null;
        } catch (SQLException ex) {
            Logger.getLogger(reserva_habitaciondao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (c != null) {
                    c.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(reserva_habitaciondao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return obj;
    }

    public List<reserva_habitacionbe> getReserva_habitacion(String parametro1) {
        List<reserva_habitacionbe> obj = new ArrayList();

        String sql = "select id_reserva,id_habitacion,id_persona,fecha_reserva,fecha_reserva_limite,fecha_estadia_inicio,fecha_estadia_fin,estado,usuario_registra,fecha_registro from hotel.reserva_habitacion where  id_reserva like '%" + parametro1 + "%'";
        Connection c = null;
        try {
            c = new data().getMysql();
            Statement st = c.createStatement();
            ResultSet rs = st.executeQuery(sql);

            while (rs.next()) {
                obj.add(new reserva_habitacionbe(rs.getInt("id_reserva"), rs.getInt("id_habitacion"), rs.getInt("id_persona"), rs.getDate("fecha_reserva"), rs.getDate("fecha_reserva_limite"), rs.getDate("fecha_estadia_inicio"), rs.getDate("fecha_estadia_fin"), rs.getInt("estado"), rs.getInt("usuario_registra"), rs.getDate("fecha_registro")));
            }
            c.close();
            c = null;
        } catch (SQLException ex) {
            Logger.getLogger(reserva_habitaciondao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (c != null) {
                    c.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(reserva_habitaciondao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return obj;
    }

    public List<reserva_habitacionbe> getReserva_habitacion(String parametro1, String parametro2) {
        List<reserva_habitacionbe> obj = new ArrayList();

        String sql = "select id_reserva,id_habitacion,id_persona,fecha_reserva,fecha_reserva_limite,fecha_estadia_inicio,fecha_estadia_fin,estado,usuario_registra,fecha_registro from hotel.reserva_habitacionwhere  id_reserva like '%" + parametro1 + "%'";
        Connection c = null;

        try {
            c = new data().getMysql();
            Statement st = c.createStatement();
            ResultSet rs = st.executeQuery(sql);

            while (rs.next()) {
                obj.add(new reserva_habitacionbe(rs.getInt("id_reserva"), rs.getInt("id_habitacion"), rs.getInt("id_persona"), rs.getDate("fecha_reserva"), rs.getDate("fecha_reserva_limite"), rs.getDate("fecha_estadia_inicio"), rs.getDate("fecha_estadia_fin"), rs.getInt("estado"), rs.getInt("usuario_registra"), rs.getDate("fecha_registro")));
            }
            c.close();
            c = null;
        } catch (SQLException ex) {
            Logger.getLogger(reserva_habitaciondao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (c != null) {
                    c.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(reserva_habitaciondao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return obj;
    }

    public int addReserva_habitacion(reserva_habitacionbe obj) {
        String sql = " insert into hotel.reserva_habitacion"
                + "   select coalesce((select max(id_reserva) from hotel.reserva_habitacion),0)+1," + obj.getId_habitacion() + "," + obj.getId_persona() + ",'" + obj.getFecha_reserva() + "','" + obj.getFecha_reserva_limite() + "','" + obj.getFecha_estadia_inicio() + "','" + obj.getFecha_estadia_fin() + "'," + obj.getEstado() + "," + obj.getUsuario_registra() + ",'" + obj.getFecha_registro() + "'";
        Connection c = null;
        int r = 0;

        try {
            c = new data().getMysql();
            Statement st = c.createStatement();
            r = st.executeUpdate(sql);
            c.close();
            c = null;
        } catch (SQLException ex) {
            Logger.getLogger(reserva_habitaciondao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (c != null) {
                    c.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(reserva_habitaciondao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return r;
    }

    public int updateReserva_habitacion(reserva_habitacionbe obj) {
        String sql = " update hotel.reserva_habitacion  set id_reserva=" + obj.getId_reserva() + ",id_habitacion=" + obj.getId_habitacion() + ",id_persona=" + obj.getId_persona() + ",fecha_reserva='" + obj.getFecha_reserva() + "',fecha_reserva_limite='" + obj.getFecha_reserva_limite() + "',fecha_estadia_inicio='" + obj.getFecha_estadia_inicio() + "',fecha_estadia_fin='" + obj.getFecha_estadia_fin() + "',estado=" + obj.getEstado() + ",usuario_registra=" + obj.getUsuario_registra() + ",fecha_registro='" + obj.getFecha_registro() + "'";
        Connection c = null;
        int r = 0;

        try {
            c = new data().getMysql();
            Statement st = c.createStatement();
            r = st.executeUpdate(sql);
            c.close();
            c = null;
        } catch (SQLException ex) {
            Logger.getLogger(reserva_habitaciondao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (c != null) {
                    c.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(reserva_habitaciondao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return 1;
    }

    public int deshabilitarReserva_habitacion(reserva_habitacionbe obj) {
        String sql = " update hotel.reserva_habitacion  set estado = 0 where id_reserva_habitacion=" + -1 * obj.getId_reserva() + ";";

        Connection c = null;
        int r = 0;

        try {
            c = new data().getMysql();
            Statement st = c.createStatement();
            r = st.executeUpdate(sql);
            c.close();
            c = null;
        } catch (SQLException ex) {
            Logger.getLogger(reserva_habitaciondao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (c != null) {
                    c.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(reserva_habitaciondao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return 1;
    }
}
