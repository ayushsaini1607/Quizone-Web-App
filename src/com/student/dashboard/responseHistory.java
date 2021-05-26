package com.student.dashboard;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.login.util.DBConnection;
import com.users.Student;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/responseHistory")
public class responseHistory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public responseHistory() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("Inside Response History Servlet-Post");
        HttpSession session = request.getSession(false);
        if(session==null)
		  {
			  request.setAttribute("Message", "Session timed out!");
			  request.getRequestDispatcher("/JSP/Login.jsp").forward(request, response);
		  }
        else
        {
	        String quizCode = (String)request.getParameter("codeForDetailed");
	        boolean found = false;
	        Connection con = null;
	    	Statement statement = null;
	    	ResultSet resultSet = null;
	    	
	    	try {
	    		con = DBConnection.createConnection();
	    		statement = con.createStatement();
	    			
	    		resultSet = statement.executeQuery("select QuizCode from detailed_result where QuizCode='" + quizCode + "'");
	    		
	    		if(resultSet.next())
	    		{
	    			System.out.println("inside response resultSet");
	    			found = true;
	    			request.setAttribute("DetailedCode", quizCode);
	    			request.getRequestDispatcher("/JSP/DetailedHistory.jsp").forward(request, response);	
	    			return;
	    		}
	    		if (found == false) {
	    			request.setAttribute("DetailedCode", "NA");
    	            request.getRequestDispatcher("/JSP/TestHistory.jsp").forward(request, response);
    				//response.sendRedirect(request.getContextPath()+"/JSP/TestHistory.jsp");
		        }
	    	} catch (SQLException E) {
	    		E.printStackTrace();
	    	}
	    }
    }
}