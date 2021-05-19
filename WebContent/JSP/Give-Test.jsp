<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Open Graph Meta-->
    <meta property="og:type" content="website">
    <meta property="og:site_name" content="Quizone Test">
    <title>Quizone - Give Test</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Main CSS-->
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/main.css">
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
<body>
  <section class="material-half-bg">
    <div class="cover"></div>
  </section>
  <section class="login-content">
    <div class="logo">
     <a href="<%=request.getContextPath()%>/JSP/Student.jsp"><h1 style="color:white">Quizone</h1></a>
    </div>
    <div class="test-box">
      <form class="login-form " method="post" action="<%= request.getContextPath() %>/TakeQuiz">
        <h3 class="login-head"><i class="fa fa-lg fa fa-file-text"></i> Join Quiz</h3>
        <div class="form-group">
          <label class="control-label">TEST CODE</label>
          <input class="form-control" type="text" placeholder="Enter 6 Digit Quiz Code" autofocus required name="quizCode">
        </div>
        <div class="form-group btn-container">
          <button class="btn btn-primary btn-block" type="submit"><i class="fa fa-sign-in fa-lg fa-fw"></i>START QUIZ</button>
        </div>
        <div style="color:red"><%=(request.getAttribute("quizErrMessage") == null) ? "" : request.getAttribute("quizErrMessage")%></div>
        <div style="color:green"><%=(request.getAttribute("quizSccMessage") == null	) ? "" : request.getAttribute("quizSccMessage")%></div>
      </form>
    </div>
  </section>
  
  <!-- Essential javascripts for application to work-->
  <script src="<%=request.getContextPath()%>/js/jquery-3.3.1.min.js"></script>
  <script src="<%=request.getContextPath()%>/js/popper.min.js"></script><!-- Notification ka dropdown -->
  <script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
  <script src="<%=request.getContextPath()%>/js/main.js"></script><!-- Dashboard ka dropdown -->
</body>
</html>