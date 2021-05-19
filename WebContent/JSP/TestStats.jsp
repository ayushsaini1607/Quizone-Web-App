<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <meta charset="ISO-8859-1">
    <meta property="og:type" content="website">
    <meta property="og:site_name" content="Quiz Stats">
    <title>Faculty - Stats</title>
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
        <%
        //String one = request.getAttribute("user");
        System.out.println("profile name : "+ session.getAttribute("user"));
        %>
          <p class="app-sidebar__user-name"><%=session.getAttribute("Tea") %></p>
          <p class="app-sidebar__user-designation">Faculty</p>
        </div>
      </div>
      <ul class="app-menu">
        <li class="treeview"><a class="app-menu__item active" href="#" data-toggle="treeview"><i class="app-menu__icon fa fa-dashboard"></i><span class="app-menu__label">Dashboard</span><i class="treeview-indicator fa fa-angle-right"></i></a>
          <ul class="treeview-menu">
            <li><a class="treeview-item" href="<%=request.getContextPath()%>/teacher-dashboard"><i class="icon fa fa-circle-o"></i> Home</a></li>
            <li><a class="treeview-item" href="<%=request.getContextPath()%>/JSP/create-test.jsp" target="_blank" rel="noopener"><i class="icon fa fa-circle-o"></i> Create Quiz</a></li>
            <li><a class="treeview-item" href="<%=request.getContextPath()%>/JSP/EditQuiz.jsp"><i class="icon fa fa-circle-o"></i> Edit Quiz</a></li>
            <li><a class="treeview-item" href="#"><i class="icon fa fa-circle-o"></i> Quiz Stats</a></li>
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
          <h1><i class="icon fa fa-bar-chart"></i> Stats</h1>
          <p>Welcome, Here are some interesting stats.</p>
        </div>
        <ul class="app-breadcrumb breadcrumb">
          <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
          <li class="breadcrumb-item"><a href="#">Stats</a></li>
        </ul>
      </div>
      <div class="row">
        <div class="col-md-12">
          <div class="tile">
            <div class="tile-body">
            <div class="table-responsive">
            <table class="table table-hover table-bordered" id="sampleTable">
            <h3 class="tile-title">Quiz List</h3>
              <thead>
                <tr>
                  <th>#</th>
                  <th>Quiz Title</th>
                  <th>Quiz Code</th>
                  <th>Date (yyyy-mm-dd)</th>
                  <th>Participants</th>
                  <th>Average Score (10)</th>
                </tr>
              </thead>
              <tbody>
              <%@page import="java.sql.*" %>
      <%
      int count = 1;
      Connection con=null;
  	String url = "jdbc:mysql://localhost:3306/testproject";
  	String username ="root";
  	String password="Ayush@123";
  		try {
  			Class.forName("com.mysql.cj.jdbc.Driver");
  			con=DriverManager.getConnection(url, username, password);
  			System.out.println("Post establishing a DB connection - "+con);	
  			PreparedStatement ps = con.prepareStatement("select * from quiz_to_username where username='"+session.getAttribute("Tea")+"'");
  			ResultSet r = ps.executeQuery();
  			while(r.next()){
  				PreparedStatement pss = con.prepareStatement("select title,date from create_quiz where code='"+r.getString("quiz_id")+"'");
  	  			ResultSet rr = pss.executeQuery();
  	  			while(rr.next()){
  	  			    PreparedStatement pps = con.prepareStatement("select count(participants), avg(score), avg(totalMarks) from result where quizCode='"+r.getString("quiz_id")+"'");
  	  			    ResultSet rrr = pps.executeQuery();
  	  			    while(rrr.next()){
  	  			        session.setAttribute("count", count);
  	  			        float avg_score=0,avg_total = 1;
  	  			        if(rrr.getString("avg(score)") != null && rrr.getString("avg(totalMarks)") != null){
  	  			            avg_score = Float.parseFloat(rrr.getString("avg(score)"));
  	  			            avg_total = Float.parseFloat(rrr.getString("avg(totalMarks)"));
  	  			            avg_score = avg_score/avg_total;
  	  			            avg_score = avg_score * 10;
  	  			        }
  		%>
  				<tr>
                  <td><%=session.getAttribute("count") %></td>
                  <td><%=rr.getString("title") %></td>
                  <td><%=r.getString("quiz_id") %></td>
                  <td><%=rr.getString("date") %></td>
                  <td><%=rrr.getString("count(participants)") %></td>
                  <td><%=avg_score%></td>
                </tr>
  		<% 
  	  			    }
  	  			}
  		         count++;
  			}
  			con.close();
  		} catch(ClassNotFoundException E){
  			E.printStackTrace();
  		}
  		
      %>
              </tbody>
            </table>
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
</body>
</html>