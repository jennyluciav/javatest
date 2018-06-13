
use rokagym_db;
drop PROCEDURE if exists rokagym_db.proc_dao_get;
create PROCEDURE rokagym_db.proc_dao_get(in p_tabla VARCHAR(50))  
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
         
END;
call rokagym_db.proc_dao_get('usuario');
/*DAO*/
 