<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta property="og:type" content="website">
    <meta property="og:site_name" content="Faculty Dashboard">
    <title>Quizone - Faculty Dashboard</title>
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
<!-- Navbar-->
    <header class="app-header">
      <a class="app-header__logo" href="#">Quizone</a>
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
        <%
        final String teach = request.getParameter("username");
        
        session.setAttribute("user", teach);
        %>
        <%@page import="java.sql.*" %>
      <%
      Connection con=null;
  	String url = "jdbc:mysql://localhost:3306/testproject";
  	String username ="root";
  	String password="Ayush@123";
  		try {
  			Class.forName("com.mysql.cj.jdbc.Driver");
  			con=DriverManager.getConnection(url, username, password);
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
  				String Tea = rr.getString("username");
  				session.setAttribute("Tea", Tea);
  				String Id = rr.getString("institute_id");
  				session.setAttribute("inst_id", Id);
  				System.out.println("Institute Id : "+Id);
  			}
  			rr.close();
  		    p.close();
  			
  			PreparedStatement ps2 = con.prepareStatement("select count(*) AS 'total-quiz' from quiz_to_username where username='"+session.getAttribute("Tea")+"'");
  			ResultSet rs2 = ps2.executeQuery();
  			int ap = 0;
  			while(rs2.next()){
  				String Tt = rs2.getString("total-quiz");
  				session.setAttribute("Tt", Tt);
  				System.out.println("Total Quiz : "+Tt);
  			}
  			rs2.close();
  		    ps2.close();
  		    
  		    PreparedStatement ps3 = con.prepareStatement("select quiz_id from quiz_to_username where username='"+session.getAttribute("Tea")+"'");
			ResultSet rs3 = ps3.executeQuery();
			while(rs3.next()){
				PreparedStatement ps4 = con.prepareStatement("select count(participants) from result where quizCode="+rs3.getString("quiz_id")+"");
				ResultSet rs4 = ps4.executeQuery();
				while(rs4.next()){
					int participant = Integer.parseInt(rs4.getString("count(participants)"));
					ap = ap + participant;
				}
				rs4.close();
			    ps4.close();
				
			}
			session.setAttribute("ap", ap);
			System.out.println("Total Participants : "+ap);
			rs3.close();
		    ps3.close();
  			con.close();
  		} catch(ClassNotFoundException E){
  			E.printStackTrace();
  		}
  		
      %>
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
      <div class="app-sidebar__user"><img class="app-sidebar__user-avatar" src="images/logo.png" width="50" alt="User Image">
        <div>
          <p class="app-sidebar__user-name"><%=session.getAttribute("Tea") %></p>
          <p class="app-sidebar__user-designation">Faculty</p>
        </div>
      </div>
      <ul class="app-menu">
        <li class="treeview"><a class="app-menu__item active" href="#" data-toggle="treeview"><i class="app-menu__icon fa fa-dashboard"></i><span class="app-menu__label">Dashboard</span><i class="treeview-indicator fa fa-angle-right"></i></a>
          <ul class="treeview-menu">
            <li><a class="treeview-item" href="#"><i class="icon fa fa-circle-o"></i> Home</a></li>
            <li><a class="treeview-item" href="<%=request.getContextPath()%>/JSP/create-test.jsp" target="_blank" rel="noopener"><i class="icon fa fa-circle-o"></i> Create Quiz</a></li>
            <li><a class="treeview-item" href="JSP/EditQuiz.jsp"><i class="icon fa fa-circle-o"></i> Edit Quiz</a></li>
            <li><a class="treeview-item" href="JSP/TestStats.jsp"><i class="icon fa fa-circle-o"></i> Quiz Stats</a></li>
            <li><a class="treeview-item" href="JSP/QuizResult.jsp"><i class="icon fa fa-circle-o"></i> Quiz Result</a></li>
          </ul>
        </li>
        <li><a class="app-menu__item" href="<%=request.getContextPath()%>/JSP/TeacherProfile.jsp"><i class="app-menu__icon fa fa-user fa-lg"></i><span class="app-menu__label">Profile</span></a></li>
        
        <li><a class="app-menu__item" href="<%=request.getContextPath()%>/logout"><i class="app-menu__icon fa fa-sign-out fa-lg"></i><span class="app-menu__label">Logout</span></a></li>
      </ul>
    </aside>
    <main class="app-content">
      <div class="app-title">
        <div>
          <h1><i class="fa fa-dashboard"></i> Faculty Dashboard</h1>
          <p>Welcome, Here's what we got for you.</p>
        </div>
        <ul class="app-breadcrumb breadcrumb">
          <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
          <li class="breadcrumb-item"><a href="#">Dashboard</a></li>
        </ul>
      </div>
      <div class="row">
        <div class="col-md-6">
          <div class="widget-small primary coloured-icon"><i class="icon fa fa-file-text fa-3x"></i>
            <div class="info">
              <h4>Quiz Created</h4>
              <p><b><%=session.getAttribute("Tt")%></b></p>
            </div>
          </div>
        </div>
        <div class="col-md-6">
          <div class="widget-small info coloured-icon"><i class="icon fa fa-bar-chart fa-3x"></i>
            <div class="info">
              <h4>Total Participants</h4>
              <p><b><%=session.getAttribute("ap")%></b></p>
            </div>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-md-6">
          <a href="<%=request.getContextPath()%>/JSP/create-test.jsp" target="_blank" rel="noopener"><button type="button" class="btn btn-lg btn-outline-success col-md-12">Create Quiz</button></a><br><br><br>
        </div>
        <div class="col-md-6">
          <a href="<%=request.getContextPath()%>/JSP/TestStats.jsp"><button type="button" class="btn btn-lg btn-outline-success col-md-12">Quiz Stats</button></a><br><br><br>  
        </div>
      </div>
      <div class="row">
        <div class="col-md-6">
          <a href="<%=request.getContextPath()%>/JSP/EditQuiz.jsp"><button type="button" class="btn btn-lg btn-outline-success col-md-12">Edit Quiz</button></a><br><br><br>
        </div>
        <div class="col-md-6">
          <a href="<%=request.getContextPath()%>/JSP/QuizResult.jsp"><button type="button" class="btn btn-lg btn-outline-success col-md-12">Quiz Result</button></a><br><br><br>  
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