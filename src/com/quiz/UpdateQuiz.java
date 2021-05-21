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
	    		ArrayList<Question> questions = new ArrayList<Question>();
    			
	    		 if(request.getParameter("updateQuiz") != null) {
	    			 int update = Integer.parseInt(request.getParameter("updateQuiz"));
	       			 
	     			String questionTitle = request.getParameterValues("questionTitle")[update];
	     			String[] options = {request.getParameterValues("option1")[update],request.getParameterValues("option2")[update],request.getParameterValues("option3")[update],request.getParameterValues("option4")[update]};
	     			int correct = Integer.parseInt(request.getParameterValues("answer")[update]);
	     			float marks = Float.parseFloat(request.getParameterValues("marks")[update]);
	    			int quiz_id = Integer.parseInt(request.getParameterValues("quiz_id")[update]);
	    			 
	    			ResultSet rr = statement.executeQuery("select quiz_code from quiz where quiz_id="+quiz_id);
					    while(rr.next()) {
					    	int quiz = Integer.parseInt(rr.getString("quiz_code"));
					    	request.setAttribute("code_code", quiz);
					    	session.setAttribute("code_code", quiz);
					    }
					    
				   ResultSet rstSet = statement.executeQuery("select * from quiz where quiz_code="+session.getAttribute("code_code").toString());
						
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
						}
						
	    			 String query = " update quiz set questionTitle='"+questionTitle+"', option1='"+options[0]+"', option2='"+options[1]+"', option3='"
	    			    		+options[2]+"', option4='"+options[3]+"', answer="+correct+", marks="+marks+" where quiz_id="+quiz_id;
	    			int r = statement.executeUpdate(query);
	    			    		
	    			if(r == 0) {
	    				System.out.println(" Quiz ID not Found!");
	    			}else {
	    				System.out.println(" Record Updated Successfully!");
	    			}
	    			
				    ArrayList<String> user =new ArrayList<String>();
			    	ArrayList<Integer> stu_ans =new ArrayList<Integer>();
			    	ArrayList<Float> ttl =new ArrayList<Float>();
				    ResultSet stu = statement.executeQuery("select username,answer,totalMarks from detailed_result where questionID="+quiz_id);
				    while(stu.next()) {
				    	user.add(stu.getString("username"));
				    	System.out.println("while loop "+stu.getString("username"));
				    	stu_ans.add(Integer.parseInt(stu.getString("answer")));
				    	ttl.add(Float.parseFloat(stu.getString("totalMarks")));
				    }
				    
				    int count=0;
				    for(String s: user) {
//				    	System.out.println(" Inside user for loop");
//				    	System.out.println(" quiz id "+quiz_id);
//				    	System.out.println(" username "+s);
				    	int quiz = Integer.parseInt(request.getAttribute("code_code").toString());
				    	Statement stmt1 = con.createStatement();
				    	ResultSet res = stmt1.executeQuery("select score,totalMarks from result where quizCode="+quiz+" and participants='"+s+"'");
				    	while(res.next()) {
//				    		System.out.println(" Inside result Table!");
				    		float stu_score = Float.parseFloat(res.getString("score"));
				    		float stu_ttl = Float.parseFloat(res.getString("totalMarks"));
				    		Question question = new Question();
				    		for(Question q: questions) {
				    			if(q.getId() == quiz_id) {
				    				question.setCorrectOption(q.getCorrectOption());
				    				question.setWeightage(q.getWeightage());
				    			}
				    		}
				    		if(question.getCorrectOption() != correct) {
				    			if(correct == stu_ans.get(count)) {
						    		stu_score += marks;
						    	}else {
						    		stu_score -= marks;
						    	}
				    		}
				    		if(question.getWeightage() != marks) {
				    			stu_ttl -= question.getWeightage();
				    			stu_ttl += marks;
				    		}
				    		Statement stmt2 = con.createStatement();
				    		String stu_upd = "update result set score="+stu_score+", totalMarks="+stu_ttl+" where quizCode="+quiz+" and participants='"+s+"'";
				    		int st = stmt2.executeUpdate(stu_upd);
				    		if(st == 1) {
				    			System.out.println(" Students Score Updated from Resullt Table");
				    		}else {
				    			System.out.println(" Unable to Update Students Score from Resullt Table");
				    		}
				        }
				    	count++;
				    } 
		  		 }else if(request.getParameter("deleteQuiz") != null) {
		  			int delete = Integer.parseInt(request.getParameter("deleteQuiz"));
		  			String questionTitle = request.getParameterValues("questionTitle")[delete];
	     			String[] options = {request.getParameterValues("option1")[delete],request.getParameterValues("option2")[delete],request.getParameterValues("option3")[delete],request.getParameterValues("option4")[delete]};
	     			int correct = Integer.parseInt(request.getParameterValues("answer")[delete]);
	     			float marks = Float.parseFloat(request.getParameterValues("marks")[delete]);
		  			
		  			int quiz_id = Integer.parseInt(request.getParameterValues("quiz_id")[delete]);
		  			
		  			ResultSet rrrr = statement.executeQuery("select quiz_code from quiz where quiz_id="+quiz_id);
				    while(rrrr.next()) {
				    	int quiz = Integer.parseInt(rrrr.getString("quiz_code"));
				    	request.setAttribute("code_code", quiz);
				    	session.setAttribute("code_code", quiz);
				    }
				  
					
		  			String query = " delete from quiz where quiz_id="+quiz_id; //quiz_id= question_id
				    int rrr = statement.executeUpdate(query);
				    		
				    if(rrr == 0) {
					    System.out.println(" Quiz ID not Found!");
				    }else {
				    	ArrayList<String> user =new ArrayList<String>();
				    	ArrayList<Integer> stu_ans =new ArrayList<Integer>();
				    	ArrayList<Float> ttl =new ArrayList<Float>();
					    System.out.println(" Record Deleted Successfully!");
//					    System.out.println(" question id "+quiz_id);
					    ResultSet stu = statement.executeQuery("select username,answer,totalMarks from detailed_result where questionID="+quiz_id);
					    while(stu.next()) {
					    	user.add(stu.getString("username"));
					    	stu_ans.add(Integer.parseInt(stu.getString("answer")));
					    	ttl.add(Float.parseFloat(stu.getString("totalMarks")));
					    }
					    
					    int count=0;
					    Statement stmt = null;
					    ResultSet res = null;
					    for(String s: user) {
//					    	System.out.println("User "+s);
					    	
					    	int quiz = Integer.parseInt(request.getAttribute("code_code").toString());
					    	stmt = con.createStatement();
					    	res = stmt.executeQuery("select score,totalMarks from result where quizCode="+quiz+" and participants='"+s+"'");
					    	while(res.next()) {
					    		float stu_score = Float.parseFloat(res.getString("score"));
					    		float stu_ttl = Float.parseFloat(res.getString("totalMarks"));
//					    	System.out.println("total marks "+ stu_ttl);
//					    	System.out.println("student marks "+ stu_score);
//					    	System.out.println("marks "+ marks);
					    		if(correct == stu_ans.get(count)) {
						    		stu_score -= marks;
						    		stu_ttl -= marks;
						    	}else {
						    		stu_ttl -= marks;
						    	}
//					    		System.out.println("total marks "+ stu_ttl);
//					    		System.out.println("student marks "+ stu_score);
//						    	System.out.println("marks "+ marks);
					    		Statement stmt2 = con.createStatement();
					    		String stu_upd = "update result set score="+stu_score+", totalMarks="+stu_ttl+" where quizCode="+quiz+" and participants='"+s+"'";
					    		int st = stmt2.executeUpdate(stu_upd);
					    		if(st == 1) {
					    			System.out.println(" Students Score Updated from Resullt Table");
					    		}else {
					    			System.out.println(" Unable to Update Students Score from Resullt Table");
					    		}
					    		Statement stmt3 = con.createStatement();
					    		String stu_del = " delete from detailed_result where questionID="+quiz_id+" and username='"+s+"'"; //quiz_id= question_id
							    int del = stmt3.executeUpdate(stu_del);
							    if(del == 1) {
					    			System.out.println(" Students Score deleted from detailed_result Table");
					    		}else {
					    			System.out.println(" Unable to delete Students Score from detailed_result Table");
					    		}
					        }
					    	count++;
					    } 
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
