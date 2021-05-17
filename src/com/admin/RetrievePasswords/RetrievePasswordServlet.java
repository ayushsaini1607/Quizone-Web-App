package com.admin.RetrievePasswords;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.login.util.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class RetrievePasswordServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	public RetrievePasswordServlet() {
	}
	
	 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		  System.out.println("Inside retrieve password servlet-post");
		  HttpSession session = request.getSession(false);
		  if(session==null)
		  {
			  request.setAttribute("Message", "Session timed out!");
			  request.getRequestDispatcher("/JSP/Login.jsp").forward(request, response);
		  }
		  else
		  {
			  String username=(String)session.getAttribute("Admin");		 
			  session.setAttribute("username", username);
			  session.setAttribute("Admin",username);
			  System.out.println((String)session.getAttribute("Admin"));
			  System.out.println((String)session.getAttribute("username"));
			  
			  String searchUsername = request.getParameter("searchUsername");
			  String verifyPass = request.getParameter("verifyPass");
			  boolean authorised = false;
			  
			  Connection con=null;
		      Statement statement=null;
		      ResultSet resultSet=null;
		      
		      try {
		    		con=DBConnection.createConnection();
		    		statement=con.createStatement();
		    		resultSet=statement.executeQuery("Select password from users where username='"
		    				+ username + "'");
		    		
		    		if(resultSet.next())
		    		{
			    		if(verifyPass.equals(resultSet.getString("password")))
			    		{
			    			authorised = true;
			    		}
			    		else
			    		{
			    			request.setAttribute("errMessage","Authentication failed:Invalid password!");
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
		      
		      System.out.println("Authorised = " + authorised);
		      if(authorised)
		      {
			      con=null;
			      statement=null;
			      resultSet=null;
			      
			      try {
			    		con=DBConnection.createConnection();
			    		statement=con.createStatement();
			    		resultSet=statement.executeQuery("Select password from users where username='"
			    				+ searchUsername + "' and userType!='admin'");
			    		if(resultSet.next())
			    		{
			    			String fetchedPass = resultSet.getString("password");
				    		System.out.println("Fetched pass = " + fetchedPass);
			    			request.setAttribute("fetchedPassword",fetchedPass);
			    		}
			    		else
			    		{
			    			request.setAttribute("errMessage","Couldn't fetch password: User doesn't exist or has admin priveleges!");
			    		}
			    	}
			    	catch(SQLException E)
			    	{
			    		E.printStackTrace();
			    	}
		     } 
			  
			
		     request.getRequestDispatcher("JSP/RetrievePassword.jsp").forward(request, response);	  
		  }
	}
}
