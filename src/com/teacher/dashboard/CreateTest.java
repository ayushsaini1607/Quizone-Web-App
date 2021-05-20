package com.teacher.dashboard;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.time.LocalTime;

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
		  if(session==null)
		  {
			  request.setAttribute("Message", "Session timed out!");
			  request.getRequestDispatcher("/JSP/Login.jsp").forward(request, response);
		  }
		  else
		  {
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
		      LocalTime time1 = LocalTime.parse(startTime);
		      LocalTime time2 = LocalTime.parse(endTime);
		      LocalTime time3 = LocalTime.now();
		      int currtym = 0;
		      if(time3.getHour() != 23) {
		    	  currtym = time3.getHour()+1;
		      }
//		      int currtym = time3.getHour()+1;
		      LocalTime time4 = null;
		      if(currtym < 10) {
		    	  time4 = LocalTime.parse("0"+currtym+":00");
		      }else {
		    	  time4 = LocalTime.parse(""+currtym+":00");
		      }
		      
		      if(time4.isAfter(time1) && date1.isEqual(date2)) {
		    	  String errSt = "Start Time should be atleast 1 hour after current Time!";
	//	    	  System.out.println("Error message = "+errSt);
		          request.setAttribute("errSt", errSt);
		          request.getRequestDispatcher("/JSP/create-test.jsp").forward(request, response);
		      }else {
		      if(time1.isAfter(time2) || time1.equals(time2)) {
		    	  String errTime = "End Time can't be before or equal to Start Time!";
	//	    	    System.out.println("Error message = "+errTime);
		            request.setAttribute("errTime", errTime);
		            request.getRequestDispatcher("/JSP/create-test.jsp").forward(request, response);
		      }else {
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
		    	    String error = "Please Select a Valid Date!";
	//	    	    System.out.println("Error message = "+error);
		            request.setAttribute("errDate", error);
		            request.getRequestDispatcher("/JSP/create-test.jsp").forward(request, response);
		      }
		      
		      }	
		   }
		}
	}

}
