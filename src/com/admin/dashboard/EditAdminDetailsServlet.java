package com.admin.dashboard;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.login.util.DBConnection;
import com.password.Password;
import com.users.Admin;

public class EditAdminDetailsServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	public EditAdminDetailsServlet() {
	}
	
	 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		  System.out.println("Inside edit admin details servlet-post");
		  HttpSession session = request.getSession(false);
		  if(session==null)
		  {
			  request.setAttribute("Message", "Session timed out!");
			  request.getRequestDispatcher("/JSP/Login.jsp").forward(request, response);
		  }
		  else
		  {
			  //System.out.println((String)session.getAttribute("Admin"));
			  String username=(String)session.getAttribute("Admin");
			  //request.setAttribute("username",username);
			  Admin admin;
			  admin = Admin.search(username);
			  request.setAttribute("username",admin.getUserName());
			  request.setAttribute("email",admin.getemail());
			  request.setAttribute("fname", admin.getFname());
			  request.setAttribute("lname", admin.getLname());
			  request.setAttribute("inst_id", admin.getInstituteId());
			  if(request.getParameter("Edit Username")!=null)
			  {
				  //System.out.println("Old password : " + request.getParameter("u_old_password"))		        		
				  if(request.getParameter("new_username").compareTo(username)==0)
					  request.setAttribute("uErrMessage","Coudln't change username: Same username entered!");
				  else
				   {
					   Connection con=null;
			        	Statement statement=null;
			        	ResultSet resultSet=null;
			        	try {
			        		
			        		con=DBConnection.createConnection();
			        		statement=con.createStatement();
			        		resultSet=statement.executeQuery("select username from users where username='" + request.getParameter("new_username") + "'" );
			        		
			        		if(resultSet.next())
			        		{
			        			System.out.println("Current username when checking new username exists: " + resultSet.getString("username"));
			        			System.out.println("New username when checking new username exists: " + request.getParameter("new_username"));
			        			if(resultSet.getString("username").equals(request.getParameter("new_username")))
			        			{
			        				request.setAttribute("uErrMessage","Couldn't change username: Username already exists!");
			        				request.getRequestDispatcher("JSP/ViewAdminProfile.jsp").forward(request, response);	
				        			return;
			        			}
			        			if(resultSet!=null)
					    			resultSet.close();
					    		if(statement!=null)
									statement.close();
								if(con!=null)
									con.close();
			        		}
			        	} catch(SQLException E)
			        	{
			        		E.printStackTrace();
			        	}
			        		
					  if(admin.authenticate(request.getParameter("u_old_password"))) 	   
						   	{
							  if(admin.edit(request.getParameter("new_username"),true))
							  {
								  session.setAttribute("username", admin.getUserName());
								  request.setAttribute("username",admin.getUserName());
								  request.setAttribute("email",admin.getemail());
								  request.setAttribute("fname", admin.getFname());
								  request.setAttribute("lname", admin.getLname());
								  request.setAttribute("inst_id", admin.getInstituteId());
								  session.setAttribute("Admin", admin.getUserName());
								  request.setAttribute("uConfirmMessage","Username changed successfully!");
							  }
							  else
								  request.setAttribute("uErrMessage", "Couldn't change username!");
						   	}
					  else
						 request.setAttribute("uErrMessage","Coudln't change username : Invalid password!");			 
				   }  
				  request.getRequestDispatcher("/JSP/ViewAdminProfile.jsp").forward(request, response);
			   }	  
			  
			  if(request.getParameter("Edit Password")!=null)
			  {		  
				  String new_password=request.getParameter("new_password");
				  if(new_password.compareTo(request.getParameter("confirm_new_password"))==0)
				  {
					 if(admin.authenticate(request.getParameter("p_old_password")))
					 {
						 if(Password.checkStrongPassword(new_password))
						 {
							 if(admin.edit(request.getParameter("new_password"), false))
							 {
								 request.setAttribute("username",admin.getUserName());
								 session.setAttribute("Admin", admin.getUserName());
								 request.setAttribute("pConfirmMessage","Password changed successfully!");
							 }
							 else
							 {
								 request.setAttribute("pErrMessage","Couldn't change password!");
							 }
						 }
						 else
							request.setAttribute("pErrMessage","Couldn't change password: New password should be a combination of a lower-case letter,an upper-case letter, a number and a special character(@,#,$,%,^,&,+,=)");
					 }
					 else
						request.setAttribute("pErrMessage","Couldn't change password: Current password is incorrect!");
				  }  
				  else
					  request.setAttribute("pErrMessage","Couldn't change password: New password and confirm new password fields don't match!");
				  
				  request.getRequestDispatcher("/JSP/ViewAdminProfile.jsp").forward(request, response);
			  }
	  }
	}
}
