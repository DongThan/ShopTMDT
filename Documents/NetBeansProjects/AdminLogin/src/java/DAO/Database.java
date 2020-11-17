package DAO;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */



import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author ASUS
 */
public class Database {
    String driverClassName = "com.mysql.jdbc.Driver";
    String url = "jdbc:mysql://localhost:3306/dbthuongmaidientu";
    String user = "root";
    String password = "QM1234";
    public Connection getConnection() throws ClassNotFoundException  {
        Connection connection = null;
        try {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                connection = DriverManager.getConnection(url, user , password);
        }        
        catch (ClassNotFoundException | IllegalAccessException | InstantiationException | SQLException e) 
        {
            return null;
        }
        return connection;
    }
}
