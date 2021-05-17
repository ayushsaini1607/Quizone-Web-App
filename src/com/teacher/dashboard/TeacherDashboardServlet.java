package com.teacher.dashboard;

import java.io.IOException;


import com.users.Teacher;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class TeacherDashboardServlet
 */
//@WebServlet("/TeacherDashboardServlet")
public class TeacherDashboardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TeacherDashboardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("Inside get of teacher-dashboard");
		System.out.println("Inside teacher dashboard servlet-get");
		HttpSession session = request.getSession(false);
		if(session==null)
		  {
			  request.setAttribute("Message", "Session timed out!");
			  request.getRequestDispatcher("/JSP/Login.jsp").forward(request, response);
		  }
		else
		{
			System.out.println((String)session.getAttribute("Teacher")); 
			request.setAttribute("username",(String)session.getAttribute("Teacher"));
			request.getRequestDispatcher("/JSP/Teacher.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		  System.out.println("Inside admin dashboard servlet-post");
		  HttpSession session = request.getSession(false);
		  if(session==null)
		  {
			  request.setAttribute("Message", "Session timed out!");
			  request.getRequestDispatcher("/JSP/Login.jsp").forward(request, response);
		  }
		  else
		  {
			  System.out.println((String)session.getAttribute("Teacher"));
	
			  
			  if(request.getParameter("View Profile")!=null)
			  {		  
				  Teacher teacher = Teacher.search((String)session.getAttribute("Teacher"));
				  request.setAttribute("fname",teacher.getFname());
				  request.setAttribute("lname", teacher.getLname());
				  request.setAttribute("email", teacher.getemail());
				  request.setAttribute("username", (String)session.getAttribute("Teacher"));
				  request.setAttribute("inst_id", teacher.getInstituteId());
				  request.getRequestDispatcher("/JSP/TeacherProfile.jsp").forward(request, response); 
	//			  request.getRequestDispatcher("/view-admin-profile").forward(request, response); 
			  }
		}
	}

}
