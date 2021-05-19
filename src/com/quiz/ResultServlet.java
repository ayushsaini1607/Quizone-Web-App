package com.quiz;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
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
 * Servlet implementation class ResultServlet
 */
@WebServlet("/ResultServlet")
public class ResultServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ResultServlet() {
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("Inside Result servlet");
		HttpSession session = request.getSession(false);
		if(session==null)
		  {
			  request.setAttribute("Message", "Session timed out!");
			  request.getRequestDispatcher("/JSP/Login.jsp").forward(request, response);
		  }
		else
		{
			ArrayList<Result> results = new ArrayList<>();
			int code = Integer.parseInt(request.getParameter("code_result"));
			
			Connection con=null;
	    	Statement statement=null;
	    	ResultSet resultset=null;
	    	
	    	try {
	    		
	    		con=DBConnection.createConnection();
	    		statement = con.createStatement();
	    		
	    		resultset = statement.executeQuery("select * from result where quizCode="+code);
	    		
	    		while(resultset.next())
	    		{
	    			Result result = new Result();
	    			result.setUsername(resultset.getString("participants"));
	    			result.setScore(Float.parseFloat(resultset.getString("score")));
	    			result.setTotal(Float.parseFloat(resultset.getString("totalMarks")));
	    			results.add(result);
	    			request.setAttribute("resultList", results);
	    			request.setAttribute("quiz_quiz",code);
	    		}
	    		resultset.close();
	    		
	    		for(Result R : results) {
	    			ResultSet rs=null;
	    			rs = statement.executeQuery("select institute_id from username_to_inst_id where username='"+R.getUsername()+"'");
	    			while(rs.next()) {
	    				R.setInstituteID(rs.getString("institute_id"));
	    			}
	    			rs.close();
	    		}
	        	} catch(SQLException E)
		        	{
		        		E.printStackTrace();
		        	}
	    	
			request.getRequestDispatcher("/JSP/QuizResult.jsp").forward(request, response);
		}
	}

}
