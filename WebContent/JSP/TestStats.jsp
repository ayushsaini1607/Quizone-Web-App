<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <meta charset="ISO-8859-1">
    <meta property="og:type" content="website">
    <meta property="og:site_name" content="Student Profile">
    <title>Faculty - Profile</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Main CSS-->
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/main.css">
    <!-- Font-icon css-->
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
<header class="app-header">
      <a class="app-header__logo" href="index.html">Quizone</a>
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
      <div class="app-sidebar__user"><img class="app-sidebar__user-avatar" src="images/logo.png" width="50" alt="User Image">
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
            <li><a class="treeview-item" href="<%=request.getContextPath()%>/JSP/create-test.jsp"><i class="icon fa fa-circle-o"></i> Create Test</a></li>
            <li><a class="treeview-item" href="#"><i class="icon fa fa-circle-o"></i> Test Stats</a></li>
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
  			PreparedStatement ps = con.prepareStatement("select * from "+session.getAttribute("Tea")+"");
  			ResultSet r = ps.executeQuery();
  			while(r.next()){
  				session.setAttribute("count", count);
  		%>
  				<tr>
                  <td><%=session.getAttribute("count") %></td>
                  <td><%=r.getString("title") %></td>
                  <td><%=r.getString("quiz_code") %></td>
                  <td><%=r.getString("date") %></td>
                  <td><%=r.getString("participants") %></td>
                  <td><%=r.getString("avg_score") %></td>
                </tr>
  		<% 
  		         count++;
  			}
  			con.close();
  		} catch(ClassNotFoundException E){
  			E.printStackTrace();
  		}
  		
      %>
             <!--  <tr>
                  <td>1</td>
                  <td>DS - Unit 1</td>
                  <td>741258</td>
                  <td>03/03/2021</td>
                  <td>63</td>
                  <td>8.25</td>
                </tr>
                <tr>
                  <td>2</td>
                  <td>DS - Unit 2</td>
                  <td>963248</td>
                  <td>22/03/2021</td>
                  <td>65</td>
                  <td>9.2</td>
                </tr>
                <tr>
                  <td>3</td>
                  <td>DS - Unit 3</td>
                  <td>246851</td>
                  <td>17/04/2021</td>
                  <td>61</td>
                  <td>8.66</td>
                </tr>
                <tr>
                  <td>4</td>
                  <td>FDS - Unit 1</td>
                  <td>658492</td>
                  <td>7/03/2021</td>
                  <td>63</td>
                  <td>9.2</td>
                </tr>
                <tr>
                  <td>5</td>
                  <td>FDS - Unit 2</td>
                  <td>842862</td>
                  <td>15/03/2021</td>
                  <td>58</td>
                  <td>7.9</td>
                </tr>
                <tr>
                  <td>6</td>
                  <td>DS - Unit 3</td>
                  <td>753951</td>
                  <td>07/04/2021</td>
                  <td>67</td>
                  <td>9</td>
                </tr>
                <tr>
                  <td>7</td>
                  <td>FDS - Unit 4</td>
                  <td>153759</td>
                  <td>10/04/2021</td>
                  <td>65</td>
                  <td>8.8</td>
                </tr> -->
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