/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;
/**
 *
 * @author ASMODEUS
 */
import be.usuariobe;
import bl.usuariobl;
import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/validar")

public class ControlUsuario {
    
    @RequestMapping(method = RequestMethod.GET)
    public String entradaGET(Model m){
        return "index";
    }

    @RequestMapping(method = RequestMethod.POST)
    public String respuesta(@RequestParam("txtUsuario") String usuario,@RequestParam("txtClave") String clave , Model m){
        if(usuario.equals("") || clave.equals("") ){
            m.addAttribute("mensaje","Ingrese datos correctos");
            return "index";
        }else{
            usuariobl obj = new usuariobl();
            List<usuariobe> entidad = obj.getUsuario(usuario,clave);
            
            if(entidad != null && entidad.size()>0){
                m.addAttribute("valor",usuario);
                m.addAttribute("dpto",entidad);
                return "principal";
            }else{
                m.addAttribute("mensaje","No existe usuario y/o contraseña");
                return "index";
            }
        }
    }
}


