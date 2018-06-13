/*
*Nombre Archivo : personabl.java
*Nombre Clase   : persona
*Creador Archivo: ASMODEUS-AZAZEL
*Fecha Creacion : 2017-11-07 11:07:48
*/


package bl;
import be.personabe;
import dao.personadao;
import java.util.List;

public class personabl {

public personabl (){}

public personabe getPersona( int id_persona){
return new personadao().getPersona( id_persona); 
    }

public List<personabe> getPersona( String parametro1){
return new personadao().getPersona(  parametro1);
 
    }
public List<personabe> getPersona( String parametro1,String parametro2){
 return new personadao().getPersona(  parametro1, parametro2);
 
    }
public int addPersona( personabe obj){
 return new personadao().addPersona( obj);

    }
public int updatePersona( personabe obj){
return new personadao().updatePersona(   obj);
 
    }
public int deshabilitarPersona( personabe obj){
return new personadao().deshabilitarPersona(obj);
 
    }
 
}