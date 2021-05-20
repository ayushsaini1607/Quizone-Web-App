package com.quiz;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.*;

import com.login.util.DBConnection;

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
        else {
        	ArrayList<Question> questionBank = (ArrayList<Question>)session.getAttribute("questionBank");
        	int size = questionBank.size();
        	
        	int [] answers = new int[size];
        	for(int i = 0; i < size; i++) {
        		if (request.getParameter("options"+i) == null)
        			answers[i] = 0;
        		else
        			answers[i] = Integer.parseInt(request.getParameter("options"+i));
        	}
        	
        	int count = 0;
        	float totalMarks = 0.0f;
        	float marks = 0.0f;
        	for (Question i:questionBank) {
        		if (i.getCorrectOption() == answers[count]) {
        			marks += i.getWeightage();
        		}
        		count++;
        		totalMarks += i.getWeightage();
        	}
	        
	        request.setAttribute("quizSccMessage", "Your response has been saved");
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("/JSP/Give-Test.jsp");
            requestDispatcher.forward(request, response);
	        Connection con = null;
	    	Statement statement = null;
	    	ResultSet resultSet = null;
	    	
	    	try {
	    		String title = null;
	    		con = DBConnection.createConnection();
	    		statement = con.createStatement();
	    		resultSet = statement.executeQuery("SELECT title from create_quiz where code = " + session.getAttribute("quizCodeSQL"));
	    		if (resultSet.next()) {
	    			title = resultSet.getString("title");
	    		}
	    		
	    		statement.executeUpdate("insert into result values('"+session.getAttribute("quizCodeSQL")+"', '"+title+"', '"+session.getAttribute("Student")+"', "+marks+", "+totalMarks+")");
	    	
	    	//Logging marks in detailed_result
	    	for (int i = 0; i < questionBank.size(); i++) {
	    		statement.executeUpdate("insert into detailed_result values('"+session.getAttribute("quizCodeSQL")+"', '"+session.getAttribute("Student")+"', '"+questionBank.get(i).getId()+"', "+answers[i]+", "+totalMarks+")");
	    	}
	    	
	    	} catch (SQLException E) {
	    		E.printStackTrace();
	    	}
	    }
    }
}