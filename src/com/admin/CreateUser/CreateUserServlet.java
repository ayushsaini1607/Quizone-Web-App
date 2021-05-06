package com.admin.CreateUser;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.users.Teacher;
import com.users.Admin;
import com.users.Student;


public class CreateUserServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	public CreateUserServlet() {
	}
	
	 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		  System.out.println("Inside create users servlet-post");
		  HttpSession session = request.getSession(false);
		  
		  String username=(String)session.getAttribute("Admin");
		  //System.out.println((String)session.getAttribute("Admin"));
		  String fname = request.getParameter("fname");
		  String lname = request.getParameter("lname");
		  String email = request.getParameter("email");
		  String userType = request.getParameter("user");
		  String instituteId = request.getParameter("inst_id");
		  
		  session.setAttribute("username", username);
		  session.setAttribute("Admin",username);
		  System.out.println((String)session.getAttribute("Admin"));
		  System.out.println((String)session.getAttribute("username"));
		  request.setAttribute("username", (String)session.getAttribute("Admin"));
		  
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
                	  request.setAttribute("UserAdd","Teacher addded");
				  else
	            	  request.setAttribute("UserAdd","Couldn't add record!");
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
            	  request.setAttribute("UserAdd","Student addded");
			  else
            	  request.setAttribute("UserAdd","Couldn't add record!");
			  
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
                  request.setAttribute("UserAdd","Admin addded");
              else
            	  request.setAttribute("UserAdd","Couldn't add record!");
		  }
		  
		  session.setAttribute("username", username);
		  session.setAttribute("Admin",username);
		  System.out.println((String)session.getAttribute("Admin"));
		  System.out.println((String)session.getAttribute("username"));
		
	     request.getRequestDispatcher("JSP/create-account.jsp").forward(request, response);	  
	}
}
