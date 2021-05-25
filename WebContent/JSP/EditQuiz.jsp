<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.login.util.DBConnection" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <meta property="og:type" content="website">
    <meta property="og:site_name" content="Quiz Stats">
    <title>Quiz - Edit</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Main CSS-->
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/main.css">
    <!-- Font-icon css-->
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="icon" href="<%=request.getContextPath()%>/images/favicon.png" type="image/png">
</head>
<% //In case, if Teacher session is not set, redirect to Login page
if((request.getSession(false).getAttribute("Teacher")== null) )
{
%>
<jsp:forward page="/JSP/Login.jsp"></jsp:forward>
<%} %>
<body class="app sidebar-mini">
<header class="app-header">
      <a class="app-header__logo" href="<%=request.getContextPath()%>/teacher-dashboard">Quizone</a>
      <!-- Sidebar toggle button--><a class="app-sidebar__toggle" href="#" data-toggle="sidebar" aria-label="Hide Sidebar"></a>
      <!-- Navbar Right Menu-->
      <ul class="app-nav">
        <!--Notification Menu-->
        <li class="dropdown"><a class="app-nav__item" href="#" data-toggle="dropdown" aria-label="Show notifications"><i class="fa fa-bell-o fa-lg"></i></a>
          <ul class="app-notification dropdown-menu dropdown-menu-right">
            <li class="app-notification__title">You have 2 new notifications.</li>
            <div class="app-notification__content">
              <li><a class="app-notification__item" href="javascript:;"><span class="app-notification__icon"><span class="fa-stack fa-lg"><i class="fa fa-circle fa-stack-2x text-primary"></i><i class="fa fa-envelope fa-stack-1x fa-inverse"></i></span></span>
                  <div>
                    <p class="app-notification__message">Comming Soon!</p>
                    <p class="app-notification__meta">2 min ago</p>
                  </div></a></li>
              <li><a class="app-notification__item" href="javascript:;"><span class="app-notification__icon"><span class="fa-stack fa-lg"><i class="fa fa-circle fa-stack-2x text-danger"></i><i class="fa fa-hdd-o fa-stack-1x fa-inverse"></i></span></span>
                  <div>
                    <p class="app-notification__message">Comming Soon!</p>
                    <p class="app-notification__meta">5 min ago</p>
                  </div></a></li>
              <li><a class="app-notification__item" href="javascript:;"><span class="app-notification__icon"><span class="fa-stack fa-lg"><i class="fa fa-circle fa-stack-2x text-success"></i><i class="fa fa-money fa-stack-1x fa-inverse"></i></span></span>
                  <div>
                    <p class="app-notification__message">Comming Soon!</p>
                    <p class="app-notification__meta">2 days ago</p>
                  </div></a></li>
              <div class="app-notification__content">
                <li><a class="app-notification__item" href="javascript:;"><span class="app-notification__icon"><span class="fa-stack fa-lg"><i class="fa fa-circle fa-stack-2x text-primary"></i><i class="fa fa-envelope fa-stack-1x fa-inverse"></i></span></span>
                    <div>
                      <p class="app-notification__message">Comming Soon!</p>
                      <p class="app-notification__meta">2 min ago</p>
                    </div></a></li>
                <li><a class="app-notification__item" href="javascript:;"><span class="app-notification__icon"><span class="fa-stack fa-lg"><i class="fa fa-circle fa-stack-2x text-danger"></i><i class="fa fa-hdd-o fa-stack-1x fa-inverse"></i></span></span>
                    <div>
                      <p class="app-notification__message">Comming Soon!</p>
                      <p class="app-notification__meta">5 min ago</p>
                    </div></a></li>
                <li><a class="app-notification__item" href="javascript:;"><span class="app-notification__icon"><span class="fa-stack fa-lg"><i class="fa fa-circle fa-stack-2x text-success"></i><i class="fa fa-money fa-stack-1x fa-inverse"></i></span></span>
                    <div>
                      <p class="app-notification__message">Comming Soon!</p>
                      <p class="app-notification__meta">2 days ago</p>
                    </div></a></li>
              </div>
            </div>
            <li class="app-notification__footer"><a href="#">See all notifications.</a></li>
          </ul>
        </li>
        <!-- User Menu-->
        <li class="dropdown"><a class="app-nav__item" href="#" data-toggle="dropdown" aria-label="Open Profile Menu"><i class="fa fa-user fa-lg"></i></a>
          <ul class="dropdown-menu settings-menu dropdown-menu-right">
           
            <li><a class="dropdown-item" href="<%=request.getContextPath()%>/JSP/TeacherProfile.jsp"><i class="fa fa-user fa-lg"></i> Profile</a></li>
            <li><a class="dropdown-item" href="<%=request.getContextPath()%>/logout"><i class="fa fa-sign-out fa-lg"></i> Logout</a></li>
          </ul>
        </li>
      </ul>
    </header>
    <!-- Sidebar menu-->
    <div class="app-sidebar__overlay" data-toggle="sidebar"></div>
    <aside class="app-sidebar">
      <div class="app-sidebar__user"><img class="app-sidebar__user-avatar" src="<%= request.getContextPath() %>/images/logo.png" width="50" alt="User Image">
        <div>
          <p class="app-sidebar__user-name"><%=session.getAttribute("Tea") %></p>
          <p class="app-sidebar__user-designation">Faculty</p>
        </div>
      </div>
      <ul class="app-menu">
        <li class="treeview"><a class="app-menu__item active" href="#" data-toggle="treeview"><i class="app-menu__icon fa fa-dashboard"></i><span class="app-menu__label">Dashboard</span><i class="treeview-indicator fa fa-angle-right"></i></a>
          <ul class="treeview-menu">
            <li><a class="treeview-item" href="<%=request.getContextPath()%>/teacher-dashboard"><i class="icon fa fa-circle-o"></i> Home</a></li>
            <li><a class="treeview-item" href="<%=request.getContextPath()%>/JSP/create-test.jsp" target="_blank" rel="noopener"><i class="icon fa fa-circle-o"></i> Create Quiz</a></li>
            <li><a class="treeview-item" href="#"><i class="icon fa fa-circle-o"></i> Edit Quiz</a></li>
            <li><a class="treeview-item" href="<%=request.getContextPath()%>/JSP/TestStats.jsp"><i class="icon fa fa-circle-o"></i> Quiz Stats</a></li>
            <li><a class="treeview-item" href="<%=request.getContextPath()%>/JSP/QuizResult.jsp"><i class="icon fa fa-circle-o"></i> Quiz Result</a></li>
          </ul>
        </li>
        <li><a class="app-menu__item" href="<%=request.getContextPath()%>/JSP/TeacherProfile.jsp" ><i class="app-menu__icon fa fa-user fa-lg"></i><span class="app-menu__label">Profile</span></a></li>
        
        <li><a class="app-menu__item" href="<%=request.getContextPath()%>/logout"><i class="app-menu__icon fa fa-sign-out fa-lg"></i><span class="app-menu__label">Logout</span></a></li>
      </ul>
    </aside>
   <main class="app-content">
      <div class="app-title">
        <div>
          <h1><i class="icon fa fa-bar-chart"></i> Edit Quiz</h1>
          <p>Welcome, Let us double check it</p>
        </div>
        <ul class="app-breadcrumb breadcrumb">
          <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
          <li class="breadcrumb-item"><a href="#">Edit Quiz</a></li>
        </ul>
      </div>
      
      <%
      
      	ArrayList<String> quizIds = new ArrayList<>(); 
        Connection con=null;
		Statement statement=null;
		ResultSet resultSet = null;
		
		try{
	  		con = DBConnection.createConnection();
	  		statement = con.createStatement(); 
	  		resultSet = statement.executeQuery("select quiz_id from quiz_to_username where username='" + session.getAttribute("Tea") + "'" );
	  		while(resultSet.next())
	  		{
	  			quizIds.add(resultSet.getString("quiz_id"));	
	  		}
	
	  		resultSet.close();
  	  		statement.close();
  	  		con.close(); 
  		} catch(SQLException E)
  			{
  				
  			}   
        
      %>
      
      <div class="app-title">
        <form action="<%=request.getContextPath()%>/EditQuizServlet" method="get">
            <div class="input-group">
              <h3 class="tile-title"  style="margin-right:25px">Quiz Code : </h3>
              
                 <select name="code_edit" class="form-control" style="margin-right:25px" required>
                  <%
                      for(String S : quizIds)
                      {
                  %>
                  <%
                     if(request.getAttribute("code_code")!=null)
                     {
                  %>
                      <option <%= S.equals(request.getAttribute("code_code").toString()) ? "selected" : "" %> style="margin-right:25px" value="<%=S%>"><%=S%></option>
                  <%
                    }
                    else
                     {
                    	 
                  %>
                      <option style="margin-right:25px" value="<%=S%>"><%=S%></option>
                  <% 
                     }
                      }
                  %>
                  </select>
                  <!-- <input class="form-control "  style="margin-right:25px" type="number" placeholder="Enter 6 digit Quiz Code" name="code_edit" required>  -->
                  <button class="btn btn-primary"  style="margin-right:25px" name="result" type="submit"><i class="fa fa-fw fa-lg fa-check-circle"></i>Search Quiz</button>
                 <button class="btn btn-primary" name="addQ" type="submit" ><i class="fa fa-fw fa-lg fa-check-circle"></i>ADD Questions</button>
           </div>
         </form>
      </div>
      <div class="row">
        <div class="col-md-12">
          <div class="tile">
            <div class="tile-body">
            <div class="table-responsive">
            <form name="edit-users" action="<%=request.getContextPath()%>/UpdateQuiz" onsubmit="return myFunction()" method="get">
            <table class="table table-hover table-bordered" id="editTable">
              <thead>
                    <tr>
                      <th>Unique ID</th>
                      <th>Question</th>
                      <th>Option A</th>
                      <th>Option B</th>
                      <th>Option C</th>
                      <th>Option D</th>
                      <th>Correct Answer</th>
                      <th>Weightage</th>
                      <th>Update</th>
                    </tr>
                  </thead>
                  <tbody>
                  <%@page import="com.quiz.Question" %>
              <%@page import="java.util.ArrayList" %>
              <%@page import="java.util.Arrays" %>
                    <%
                     int i=0;
                     ArrayList<Question> questionList = (ArrayList<Question>) request.getAttribute("questionList");
                     if(questionList != null){
                      for(Question Q : questionList){ 
                      String[] opts = Arrays.copyOf(Q.getOptions(), 4);
                      %>
	                    <tr>
	                      <td><textarea name="quiz_id" class="form-control" type="text" readonly><%= Q.getId()%></textarea></td>
	                      <td>
	                        <textarea id="question" name="questionTitle" class="form-control" type="text" ><%= Q.getQuestionTitle() %></textarea>
	                      </td>
	                      <td>
	                        <textarea id="A" name="option1" class="form-control" type="text" ><%= opts[0] %></textarea>
	                      </td>
	                      <td>
	                        <textarea id="B" name="option2" class="form-control" type="text" ><%= opts[1] %></textarea>
	                      </td>
	                      <td>
	                        <textarea id="C" name="option3" class="form-control" type="text" ><%= opts[2] %></textarea>
	                      </td>
	                      <td>
	                        <textarea id="D" name="option4" class="form-control" type="text" ><%= opts[3] %></textarea>
	                      </td>
	                      <td>
	                      	<textarea name="answer" id="correct" class="form-control" type="text" ><%= Q.getCorrectOption() %></textarea> 
	                      	
	                      </td>
	                      <td>
	                      	  <textarea id="mark" name="marks" class="form-control" type="text" ><%= Q.getWeightage() %></textarea>
	                      </td>
	                      <td>
	                            <button class="btn btn-primary" style="margin-bottom:5px" type="submit" name="updateQuiz" value="<%=i%>" >Update</button>
	                            <br>
	                            <button class="btn btn-primary" type="submit" name="deleteQuiz" value="<%=i%>" >Delete</button>
	                         
	                      </td>
	                    </tr>
                      <%i++;}}%>
                  </tbody> 
            </table>
            </form>
            </div>
            </div>
          </div>
        </div>
      </div>
    </main>
