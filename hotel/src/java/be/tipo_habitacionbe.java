/*
*Nombre Archivo : tipo_habitacionbe.java
*Nombre Clase   : tipo_habitacion
*Creador Archivo: ASMODEUS-AZAZEL
*Fecha Creacion : 2017-11-07 01:46:59
 */
package be;

import java.sql.Date;

public class tipo_habitacionbe {

    private int id_tipo_habitacion;

    private String descripcion;

    private double precio;

    private String caracteristica;

    private int estado;

    private int usuario_registra;

    private Date fecha_registro;

    public tipo_habitacionbe() {
    }

    public tipo_habitacionbe(int id_tipo_habitacion, String descripcion, double precio, String caracteristica, int estado, int usuario_registra, Date fecha_registro) {

        this.id_tipo_habitacion = id_tipo_habitacion;

        this.descripcion = descripcion;

        this.precio = precio;

        this.caracteristica = caracteristica;

        this.estado = estado;

        this.usuario_registra = usuario_registra;

        this.fecha_registro = fecha_registro;

    }

    public int getId_tipo_habitacion() {
        return id_tipo_habitacion;
    }

    public void setId_tipo_habitacion(int id_tipo_habitacion) {
        this.id_tipo_habitacion = id_tipo_habitacion;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public String getCaracteristica() {
        return caracteristica;
    }

    public void setCaracteristica(String caracteristica) {
        this.caracteristica = caracteristica;
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
