<%@page import="java.util.ArrayList"%>
<%@page import="com.users.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Open Graph Meta-->
    <meta property="og:type" content="website">
    <meta property="og:site_name" content="Quizone Users">
    <title>Quizone - Users</title>
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
            <li><a class="treeview-item" href="<%=request.getContextPath()%>/admin-dashboard"><i class="icon fa fa-circle-o"></i> Home</a></li>
            <li><a class="treeview-item" href="JSP/create-account.jsp"><i class="icon fa fa-circle-o"></i> Create Account</a></li>
            <li><a class="treeview-item" href="#"><i class="icon fa fa-circle-o"></i> Manage Users</a></li>
            <li><a class="treeview-item" href="<%= request.getContextPath() %>/JSP/RetrievePassword.jsp"><i class="icon fa fa-circle-o"></i> Retrieve User Passwords</a></li>
            <!-- <li><a class="treeview-item" href="#"><i class="icon fa fa-circle-o"></i> Aur Btao</a></li>
            <li><a class="treeview-item" href="feedback.html"><i class="icon fa fa-circle-o"></i> Feedback</a></li> -->
          </ul>
        </li>
        <li><form action="<%=request.getContextPath() %>/admin-dashboard" method="post"><a class="app-menu__item"><i class="app-menu__icon fa fa-user fa-lg"></i><button  class="btn btn-dark" type="submit" name="View Profile"> <span class="app-menu__label">Profile</span></button></a></form></li>
        <li><a class="app-menu__item" href="<%=request.getContextPath()%>/logout"><i class="app-menu__icon fa fa-sign-out fa-lg"></i><span class="app-menu__label">Logout</span></a></li>
      </ul>
    </aside>
    <main class="app-content">
      <div class="app-title">
        <div>
          <h1><i class="fa fa-users"></i> Manage Users</h1>
          <p>Welcome, Here's the list of Users</p>
        </div>
        <ul class="app-breadcrumb breadcrumb">
          <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
          <li class="breadcrumb-item"><a href="#">Manage Users</a></li>
        </ul>
      </div>
      <!-- Table -->
      <div class="row">
        <div class="col-md-12">
          <div class="tile">
            <div class="tile-body">   
              <div style="color:red"><%=request.getAttribute("errMsg")==null ? "" : request.getAttribute("errMsg") %></div>           
              <div class="table-responsive">
              <form name="edit-users" action="<%=request.getContextPath()%>/edit-users" method="get"> 
                <table class="table table-hover table-bordered" id="sampleTable">
                  <thead>
                    <tr>
                      <th>First Name</th>
                      <th>Last Name</th>
                      <th>Email</th>
                      <th>Username</th>
                      <th>Institute ID</th>
                      <th>User Type</th>
                      <th></th>
                    </tr>
                  </thead>
                  <tbody>
                    <%
                     int i=0;
                     ArrayList<User> usersList = (ArrayList<User>) request.getAttribute("userList");
                      for(User U : usersList){ %>
	                    <tr>
	                      <td>
	                        <input <%= U.getClass().getSimpleName().equals("Admin") && !U.getUserName().equals(request.getAttribute("username")) ? "readonly" : "" %> name="fname" class="form-control" type="text" value="<%= U.getFname() %>">
	                      </td>
	                      <td>
	                        <input <%= U.getClass().getSimpleName().equals("Admin") && !U.getUserName().equals(request.getAttribute("username")) ? "readonly" : "" %> name="lname" class="form-control" type="text" value="<%= U.getLname() %>">
	                      </td>
	                      <td>
	                        <input <%= U.getClass().getSimpleName().equals("Admin") && !U.getUserName().equals(request.getAttribute("username")) ? "readonly" : "" %> name="email" class="form-control" type="email" value="<%= U.getemail() %>">
	                      </td>
	                      <td>
	                        <input name="edit-username" class="form-control" value= "<%= U.getUserName() %>" readonly>
	                      </td>
	                      <td><input <%= U.getClass().getSimpleName().equals("Admin") && !U.getUserName().equals(request.getAttribute("username")) ? "readonly" : "" %> name="inst_id" class="form-control" type="text" value="<%= U.getInstituteId() %>"></td>
	                      <td>
	                     	<input name="userType" class="form-control" value= "<%= U.getClass().getSimpleName() %>" readonly>
	                      </td>
	                      <td>
	                        <button class="btn btn-primary" type="submit" name="update" value="<%=i%>" >Update</button>
	                      </td>
	                    </tr>
                      <%i++;}%>
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
    <script type="text/javascript">$('#sampleTable').DataTable();</script>
    <!-- Google analytics script-->
    
  </body>
</html>