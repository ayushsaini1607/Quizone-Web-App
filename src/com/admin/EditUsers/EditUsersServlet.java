package com.admin.EditUsers;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.users.Teacher;
import com.users.Admin;
import com.users.Student;


public class EditUsersServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	public EditUsersServlet() {
	}
	
	 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		  System.out.println("Inside edit users servlet-post");
		  HttpSession session = request.getSession(false);
		  
		  String currUsername=(String)session.getAttribute("Admin");
		  //System.out.println((String)session.getAttribute("Admin"));
		  int update = Integer.parseInt(request.getParameter("update"));
		  //update stores the record no in the table for which update request is sent
		  
		  String username = (request.getParameterValues("edit-username"))[update];
		  String fname = request.getParameterValues("fname")[update];
		  String lname = request.getParameterValues("lname")[update];
		  String email = request.getParameterValues("email")[update];
		  String userType = request.getParameterValues("userType")[update];
		  String instituteId = request.getParameterValues("inst_id")[update];
		  
//		  System.out.println("Username=" + username);
//		  System.out.println("First name= " + fname);
//		  System.out.println("update = " + update);
		  
		  session.setAttribute("username", currUsername);
		  session.setAttribute("Admin",currUsername);
		  System.out.println((String)session.getAttribute("Admin"));
		  System.out.println((String)session.getAttribute("username"));
		  request.setAttribute("username", (String)session.getAttribute("Admin"));
		  
		  if(userType.equals("Admin"))
		  {
			  System.out.println("editing admin");
		      Admin admin = Admin.search(username);
			  admin.setFname(fname);
			  admin.setLname(lname);
			  admin.setemail(email);
			  admin.setInstituteId(instituteId);
			  admin.writeToDB(true);
		  }
		  
		  else if(userType.equals("Student"))
		  {
			  System.out.println("editing student");
		      Student student = Student.search(username);
			  student.setFname(fname);
			  student.setLname(lname);
			  student.setemail(email);
			  student.setInstituteId(instituteId);
			  student.writeToDB(true);
//			  request.getRequestDispatcher("manage-users").forward(request, response);
		  }
		  
		  else if(userType.equals("Teacher"))
		  {
			  System.out.println("editing teacher");
		      Teacher teacher = Teacher.search(username);
		      teacher.setFname(fname);
		      teacher.setLname(lname);
		      teacher.setemail(email);
		      teacher.setInstituteId(instituteId);
		      teacher.writeToDB(true);
//			  request.getRequestDispatcher("manage-users").forward(request, response);
		  } 
		  
		  request.getRequestDispatcher("manage-users").forward(request, response);
	}
		  
}
