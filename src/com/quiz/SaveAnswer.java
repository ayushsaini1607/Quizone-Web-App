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

@WebServlet("/SaveAnswer")
public class SaveAnswer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SaveAnswer() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("Inside Save Answer Servlet-Post");
        HttpSession session = request.getSession(false);
        if(session==null)
		  {
			  request.setAttribute("Message", "Session timed out!");
			  request.getRequestDispatcher("/JSP/Login.jsp").forward(request, response);
		  }
        else
        {
        	String quizCode = (String)session.getAttribute("quizCode");
        	String question = (String)session.getAttribute("question");
	        int correctAnswer = Integer.parseInt((String)session.getAttribute("answer"));
	        float marksForAnswer = Float.parseFloat((String)session.getAttribute("marks"));
	        
	        String op1 = request.getParameter("radio1");
	        String op2 = request.getParameter("radio2");
	        String op3 = request.getParameter("radio3");
	        String op4 = request.getParameter("radio4");
	        
	        String Answer = "0";
	        float Marks = 0.0f;
	        
	        //Check Answer
	        if (correctAnswer == 1 && op1 != null) {
	        	Answer = "1";
	        	Marks = marksForAnswer;
	        }
	        else if (correctAnswer == 2 && op2 != null) {
	        	Answer = "2";
	        	Marks = marksForAnswer;
	        }
	        else if (correctAnswer == 3 && op3 != null) {
	        	Answer = "3";
	        	Marks = marksForAnswer;
	        }
	        else if (correctAnswer == 4 && op4 != null) {
	        	Answer = "4";
	        	Marks = marksForAnswer;
	        }
	        
	        System.out.println(session.getAttribute("Student") + "\t" + quizCode + "\t" + Answer + "\t" + Marks);
	        
	        request.setAttribute("quizErrMessage", "YOUR RESPONSE HAS BEEN SAVED");
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("/JSP/Give-Test.jsp");
            requestDispatcher.forward(request, response);
	        /*Connection con = null;
	    	Statement statement = null;
	    	ResultSet resultSet = null;
	    	
	    	try {
	    		//con = DBConnection.createConnection();
	    		//statement = con.createStatement();
	    		//resultSet = statement.executeQuery("insert into qresult values('"+session.getAttribute("Student")+"', '"+quizCode+"', '"+Answer+"', "+Marks+")");
	    	} catch (SQLException E) {
	    		E.printStackTrace();
	    	}*/
	    }
    }
}