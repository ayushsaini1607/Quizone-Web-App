<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.login.util.DBConnection" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Statement" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Quizone - Admin Dashboard</title>
<!-- Open Graph Meta-->
    <meta property="og:type" content="website">
    <meta property="og:site_name" content="Admin Dashboard">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Main CSS-->
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/main.css">
    <!-- Font-icon css-->
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="icon" href="<%=request.getContextPath()%>/images/favicon.png" type="image/png">
</head>
<% //In case, if Admin session is not set, redirect to Login page
if((request.getSession(false).getAttribute("Admin")== null) )
{
%>
<jsp:forward page="/JSP/Login.jsp"></jsp:forward>
<%}
%>
<body class="app sidebar-mini">
    <!-- Navbar-->
    <header class="app-header">
      <a class="app-header__logo" href="<%=request.getContextPath()%>/admin-dashboard">Quizone</a>
      <!-- Sidebar toggle button-->
      <a class="app-sidebar__toggle" href="#" data-toggle="sidebar" aria-label="Hide Sidebar"></a>
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
             <li><form action="<%=request.getContextPath() %>/admin-dashboard" method="post"><a class="app-menu__item"><i class="app-menu__icon fa fa-user fa-lg"></i><button class="btn btn-light" type="submit" name="View Profile"> <span class="app-menu__label">Profile</span></button></a></form></li>
            <li><a class="dropdown-item" href="<%=request.getContextPath()%>/logout"><i class="fa fa-sign-out fa-lg"></i> Logout</a></li>
          </ul>
        </li>
      </ul>
    </header>
    <!-- Sidebar menu-->
    <div class="app-sidebar__overlay" data-toggle="sidebar"></div>
    <aside class="app-sidebar">
      <div class="app-sidebar__user"><img class="app-sidebar__user-avatar" src="images/logo.png" width="50" alt="User Image">
        <div>
          <p class="app-sidebar__user-name"><%=request.getAttribute("username") %></p>
          <p class="app-sidebar__user-designation">Developer / Admin</p>
        </div>
      </div>
      <ul class="app-menu">
        <li class="treeview"><a class="app-menu__item active" href="#" data-toggle="treeview"><i class="app-menu__icon fa fa-dashboard"></i><span class="app-menu__label">Dashboard</span><i class="treeview-indicator fa fa-angle-right"></i></a>
          <ul class="treeview-menu">
            <li><a class="treeview-item" href="<%= request.getContextPath() %>/admin-dashboard"><i class="icon fa fa-circle-o"></i> Home</a></li>
            <li><a class="treeview-item" href="JSP/create-account.jsp"><i class="icon fa fa-circle-o"></i> Create Account</a></li>
            <li><a class="treeview-item" href="<%=request.getContextPath() %>/manage-users"><i class="icon fa fa-circle-o"></i> Manage Users</a></li>
             <li><a class="treeview-item" href="<%= request.getContextPath() %>/JSP/RetrievePassword.jsp"><i class="icon fa fa-circle-o"></i> Retrieve User Passwords</a></li>
          </ul>
        </li>
       
        <li><form action="<%=request.getContextPath() %>/admin-dashboard" method="post"><a class="app-menu__item"><i class="app-menu__icon fa fa-user fa-lg"></i><button class="btn btn-dark" type="submit" name="View Profile"> <span class="app-menu__label">Profile</span></button></a></form></li>
       
        <li><a class="app-menu__item" href="<%=request.getContextPath()%>/logout"><i class="app-menu__icon fa fa-sign-out fa-lg"></i><span class="app-menu__label">Logout</span></a></li>
       
      </ul>
    </aside>
    <main class="app-content">
      <div class="app-title">
        <div>
          <h1><i class="fa fa-dashboard"></i> Admin Dashboard</h1>
          <p>Welcome, Here's what we got for you.</p>
        </div>
        <ul class="app-breadcrumb breadcrumb">
          <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
          <li class="breadcrumb-item"><a href="#">Dashboard</a></li>
        </ul>
      </div>
  			
  			<%
      
			        String userCount = "0";
        		    String studentCount ="0";
        		    String teacherCount="0";
        		    String quizCount="0";
        		    
			        Connection con=null;
					Statement statement=null;
					ResultSet resultSet = null;
			  
					
					try{
				  		con = DBConnection.createConnection();
				  		statement = con.createStatement(); 
				  		resultSet = statement.executeQuery("select count(username) as userCount from users");
				  		if(resultSet.next())
				  			userCount = resultSet.getString("userCount");
				  		resultSet = statement.executeQuery("select count(username) as teacherCount from users where userType='teacher'");
				  		if(resultSet.next())
				  			teacherCount = resultSet.getString("teacherCount");
				  		resultSet = statement.executeQuery("select count(username) as studentCount from users where userType='student'");
				  		if(resultSet.next())
				  			studentCount = resultSet.getString("studentCount");
				  		resultSet = statement.executeQuery("select count(quiz_id) as quizCount from quiz_to_username");
				  		if(resultSet.next())
				  			quizCount = resultSet.getString("quizCount");
				  		//out.println("userCount = " +  userCount);
				
				  		resultSet.close();
			  	  		statement.close();
			  	  		con.close(); 
			  		} catch(SQLException E)
			  			{
			  				//userCount="0";
			  				//teacherCount="0";
			  				
			  			}   
				%>
				
      <div class="row">
        <div class="col-md-6">
          <div class="widget-small primary coloured-icon"><i class="icon fa fa-users fa-3x"></i>
            <div class="info">
              <h4>Total Accounts</h4>	
              <p><b><%= userCount %></b></p>  		 
            </div>
          </div>
        </div>
        <div class="col-md-6">
          <div class="widget-small primary coloured-icon"><i class="icon fa fa-users fa-3x"></i>
            <div class="info">
              <h4>Total Teachers</h4>	
              <p><b><%= teacherCount %></b></p>  		 
            </div>
          </div>
      </div>
        <div class="col-md-6">
          <div class="widget-small primary coloured-icon"><i class="icon fa fa-users fa-3x"></i>
            <div class="info">
              <h4>Total Students</h4>	
              <p><b><%= studentCount %></b></p>  		 
            </div>
          </div>
      </div>
      <div class="col-md-6">
          <div class="widget-small info coloured-icon"><i class="icon fa fa-file-text fa-3x"></i>
            <div class="info">
              <h4>Total Quizzes</h4>
              <p><b><%= quizCount %></b>
            </div>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-md-6">
         <form action="<%=request.getContextPath()%>/admin-dashboard" method="post">
          <button type="submit" name="create account" class="btn btn-lg btn-outline-success col-md-12">Create Account</button><br><br><br>
        </form>
        </div>
        <div class="col-md-6">
         <form action="<%=request.getContextPath()%>/manage-users" method="get">
          <button type="submit" name="manage users" class="btn btn-lg btn-outline-success col-md-12">Manage Users</button><br><br><br>  
       	 </form>
        </div>
        <!-- <div class="col-md-6">
          <a href="account-stats.html"><button type="button" class="btn btn-lg btn-outline-success col-md-12">Aur Btao</button></a><br><br><br>  
        </div>
        <div class="col-md-6">
          <a href="feedback.html"><button type="button" class="btn btn-lg btn-outline-success col-md-12">Feedback</button></a><br><br><br>  
        </div> -->
      </div>
      
    </main>
    <!-- Essential javascripts for application to work-->
    <script src="<%=request.getContextPath()%>/js/jquery-3.3.1.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/popper.min.js"></script><!-- Notification ka dropdown -->
    <script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/main.js"></script><!-- Dashboard ka dropdown -->
  </body>
</html>
</html>