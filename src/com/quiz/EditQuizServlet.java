package com.quiz;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.chrono.ChronoLocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;

import com.login.util.DBConnection;

/**
 * Servlet implementation class EditQuizServlet
 */
@WebServlet("/EditQuizServlet")
public class EditQuizServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditQuizServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
//	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("Inside EditQuiz servlet");
		HttpSession session = request.getSession(false);
		int code = 0;
		if(request.getParameter("code_edit") != null) {
			code = Integer.parseInt(request.getParameter("code_edit"));
		}else {
			code = Integer.parseInt(request.getAttribute("code_code").toString());
		}
		
        LocalDate date1 = java.time.LocalDate.now();

		ArrayList<Question> questions = new ArrayList<Question>();
		
		Connection con=null;
    	Statement statement=null;
    	ResultSet result=null;
//    	ResultSet rstSet=null;
    	String quizd="";
    	
    	try {
    		
    		con=DBConnection.createConnection();
    		statement = con.createStatement();
    		
    		result = statement.executeQuery("select date from create_quiz where code="+code);
    		if(result.next()) {
    			quizd = result.getString("date");
    		}
    		else
    		{
    			request.setAttribute("errCodeNotFound","Sorry! We couldn't find this quiz code!");
    			request.getRequestDispatcher("/JSP/EditQuiz.jsp").forward(request, response);
    		}
    				
    			
    		LocalDate date2 = LocalDate.parse(quizd);
    		if(date1.isBefore(date2) || date1.isAfter(date2)) {
				ResultSet rstSet = statement.executeQuery("select * from quiz where quiz_code="+code);
				
				while(rstSet.next())
				{
					Question question = new Question();
					question.setId(Integer.parseInt(rstSet.getString("quiz_id")));
					question.setQuestionTitle(rstSet.getString("questionTitle"));
					String[] opt = {rstSet.getString("option1"),rstSet.getString("option2"),rstSet.getString("option3"),rstSet.getString("option4")};
					question.setOptions(opt);
					question.setCorrectOption(Integer.parseInt(rstSet.getString("answer")));
					question.setWeightage(Float.parseFloat(rstSet.getString("marks")));
					questions.add(question);
					request.setAttribute("questionList", questions);
					request.setAttribute("code_code", code);
				}
				rstSet.close();
			}
    		result.close();
    		
    		
        	} catch(SQLException E)
	        	{
	        		E.printStackTrace();
	        	}
		request.getRequestDispatcher("/JSP/EditQuiz.jsp").forward(request, response);
	}

}
