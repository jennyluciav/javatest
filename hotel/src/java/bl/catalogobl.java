/*
*Nombre Archivo : catalogobl.java
*Nombre Clase   : catalogo
*Creador Archivo: ASMODEUS-AZAZEL
*Fecha Creacion : 2017-11-07 11:09:24
*/


package bl;
import be.catalogobe;
import dao.catalogodao;
import java.util.List;

public class catalogobl {

public catalogobl (){}

public catalogobe getCatalogo( int id_catalogo){
return new catalogodao().getCatalogo( id_catalogo); 
    }

public List<catalogobe> getCatalogo( String parametro1){
return new catalogodao().getCatalogo(  parametro1);
 
    }
public List<catalogobe> getCatalogo( String parametro1,String parametro2){
 return new catalogodao().getCatalogo(  parametro1, parametro2);
 
    }
public int addCatalogo( catalogobe obj){
 return new catalogodao().addCatalogo( obj);

    }
public int updateCatalogo( catalogobe obj){
return new catalogodao().updateCatalogo(obj);
 
    }

public int deshabilitarCatalogo( catalogobe obj){
return new catalogodao().deshabilitarCatalogo(   obj);
 
    }


}