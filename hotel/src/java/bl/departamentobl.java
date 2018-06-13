/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bl;

import be.departamentobe;
import dao.departamentodao;
import java.util.List;

/**
 *
 * @author Estudiante
 */
public class departamentobl {

    public departamentobl() {
    }
    public departamentobe buscaxcodigo(String cod){
        return new departamentodao().getDepartamento(cod);
    }
    public List<departamentobe> buscaxnombre(String nom){
        return new departamentodao().getDepartamentos(nom);
    }
}
