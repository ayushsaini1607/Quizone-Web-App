package com.admin.dashboard;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.users.Admin;

public class AdminDashboardServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	public AdminDashboardServlet() {
	}
	
	 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		  System.out.println("Inside admin dashboard servlet-post");
		  HttpSession session = request.getSession(false);
		  if(session==null)
		  {
			  request.setAttribute("Message", "Session timed out!");
			  request.getRequestDispatcher("/JSP/Login.jsp").forward(request, response);
		  }
		  else
		  {
			  System.out.println((String)session.getAttribute("Admin"));
	//		  session.setAttribute("username", request.getParameter("username"));
	//		  System.out.println((String)session.getAttribute("username"));
	//		  session.setAttribute("Admin",request.getAttribute("username"));
	//		  System.out.println((String)session.getAttribute("Admin"));
			  if(request.getParameter("create account")!=null)
			  {
				  
				  request.getRequestDispatcher("/JSP/create-account.jsp").forward(request, response);
			  }
			  
			  if(request.getParameter("View Profile")!=null)
			  {		  
				  Admin admin = Admin.search((String)session.getAttribute("Admin"));
				  request.setAttribute("fname",admin.getFname());
				  request.setAttribute("lname", admin.getLname());
				  request.setAttribute("email", admin.getemail());
				  request.setAttribute("username", (String)session.getAttribute("Admin"));
				  request.setAttribute("inst_id", admin.getInstituteId());
				  request.getRequestDispatcher("/JSP/ViewAdminProfile.jsp").forward(request, response); 
	//			  request.getRequestDispatcher("/view-admin-profile").forward(request, response); 
			  }
		  
		  }
//		  
//		  if(request.getParameter("manage users")!=null)
//		  {
//			  request.setAttribute("username", (String)session.getAttribute("Admin"));
//			  request.getRequestDispatcher("/manage-users").forward(request, response); 
//		  }
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		    System.out.println("Inside get of admin-dashboard");
			System.out.println("Inside admin dashboard servlet-get");
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
				request.getRequestDispatcher("/JSP/Admin.jsp").forward(request, response);
			}
	}
	
}
