package com.student.dashboard;

import java.io.IOException;

import com.password.Password;
import com.users.Student;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/editStudent")
public class editStudent extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public editStudent() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("Inside edit Student details servlet-post");
		  HttpSession session = request.getSession(false);
		  if(session==null)
		  {
			  request.setAttribute("Message", "Session timed out!");
			  request.getRequestDispatcher("/JSP/Login.jsp").forward(request, response);
		  }
		  else
		  {
			  String username = (String)session.getAttribute("Student");
			  Student student;
			  student = Student.search(username);
			  request.setAttribute("username",student.getUserName());
			  request.setAttribute("email",student.getemail());
			  request.setAttribute("fname", student.getFname());
			  request.setAttribute("lname", student.getLname());
			  request.setAttribute("inst_id", student.getInstituteId());	  
			  
			  if(request.getParameter("Edit Password")!=null)
			  {		  
				  String new_password=request.getParameter("new_password");
				  if(new_password.compareTo(request.getParameter("confirm_new_password"))==0)
				  {
					 if(student.authenticate(request.getParameter("p_old_password")))
					 {
						 if(Password.checkStrongPassword(new_password))
						 {
							 if(student.edit(request.getParameter("new_password")))
							 {
								 request.setAttribute("username",student.getUserName());
								 session.setAttribute("student", student.getUserName());
								 request.setAttribute("pConfirmMessage","Password changed successfully!");
							 }
							 else
							 {
								 request.setAttribute("pErrMessage","Couldn't change password!");
							 }
						 }
						 else
							request.setAttribute("pErrMessage","Couldn't change password: New password should be a combination of a lower-case letter,an upper-case letter, a number and a special character(@,#,$,%,^,&,+,=)");
					 }
					 else
						request.setAttribute("pErrMessage","Couldn't change password: Current password is incorrect!");
				  }  
				  else
					  request.setAttribute("pErrMessage","Couldn't change password: New password and confirm new password fields don't match!");
				  
				  request.getRequestDispatcher("/JSP/StudentProfile.jsp").forward(request, response);
			  }
		
		}
	}

}