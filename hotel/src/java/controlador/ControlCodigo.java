/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import be.departamentobe;
import bl.departamentobl;
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
@RequestMapping("/consultacodigo.htm")
public class ControlCodigo {

    @RequestMapping(method = RequestMethod.GET)
    public String entradaGET(Model m){
        return "pagina1";
    }

    @RequestMapping(method = RequestMethod.POST)
    public String respuesta(@RequestParam("txtCodigo") String valor, Model m){
        if(valor.equals("")){
            m.addAttribute("mensaje","Valor ingresado en formulario es vacio");
            return "error";
        }else{
            departamentobl obj = new departamentobl();
            departamentobe entidad = obj.buscaxcodigo(valor);
            if(entidad!=null){
                m.addAttribute("valor",valor);
                m.addAttribute("dpto",entidad);
                return "codigo";
            }else{
                m.addAttribute("mensaje","la busqueda no devolvio resultados");
                return "error";
            }
        }
    }
}
