/*
*Nombre Archivo : tipo_habitacionbl.java
*Nombre Clase   : tipo_habitacion
*Creador Archivo: ASMODEUS-AZAZEL
*Fecha Creacion : 2017-11-07 11:04:54
*/


package bl;
import be.tipo_habitacionbe;
import dao.tipo_habitaciondao;
import java.util.List;

public class tipo_habitacionbl {

public tipo_habitacionbl (){}

public tipo_habitacionbe getTipo_habitacion( int id_tipo_habitacion){
return new tipo_habitaciondao().getTipo_habitacion( id_tipo_habitacion); 
    }

public List<tipo_habitacionbe> getTipo_habitacion( String parametro1){
return new tipo_habitaciondao().getTipo_habitacion(  parametro1);
 
    }
public List<tipo_habitacionbe> getTipo_habitacion( String parametro1,String parametro2){
 return new tipo_habitaciondao().getTipo_habitacion(  parametro1, parametro2);
 
    }
public int addTipo_habitacion( tipo_habitacionbe obj){
 return new tipo_habitaciondao().addTipo_habitacion( obj);

    }
public int updateTipo_habitacion( tipo_habitacionbe obj){
return new tipo_habitaciondao().updateTipo_habitacion(   obj);
 
    }
public int deshabilitarTipo_habitacion( tipo_habitacionbe obj){
return new tipo_habitaciondao().deshabilitarTipo_habitacion(   obj);
 
    }
}