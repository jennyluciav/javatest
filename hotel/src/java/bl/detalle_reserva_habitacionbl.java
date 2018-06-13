/*
*Nombre Archivo : detalle_reserva_habitacionbl.java
*Nombre Clase   : detalle_reserva_habitacion
*Creador Archivo: ASMODEUS-AZAZEL
*Fecha Creacion : 2017-11-07 11:08:45
*/


package bl;
import be.detalle_reserva_habitacionbe;
import dao.detalle_reserva_habitaciondao;
import java.util.List;

public class detalle_reserva_habitacionbl {

public detalle_reserva_habitacionbl (){}

public detalle_reserva_habitacionbe getDetalle_reserva_habitacion( int id_detalle_reserva_habitacion){
return new detalle_reserva_habitaciondao().getDetalle_reserva_habitacion( id_detalle_reserva_habitacion); 
    }

public List<detalle_reserva_habitacionbe> getDetalle_reserva_habitacion( String parametro1){
return new detalle_reserva_habitaciondao().getDetalle_reserva_habitacion(  parametro1);
 
    }
public List<detalle_reserva_habitacionbe> getDetalle_reserva_habitacion( String parametro1,String parametro2){
 return new detalle_reserva_habitaciondao().getDetalle_reserva_habitacion(  parametro1, parametro2);
 
    }
public int addDetalle_reserva_habitacion( detalle_reserva_habitacionbe obj){
 return new detalle_reserva_habitaciondao().addDetalle_reserva_habitacion( obj);

    }
public int updateDetalle_reserva_habitacion( detalle_reserva_habitacionbe obj){
return new detalle_reserva_habitaciondao().updateDetalle_reserva_habitacion(   obj);
 
    }
}