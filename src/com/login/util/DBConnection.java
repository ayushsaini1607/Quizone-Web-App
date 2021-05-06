package com.login.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    public static Connection createConnection()
    {
    	Connection con=null;
    	String url = "jdbc:mysql://localhost:3306/testproject";
    	String username ="root";

    	String password="Ayush@123";

    	try {
    		try {
    			Class.forName("com.mysql.cj.jdbc.Driver");
    		} catch(ClassNotFoundException E){
    			E.printStackTrace();
    		}
    		con=DriverManager.getConnection(url, username, password);
    		System.out.println("Post establishing a DB connection - "+con);	
    	} catch (SQLException e)
        {
            System.out.println("An error occurred. Maybe user/password is invalid");
            e.printStackTrace();
        }
     return con;
     }
}

