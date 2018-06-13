/*
*Nombre Archivo : personabe.java
*Nombre Clase   : persona
*Creador Archivo: ASMODEUS-AZAZEL
*Fecha Creacion : 2017-11-07 01:44:09
 */
package be;

import java.sql.Date;

public class personabe {

    private int id_persona;

    private String nombre;

    private int tipo_documento;

    private String documento;

    private String telefono;

    private String correo_electronico;

    private int estado;

    private int usuario_registra;

    private Date fecha_registro;

    public personabe() {
    }

    public personabe(int id_persona, String nombre, int tipo_documento, String documento, String telefono, String correo_electronico, int estado, int usuario_registra, Date fecha_registro) {

        this.id_persona = id_persona;

        this.nombre = nombre;

        this.tipo_documento = tipo_documento;

        this.documento = documento;

        this.telefono = telefono;

        this.correo_electronico = correo_electronico;

        this.estado = estado;

        this.usuario_registra = usuario_registra;

        this.fecha_registro = fecha_registro;

    }

    public int getId_persona() {
        return id_persona;
    }

    public void setId_persona(int id_persona) {
        this.id_persona = id_persona;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getTipo_documento() {
        return tipo_documento;
    }

    public void setTipo_documento(int tipo_documento) {
        this.tipo_documento = tipo_documento;
    }

    public String getDocumento() {
        return documento;
    }

    public void setDocumento(String documento) {
        this.documento = documento;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getCorreo_electronico() {
        return correo_electronico;
    }

    public void setCorreo_electronico(String correo_electronico) {
        this.correo_electronico = correo_electronico;
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
