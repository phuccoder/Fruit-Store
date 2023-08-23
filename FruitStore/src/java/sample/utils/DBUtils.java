/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

/**
 *
 * @author PHUC
 */
public class DBUtils {
    private static final String DB_NAME="StoreManagement";
    private static final String DB_USER_NAME="sa";
    private static final String DB_PASSWORD="fpt@12345";
    public static Connection getConnectionV1() throws ClassNotFoundException, SQLException{
        Connection conn=null;
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver"); 
        String url="jdbc:sqlserver://localhost\\SQLEXPRESS:1433;databaseName="+DB_NAME;
        conn= DriverManager.getConnection(url,DB_USER_NAME, DB_PASSWORD);
        return conn;
    }
 public static Connection getConnectionV2() throws ClassNotFoundException, SQLException, NamingException{
        Connection conn=null;
        Context context = new InitialContext();
        Context end = (Context) context.lookup("java:comp/env");
        DataSource ds=(DataSource) end.lookup("DBCon");
        conn = ds.getConnection();
        return conn;
                
    }

    
}
