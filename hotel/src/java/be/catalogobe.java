/*
*Nombre Archivo : catalogobe.java
*Nombre Clase   : catalogo
*Creador Archivo: ASMODEUS-AZAZEL
*Fecha Creacion : 2017-11-07 01:50:34
 */
package be;

import java.sql.Date;

public class catalogobe {

    private int id_catalogo;

    private int id_catalogo_categoria;

    private String descripcion;

    private double precio;

    private int estado;

    private int usuario_registra;

    private Date fecha_registro;

    public catalogobe() {
    }

    public catalogobe(int id_catalogo, int id_catalogo_categoria, String descripcion, double precio, int estado, int usuario_registra, Date fecha_registro) {

        this.id_catalogo = id_catalogo;

        this.id_catalogo_categoria = id_catalogo_categoria;

        this.descripcion = descripcion;

        this.precio = precio;

        this.estado = estado;

        this.usuario_registra = usuario_registra;

        this.fecha_registro = fecha_registro;

    }

    public int getId_catalogo() {
        return id_catalogo;
    }

    public void setId_catalogo(int id_catalogo) {
        this.id_catalogo = id_catalogo;
    }

    public int getId_catalogo_categoria() {
        return id_catalogo_categoria;
    }

    public void setId_catalogo_categoria(int id_catalogo_categoria) {
        this.id_catalogo_categoria = id_catalogo_categoria;
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
