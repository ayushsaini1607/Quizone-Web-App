package com.admin.dashboard;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.login.util.DBConnection;
import com.users.*;

public class ManageUsersServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	public ManageUsersServlet() {
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		System.out.println("Inside manage users servlet-get");
		HttpSession session = request.getSession(false);
		if(session==null)
		  {
			  request.setAttribute("Message", "Session timed out!");
			  request.getRequestDispatcher("/JSP/Login.jsp").forward(request, response);
		  }
		else
		{
			System.out.println((String)session.getAttribute("Admin")); 
			request.setAttribute("username",(String)session.getAttribute("Admin"));
			
			ArrayList<User> users = new ArrayList<>();
			
			Connection con=null;
	    	Statement statement=null;
	    	ResultSet resultSet=null;
	    	
	    	
	    	try {
	    		
	    		con=DBConnection.createConnection();
	    		statement = con.createStatement();
	    		
	    		resultSet = statement.executeQuery("select users.*, username_to_inst_id.institute_id from users join username_to_inst_id on users.username=username_to_inst_id.username");
	    		
	    		while(resultSet.next())
	    		{
	    			if(resultSet.getString("userType").equals("admin"))
	    			{
	    				Admin admin = new Admin();
	    				admin.setUserName(resultSet.getString("username"));
	    				admin.setemail(resultSet.getString("email"));
	    				admin.setFname(resultSet.getString("fname"));
	    				admin.setLname(resultSet.getString("lname"));
	    				admin.setInstituteId(resultSet.getString("institute_id"));
	    				users.add(admin);
	    			}
	    			else if(resultSet.getString("userType").equals("teacher"))
	    			{
	    				Teacher teacher = new Teacher();
	    				teacher.setUserName(resultSet.getString("username"));
	    				teacher.setemail(resultSet.getString("email"));
	    				teacher.setFname(resultSet.getString("fname"));
	    				teacher.setLname(resultSet.getString("lname"));
	    				teacher.setInstituteId(resultSet.getString("institute_id"));
	    				users.add(teacher);
	    			}
	    			else if(resultSet.getString("userType").equals("student"))
	    			{
	    				Student student = new Student();
	    				student.setUserName(resultSet.getString("username"));
	    				student.setemail(resultSet.getString("email"));
	    				student.setFname(resultSet.getString("fname"));
	    				student.setLname(resultSet.getString("lname"));
	    				student.setInstituteId(resultSet.getString("institute_id"));
	    				users.add(student);
	    			}
	    			
	    			request.setAttribute("userList", users);
	    		}
	    		
	        	} catch(SQLException E)
		        	{
		        		E.printStackTrace();
		        	}
			
			request.getRequestDispatcher("/JSP/ManageUsers.jsp").forward(request, response);
		}
   }
	
}
