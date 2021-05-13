package com.teacher.dashboard;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;

import com.login.util.DBConnection;
import com.users.Teacher;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class CreateTest
 */
@WebServlet("/CreateTest")
public class CreateTest extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateTest() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("Inside create Test servlet-post");
		  HttpSession session = request.getSession(false);
		  
		  String username=(String)session.getAttribute("user");
		  //System.out.println((String)session.getAttribute("Admin"));
		  String testTitle = request.getParameter("testTitle");
		  String startTime = request.getParameter("startTime");
		  String endTime = request.getParameter("endTime");
		  String userType = (String)session.getAttribute("user");
		  String testDate = request.getParameter("testDate");
		  
		  Integer random_int = (int)Math.floor(Math.random()*(999999-111111+1)+111111);
		  String quizCode = random_int.toString();
		  session.setAttribute("quizCode", quizCode);
		  
		  System.out.println("Quiz Title : " + testTitle);
		  System.out.println("Quiz Date : " + testDate);
		  System.out.println("Start Time : " + startTime);
		  System.out.println("End Time : " + endTime);
		  System.out.println("Quiz Code : " + quizCode);
		  
		  Connection con=null;
	      Statement statement=null;
	      
	      LocalDate date1 = java.time.LocalDate.now();
	      LocalDate date2 = LocalDate.parse(testDate);
	      if(date1.isBefore(date2) || date1.isEqual(date2)) {
	    	  try {
	        		
	        		con = DBConnection.createConnection();
	        		PreparedStatement p = con.prepareStatement("insert into create_quiz values ('" + testTitle 
      					+ "','" + startTime + "','" + endTime + "','" + testDate + "','" + quizCode +"')");
	        		
	      			p.executeUpdate();
	      			p.close();
	      			
	      			PreparedStatement pp = con.prepareStatement("insert into quiz_to_username values ('" + session.getAttribute("Tea")+"','"+quizCode+ "')");
	        		pp.executeUpdate();
	        		pp.close();
	        		
	        		request.getRequestDispatcher("JSP/questions.jsp").forward(request, response);
	        	} catch(SQLException E)
	        	{
	        		E.printStackTrace();
	        	}
	      }else {
	    	    String error = "Please Enter Valid Date!";
	    	    System.out.println("Error message = "+error);
	            request.setAttribute("errDate", error);
	            request.getRequestDispatcher("/JSP/create-test.jsp").forward(request, response);
	      }
	      
	        	
		 
	}

}
