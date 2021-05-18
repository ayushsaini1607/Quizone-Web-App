package com.admin.CreateUser;

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

import com.users.Teacher;
import com.login.util.DBConnection;
import com.users.Admin;
import com.users.Student;
import com.validationMethods.ValidateInput;


public class CreateUserServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	public CreateUserServlet() {
	}
	
	 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		  System.out.println("Inside create users servlet-post");
		  HttpSession session = request.getSession(false);
		  if(session==null)
		  {
			  request.setAttribute("Message", "Session timed out!");
			  request.getRequestDispatcher("/JSP/Login.jsp").forward(request, response);
		  }
		  else
		  {
		  
			  String username=(String)session.getAttribute("Admin");
			  //System.out.println((String)session.getAttribute("Admin"));
			  String fname = request.getParameter("fname");
			  String lname = request.getParameter("lname");
			  String email = request.getParameter("email");
			  String userType = request.getParameter("user");
			  String instituteId = request.getParameter("inst_id");
			  
			  if(!ValidateInput.isAlpha(fname))
			  {
				  request.setAttribute("errMsg", "First Name should only contain alphabets!");
				  request.getRequestDispatcher("JSP/create-account.jsp").forward(request, response);	 
				  return;
			  }
			  
			  if(!ValidateInput.isAlpha(lname))
			  {
				  request.setAttribute("errMsg", "Last Name should only contain alphabets!");
				  request.getRequestDispatcher("JSP/create-account.jsp").forward(request, response);	 
				  return;
			  }
				  
			  if(ValidateInput.hasSpecialCharacters(instituteId))
			  {
				  request.setAttribute("errMsg", "Institute ID cannot contain special characters!");
				  request.getRequestDispatcher("JSP/create-account.jsp").forward(request, response);	 
				  return;
			  }
			  
			  session.setAttribute("username", username);
			  session.setAttribute("Admin",username);
			  System.out.println((String)session.getAttribute("Admin"));
			  System.out.println((String)session.getAttribute("username"));
			  request.setAttribute("username", (String)session.getAttribute("Admin"));
	
			    Connection con=null;
	        	Statement statement=null;
	        	ResultSet resultSet=null;
	        	try {
	        		
	        		con=DBConnection.createConnection();
	        		statement=con.createStatement();
	        		resultSet=statement.executeQuery("select institute_id from username_to_inst_id where institute_id='" + instituteId + "'");
	        		
	        		if(resultSet.next())
	        		{
	        			request.setAttribute("errMsg","Couldn't add record: This Institute ID is already asscoiated with another account!");
	        			if(resultSet!=null)
			    			resultSet.close();
			    		if(statement!=null)
							statement.close();
						if(con!=null)
							con.close();
						request.getRequestDispatcher("JSP/create-account.jsp").forward(request, response);	
	        			return;
	        		}
	        		
	        		statement=con.createStatement();
	        		resultSet=statement.executeQuery("select email from users where email='" + email + "'");
	        		
	        		if(resultSet.next())
	        		{
	        			request.setAttribute("errMsg","Couldn't add record: This Email ID is already asscoiated with another account!");
	        			if(resultSet!=null)
			    			resultSet.close();
			    		if(statement!=null)
							statement.close();
						if(con!=null)
							con.close();
						request.getRequestDispatcher("JSP/create-account.jsp").forward(request, response);	
	        			return;
	        		}
	        		
	        		
	        		if(resultSet!=null)
		    			resultSet.close();
		    		if(statement!=null)
						statement.close();
					if(con!=null)
						con.close();
	        	} catch(SQLException E)
	        		{
	        			E.printStackTrace();
	        		}
			  
			  if(userType.equals("teacher"))
			  {
					  Teacher teacher = new Teacher();
					  teacher.setFname(fname);
					  teacher.setLname(lname);
					  teacher.setemail(email);
					  teacher.setInstituteId(instituteId);
					  teacher.generateUsername();
					  teacher.generatePassword();
					  
					  System.out.println(teacher.getUserName());
					  System.out.println(teacher.getPassword());
	                  if(teacher.writeToDB(false))
	//	              teacher.writeToDBTeacher();
	                	  request.setAttribute("UserAdd","Teacher added: Username: " + teacher.getUserName() + "\nPassword: " + teacher.getPassword());
					  else
						  request.setAttribute("errMsg","Couldn't add record!");
			  }
			  
			  else if(userType.equals("student"))
			  {
				  Student student = new Student();
				  student.setFname(fname);
				  student.setLname(lname);
				  student.setemail(email);
				  student.setInstituteId(instituteId);
				  student.generateUsername();
				  student.generatePassword();
				  
				  System.out.println(student.getUserName());
				  System.out.println(student.getPassword());
	              if(student.writeToDB(false))
	//              teacher.writeToDBTeacher();
	            	  request.setAttribute("UserAdd","Student added: Username: " + student.getUserName() + " \nPassword: " + student.getPassword());
				  else
					  request.setAttribute("errMsg","Couldn't add record!");
				  
			  }
			  
			  else if(userType.equals("admin"))
			  {
				  Admin admin = new Admin();
				  admin.setFname(fname);
				  admin.setLname(lname);
				  admin.setemail(email);
				  admin.setInstituteId(instituteId);
				  admin.generateUsername();
				  admin.generatePassword();
				  
				  System.out.println(admin.getUserName());
				  System.out.println(admin.getPassword());
	              if(admin.writeToDB(false))
	//              teacher.writeToDBTeacher();
	                  request.setAttribute("UserAdd","Admin added: Username: " + admin.getUserName() + "\nPassword: " + admin.getPassword());
	              else
	            	  request.setAttribute("errMsg","Couldn't add record!");
			  }
			  
			  session.setAttribute("username", username);
			  session.setAttribute("Admin",username);
			  System.out.println((String)session.getAttribute("Admin"));
			  System.out.println((String)session.getAttribute("username"));
			
		     request.getRequestDispatcher("JSP/create-account.jsp").forward(request, response);	  
	}
  }
}
