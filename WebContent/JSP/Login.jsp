<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
    <head>
    <!-- Open Graph Meta-->
    <meta property="og:type" content="website">
    <meta property="og:site_name" content="Quizone Login">
    <title>Quizone - Login</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Main CSS-->
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/main.css">
    <!-- Font-icon css-->
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="icon" href="<%=request.getContextPath()%>/images/favicon.png" type="image/png">
   </head>
    <body>
        <section class="material-half-bg">
	      <div class="cover"></div>
	    </section>
	    <section class="login-content">
	      <div class="logo">
	        <h1>Quizone</h1> 
	      </div>
	      <div class="login-box">
        <form class="login-form" name="login-form" action="<%=request.getContextPath()%>/login" method="post">
 			<h3 class="login-head"><i class="fa fa-lg fa-fw fa-user"></i>SIGN IN</h3>
          <div class="form-group">
            <label class="control-label">USERNAME</label>
            <input class="form-control" type="text" placeholder="Username" name="username" autofocus required>
          </div>
          <div class="form-group">
            <label class="control-label">PASSWORD</label>
            <input class="form-control" type="password" placeholder="Password" name="password" required>
          </div>          
          <div class="form-group btn-container">
            <button class="btn btn-primary btn-block" type="submit"><i class="fa fa-sign-in fa-lg fa-fw"></i>SIGN IN</button>
          </div>
          <div style="color:red"><%=(request.getAttribute("Message") == null) ? "" : request.getAttribute("Message")%></div>
        </form>
    </section>
    <!-- Essential javascripts for application to work-->
    <script src="../js/jquery-3.3.1.min.js"></script>
    <script src="../js/popper.min.js"></script><!-- Notification ka dropdown -->
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/main.js"></script><!-- Dashboard ka dropdown -->
    <script type="text/javascript">
      // Login Page Flipbox control
      $('.login-content [data-toggle="flip"]').click(function() {
        $('.login-box').toggleClass('flipped');
        return false;
      });
    </script>
        <!-- <table align="center">
        <tr>
        <td>Username</td>
        <td><input type="text" name="username" required/></td>
        </tr>
        <tr>
        <td>Password</td>
        <td><input type="password" name="password" required/></td>
        </tr>
        <tr>
        <td><span style="color:red"><%=(request.getAttribute("errMessage") == null) ? "" : request.getAttribute("errMessage")%></span></td>
        </tr>
        <tr>
        <td></td>
        <td><input type="submit" value="Login"></input><input type="reset" value="Reset"></input></td>
        </tr>
        </table> -->
    </body>
</html>