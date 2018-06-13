/*
*Nombre Archivo : habitacionbl.java
*Nombre Clase   : habitacion
*Creador Archivo: ASMODEUS-AZAZEL
*Fecha Creacion : 2017-11-07 11:08:21
*/


package bl;
import be.habitacionbe;
import dao.habitaciondao;
import java.util.List;

public class habitacionbl {

public habitacionbl (){}

public habitacionbe getHabitacion( int id_habitacion){
return new habitaciondao().getHabitacion( id_habitacion); 
    }

public List<habitacionbe> getHabitacion( String parametro1){
return new habitaciondao().getHabitacion(  parametro1);
 
    }
public List<habitacionbe> getHabitacion( String parametro1,String parametro2){
 return new habitaciondao().getHabitacion(  parametro1, parametro2);
 
    }
public int addHabitacion( habitacionbe obj){
 return new habitaciondao().addHabitacion( obj);

    }
public int updateHabitacion( habitacionbe obj){
return new habitaciondao().updateHabitacion(   obj);
 
    }
public int deshabilitarHabitacion( habitacionbe obj){
return new habitaciondao().deshabilitarHabitacion(   obj);
 
    }
}