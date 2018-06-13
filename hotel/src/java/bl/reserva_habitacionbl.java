/*
*Nombre Archivo : reserva_habitacionbl.java
*Nombre Clase   : reserva_habitacion
*Creador Archivo: ASMODEUS-AZAZEL
*Fecha Creacion : 2017-11-07 11:06:33
 */
package bl;

import be.reserva_habitacionbe;
import dao.reserva_habitaciondao;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class reserva_habitacionbl {

    public reserva_habitacionbl() {
    }

    public reserva_habitacionbe getReserva_habitacion(int id_reserva) {
        return new reserva_habitaciondao().getReserva_habitacion(id_reserva);
    }

    public List<reserva_habitacionbe> getReserva_habitacion(String parametro1) {
        return new reserva_habitaciondao().getReserva_habitacion(parametro1);

    }

    public List<reserva_habitacionbe> getReserva_habitacion(String parametro1, String parametro2) {
        return new reserva_habitaciondao().getReserva_habitacion(parametro1, parametro2);

    }

    public int addReserva_habitacion(reserva_habitacionbe obj) {
        return new reserva_habitaciondao().addReserva_habitacion(obj);

    }

    public int updateReserva_habitacion(reserva_habitacionbe obj) {
        return new reserva_habitaciondao().updateReserva_habitacion(obj);

    }

    public Date fecha(String dateInString) throws ParseException {
        SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MON/yyyy");
        java.sql.Date fecha= new java.sql.Date(dateFormat.parse(dateInString).getTime());
        return fecha;
    }
}
