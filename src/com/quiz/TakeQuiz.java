package com.quiz;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.login.util.DBConnection;
import com.users.Teacher;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/TakeQuiz")
public class TakeQuiz extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TakeQuiz() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("Inside Take Quiz Servlet-Post");
        //HttpSession session = request.getSession(false);
        String quizCode = request.getParameter("quizCode");
        boolean found = false;
        Connection con = null;
    	Statement statement = null;
    	ResultSet resultSet = null;
    	
    	try {
    		con = DBConnection.createConnection();
    		statement = con.createStatement();
    		resultSet = statement.executeQuery("select * from quiz");
    		
    		while(resultSet.next()) {
    			if (quizCode.equals(resultSet.getString("quiz_code"))) {
    				found = true;
        			request.setAttribute("quizCode", quizCode);
    	            request.getRequestDispatcher("/JSP/QPaper.jsp").forward(request, response);
    				response.sendRedirect(request.getContextPath()+"/JSP/QPaper.jsp");
    			}
    		}
    		if (found == false) {
	            request.setAttribute("quizErrMessage", "INVALID QUIZ CODE");
	            RequestDispatcher requestDispatcher = request.getRequestDispatcher("/JSP/Give-Test.jsp");
	            requestDispatcher.forward(request, response);
	            System.out.println("Incorrect Code Fomart");
	        }
    	} catch (SQLException E) {
    		E.printStackTrace();
    	}
    }
}