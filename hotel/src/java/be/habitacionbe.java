/*
*Nombre Archivo : habitacionbe.java
*Nombre Clase   : habitacion
*Creador Archivo: ASMODEUS-AZAZEL
*Fecha Creacion : 2017-11-07 01:48:07
 */
package be;

import java.sql.Date;

public class habitacionbe {

    private int id_habitacion;

    private int piso;
    
    private int nro;

    private int id_tipo_habitacion;

    private int estado;

    private int usuario_registra;

    private Date fecha_registro;

    public habitacionbe() {
    }

    public habitacionbe(int id_habitacion, int piso,int nro, int id_tipo_habitacion, int estado, int usuario_registra, Date fecha_registro) {

        this.id_habitacion = id_habitacion;

        this.piso = piso;
        this.nro = nro;

        this.id_tipo_habitacion = id_tipo_habitacion;

        this.estado = estado;

        this.usuario_registra = usuario_registra;

        this.fecha_registro = fecha_registro;

    }

    public int getId_habitacion() {
        return id_habitacion;
    }

    public void setId_habitacion(int id_habitacion) {
        this.id_habitacion = id_habitacion;
    }

    public int getNro() {
        return nro;
    }

    public void setNro(int nro) {
        this.nro = nro;
    }
    public int getPiso() {
        return piso;
    }

    public void setPiso(int piso) {
        this.piso = piso;
    }

    public int getId_tipo_habitacion() {
        return id_tipo_habitacion;
    }

    public void setId_tipo_habitacion(int id_tipo_habitacion) {
        this.id_tipo_habitacion = id_tipo_habitacion;
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
