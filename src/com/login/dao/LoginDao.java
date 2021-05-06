package com.login.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


import com.login.bean.LoginBean;
import com.login.util.DBConnection;
 
public class LoginDao {
    public String authenticateUser(LoginBean loginBean)
    {
    	String username=loginBean.getUserName();
    	String password=loginBean.getPassword();
    	
    	Connection con=null;
    	Statement statement=null;
    	ResultSet resultSet=null;
    	
    	String usernameDB="";
    	String passwordDB="";
    	String roleDB="";
    	
    	try {
    		con=DBConnection.createConnection();
    		statement=con.createStatement();
    		resultSet=statement.executeQuery("Select username,password,userType from users");
    		
    		while(resultSet.next())
    		{
    			usernameDB = resultSet.getString("username");
                passwordDB = resultSet.getString("password");
                roleDB = resultSet.getString("userType");
	    		if(username.equals(usernameDB) && password.equals(passwordDB))
	    		{
	    			if(resultSet!=null)
	        			resultSet.close();
	        		if(statement!=null)
	    				statement.close();
	    			if(con!=null)
	    				con.close();
	    			return roleDB;
	    		}
    		}
    		if(resultSet!=null)
    			resultSet.close();
    		if(statement!=null)
				statement.close();
			if(con!=null)
				con.close();
    	}
    	catch(SQLException E)
    	{
    		E.printStackTrace();
    	}
    	return "Invalid user credentials";
    }
}