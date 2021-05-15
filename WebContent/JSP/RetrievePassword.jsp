<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Open Graph Meta-->
    <meta property="og:type" content="website">
    <meta property="og:site_name" content="Quizone Test">
    <title>Quizone - Retrieve Password</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Main CSS-->
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/main.css">
    <!-- Font-icon css-->
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <!-- Favicon  -->
    <link rel="icon" type="image/png" href="<%=request.getContextPath()%>/images/favicon.png">
</head>
<% //In case, if Student session is not set, redirect to Login page
if((request.getSession(false).getAttribute("Admin") == null) )
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
       <a href="<%=request.getContextPath()%>/admin-dashboard"><h1 style="color:white">Quizone</h1></a> 
      </div>
    <div class="test-box">
      <form class="login-form " method="post" action="<%= request.getContextPath() %>/retrieve-password">
        <h3 class="login-head"><i class="fa fa-lg fa fa-file-text"></i> Retrieve Password </h3>
        <div class="form">
        	<h6>Search for passwords of students and teachers!</h6>
        </div>
        <div class="form-group">
          <label class="control-label">Username</label>
          <input class="form-control" type="text" placeholder="Enter username" autofocus required name="searchUsername">
        </div>
        <div class="form-group">
        <label class="control-label">Password</label>
          <input class="form-control" type="password" placeholder="Verify your password" autofocus required name="verifyPass">
        </div>
        <div class="form-group btn-container">
          <button class="btn btn-primary btn-block" type="submit"><i class="fa fa-sign-in fa-lg fa-fw"></i>RETRIEVE PASSWORD</button>
        </div>
         <% 
           String fetchedPass = "Password for requested username is : " + request.getAttribute("fetchedPassword");
         %>
         <div style="color:green"><%= (request.getAttribute("fetchedPassword") == null) ? "" : fetchedPass %></div>
        <div style="color:red"><%=(request.getAttribute("errMessage") == null) ? "" : request.getAttribute("errMessage")%></div>
      </form>
    </div>
  </section>
  
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
</body>
</html>