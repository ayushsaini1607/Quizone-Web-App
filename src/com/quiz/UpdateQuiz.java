package com.quiz;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.login.util.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class UpdateQuiz
 */
@WebServlet("/UpdateQuiz")
public class UpdateQuiz extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateQuiz() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("Inside UpdateQuiz servlet");
		HttpSession session = request.getSession(false);
		if(session==null)
		  {
			  request.setAttribute("Message", "Session timed out!");
			  request.getRequestDispatcher("/JSP/Login.jsp").forward(request, response);
		  }
		else
		{
			String error = null;
				
			Connection con=null;
	    	Statement statement=null;
	
	    	try {
	    		con=DBConnection.createConnection();
	    		statement = con.createStatement();
	    		
	    		 if(request.getParameter("updateQuiz") != null) {
	    			 int update = Integer.parseInt(request.getParameter("updateQuiz"));
	    			 
	    			 String questionTitle = request.getParameterValues("questionTitle")[update];
	    			String[] options = {request.getParameterValues("option1")[update],request.getParameterValues("option2")[update],request.getParameterValues("option3")[update],request.getParameterValues("option4")[update]};
	    			int correct = Integer.parseInt(request.getParameterValues("answer")[update]);
	    			float marks = Float.parseFloat(request.getParameterValues("marks")[update]);
	    			int quiz_id = Integer.parseInt(request.getParameterValues("quiz_id")[update]);
	    			 String query = " update quiz set questionTitle='"+questionTitle+"', option1='"+options[0]+"', option2='"+options[1]+"', option3='"
	    			    		+options[2]+"', option4='"+options[3]+"', answer="+correct+", marks="+marks+" where quiz_id="+quiz_id;
	    			int r = statement.executeUpdate(query);
	    			
	    			ResultSet resultSet = statement.executeQuery("select quiz_code from quiz where quiz_id=" + quiz_id);
	    			if(resultSet.next())
	    			  {
	    				System.out.println(resultSet.getInt("quiz_code"));
	    				request.setAttribute("code_code",resultSet.getInt("quiz_code"));
	    			  }
	    			    		
	    			if(r == 0) {
	    				System.out.println(" Quiz ID not Found!");
	    			}else {
	    				System.out.println(" Record Updated Successfully!");
	    			}
	    			
	    			ResultSet rr = statement.executeQuery("select quiz_code from quiz where quiz_id="+quiz_id);
				    while(rr.next()) {
				    	int quiz = Integer.parseInt(rr.getString("quiz_code"));
				    	System.out.println("Quiz Code : "+quiz);
				    	request.setAttribute("code_code", quiz);
				    }
				    rr.close();
		  		 }else if(request.getParameter("deleteQuiz") != null) {
		  			int delete = Integer.parseInt(request.getParameter("deleteQuiz"));
		  			
		  			int quiz_id = Integer.parseInt(request.getParameterValues("quiz_id")[delete]);
		  			
		  			ResultSet rrrr = statement.executeQuery("select quiz_code from quiz where quiz_id="+quiz_id);
				    while(rrrr.next()) {
				    	int quiz = Integer.parseInt(rrrr.getString("quiz_code"));
				    	System.out.println("Quiz Code : "+quiz);
				    	request.setAttribute("code_code", quiz);
				    }
				    rrrr.close();
		  			String query = " delete from quiz where quiz_id="+quiz_id;
				    int rrr = statement.executeUpdate(query);
				    
				    ResultSet resultSet = statement.executeQuery("select quiz_code from quiz where quiz_id=" + quiz_id);
	    			if(resultSet.next())
	    			  {
	    				System.out.println(resultSet.getInt("quiz_code"));
	    				request.setAttribute("code_code",resultSet.getInt("quiz_code"));
	    			  }
				    		
				    if(rrr == 0) {
					    System.out.println(" Quiz ID not Found!");
				    }else {
					    System.out.println(" Record Deleted Successfully!");
				    }
				    
		  		 }
				statement.close();
	    	} catch(SQLException E)
	    	{
	    		E.printStackTrace();
	    	}
	    	request.getRequestDispatcher("EditQuizServlet").forward(request, response);
		}
	}

}
