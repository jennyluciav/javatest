/*
*Nombre Archivo : usuariobe.java
*Nombre Clase   : usuario
*Creador Archivo: ASMODEUS-AZAZEL
*Fecha Creacion : 2017-11-07 04:00:28
 */
package dao;

import java.sql.Date;
import be.usuariobe;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class usuariodao {

    public usuariodao() {
    }

    public usuariobe getUsuario(int id_usuario) {
        usuariobe obj = null;

        String sql = "select id_usuario,id_persona,logueo,clave,tipo_nivel,estado,usuario_registra,fecha_registro from hotel.usuario" + "where  id_usuario = " + id_usuario;
        Connection c = null;

        try {
            c = new data().getMysql();
            Statement st = c.createStatement();
            ResultSet rs = st.executeQuery(sql);
            rs.next();
            obj = new usuariobe(rs.getInt("id_usuario"), rs.getInt("id_persona"), rs.getString("logueo"), rs.getString("clave"), rs.getInt("tipo_nivel"), rs.getInt("estado"), rs.getInt("usuario_registra"), rs.getDate("fecha_registro"));
            c.close();
            c = null;
        } catch (SQLException ex) {
            Logger.getLogger(usuariodao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (c != null) {
                    c.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(usuariodao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return obj;
    }

    public List<usuariobe> getUsuario(String parametro1) {
        List<usuariobe> obj = new ArrayList();

        String sql = "select id_usuario,id_persona,logueo,clave,tipo_nivel,estado,usuario_registra,fecha_registro from hotel.usuario where  id_usuario like '%" + parametro1 + "%' and estado = 1";
        Connection c = null;

        try {
            c = new data().getMysql();
            Statement st = c.createStatement();
            ResultSet rs = st.executeQuery(sql);

            while (rs.next()) {
                obj.add(new usuariobe(rs.getInt("id_usuario"), rs.getInt("id_persona"), rs.getString("logueo"), rs.getString("clave"), rs.getInt("tipo_nivel"), rs.getInt("estado"), rs.getInt("usuario_registra"), rs.getDate("fecha_registro")));
            }
            c.close();
            c = null;
        } catch (SQLException ex) {
            Logger.getLogger(usuariodao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (c != null) {
                    c.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(usuariodao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return obj;
    }

    public List<usuariobe> getUsuario(String parametro1, String parametro2) {
        List<usuariobe> obj = new ArrayList();

        String sql = "select id_usuario,id_persona,logueo,clave,tipo_nivel,estado,usuario_registra,fecha_registro from hotel.usuario where  logueo = '" + parametro1 + "' and clave = '" + parametro2 + "';";
        Connection c = null;

        try {
            c = new data().getMysql();
            Statement st = c.createStatement();
            ResultSet rs = st.executeQuery(sql);

            while (rs.next()) {
                obj.add(new usuariobe(rs.getInt("id_usuario"), rs.getInt("id_persona"), rs.getString("logueo"), rs.getString("clave"), rs.getInt("tipo_nivel"), rs.getInt("estado"), rs.getInt("usuario_registra"), rs.getDate("fecha_registro")));
            }
            c.close();
            c = null;
        } catch (SQLException ex) {
            Logger.getLogger(usuariodao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (c != null) {
                    c.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(usuariodao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return obj;
    }

    public int addUsuario(usuariobe obj) {
        String sql = " insert into hotel.usuario "
                + "   select (select max(id_usuario)from hotel.usuario)+1," + obj.getId_persona() + ",'" + obj.getLogueo() + "','" + obj.getClave() + "'," + obj.getTipo_nivel() + "," + obj.getEstado() + "," + obj.getUsuario_registra() + ",'" + obj.getFecha_registro() + "'";
        Connection c = null;
        int r = 0;
        try {
            c = new data().getMysql();
            Statement st = c.createStatement();
            r = st.executeUpdate(sql);
            c.close();
            c = null;
        } catch (SQLException ex) {
            Logger.getLogger(usuariodao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (c != null) {
                    c.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(usuariodao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return r;
    }

    public int updateUsuario(usuariobe obj) {
        String sql = " update hotel.usuario  set id_persona=" + obj.getId_persona() + ",logueo='" + obj.getLogueo() + "',clave='" + obj.getClave() + "',tipo_nivel=" + obj.getTipo_nivel() + ",estado=" + obj.getEstado() + ",usuario_registra=" + obj.getUsuario_registra() + ",fecha_registro='" + obj.getFecha_registro() + "' where id_usuario=" + obj.getId_usuario() + ";";
        Connection c = null;
        int r = 0;

        try {
            c = new data().getMysql();
            Statement st = c.createStatement();
            r = st.executeUpdate(sql);
            c.close();
            c = null;
        } catch (SQLException ex) {
            Logger.getLogger(usuariodao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (c != null) {
                    c.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(usuariodao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return 1;
    }

    public int deshabilitarUsuario(usuariobe obj) {
        String sql = " update hotel.usuario  set estado = 0 where id_usuario=" + -1 * obj.getId_usuario() + ";";

        Connection c = null;
        int r = 0;

        try {
            c = new data().getMysql();
            Statement st = c.createStatement();
            r = st.executeUpdate(sql);
            c.close();
            c = null;
        } catch (SQLException ex) {
            Logger.getLogger(usuariodao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (c != null) {
                    c.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(usuariodao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return 1;
    }
}
