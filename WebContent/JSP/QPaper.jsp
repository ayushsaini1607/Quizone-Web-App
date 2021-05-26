<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Open Graph Meta-->
    <meta property="og:type" content="website">
    <meta property="og:site_name" content="Quiz">
    <title>Quizone - Quiz Time</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Main CSS-->
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/main.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/quiz.css">
    <!-- Font-icon css-->
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <!-- Favicon  -->
    <link rel="icon" href="<%=request.getContextPath()%>/images/favicon.png" type="image/png">
</head>
<% //In case, if Student session is not set, redirect to Login page
if((request.getSession(false).getAttribute("Student") == null) )
{
%>
<jsp:forward page="/JSP/Login.jsp"></jsp:forward>
<%} %>
<body class="app sidebar-mini">
    <!-- Navbar-->
    <header class="app-header">
      <a class="app-header__logo tym" href="" id="demo" ><i class="fa fa-clock-o fa-lg">	Time Remaining</i></a>
      <!-- Sidebar toggle button-->
      <!-- <a class="app-sidebar__toggle" href="#" data-toggle="sidebar" aria-label="Hide Sidebar"></a> -->
      <!-- Navbar Right Menu-->
      <ul class="app-nav">
        <!-- User Menu-->
        <li class="dropdown"><a class="app-nav__item" href="#" data-toggle="dropdown" aria-label="Open Profile Menu"><i class="fa fa-user fa-2x"></i></a>
          <ul class="dropdown-menu settings-menu dropdown-menu-right">
          </ul>
        </li>
        <!-- <li ><a class="app-nav__item" ><i></i><input type="text" value="Usernames" disabled="true"></a> -->
      </ul>
    </header>
    
    <main class="main-cont">
      <div class="app-title">
        <div>
          <h1><i class="fa fa-file-text"></i><input type="text" value="Quiz Title" disabled="true"></h1>
        </div>
      </div>
      
	<%@page import="java.sql.*"%>
	<%@page import="java.util.*" %>
	<%@ page import="com.login.util.DBConnection" %>
	<%@page import="com.quiz.Question" %>
	<%@page import="java.time.LocalDate" %>
	<%@page import="java.time.LocalTime" %>
	<%@page import="java.time.Month" %>

	<%
	ArrayList <Question> questions = new ArrayList<Question>();

	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	}

	Connection connection = null;
	Statement statement = null;
	ResultSet resultSet = null;
	
	try{ 
		connection = DBConnection.createConnection();
		statement=connection.createStatement();
		resultSet = statement.executeQuery("SELECT * FROM quiz");
		
		while(resultSet.next()) {
			if(resultSet.getString("quiz_code").equals(request.getAttribute("quizCode"))) {
				session.setAttribute("quizCodeSQL", resultSet.getString("quiz_code"));
				Question question = new Question();
				question.setId(Integer.parseInt(resultSet.getString("quiz_id")));
				question.setQuestionTitle(resultSet.getString("questionTitle"));
				String[] opt = {resultSet.getString("option1"),resultSet.getString("option2"),resultSet.getString("option3"),resultSet.getString("option4")};
				question.setOptions(opt);
				question.setCorrectOption(Integer.parseInt(resultSet.getString("answer")));
				question.setWeightage(Float.parseFloat(resultSet.getString("marks")));
				questions.add(question);
			}
		}
		
		session.setAttribute("questionBank", questions);
		String quizDate = null;
		String quizStime = null;
		String quizEtime = null;
		resultSet = statement.executeQuery("SELECT * FROM create_quiz where code="+session.getAttribute("quizCodeSQL"));
		if(resultSet.next()){
			quizDate = resultSet.getString("date");
			quizStime = resultSet.getString("stime");
		    quizEtime = resultSet.getString("etime");
		}
		session.setAttribute("quizDate", quizDate);
		session.setAttribute("quizStime", quizStime);
		session.setAttribute("quizEtime", quizEtime);
	%>
	<form method = post action="<%= request.getContextPath() %>/SaveAnswer">
	<%
		int var = 0;
		for(Question i:questions) {
	%>
    <div class="container-quiz mt-sm-5 my-1">
    <div class="question ml-sm-5 pl-sm-5 pt-2">
    <div class="py-2 h5"><b><%=i.getQuestionTitle() %></b></div>
    <div class="ml-md-3 ml-sm-3 pl-md-5 pt-sm-0 pt-3" id="options">
    <label class="options"><%=i.getOptions()[0] %> <input type="radio" name="options<%=var%>" value = "1"> <span class="checkmark"></span> </label>
    <label class="options"><%=i.getOptions()[1] %> <input type="radio" name="options<%=var%>" value = "2"> <span class="checkmark"></span> </label>
    <label class="options"><%=i.getOptions()[2] %> <input type="radio" name="options<%=var%>" value = "3"> <span class="checkmark"></span> </label>
    <label class="options"><%=i.getOptions()[3] %> <input type="radio" name="options<%=var%>" value = "4"> <span class="checkmark"></span> </label>
    </div>
    </div>
    <div class="d-flex align-items-center pt-3">
    <!-- <div id="prev"><button class="btn btn-pri"> Previous </button></div> -->
    </div>
</div>
    <% 
    	var++;
		}
	%>
	<div class="ml-auto mr-sm-5" style = "margin: auto; width: 50%; padding: 10px;"> <button class="btn btn-succ" type = "submit">Submit</button> </div>
	</form>
	
	<%
	} catch (Exception e) {
		e.printStackTrace();
	}
	%>
    </main>
    <!-- Essential javascripts for application to work-->
    <script src="<%=request.getContextPath()%>/js/jquery-3.3.1.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/popper.min.js"></script><!-- Notification ka dropdown -->
    <script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/main.js"></script><!-- Dashboard ka dropdown -->
    <script type="text/javascript">
    // Mre Details Page Flipbox control
    $('.login-content [data-toggle="flip"]').click(function() {
      $('.login-box').toggleClass('flipped');
      return false;
    });
  </script>
    <script>