<!-- Essential javascripts for application to work-->
    <script src="<%=request.getContextPath()%>/js/jquery-3.3.1.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/popper.min.js"></script><!-- Notification ka dropdown -->
    <script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/main.js"></script><!-- Dashboard ka dropdown -->
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/plugins/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/plugins/dataTables.bootstrap.min.js"></script>
 <!--   <script type="text/javascript">$('#editTable').DataTable();</script> -->
    <script>
    function myFunction() {
	var correct = document.getElementById("correct").value;
	var quest = document.getElementById("question").value;
	var opta = document.getElementById("A").value;
	var optb = document.getElementById("B").value;
	var optc = document.getElementById("C").value;
	var optd = document.getElementById("D").value;
	var mark = document.getElementById("mark").value;
	submitOK = "true";
	
	if (quest.length <= 0) {
	    alert("Question Field cannot be EMPTY. Please Write something OR DELETE that question.");
	    submitOK = "false";
	  }
	if (opta.length <= 0 || optb.length <= 0 || optc.length <= 0 || optd.length <= 0) {
	    alert("Option Field cannot be EMPTY. Please Write something OR DELETE that question.");
	    submitOK = "false";
	  }
	
	if (isNaN(mark) || mark <= 0) {
	    alert(" Weightage of a question must be a postive number & greater than 0.");
	    submitOK = "false";
	  }
	
	if (isNaN(correct) || correct< 1 || correct > 4) {
	    alert("The Correct Answer must be a number between 1 and 4. Where 1-A, 2-B, 3-C & 4-D.");
	    submitOK = "false";
	  }
	
	if (submitOK == "false") {
	    return false;
	  }
	}
	</script>

    <script src="https://cdn.datatables.net/buttons/1.6.4/js/dataTables.buttons.min.js"></script> 
    <script src="https://cdn.datatables.net/buttons/1.6.4/js/buttons.flash.min.js"></script> 
   <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script> 
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script> 
   <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script> 
    <script src="https://cdn.datatables.net/buttons/1.6.4/js/buttons.html5.min.js"></script> 
   <script src="https://cdn.datatables.net/buttons/1.6.4/js/buttons.print.min.js"></script> 
    <script type="text/javascript">
        $(document).ready(function() 
			{ 
			    $('#editTable').DataTable( 
			    {   
			        dom: 'Blfrtip',
		            buttons: [      
		                {
		                    extend: 'pdfHtml5',
		                    title: 'Quiz Questions : <%= request.getAttribute("code_code") %>',
		                    className: 'btn_pdf',
		                    text:'Download Questions'
		                }
			       ]	        
			    });
		        
		        $('.btn_pdf').attr("class","btn btn-primary");
			} );
    </script> 
</body>
</html>
