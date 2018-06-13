/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import be.departamentobe;
import bl.departamentobl;
import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author Estudiante
 */
@Controller
@RequestMapping("/consultanombre.htm")
public class ControlNombre {
    @RequestMapping(method = RequestMethod.GET)
    public String entradaGET(Model m){
        return "pagina2";
    }

    @RequestMapping(method = RequestMethod.POST)
    public String respuesta(@RequestParam("txtNombre") String valor, Model m){
        if(valor.equals("")){
            m.addAttribute("mensaje","Valor ingresado en formulario es vacio");
            return "error";
        }else{
            departamentobl obj = new departamentobl();
            List<departamentobe> lentidad = obj.buscaxnombre(valor);
            if(lentidad!=null && lentidad.size()>0){
                m.addAttribute("valor",valor);
                m.addAttribute("dpto",lentidad);
                return "nombre";
            }else{
                m.addAttribute("mensaje","la busqueda no devolvio resultados");
                return "error";
            }
        }
    }
    
}
