-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-06-2018 a las 17:20:15
-- Versión del servidor: 5.6.21
-- Versión de PHP: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `rokagym_db`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_bl_get`(in p_tabla VARCHAR(50))
BEGIN
/*creamos la cabecera*/

select CONCAT("/*",CHAR(10),
"*Nombre Archivo : ",p_tabla,"br.java",CHAR(10),
"*Nombre Clase   : ",p_tabla,CHAR(10),
"*Creador Archivo: ",@@hostname ,CHAR(10),
"*Fecha Creacion : ",now() ,CHAR(10),
"*/",char(10),char(10)) 
union all 
 

select CONCAT("package br;",char(10) 
,"import be.",p_tabla,"be;",char(10)
,"import dao.",p_tabla,"dao;",char(10) 
,"import java.util.List;",char(10))
 

union all 
/*creamos la clase*/
select CONCAT("public class ",p_tabla,"br {",char(10))
union all  
   
select CONCAT("public ",p_tabla,"br (){}",char(10))

union all 

select CONCAT("public ",p_tabla,"be get",CONCAT(UCASE(LEFT(p_tabla, 1)),LCASE(SUBSTRING(p_tabla, 2))),"( ",(select CONCAT(data_type , " " , COLUMN_NAME)  
				from information_schema.COLUMNS 
				where TABLE_SCHEMA = 'rokagym_db' AND table_name = p_tabla and column_key = 'PRI'),"){" ,

"
return new ",p_tabla,"dao().get",CONCAT(UCASE(LEFT(p_tabla, 1)),LCASE(SUBSTRING(p_tabla, 2))),"(",(select CONCAT(  COLUMN_NAME)  
				from information_schema.COLUMNS 
				where TABLE_SCHEMA = 'rokagym_db' AND table_name = p_tabla and column_key = 'PRI'),");"
, " 
    }",char(10))
union all


select CONCAT("public List<",p_tabla,"be> get",CONCAT(UCASE(LEFT(p_tabla, 1)),LCASE(SUBSTRING(p_tabla, 2))),"( String parametro1){"  
,"
return new ",p_tabla,"dao().get",CONCAT(UCASE(LEFT(p_tabla, 1)),LCASE(SUBSTRING(p_tabla, 2))),"(parametro1);
"
 , " 
    }")


union all


select CONCAT("public List<",p_tabla,"be> get",CONCAT(UCASE(LEFT(p_tabla, 1)),LCASE(SUBSTRING(p_tabla, 2))),"( String parametro1,String parametro2){" ,
"
 return new ",p_tabla,"dao().get",CONCAT(UCASE(LEFT(p_tabla, 1)),LCASE(SUBSTRING(p_tabla, 2))),"(parametro1, parametro2);
"

 , " 
    }" )


union all


select CONCAT("public int add",CONCAT(UCASE(LEFT(p_tabla, 1)),LCASE(SUBSTRING(p_tabla, 2))),"( ",p_tabla,"be obj){" , 
"
 return new ",p_tabla,"dao().add",CONCAT(UCASE(LEFT(p_tabla, 1)),LCASE(SUBSTRING(p_tabla, 2))),"(obj);
","
    }" )


union all


select CONCAT("public int update",CONCAT(UCASE(LEFT(p_tabla, 1)),LCASE(SUBSTRING(p_tabla, 2))),"( ",p_tabla,"be obj){" ,
"
return new ",p_tabla,"dao().update",CONCAT(UCASE(LEFT(p_tabla, 1)),LCASE(SUBSTRING(p_tabla, 2))),"(obj);
"

, " 
    }", "
}" ) 
 ;
         
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_dao_get`(in p_tabla VARCHAR(50))
BEGIN
/*creamos la cabecera*/

select CONCAT("/*",CHAR(10),
"*Nombre Archivo : ",p_tabla,"be.java",CHAR(10),
"*Nombre Clase   : ",p_tabla,CHAR(10),
"*Creador Archivo: ",@@hostname ,CHAR(10),
"*Fecha Creacion : ",now() ,CHAR(10),
"*/",char(10),char(10)) 
union all 
 

