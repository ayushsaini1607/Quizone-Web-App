<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.login.util.DBConnection" %>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<% //In case, if User session is not set, redirect to Login page.
if((request.getSession(false).getAttribute("Student")== null) )
{
%>
<jsp:forward page="/JSP/Login.jsp"></jsp:forward>
<%} %>
<!-- Open Graph Meta-->
    <meta property="og:type" content="website">
    <meta property="og:site_name" content="Quizone Dashboard">
    <title>Quizone - Student Dashboard</title>
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
<body class="app sidebar-mini">
    <!-- Navbar-->
    <header class="app-header">
      <a class="app-header__logo" href="<%=request.getContextPath()%>/JSP/Student.jsp">Quizone</a>
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
                    <p class="app-notification__message">Coming Soon!</p>
                    <p class="app-notification__meta">2 min ago</p>
                  </div></a></li>
              <li><a class="app-notification__item" href="javascript:;"><span class="app-notification__icon"><span class="fa-stack fa-lg"><i class="fa fa-circle fa-stack-2x text-danger"></i><i class="fa fa-hdd-o fa-stack-1x fa-inverse"></i></span></span>
                  <div>
                    <p class="app-notification__message">Coming Soon!</p>
                    <p class="app-notification__meta">5 min ago</p>
                  </div></a></li>
              <li><a class="app-notification__item" href="javascript:;"><span class="app-notification__icon"><span class="fa-stack fa-lg"><i class="fa fa-circle fa-stack-2x text-success"></i><i class="fa fa-money fa-stack-1x fa-inverse"></i></span></span>
                  <div>
                    <p class="app-notification__message">Coming Soon!</p>
                    <p class="app-notification__meta">2 days ago</p>
                  </div></a></li>
              <div class="app-notification__content">
                <li><a class="app-notification__item" href="javascript:;"><span class="app-notification__icon"><span class="fa-stack fa-lg"><i class="fa fa-circle fa-stack-2x text-primary"></i><i class="fa fa-envelope fa-stack-1x fa-inverse"></i></span></span>
                    <div>
                      <p class="app-notification__message">Coming Soon!</p>
                      <p class="app-notification__meta">2 min ago</p>
                    </div></a></li>
                <li><a class="app-notification__item" href="javascript:;"><span class="app-notification__icon"><span class="fa-stack fa-lg"><i class="fa fa-circle fa-stack-2x text-danger"></i><i class="fa fa-hdd-o fa-stack-1x fa-inverse"></i></span></span>
                    <div>
                      <p class="app-notification__message">Coming Soon!</p>
                      <p class="app-notification__meta">5 min ago</p>
                    </div></a></li>
                <li><a class="app-notification__item" href="javascript:;"><span class="app-notification__icon"><span class="fa-stack fa-lg"><i class="fa fa-circle fa-stack-2x text-success"></i><i class="fa fa-money fa-stack-1x fa-inverse"></i></span></span>
                    <div>
                      <p class="app-notification__message">Coming Soon!</p>
                      <p class="app-notification__meta">2 days ago</p>
                    </div></a></li>
              </div>
            </div>
            <li class="app-notification__footer"><a href="#">See all notifications.</a></li>
          </ul>
        </li>
        <!-- User Menu-->
        <%
        final String stud = request.getParameter("username");
        session.setAttribute("user", stud);
      	Connection con=null;
  		try {
  			Class.forName("com.mysql.cj.jdbc.Driver");
  			con=DBConnection.createConnection();
  			System.out.println("Post establishing a DB connection - "+con);	
  			PreparedStatement ps = con.prepareStatement("select * from users where username='"+session.getAttribute("user")+"'");
  			ResultSet r = ps.executeQuery();
  			while(r.next()){
  				String User = r.getString("username");
  				session.setAttribute("users", User);
  				String Email = r.getString("email");
  				session.setAttribute("email", Email);
  				String Fname = r.getString("fname");
  				session.setAttribute("fname", Fname);
  				String Lname = r.getString("lname");
  				session.setAttribute("lname", Lname);
  				System.out.println("First Name : "+Fname);
  				System.out.println("Last Name : "+Lname);
  				System.out.println("Email : "+Email);
  			}
  			ps.close();
  			r.close();
  			
  			PreparedStatement p = con.prepareStatement("select * from username_to_inst_id where username='"+session.getAttribute("user")+"'");
  			ResultSet rr = p.executeQuery();
  			while(rr.next()){
  				String studs = rr.getString("username");
  				session.setAttribute("stud", studs);
  				String Id = rr.getString("institute_id");
  				session.setAttribute("inst_id", Id);
  				System.out.println("Institute Id : "+Id);
  			}
  			rr.close();
  		    p.close();
  		} catch(ClassNotFoundException E){
  			E.printStackTrace();
  		}
  		
      %>
        <li class="dropdown"><a class="app-nav__item" href="#" data-toggle="dropdown" aria-label="Open Profile Menu"><i class="fa fa-user fa-lg"></i></a>
          <ul class="dropdown-menu settings-menu dropdown-menu-right">
            <li><a class="dropdown-item" href="<%=request.getContextPath()%>/JSP/StudentProfile.jsp"><i class="fa fa-user fa-lg"></i> Profile</a></li>
            <li><a class="dropdown-item" href="<%=request.getContextPath()%>/logout"><i class="fa fa-sign-out fa-lg"></i> Logout</a></li>
          </ul>
        </li>
      </ul>
    </header>
    <!-- Sidebar menu-->
    <div class="app-sidebar__overlay" data-toggle="sidebar"></div>
    <aside class="app-sidebar">
      <div class="app-sidebar__user"><img class="app-sidebar__user-avatar" src="<%=request.getContextPath() %>/images/logo.png" width="50" alt="User Image">
        <div>
          <p class="app-sidebar__user-name"><%= session.getAttribute("Student") %></p>
          <p class="app-sidebar__user-designation">Student</p>
        </div>
      </div>
      <ul class="app-menu">
        <li class="treeview"><a class="app-menu__item active" href="#" data-toggle="treeview"><i class="app-menu__icon fa fa-dashboard"></i><span class="app-menu__label">Dashboard</span><i class="treeview-indicator fa fa-angle-right"></i></a>
          <ul class="treeview-menu">
            <li><a class="treeview-item" href="<%=request.getContextPath()%>/JSP/Student.jsp"><i class="icon fa fa-circle-o"></i> Home</a></li>
            <li><a class="treeview-item" href="<%=request.getContextPath()%>/JSP/Give-Test.jsp" target="_blank" rel="noopener"><i class="icon fa fa-circle-o"></i> Give Test</a></li>
            <li><a class="treeview-item" href="<%=request.getContextPath()%>/JSP/TestHistory.jsp"><i class="icon fa fa-circle-o"></i> Test History</a></li>
          </ul>
        </li>
        <li><a class="app-menu__item" href="<%=request.getContextPath()%>/JSP/StudentProfile.jsp"><i class="app-menu__icon fa fa-user fa-lg"></i><span class="app-menu__label">Profile</span></a></li>
        <li><a class="app-menu__item" href="<%=request.getContextPath()%>/logout"><i class="app-menu__icon fa fa-sign-out fa-lg"></i><span class="app-menu__label">Logout</span></a></li>
      </ul>
    </aside>
    <main class="app-content">
      <div class="app-title">
        <div>
          <h1><i class="fa fa-dashboard"></i> Student Dashboard</h1>
          <p>Welcome, Here's what we got for you.</p>
        </div>
        <ul class="app-breadcrumb breadcrumb">
          <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
          <li class="breadcrumb-item"><a href="#">Dashboard</a></li>
        </ul>
      </div>
      
  <%
      
			        int testAttempt = 0;
        		    float sumScore = 0;
        		    float sumMax = 0;
        		    double avg = 0;
        		    String avge = null;
        		    //String curr_username = (String)request.getAttribute("username");
        		    //System.out.println(curr_username);
        		    
			        con=null;
					Statement statement=null;
					ResultSet resultSet = null;
			       
					
					try{
				  		con = DBConnection.createConnection();
				  		statement = con.createStatement(); 
				  		resultSet = statement.executeQuery("select count(participants) as noOfParticipants from result where participants='" + session.getAttribute("Student") + "'");
				  		if(resultSet.next())
				  			testAttempt = resultSet.getInt("noOfParticipants");
				  		resultSet = statement.executeQuery("select sum(score) as totalScore, sum(totalMarks) as totalMax from result where participants='" + session.getAttribute("Student") + "'");
				  		if(resultSet.next())
				  			{
				  			  sumScore = resultSet.getFloat("totalScore");
				  			  System.out.println(sumScore);
				  			  sumMax = resultSet.getFloat("totalMax");
				  			  System.out.println(sumMax);
				  			}
				  		avg = (sumScore/sumMax)*100;
				  		if (avg >= 0.00001) {
				  			avg = (sumScore/sumMax)*100;
				  			avge = String.format("%.2f", avg);
				  		}
				  		else {
				  			avg = 0;
				  			avge = "0";
				  		}
				
				  		resultSet.close();
			  	  		statement.close();
			  	  		con.close(); 
			  		} catch(SQLException E)
			  			{
			  				//userCount="0";
			  				//teacherCount="0";
			  				E.printStackTrace();
			  				
			  			}   
				%>
     
      <div class="row">
        <div class="col-md-6">
          <div class="widget-small primary coloured-icon"><i class="icon fa fa-file-text fa-3x"></i>
            <div class="info">
              <h4>Test Attempted</h4>
              <p><b><%= testAttempt %></b></p>
            </div>
          </div>
        </div>
        <div class="col-md-6">
          <div class="widget-small info coloured-icon"><i class="icon fa fa-bar-chart fa-3x"></i>
            <div class="info">
              <h4>Average Score</h4>
              <p><b><%=avge%>/100</b></p>
            </div>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-md-6">
          <a href="<%=request.getContextPath()%>/JSP/Give-Test.jsp" target="_blank" rel="noopener"><button type="button" class="btn btn-lg btn-outline-success col-md-12">Give Test</button></a><br><br><br>
        </div>
        <div class="col-md-6">
          <a href="<%=request.getContextPath()%>/JSP/TestHistory.jsp"><button type="button" class="btn btn-lg btn-outline-success col-md-12">Test History</button></a><br><br><br>  
        </div>
      </div>
      
    </main>
    <!-- Essential javascripts for application to work-->
    <script src="<%=request.getContextPath()%>/js/jquery-3.3.1.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/popper.min.js"></script><!-- Notification ka dropdown -->
    <script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/main.js"></script><!-- Dashboard ka dropdown -->
  </body>
</html>