// Set the date we're counting down to
<% 
LocalTime time1 = LocalTime.parse((String)session.getAttribute("quizEtime"));
LocalDate date2 = LocalDate.parse((String)session.getAttribute("quizDate"));
int yyyy = date2.getYear();
int mm = date2.getMonthValue();
Month m = date2.getMonth();
int dd = date2.getDayOfMonth();
String date3 = null;

date3 = ""+m.toString()+" "+dd+", "+yyyy+" "+time1+":00";
session.setAttribute("countDown",date3);
System.out.println(" Countdown : "+session.getAttribute("countDown"));
%>
var dd = "<%=(String)session.getAttribute("countDown")%>";
var countDownDate = new Date(dd).getTime();

// Update the count down every 1 second
var x = setInterval(function() {

  // Get today's date and time
  var now = new Date().getTime();
    
  // Find the distance between now and the count down date
  var distance = countDownDate - now;
    
  // Time calculations for days, hours, minutes and seconds
  var days = Math.floor(distance / (1000 * 60 * 60 * 24));
  var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
  var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
  var seconds = Math.floor((distance % (1000 * 60)) / 1000);
    
  // Output the result in an element with id="demo"
  document.getElementById("demo").innerHTML = days+"d "+hours+"h "+minutes + "m " + seconds + "s ";
    
  // If the count down is over, write some text 
  if (distance < 0) {
    clearInterval(x);
    document.getElementById("demo").innerHTML = "Expired";
  }
}, 1000);
 
</script>
<script type="text/javascript">
        function preventBack() {
            window.history.forward(); 
        }
          
        setTimeout("preventBack()", 0);
          
        window.onunload = function () { null };
    </script>
<!--    <script type="text/javascript">
        window.history.forward();
        function noBack() {
            window.history.forward();
        }
         
    </script> -->
</body>
</html>