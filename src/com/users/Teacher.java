package com.users;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.PreparedStatement;


import com.login.util.DBConnection;

import com.password.Password;

public class Teacher implements User {
        private String username;
        private Password password;
        private String fname;
        private String lname;
        private String email;
        private String instituteId;
        
        public Teacher()
        {
        	password = new Password();	
        }
        
        public Teacher(String username,String password)
        {
        	this.password=new Password(password);
        	this.username=username;
        }
        
        public void setInstituteId(String instituteId)
        {
        	this.instituteId = instituteId;
        }
        
        @Override
        public String getInstituteId()
        {
        	return instituteId;
        }
        
        @Override
        public String getFname()
        {
        	return fname;
        }
        
        @Override
        public String getLname()
        {
        	return lname;
        }
        
        @Override
        public String getemail()
        {
        	return email;
        }
        
        @Override
        public void setFname(String fname)
        {
        	this.fname=fname;
        }
        
        @Override
        public void setLname(String lname)
        {
        	this.lname=lname;
        }
        
        @Override
        public void setemail(String email)
        {
        	this.email=email;
        }
        
        @Override
        public String getUserName()
        {
      	  return username;
        }
        
        @Override
        public String getPassword()
        {
      	  return password.getPassword();
        }
        
        @Override
        public void setUserName(String username)
        {
      	  this.username=username;
        }

        @Override
        public void setPassword(String password)
        {
      	  this.password.setPassword(password);
        }
        
        public static Teacher search(String username)
        {
        	Connection con=null;
        	Statement statement=null;
        	ResultSet resultSet=null;
        	try {
        		
        		con=DBConnection.createConnection();
        		statement=con.createStatement();
        		resultSet=statement.executeQuery("select users.*, username_to_inst_id.institute_id from users join username_to_inst_id on users.username=username_to_inst_id.username where users.username='" + username + "'");
        		
        		if(resultSet.next())
        		{
	        		Teacher teacher = new Teacher(username,resultSet.getString("password"));
	        		teacher.setPassword(resultSet.getString("password"));
	        		teacher.setFname(resultSet.getString("fname"));
	        		teacher.setLname(resultSet.getString("lname"));
	        		teacher.setemail(resultSet.getString("email"));
	        		teacher.setInstituteId(resultSet.getString("institute_id"));
	        		if(resultSet!=null)
	        			resultSet.close();
	        		if(statement!=null)
	    				statement.close();
	    			if(con!=null)
	    				con.close();
	        		return teacher;
        		}
        				
        	} catch(SQLException E)
        		{
        			E.printStackTrace();
        		}
        	return null;
        }
        
        public boolean authenticate(String password)
        {
        	//System.out.println("authenticate method() : " + this.password.getPassword());
        	if(password.compareTo(this.password.getPassword())==0)
                return true;
        	return false;     		
        }
        
        public boolean edit(String changedValue)
        {
        	Connection con=null;
        	PreparedStatement statement=null;
        	
        	try {
        		
        		con=DBConnection.createConnection();  			
        			String sqlUpdate="update users set password= ? where username= ?";
        			statement=con.prepareStatement(sqlUpdate);
       		        statement.setString(1,changedValue);
       		        statement.setString(2,this.username);
            		this.setPassword(changedValue);
            		statement.executeUpdate();
            		if(statement!=null)
        				statement.close();
        			if(con!=null)
        				con.close();
            		return true;
        		
        		
        	} catch(SQLException E)
        		{
        			E.printStackTrace();
        			return false;
        		}
        }
        
        @Override
        public void generateUsername()
        {
        	username = fname.toLowerCase() + lname.toLowerCase();
        
        	Connection con=null;
        	Statement statement=null;
        	ResultSet resultSet=null;
        	
        	
        	try {
        		
        		con=DBConnection.createConnection();
        		statement = con.createStatement();
        		
        		boolean notExist = false;
        		while(!notExist) {
	            	resultSet = statement.executeQuery("select username from users where username= '" + username + "'");
	            	if(resultSet.next())
	            	{
	            		int i=1;
            		    username = username + i;
            		    i++;
            		    System.out.println("username inside check: " + username);
	            	}
	            	else
	            		notExist = true;
        	}
            	
        	} catch(SQLException E)
        	{
        		E.printStackTrace();
        	}
        	try {
        		if(resultSet!=null)
        			resultSet.close();
        		if(statement!=null)
    				statement.close();
    			if(con!=null)
    				con.close();
        	} catch(SQLException E)
	        	{
	        		
	        	}
        }
        
       
        @Override
        public void generatePassword()
        {
        	password.setPassword(password.generatePassword());
        }
        
        public boolean writeToDB(boolean update)
        {
        	Connection con=null;
        	Statement statement=null;
      
        	try {
        		
        		con = DBConnection.createConnection();
        		statement = con.createStatement();
        		if(update)
        		{
        			statement.executeUpdate("update users set email='" + email 
        					+ "',userType='teacher',fname='" + fname + "',lname='"
        					+ lname + "' where username='" + username + "'");
        			statement.executeUpdate("update username_to_inst_id set institute_id='" + instituteId
        					+ "' where username='" + username + "'");
        			if(statement!=null)
        				statement.close();
        			if(con!=null)
        				con.close();
        			return true;
        		}
        		else
        		{
            	statement.executeUpdate("insert into users values ('" + username + "' , '" 
            			+ email + "' , '" + password.getPassword() + "','teacher', '" 
            			+ fname + "' , '" + lname + "')");	
            	statement.executeUpdate("insert into username_to_inst_id values ('" + username
            			+ "' , '" + instituteId + "')");
            	if(statement!=null)
    				statement.close();
    			if(con!=null)
    				con.close();
            	return true;
        		}
        	} catch(SQLException E)
        	{
        		E.printStackTrace();
        	}
        	return false;
        }
}