select CONCAT("package dao;",char(10),"import java.sql.Date;",char(10)
,"import be.",p_tabla,"be;",char(10)
,"import java.sql.Connection;",char(10)
,"import java.sql.ResultSet;",char(10)
,"import java.sql.SQLException;",char(10)
,"import java.sql.Statement;",char(10)
,"import java.util.ArrayList;",char(10)
,"import java.util.List;",char(10)
,"import java.util.logging.Level;",char(10)
,"import java.util.logging.Logger;",char(10))


union all 
/*creamos la clase*/
select CONCAT("public class ",p_tabla,"dao {",char(10))
union all  
   
select CONCAT("public ",p_tabla,"dao (){}",char(10))

union all 
select CONCAT("public ",p_tabla,"be get",CONCAT(UCASE(LEFT(p_tabla, 1)),LCASE(SUBSTRING(p_tabla, 2))),"( ",(select CONCAT(data_type , " " , COLUMN_NAME)  
				from information_schema.COLUMNS 
				where TABLE_SCHEMA = 'rokagym_db' AND table_name = p_tabla and column_key = 'PRI'),"){" )

union all 
select CONCAT(p_tabla,"be obj = null;",char(10))
union all 
select CONCAT("String sql=""select ",(select GROUP_CONCAT( COLUMN_NAME ) from information_schema.COLUMNS where TABLE_SCHEMA = 'rokagym_db' and  table_name = p_tabla), " from rokagym_db.",p_tabla, """","+","""" 
,(select CONCAT(" where " , COLUMN_NAME ," = " """","+",COLUMN_NAME )  
		from information_schema.COLUMNS 
	where TABLE_SCHEMA = 'rokagym_db' AND table_name = p_tabla and column_key = 'PRI'),";") 
union all 
select CONCAT("Connection c=null;",char(10)) 
 union all 
select CONCAT("
        try {", "
            c = new data().getMysql();", "
            Statement st = c.createStatement();", "
            ResultSet rs = st.executeQuery(sql);", "
            rs.next();", 
            "obj = new ",p_tabla,"be(", 


						(select GROUP_CONCAT( CONCAT( "rs.get",

CONCAT(UCASE(LEFT(case when DATA_TYPE = 'VARCHAR' THEN "String" ELSE 
															CASE when DATA_TYPE = 'datetime' THEN 'Date' else DATA_TYPE end END, 1)),LCASE(SUBSTRING(case when DATA_TYPE = 'VARCHAR' THEN "String" ELSE 
															CASE when DATA_TYPE = 'datetime' THEN 'Date' else DATA_TYPE end END, 2)))

,"(""", COLUMN_NAME ,"""",")")) 
							from information_schema.COLUMNS where TABLE_SCHEMA = 'rokagym_db' and  table_name = p_tabla),");", "
             c.close();", "
            c=null;", "
        } catch (SQLException ex) {", "
            Logger.getLogger(",p_tabla,"dao.class.getName()).log(Level.SEVERE, null, ex);", "
        }", "
        finally{", "
            try {", "
                if(c!=null){", "
                    c.close();", "
                }", "
            } catch (SQLException ex) {", "
                Logger.getLogger(",p_tabla,"dao.class.getName()).log(Level.SEVERE, null, ex);", "
            }", "
        }", "
        return obj;", " 
    }",char(10))
union all


select CONCAT("public List<",p_tabla,"be> get",CONCAT(UCASE(LEFT(p_tabla, 1)),LCASE(SUBSTRING(p_tabla, 2))),"( String parametro1){" )

union all 
select CONCAT("List<",p_tabla,"be> obj = new ArrayList();",char(10)) 
union all 
select CONCAT("String sql=""select ",(select GROUP_CONCAT( COLUMN_NAME ) from information_schema.COLUMNS where TABLE_SCHEMA = 'rokagym_db' and  table_name = p_tabla), " from rokagym_db.",p_tabla 
,(select CONCAT(" where " , COLUMN_NAME ," like '%" """","+","parametro1","+","""%'""" )  
		from information_schema.COLUMNS 
	where TABLE_SCHEMA = 'rokagym_db' AND table_name = p_tabla and column_key = 'PRI'),";") 
union all 
select CONCAT("Connection c=null;",char(10)) 
 union all 
select CONCAT("
        try {", "
            c = new data().getMysql();", "
            Statement st = c.createStatement();", "
            ResultSet rs = st.executeQuery(sql);", " 

            while(rs.next()){", 
            "obj.add(new  ",p_tabla,"be(", 
						(select GROUP_CONCAT( CONCAT( "rs.get",

CONCAT(UCASE(LEFT(case when DATA_TYPE = 'VARCHAR' THEN "String" ELSE 
															CASE when DATA_TYPE = 'datetime' THEN 'Date' else DATA_TYPE end END, 1)),LCASE(SUBSTRING(case when DATA_TYPE = 'VARCHAR' THEN "String" ELSE 
															CASE when DATA_TYPE = 'datetime' THEN 'Date' else DATA_TYPE end END, 2)))

,"(""", COLUMN_NAME ,"""",")")) 
							from information_schema.COLUMNS where TABLE_SCHEMA = 'rokagym_db' and  table_name = p_tabla),"));}", "
             c.close();","
            c=null;","
        } catch (SQLException ex) {","
            Logger.getLogger(",p_tabla,"dao.class.getName()).log(Level.SEVERE, null, ex);","
        }","
        finally{", "
            try {", "
                if(c!=null){", "
                    c.close();", "
                }", "
            } catch (SQLException ex) {", "
                Logger.getLogger(",p_tabla,"dao.class.getName()).log(Level.SEVERE, null, ex);", "
            }", "
        }", "
        return obj;", " 
    }")


union all


select CONCAT("public List<",p_tabla,"be> get",CONCAT(UCASE(LEFT(p_tabla, 1)),LCASE(SUBSTRING(p_tabla, 2))),"( String parametro1,String parametro2){" )

union all 
select CONCAT("List<",p_tabla,"be> obj = new ArrayList();",char(10)) 
union all 
select CONCAT("String sql=""select ",(select GROUP_CONCAT( COLUMN_NAME ) from information_schema.COLUMNS where TABLE_SCHEMA = 'rokagym_db' and  table_name = p_tabla), " from rokagym_db.",p_tabla 
,(select CONCAT(" where " , COLUMN_NAME ," like '%" """","+","parametro1","+","""%'""" )  
		from information_schema.COLUMNS 
	where TABLE_SCHEMA = 'rokagym_db' AND table_name = p_tabla and column_key = 'PRI'),";") 
union all 
select CONCAT("Connection c=null;",char(10)) 
 union all 
select CONCAT("
        try {", "
            c = new data().getMysql();", "
            Statement st = c.createStatement();", "
            ResultSet rs = st.executeQuery(sql);", " 

            while(rs.next()){", 
            "obj.add(new  ",p_tabla,"be(", 
						(select GROUP_CONCAT( CONCAT( "rs.get",

CONCAT(UCASE(LEFT(case when DATA_TYPE = 'VARCHAR' THEN "String" ELSE 
															CASE when DATA_TYPE = 'datetime' THEN 'Date' else DATA_TYPE end END, 1)),LCASE(SUBSTRING(case when DATA_TYPE = 'VARCHAR' THEN "String" ELSE 
															CASE when DATA_TYPE = 'datetime' THEN 'Date' else DATA_TYPE end END, 2)))

,"(""", COLUMN_NAME ,"""",")")) 
							from information_schema.COLUMNS where TABLE_SCHEMA = 'rokagym_db' and  table_name = p_tabla),"));}", "
             c.close();","
            c=null;","
        } catch (SQLException ex) {","
            Logger.getLogger(",p_tabla,"dao.class.getName()).log(Level.SEVERE, null, ex);","
        }","
        finally{", "
            try {", "
                if(c!=null){", "
                    c.close();", "
                }", "
            } catch (SQLException ex) {", "
                Logger.getLogger(",p_tabla,"dao.class.getName()).log(Level.SEVERE, null, ex);", "
            }", "
        }", "
        return obj;", " 
    }"
)


union all


select CONCAT("public int add",CONCAT(UCASE(LEFT(p_tabla, 1)),LCASE(SUBSTRING(p_tabla, 2))),"( ",p_tabla,"be obj){" )

union all     

select CONCAT("String sql="" insert into rokagym_db.",p_tabla,"""","+","
""   select (select max(id_",p_tabla,")from rokagym_db.",p_tabla,")+1,", (select GROUP_CONCAT( CONCAT( CASE WHEN DATA_TYPE IN ("int","double","decimal") then "" else "'" end , """+obj.get",CONCAT(UCASE(LEFT(COLUMN_NAME, 1)),LCASE(SUBSTRING(COLUMN_NAME, 2))),"()+" ,"""",CASE WHEN DATA_TYPE IN ("int","double","decimal") then "" else "'" end )) from information_schema.COLUMNS where TABLE_SCHEMA = 'rokagym_db'  and  table_name = p_tabla and COLUMN_KEY != 'PRI'), 
""";") 
union all 
select CONCAT("Connection c=null;
int r = 0;
",char(10)) 
 union all 
select CONCAT("
        try {", "
            c = new data().getMysql();", "
            Statement st = c.createStatement();", "
             r = st.executeUpdate(sql);", " 
            c.close();","
            c=null;","
        } catch (SQLException ex) {","
            Logger.getLogger(",p_tabla,"dao.class.getName()).log(Level.SEVERE, null, ex);","
        }","
        finally{", "
            try {", "
                if(c!=null){", "
                    c.close();", "
                }", "
            } catch (SQLException ex) {", "
                Logger.getLogger(",p_tabla,"dao.class.getName()).log(Level.SEVERE, null, ex);", "
            }", "
        }", "
        return r;", " 
    }" )


union all


select CONCAT("public int update",CONCAT(UCASE(LEFT(p_tabla, 1)),LCASE(SUBSTRING(p_tabla, 2))),"( ",p_tabla,"be obj){" )

union all    

select CONCAT("String sql="" update rokagym_db.",p_tabla,"  set ",
(select GROUP_CONCAT( CONCAT(COLUMN_NAME,"=", CASE WHEN DATA_TYPE IN ("int","double","decimal") then "" else "'" end , """+obj.get",CONCAT(UCASE(LEFT(COLUMN_NAME, 1)),LCASE(SUBSTRING(COLUMN_NAME, 2))),"()+" ,"""",CASE WHEN DATA_TYPE IN ("int","double","decimal") then "" else "'" end )) 
from information_schema.COLUMNS where TABLE_SCHEMA = 'rokagym_db'  and  table_name = p_tabla)				
, 
""";") 
union all 
select CONCAT("Connection c=null;
int r = 0;
",char(10)) 
 union all 
select CONCAT("
        try {", "
            c = new data().getMysql();", "
            Statement st = c.createStatement();", "
             r = st.executeUpdate(sql);", " 
            c.close();","
            c=null;","
        } catch (SQLException ex) {","
            Logger.getLogger(",p_tabla,"dao.class.getName()).log(Level.SEVERE, null, ex);","
        }","
        finally{", "
            try {", "
                if(c!=null){", "
                    c.close();", "
                }", "
            } catch (SQLException ex) {", "
                Logger.getLogger(",p_tabla,"dao.class.getName()).log(Level.SEVERE, null, ex);", "
            }", "
        }", "
        return 1;", " 
    }", "
" )

union all 
select CONCAT("public int deshabilitar",CONCAT(UCASE(LEFT(p_tabla, 1)),LCASE(SUBSTRING(p_tabla, 2))),"( ",p_tabla,"be obj){" )

union all    

select CONCAT(" String sql = "" update rokagym_db.",p_tabla,"  set estado = 0 where id_",p_tabla,"="" + -1*obj.getId_",p_tabla,"() + "";"";
       ") 
union all 
select CONCAT("Connection c=null;
int r = 0;
",char(10)) 
 union all 
select CONCAT("
        try {", "
            c = new data().getMysql();", "
            Statement st = c.createStatement();", "
             r = st.executeUpdate(sql);", " 
            c.close();","
            c=null;","
        } catch (SQLException ex) {","
            Logger.getLogger(",p_tabla,"dao.class.getName()).log(Level.SEVERE, null, ex);","
        }","
        finally{", "
            try {", "
                if(c!=null){", "
                    c.close();", "
                }", "
            } catch (SQLException ex) {", "
                Logger.getLogger(",p_tabla,"dao.class.getName()).log(Level.SEVERE, null, ex);", "
            }", "
        }", "
        return 1;", " 
    }", "
}" )

 ;
         
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_modelo_get`(in p_tabla VARCHAR(50))
BEGIN
/*creamos la cabecera*/

select CONCAT("/*",CHAR(10),
"*Nombre Archivo : ",p_tabla,"be.java",CHAR(10),
"*Nombre Clase   : ",p_tabla,CHAR(10),
"*Creador Archivo: ",@@hostname ,CHAR(10),
"*Fecha Creacion : ",now() ,CHAR(10),
"*/",char(10),char(10)) 
union all 
 
/*creamos el packete*/

select CONCAT("package be;",char(10),"import java.sql.Date;",char(10))


union all 
/*creamos la clase*/
select CONCAT("public class ",p_tabla,"be {",char(10))
union all  
/*creamos las variables*/
select  CONCAT("private ",case when DATA_TYPE = 'VARCHAR' THEN "String" ELSE 
															CASE when DATA_TYPE = 'datetime' THEN 'Date' else DATA_TYPE end END ," ",COLUMN_NAME,"; ",char(10)) from information_schema.COLUMNS
where TABLE_SCHEMA = 'rokagym_db' and  table_name = p_tabla
 

/*creamos los constructores*/
union all 
select CONCAT("public ",p_tabla,"be (){}",char(10))

union all 
select CONCAT("public ",p_tabla,"be (",(select GROUP_CONCAT(CONCAT(case when DATA_TYPE = 'VARCHAR' THEN "String" ELSE 
																																												CASE when DATA_TYPE = 'datetime' THEN "Date" else DATA_TYPE end END ," ",COLUMN_NAME )) from information_schema.COLUMNS
																				where TABLE_SCHEMA = 'rokagym_db' and  table_name = p_tabla
																				group by table_name),"){",char(10))
union all 

select CONCAT("this.",COLUMN_NAME,"=",COLUMN_NAME,"; ",char(10)) from information_schema.COLUMNS
where TABLE_SCHEMA = 'rokagym_db' and  table_name = p_tabla
union all 
select CONCAT("}",char(10))
union all 

/*creamos los Get-Set */


select CONCAT("public ",case when DATA_TYPE = 'VARCHAR' THEN "String" ELSE CASE when DATA_TYPE = 'datetime' THEN "Date" else DATA_TYPE end END ,
" get",CONCAT(UCASE(LEFT(COLUMN_NAME, 1)),LCASE(SUBSTRING(COLUMN_NAME, 2))),"(){",char(10),
"return ",COLUMN_NAME,"; ",char(10),'}',char(10),
"public void set",CONCAT(UCASE(LEFT(COLUMN_NAME, 1)),LCASE(SUBSTRING(COLUMN_NAME, 2))),"("
,
case when DATA_TYPE = 'VARCHAR' THEN "String" ELSE CASE when DATA_TYPE = 'datetime' THEN "Date" else DATA_TYPE end END," ",
COLUMN_NAME
,"){",char(10),
"this.",COLUMN_NAME,"=",COLUMN_NAME,"; ",char(10),'}',char(10)
) from information_schema.COLUMNS
where TABLE_SCHEMA = 'rokagym_db' and  table_name = p_tabla
union all 
select CONCAT("}",char(10))
;


END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_tabla_mante_get`(in p_tabla VARCHAR(50))
BEGIN

select CONCAT("/* ",CHAR(10),
"*Nombre Archivo : Control",CONCAT(UCASE(LEFT(p_tabla, 1)),LCASE(SUBSTRING(p_tabla, 2))),".jsp",CHAR(10), 
"*Creador Archivo: ",@@hostname ,CHAR(10),
"*Fecha Creacion : ",now() ,CHAR(10),
"*/",char(10),char(10)) 
union all 
 

select CONCAT("  
package controller; 

import be.",p_tabla,"be;
import br.",p_tabla,"br;
import java.sql.Date;
import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping(""/",p_tabla,".htm"")
public class ",CONCAT(LCASE(LEFT(p_tabla, 1)),LCASE(SUBSTRING(p_tabla, 2))),"Controller {
    
    @RequestMapping(method = RequestMethod.GET)
    public String entradaGET(Model m){
        return ""index"";
    }

    @RequestMapping(method = RequestMethod.POST)
public String respuesta(
" ,char(10)) 

union all    
	
select CONCAT( "	@RequestParam(""txt",CONCAT(UCASE(LEFT(COLUMN_NAME, 1)),LCASE(SUBSTRING(COLUMN_NAME, 2))),""") ",
(case when DATA_TYPE = 'VARCHAR' THEN "String" ELSE 
CASE when DATA_TYPE = 'datetime' THEN "Date" else DATA_TYPE end END )
," ",COLUMN_NAME,", ")
from information_schema.COLUMNS 
where TABLE_SCHEMA = 'rokagym_db' AND table_name = p_tabla
 union all
select  CONCAT("Model m){",char(10))

union all
select cad from (
select  @i:=@i+1,
CONCAT(case when @i  >1 then 'else ' else '' end," if( ",(case when DATA_TYPE = 'VARCHAR' THEN "" ELSE 
CASE when DATA_TYPE = 'datetime' THEN "" else "String.valueOf(" end END ), " ",COLUMN_NAME,(case when DATA_TYPE = 'VARCHAR' THEN "" ELSE 
CASE when DATA_TYPE = 'datetime' THEN "" else ")" end END ),".equals("""") ){
            m.addAttribute(""mensaje"",""Ingrese datos correctos"");
            m.addAttribute(""componente"",""txt",CONCAT(UCASE(LEFT(COLUMN_NAME, 1)),LCASE(SUBSTRING(COLUMN_NAME, 2))),""");
            return ""index"";
				
        }") cad
from information_schema.COLUMNS ,
    (SELECT @i:=0) AS foo
where TABLE_SCHEMA = 'rokagym_db' AND table_name = p_tabla
and is_nullable ='NO') as a
 union all
  
select CONCAT(" else{
            ",p_tabla,"br obj = new ",p_tabla,"br();
            ",p_tabla,"be e = new ",p_tabla,"be(",
(select GROUP_CONCAT( COLUMN_NAME )  from information_schema.COLUMNS where TABLE_SCHEMA = 'rokagym_db'  and  table_name = p_tabla),
");
            
            Integer resul =0;
            resul = obj.add",CONCAT(UCASE(LEFT(p_tabla, 1)),LCASE(SUBSTRING(p_tabla, 2))),"(e);

             if( resul>0){ 
                m.addAttribute(""mensaje"",""Se guardaron los datos Correctamente"");
                return ""principal"";
            }else{
                m.addAttribute(""mensaje"",""No se guardaron los datos Correctamente"");
                return ""index"";
            }
        }
    }
} "
,char(10)) ;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE IF NOT EXISTS `cliente` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `telefono` int(11) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `dni` int(12) DEFAULT NULL,
  `sexo` varchar(20) DEFAULT NULL,
  `edad` int(3) DEFAULT NULL,
  `fh_nacimiento` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_venta`
--

CREATE TABLE IF NOT EXISTS `detalle_venta` (
  `id_venta` int(11) DEFAULT NULL,
  `id_producto` int(11) DEFAULT NULL,
  `precio_unitario` decimal(10,0) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `descuento` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `matricula`
--

CREATE TABLE IF NOT EXISTS `matricula` (
  `id` int(11) NOT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `id_membresia` int(11) DEFAULT NULL,
  `fh_inicio` date DEFAULT NULL,
  `fh_fin` date DEFAULT NULL,
  `fh_matricula` date DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `membresia`
--

CREATE TABLE IF NOT EXISTS `membresia` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `costo` decimal(10,0) DEFAULT NULL,
  `meses` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE IF NOT EXISTS `producto` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `precio` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `id` int(11) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `tipo_usuario` varchar(50) DEFAULT NULL,
  `ST` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE IF NOT EXISTS `venta` (
  `id` int(11) NOT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `fh_venta` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `matricula`
--
ALTER TABLE `matricula`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `membresia`
--
ALTER TABLE `membresia`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `venta`
--
ALTER TABLE `venta`
 ADD PRIMARY KEY (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
