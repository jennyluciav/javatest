/*
*Nombre Archivo : reserva_habitacionbe.java
*Nombre Clase   : reserva_habitacion
*Creador Archivo: ASMODEUS-AZAZEL
*Fecha Creacion : 2017-11-07 01:51:11
 */
package be;

import java.sql.Date;

public class reserva_habitacionbe {

    private int id_reserva;

    private int id_habitacion;

    private int id_persona;

    private Date fecha_reserva;

    private Date fecha_reserva_limite;

    private Date fecha_estadia_inicio;

    private Date fecha_estadia_fin;

    private int estado;

    private int usuario_registra;

    private Date fecha_registro;

    public reserva_habitacionbe() {
    }

    public reserva_habitacionbe(int id_reserva, int id_habitacion, int id_persona, Date fecha_reserva, Date fecha_reserva_limite, Date fecha_estadia_inicio, Date fecha_estadia_fin, int estado, int usuario_registra, Date fecha_registro) {

        this.id_reserva = id_reserva;

        this.id_habitacion = id_habitacion;

        this.id_persona = id_persona;

        this.fecha_reserva = fecha_reserva;

        this.fecha_reserva_limite = fecha_reserva_limite;

        this.fecha_estadia_inicio = fecha_estadia_inicio;

        this.fecha_estadia_fin = fecha_estadia_fin;

        this.estado = estado;

        this.usuario_registra = usuario_registra;

        this.fecha_registro = fecha_registro;

    }

    public int getId_reserva() {
        return id_reserva;
    }

    public void setId_reserva(int id_reserva) {
        this.id_reserva = id_reserva;
    }

    public int getId_habitacion() {
        return id_habitacion;
    }

    public void setId_habitacion(int id_habitacion) {
        this.id_habitacion = id_habitacion;
    }

    public int getId_persona() {
        return id_persona;
    }

    public void setId_persona(int id_persona) {
        this.id_persona = id_persona;
    }

    public Date getFecha_reserva() {
        return fecha_reserva;
    }

    public void setFecha_reserva(Date fecha_reserva) {
        this.fecha_reserva = fecha_reserva;
    }

    public Date getFecha_reserva_limite() {
        return fecha_reserva_limite;
    }

    public void setFecha_reserva_limite(Date fecha_reserva_limite) {
        this.fecha_reserva_limite = fecha_reserva_limite;
    }

    public Date getFecha_estadia_inicio() {
        return fecha_estadia_inicio;
    }

    public void setFecha_estadia_inicio(Date fecha_estadia_inicio) {
        this.fecha_estadia_inicio = fecha_estadia_inicio;
    }

    public Date getFecha_estadia_fin() {
        return fecha_estadia_fin;
    }

    public void setFecha_estadia_fin(Date fecha_estadia_fin) {
        this.fecha_estadia_fin = fecha_estadia_fin;
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
