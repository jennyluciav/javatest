/*
*Nombre Archivo : catalogobe.java
*Nombre Clase   : catalogo
*Creador Archivo: ASMODEUS-AZAZEL
*Fecha Creacion : 2017-11-07 04:17:55
 */
package dao;

import java.sql.Date;
import be.catalogobe;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class catalogodao {

    public catalogodao() {
    }

    public catalogobe getCatalogo(int id_catalogo) {
        catalogobe obj = null;

        String sql = "select id_catalogo,id_catalogo_categoria,descripcion,precio,estado,usuario_registra,fecha_registro from hotel.catalogo" + "where  id_catalogo = " + id_catalogo;
        Connection c = null;

        try {
            c = new data().getMysql();
            Statement st = c.createStatement();
            ResultSet rs = st.executeQuery(sql);
            rs.next();
            obj = new catalogobe(rs.getInt("id_catalogo"), rs.getInt("id_catalogo_categoria"), rs.getString("descripcion"), rs.getDouble("precio"), rs.getInt("estado"), rs.getInt("usuario_registra"), rs.getDate("fecha_registro"));
            c.close();
            c = null;
        } catch (SQLException ex) {
            Logger.getLogger(catalogodao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (c != null) {
                    c.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(catalogodao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return obj;
    }

    public List<catalogobe> getCatalogo(String parametro1) {
        List<catalogobe> obj = new ArrayList();

        String sql = "select id_catalogo,id_catalogo_categoria,descripcion,precio,estado,usuario_registra,fecha_registro from hotel.catalogo where  id_catalogo_categoria = '" + parametro1 + "' and estado = 1";
        Connection c = null;

        try {
            c = new data().getMysql();
            Statement st = c.createStatement();
            ResultSet rs = st.executeQuery(sql);

            while (rs.next()) {
                obj.add(new catalogobe(rs.getInt("id_catalogo"), rs.getInt("id_catalogo_categoria"), rs.getString("descripcion"), rs.getDouble("precio"), rs.getInt("estado"), rs.getInt("usuario_registra"), rs.getDate("fecha_registro")));
            }
            c.close();
            c = null;
        } catch (SQLException ex) {
            Logger.getLogger(catalogodao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (c != null) {
                    c.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(catalogodao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return obj;
    }

    public List<catalogobe> getCatalogo(String parametro1, String parametro2) {
        List<catalogobe> obj = new ArrayList();

        String sql = "select id_catalogo,id_catalogo_categoria,descripcion,precio,estado,usuario_registra,fecha_registro from hotel.catalogowhere  id_catalogo like '%" + parametro1 + "%'";
        Connection c = null;

        try {
            c = new data().getMysql();
            Statement st = c.createStatement();
            ResultSet rs = st.executeQuery(sql);

            while (rs.next()) {
                obj.add(new catalogobe(rs.getInt("id_catalogo"), rs.getInt("id_catalogo_categoria"), rs.getString("descripcion"), rs.getDouble("precio"), rs.getInt("estado"), rs.getInt("usuario_registra"), rs.getDate("fecha_registro")));
            }
            c.close();
            c = null;
        } catch (SQLException ex) {
            Logger.getLogger(catalogodao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (c != null) {
                    c.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(catalogodao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return obj;
    }

    public int addCatalogo(catalogobe obj) {
        String sql = " insert into hotel.catalogo"
                + "   select " + obj.getId_catalogo() + "," + obj.getId_catalogo_categoria() + ",'" + obj.getDescripcion() + "'," + obj.getPrecio() + "," + obj.getEstado() + "," + obj.getUsuario_registra() + ",'" + obj.getFecha_registro() + "'";
        Connection c = null;
        int r = 0;

        try {
            c = new data().getMysql();
            Statement st = c.createStatement();
            r = st.executeUpdate(sql);
            c.close();
            c = null;
        } catch (SQLException ex) {
            Logger.getLogger(catalogodao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (c != null) {
                    c.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(catalogodao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return r;
    }

    public int updateCatalogo(catalogobe obj) {
        String sql = " update hotel.catalogo  set id_catalogo_categoria=" + obj.getId_catalogo_categoria() + ",descripcion='" + obj.getDescripcion() + "',precio=" + obj.getPrecio() + ",estado=" + obj.getEstado() + ",usuario_registra=" + obj.getUsuario_registra() + ",fecha_registro='" + obj.getFecha_registro() + "' where id_catalogo=" + obj.getId_catalogo() + ";";
        Connection c = null;
        int r = 0; 
        try {
            c = new data().getMysql();
            Statement st = c.createStatement();
            r = st.executeUpdate(sql);
            c.close();
            c = null;
        } catch (SQLException ex) {
            Logger.getLogger(catalogodao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (c != null) {
                    c.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(catalogodao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return r;
    }

    public int deshabilitarCatalogo(catalogobe obj) {
        String sql = " update hotel.catalogo  set estado = 0 where id_catalogo=" + -1 * obj.getId_catalogo() + ";";

        Connection c = null;
        int r = 0;
        try {
            c = new data().getMysql();
            Statement st = c.createStatement();
            r = st.executeUpdate(sql);
            c.close();
            c = null;
        } catch (SQLException ex) {
            Logger.getLogger(catalogodao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (c != null) {
                    c.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(catalogodao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return r;
    }
}
