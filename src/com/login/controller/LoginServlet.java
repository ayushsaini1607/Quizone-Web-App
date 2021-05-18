package com.login.controller;

import java.io.IOException;
 
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
 
import com.login.bean.LoginBean;
import com.login.dao.LoginDao;
 
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 
	public LoginServlet() {
	}
	
	 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
	    String username = request.getParameter("username");
	    String password = request.getParameter("password");
	    System.out.println("Inside servlet");    
	    LoginBean loginBean = new LoginBean();
	 
	    loginBean.setUserName(username);
	    loginBean.setPassword(password);
	 
	    LoginDao loginDao = new LoginDao();
	 
	    try
	    {
	        String userValidate = loginDao.authenticateUser(loginBean);
	 
	        if(userValidate.equals("admin"))
	        {
	            System.out.println("Admin's Home");
	 
	            HttpSession session = request.getSession(); //Creating a session
	            session.setAttribute("Admin", username); //setting session attribute
	            request.setAttribute("username", username);
	 
	            request.getRequestDispatcher("/JSP/Admin.jsp").forward(request, response);
	        }
	        else if(userValidate.equals("teacher"))
	        {
	            System.out.println("Teacher's Home");
	 
	            HttpSession session = request.getSession();
	            session.setAttribute("Teacher", username);
	            request.setAttribute("username", username);
	 
	            request.getRequestDispatcher("/JSP/Teacher.jsp").forward(request, response);
	        }
	        else if(userValidate.equals("student"))
	        {
	            System.out.println("Student's Home");
	 
	            HttpSession session = request.getSession();
	            session.setMaxInactiveInterval(10*60);
	            session.setAttribute("Student", username);
	            request.setAttribute("username", username);
	 
	            request.getRequestDispatcher("/JSP/Student.jsp").forward(request, response);
	        }
	        else
	        {
	            System.out.println("Error message = "+userValidate);
	            request.setAttribute("Message", userValidate);
	 
	            request.getRequestDispatcher("/JSP/Login.jsp").forward(request, response);
	        }
	    }
	    catch (IOException e1)
	    {
	        e1.printStackTrace();
	    }
	    catch (Exception e2)
	    {
	        e2.printStackTrace();
	    }
	} //End of doPost()
}