<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Open Graph Meta-->
    <meta property="og:type" content="website">
    <meta property="og:site_name" content="Quizone Account">
    <title>Quizone - Add Account</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Main CSS-->
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/main.css">
    <!-- Font-icon css-->
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="icon" href="<%=request.getContextPath()%>/images/favicon.png" type="image/png">
  </head>
 <%
  if((request.getSession(false).getAttribute("Admin")== null) )
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
      <div class="user-box">
        <form class="login-form " action="<%=request.getContextPath()%>/create-user" method="post">
          <h3 class="login-head"><i class="fa fa-lg fa fa-users"></i> Create Account</h3>
          <div class="form-group">
            <label class="control-label">First Name</label>
            <input class="form-control" type="text" placeholder="Enter First Name" name="fname" autofocus required>
          </div>
          <div class="form-group">
            <label class="control-label">Last Name</label>
            <input class="form-control" type="text" placeholder="Enter Last Name" name="lname" autofocus required>
          </div>
          <div class="form-group">
            <label class="control-label">Email</label>
            <input class="form-control" type="email" placeholder="Enter Email" name="email" autofocus required>
          </div>
          <div class="form-group">
            <label class="control-label">Institute ID</label>
            <input class="form-control" type="text" placeholder="Enter Institute ID" name="inst_id" autofocus required>
          </div>
          <div class="form-group">
            <div class="utility">
              <div class="animated-radio-button">
                <div><label class="control-label">User Type :- </label></div>
                <label for="student">
                  <input type="radio" value="student" id="student" name="user" required><span class="label-text"> Student  </span>
                </label>
                <label for="faculty">
                  <input type="radio"  value="teacher" id="faculty" name="user"><span class="label-text"> Faculty </span>
                </label>
                <label for="admin">
                  <input type="radio" value="admin" id="admin" name="user"><span class="label-text"> Admin </span>
                </label>
              </div>
            </div>
           </div>
          <div class="form-group btn-container" >
            <button class="btn btn-primary btn-block" type="submit"><i class="fa fa-chevron-circle-right fa-lg fa-fw" ></i>SUBMIT</button>
          </div>
           <div style="color:green"><%=request.getAttribute("UserAdd")!=null ? request.getAttribute("UserAdd") : "" %></div>
           <div style="color:red"><%=request.getAttribute("errMsg")!=null ? request.getAttribute("errMsg") : "" %></div>
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