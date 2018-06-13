/*
*Nombre Archivo : usuariobl.java
*Nombre Clase   : usuario
*Creador Archivo: ASMODEUS-AZAZEL
*Fecha Creacion : 2017-11-07 11:05:48
*/


package bl;
import be.usuariobe;
import dao.usuariodao;
import java.util.List;

public class usuariobl {

public usuariobl (){}

public usuariobe getUsuario( int id_usuario){
return new usuariodao().getUsuario( id_usuario); 
    }

public List<usuariobe> getUsuario( String parametro1){
return new usuariodao().getUsuario(  parametro1);
 
    }
public List<usuariobe> getUsuario( String parametro1,String parametro2){
 return new usuariodao().getUsuario(  parametro1, parametro2);
 
    }
public int addUsuario( usuariobe obj){
 return new usuariodao().addUsuario( obj);

    }
public int updateUsuario( usuariobe obj){
return new usuariodao().updateUsuario(   obj);
 
    }
public int deshabilitarUsuario( usuariobe obj){
return new usuariodao().deshabilitarUsuario(obj);
 
    }
}