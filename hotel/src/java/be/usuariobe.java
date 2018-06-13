/*
*Nombre Archivo : usuariobe.java
*Nombre Clase   : usuario
*Creador Archivo: ASMODEUS-AZAZEL
*Fecha Creacion : 2017-11-07 01:52:06
 */
package be;

import java.sql.Date;

public class usuariobe {

    private int id_usuario;

    private int id_persona;

    private String logueo;

    private String clave;

    private int tipo_nivel;

    private int estado;

    private int usuario_registra;

    private Date fecha_registro;

    public usuariobe() {
    }

    public usuariobe(int id_usuario, int id_persona, String logueo, String clave, int tipo_nivel, int estado, int usuario_registra, Date fecha_registro) {

        this.id_usuario = id_usuario;

        this.id_persona = id_persona;

        this.logueo = logueo;

        this.clave = clave;

        this.tipo_nivel = tipo_nivel;

        this.estado = estado;

        this.usuario_registra = usuario_registra;

        this.fecha_registro = fecha_registro;

    }

    public int getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }

    public int getId_persona() {
        return id_persona;
    }

    public void setId_persona(int id_persona) {
        this.id_persona = id_persona;
    }

    public String getLogueo() {
        return logueo;
    }

    public void setLogueo(String logueo) {
        this.logueo = logueo;
    }

    public String getClave() {
        return clave;
    }

    public void setClave(String clave) {
        this.clave = clave;
    }

    public int getTipo_nivel() {
        return tipo_nivel;
    }

    public void setTipo_nivel(int tipo_nivel) {
        this.tipo_nivel = tipo_nivel;
    }

    public int getEstado() {
        return estado;
    }

    public void setEstado(int estado) {
        this.estado = estado;
    }

    public int getUsuario_registra() {
        return usuario_registra;
    }

    public void setUsuario_registra(int usuario_registra) {
        this.usuario_registra = usuario_registra;
    }

    public Date getFecha_registro() {
        return fecha_registro;
    }

    public void setFecha_registro(Date fecha_registro) {
        this.fecha_registro = fecha_registro;
    }

}
