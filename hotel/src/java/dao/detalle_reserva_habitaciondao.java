/*
*Nombre Archivo : detalle_reserva_habitacionbe.java
*Nombre Clase   : detalle_reserva_habitacion
*Creador Archivo: ASMODEUS-AZAZEL
*Fecha Creacion : 2017-11-07 04:18:34
*/


package dao;
import java.sql.Date;
import be.detalle_reserva_habitacionbe;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class detalle_reserva_habitaciondao {

public detalle_reserva_habitaciondao (){}

public detalle_reserva_habitacionbe getDetalle_reserva_habitacion( int id_detalle_reserva_habitacion){
detalle_reserva_habitacionbe obj = null;

String sql="select id_detalle_reserva_habitacion,id_reserva,id_catalogo,cantidad,igv,tipo_registro,estado,usuario_registra,fecha_registro from hotel.detalle_reserva_habitacion"+"where  id_detalle_reserva_habitacion = "+id_detalle_reserva_habitacion;
Connection c=null;


        try {
            c = new data().getMysql();
            Statement st = c.createStatement();
            ResultSet rs = st.executeQuery(sql);
            rs.next();obj = new detalle_reserva_habitacionbe(rs.getInt("id_detalle_reserva_habitacion"),rs.getInt("id_reserva"),rs.getInt("id_catalogo"),rs.getInt("cantidad"),rs.getDouble("igv"),rs.getInt("tipo_registro"),rs.getInt("estado"),rs.getInt("usuario_registra"),rs.getDate("fecha_registro"));
             c.close();
            c=null;
        } catch (SQLException ex) {
            Logger.getLogger(detalle_reserva_habitaciondao.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally{
            try {
                if(c!=null){
                    c.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(detalle_reserva_habitaciondao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return obj; 
    }

public List<detalle_reserva_habitacionbe> getDetalle_reserva_habitacion( String parametro1){
List<detalle_reserva_habitacionbe> obj = new ArrayList();

String sql="select id_detalle_reserva_habitacion,id_reserva,id_catalogo,cantidad,igv,tipo_registro,estado,usuario_registra,fecha_registro from hotel.detalle_reserva_habitacionwhere  id_detalle_reserva_habitacion like '%"+parametro1+"%'";
Connection c=null;


        try {
            c = new data().getMysql();
            Statement st = c.createStatement();
            ResultSet rs = st.executeQuery(sql); 

            while(rs.next()){obj.add(new  detalle_reserva_habitacionbe(rs.getInt("id_detalle_reserva_habitacion"),rs.getInt("id_reserva"),rs.getInt("id_catalogo"),rs.getInt("cantidad"),rs.getDouble("igv"),rs.getInt("tipo_registro"),rs.getInt("estado"),rs.getInt("usuario_registra"),rs.getDate("fecha_registro")));}
             c.close();
            c=null;
        } catch (SQLException ex) {
            Logger.getLogger(detalle_reserva_habitaciondao.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally{
            try {
                if(c!=null){
                    c.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(detalle_reserva_habitaciondao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return obj; 
    }
public List<detalle_reserva_habitacionbe> getDetalle_reserva_habitacion( String parametro1,String parametro2){
List<detalle_reserva_habitacionbe> obj = new ArrayList();

String sql="select id_detalle_reserva_habitacion,id_reserva,id_catalogo,cantidad,igv,tipo_registro,estado,usuario_registra,fecha_registro from hotel.detalle_reserva_habitacionwhere  id_detalle_reserva_habitacion like '%"+parametro1+"%'";
Connection c=null;


        try {
            c = new data().getMysql();
            Statement st = c.createStatement();
            ResultSet rs = st.executeQuery(sql); 

            while(rs.next()){obj.add(new  detalle_reserva_habitacionbe(rs.getInt("id_detalle_reserva_habitacion"),rs.getInt("id_reserva"),rs.getInt("id_catalogo"),rs.getInt("cantidad"),rs.getDouble("igv"),rs.getInt("tipo_registro"),rs.getInt("estado"),rs.getInt("usuario_registra"),rs.getDate("fecha_registro")));}
             c.close();
            c=null;
        } catch (SQLException ex) {
            Logger.getLogger(detalle_reserva_habitaciondao.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally{
            try {
                if(c!=null){
                    c.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(detalle_reserva_habitaciondao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return obj; 
    }
public int addDetalle_reserva_habitacion( detalle_reserva_habitacionbe obj){
String sql=" insert into hotel.detalle_reserva_habitacion"+
"select "+obj.getId_detalle_reserva_habitacion()+","+obj.getId_reserva()+","+obj.getId_catalogo()+","+obj.getCantidad()+","+obj.getIgv()+","+obj.getTipo_registro()+","+obj.getEstado()+","+obj.getUsuario_registra()+",'"+obj.getFecha_registro()+"'";
Connection c=null;


        try {
            c = new data().getMysql();
            Statement st = c.createStatement();
            ResultSet rs = st.executeQuery(sql); 
            c.close();
            c=null;
        } catch (SQLException ex) {
            Logger.getLogger(detalle_reserva_habitaciondao.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally{
            try {
                if(c!=null){
                    c.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(detalle_reserva_habitaciondao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return 1; 
    }
public int updateDetalle_reserva_habitacion( detalle_reserva_habitacionbe obj){
String sql=" update hotel.detalle_reserva_habitacion  set id_detalle_reserva_habitacion="+obj.getId_detalle_reserva_habitacion()+",id_reserva="+obj.getId_reserva()+",id_catalogo="+obj.getId_catalogo()+",cantidad="+obj.getCantidad()+",igv="+obj.getIgv()+",tipo_registro="+obj.getTipo_registro()+",estado="+obj.getEstado()+",usuario_registra="+obj.getUsuario_registra()+",fecha_registro='"+obj.getFecha_registro()+"'";
Connection c=null;


        try {
            c = new data().getMysql();
            Statement st = c.createStatement();
            ResultSet rs = st.executeQuery(sql); 
            c.close();
            c=null;
        } catch (SQLException ex) {
            Logger.getLogger(detalle_reserva_habitaciondao.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally{
            try {
                if(c!=null){
                    c.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(detalle_reserva_habitaciondao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return 1; 
    }
}