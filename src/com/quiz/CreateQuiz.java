package com.quiz;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.login.util.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class CreateQuiz
 */
@WebServlet("/CreateQuiz")
public class CreateQuiz extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateQuiz() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("Inside Question servlet-post");
		HttpSession session = request.getSession(false);
		if(session==null)
		  {
			  request.setAttribute("Message", "Session timed out!");
			  request.getRequestDispatcher("/JSP/Login.jsp").forward(request, response);
		  }
		else
		{
			int correct = 0; 
			int code=0;
			ArrayList<Question> question = new ArrayList<Question>();
			String quest = request.getParameter("question");
			String[] opt = {request.getParameter("option1"),request.getParameter("option2"),request.getParameter("option3"),request.getParameter("option4")};
			if(request.getParameter("correct") != null) {
				correct = Integer.parseInt(request.getParameter("correct"));
			}
			float marks = Float.parseFloat(request.getParameter("marks"));
			
			if((String)session.getAttribute("quizCode") != null) {
				code = Integer.parseInt((String)session.getAttribute("quizCode"));
			}else if(session.getAttribute("addQuest") != null) {
				code = Integer.parseInt(session.getAttribute("addQuest").toString());
			}
	//		System.out.println(" Code : "+code);
			question.add(new Question(quest,opt,correct,marks));
			
			Connection con=null;
		      Statement statement=null;
		      
		        	try {
		        		
		        		con = DBConnection.createConnection();
		        		PreparedStatement p = con.prepareStatement("insert into quiz (quiz_code,questionTitle,"
		        				+ "option1,option2,option3,option4,answer,marks) values ('" +  code 
	      					+ "','" + quest + "','" + opt[0] + "','" + opt[1] + "','" + opt[2] + "','" + opt[3]
	      							+ "','" + correct+ "','" + (int)marks+"')");
		        		
		        		System.out.println(""+p.toString());
		      			p.executeUpdate();
		      			p.close();
		      			String errCre = "Quiz Created! Quiz Code -> "+code;	
		      			request.setAttribute("quizCreMessage", errCre);
		      			System.out.println(" Message : "+errCre);
		        	} catch(SQLException E)
		        	{
		        		E.printStackTrace();
		        	}
		        
		        
		        if(request.getParameter("next") != null) {
		  			  request.getRequestDispatcher("JSP/questions.jsp").forward(request, response);
		  		 }else if(request.getParameter("create") != null) {
		  			  request.getRequestDispatcher("JSP/create-test.jsp").forward(request, response);
		  		 }
		  }
	}

}
