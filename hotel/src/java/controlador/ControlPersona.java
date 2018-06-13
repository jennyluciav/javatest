/* 
*Nombre Archivo : ControlPersona.jsp
*Creador Archivo: carranza-PC
*Fecha Creacion : 2017-11-09 13:15:56
 */
package controlador;

import be.personabe;
import bl.personabl;
import java.sql.Date; 
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/persona.htm")
public class ControlPersona {

    @RequestMapping(method = RequestMethod.GET)
    public String entradaGET(Model m) {
        return "inicio";
    }

    /**
     *
     * @param id_persona
     * @param nombre
     * @param tipo_documento
     * @param documento
     * @param telefono
     * @param correo_electronico
     * @param estado
     * @param usuario_registra
     * @param fecha_registro
     * @param m
     * @return
     */
    @RequestMapping(method = RequestMethod.POST)
    public String respuesta(
            @RequestParam("txtId_persona") int id_persona,
            @RequestParam("txtNombre") String nombre,
            @RequestParam("txtTipo_documento") int tipo_documento,
            @RequestParam("txtDocumento") String documento,
            @RequestParam("txtTelefono") String telefono,
            @RequestParam("txtCorreo_electronico") String correo_electronico,
            @RequestParam("txtEstado") int estado,
            @RequestParam("txtUsuario_registra") int usuario_registra, 
            Model m) {

        if (String.valueOf(id_persona).equals("")) {
            m.addAttribute("mensaje", "Ingrese datos correctos");
            m.addAttribute("componente", "txtId_persona");
            
        return "persona_mante";

        } else if (nombre.equals("")) {
            m.addAttribute("mensaje", "Ingrese datos correctos");
            m.addAttribute("componente", "txtNombre");
           
        return "persona_mante";

        } else if (String.valueOf(tipo_documento).equals("")) {
            m.addAttribute("mensaje", "Ingrese datos correctos");
            m.addAttribute("componente", "txtTipo_documento");
            
        return "persona_mante";

        } else if (documento.equals("")) {
            m.addAttribute("mensaje", "Ingrese datos correctos");
            m.addAttribute("componente", "txtDocumento");
            
        return "persona_mante";

        } else {
            java.util.Date now = new java.util.Date();
            java.sql.Date fecha_registro = new java.sql.Date(now.getTime());
            personabl obj = new personabl();
            personabe e = new personabe(id_persona, nombre, tipo_documento, documento, telefono, correo_electronico, estado, usuario_registra, fecha_registro);

            Integer resul = 0;
            resul = obj.addPersona(e);

            if (resul > 0) {
                m.addAttribute("mensaje", "Se guardaron los datos Correctamente");
                
        return "persona_mante";
            } else {
                m.addAttribute("mensaje", "No se guardaron los datos Correctamente");
                
        return "persona_mante";
            }
        }
    }
}
