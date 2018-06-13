/*
*Nombre Archivo : detalle_reserva_habitacionbe.java
*Nombre Clase   : detalle_reserva_habitacion
*Creador Archivo: ASMODEUS-AZAZEL
*Fecha Creacion : 2017-11-07 01:49:13
 */
package be;

import java.sql.Date;

public class detalle_reserva_habitacionbe {

    private int id_detalle_reserva_habitacion;

    private int id_reserva;

    private int id_catalogo;

    private int cantidad;

    private double igv;

    private int tipo_registro;

    private int estado;

    private int usuario_registra;

    private Date fecha_registro;

    public detalle_reserva_habitacionbe() {
    }

    public detalle_reserva_habitacionbe(int id_detalle_reserva_habitacion, int id_reserva, int id_catalogo, int cantidad, double igv, int tipo_registro, int estado, int usuario_registra, Date fecha_registro) {

        this.id_detalle_reserva_habitacion = id_detalle_reserva_habitacion;

        this.id_reserva = id_reserva;

        this.id_catalogo = id_catalogo;

        this.cantidad = cantidad;

        this.igv = igv;

        this.tipo_registro = tipo_registro;

        this.estado = estado;

        this.usuario_registra = usuario_registra;

        this.fecha_registro = fecha_registro;

    }

    public int getId_detalle_reserva_habitacion() {
        return id_detalle_reserva_habitacion;
    }

    public void setId_detalle_reserva_habitacion(int id_detalle_reserva_habitacion) {
        this.id_detalle_reserva_habitacion = id_detalle_reserva_habitacion;
    }

    public int getId_reserva() {
        return id_reserva;
    }

    public void setId_reserva(int id_reserva) {
        this.id_reserva = id_reserva;
    }

    public int getId_catalogo() {
        return id_catalogo;
    }

    public void setId_catalogo(int id_catalogo) {
        this.id_catalogo = id_catalogo;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public double getIgv() {
        return igv;
    }

    public void setIgv(double igv) {
        this.igv = igv;
    }

    public int getTipo_registro() {
        return tipo_registro;
    }

    public void setTipo_registro(int tipo_registro) {
        this.tipo_registro = tipo_registro;
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
