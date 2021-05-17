<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Open Graph Meta-->
    <meta property="og:type" content="website">
    <meta property="og:site_name" content="Quizone Home">
    <title>Quizone - Home</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Main CSS-->
    <link rel="stylesheet" type="text/css" href="css/main.css">
    <!-- Font-icon css-->
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="icon" href="<%=request.getContextPath()%>/images/favicon.png" type="image/png">
  </head>
  <body bgcolor="#fff">
    <!-- <header class="app-header">
      <a class="app-header__logo" href="index.html">Quizone</a> -->
      <!-- Sidebar toggle button-->

      <!-- Navbar Right Menu-->
      <!-- <ul class="app-nav">
        <a href="login.html"><button type="button" class="btn btn-lg btn-outline-succ col-md-12">SIGN IN</button></a>
      </ul>
    </header> -->
    <!-- <section id="header">
      <div class="jumbotron text-center">
        <h1 class="display-4 ">Welcome to QUIZONE</h1>
        <p class="app-notification__message">‘Quizone’ is a web-application that provides conducting authoritiesto the aspirants/subjects (henceforth referred as stakeholders, unless specified otherwise) of educational institutions/companies in a smooth conduction of the online assessments in protected, interactive manner with a user-friendly interface.</p>
        <hr/>
        <button type="button" class="btn btn-lg btn-outline-success">Contact Us</button><br><br>
        
      </div>
    </section> -->
    <section class="landing-hero" id="top">
      <div class="landing-hero-overlay"></div>
      <div class="landing-hero-content">
        <h1 class="landing-hero-title">Welcome to QUIZONE</h1>
        <p class="landing-hero-description">Quizone is a web-based solution that helps authorities and the aspirants of educational institutions/companies in a smooth conduction of the online assessments in protected, interactive manner with a user-friendly interface.</p>
        <div><a class="btn btn-pri" href="JSP/Login.jsp" target="_blank" rel="noopener">SIGN IN</a></div><!-- <img class="landing-hero-banner" src="images/logo.png"> -->
      </div>
    </section>
    
  <!--
    <section class="features" id="contact">
      
      <div class="container">
        <div class="container about-me">
          <div class="card-header">
            <h1 class="features-title" id="about">Contact Us</h1>
          </div>
          <div class="card-body"><center>
            <p class="feature-description">Online Quiz</p></center>
          </div>
        </div>
        <div class="row">
            <div class="col-md-6 col-sm-12">
              <div class="form-group" >  
                <img  width="300" src="images/logo.png" alt="Logo"/> 
              </div>
            </div> 
            <!-- <div id="carouselExampleFade" class="carousel slide carousel-fade" data-ride="carousel">
            <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="images\images.png" class="d-block w-100" alt="...">
                <div class="carousel-caption d-none d-md-block">
                <h3>Far Cry</h3>
                <p>Play Far Cry now</p>
               </div>
            </div>
           <div class="carousel-item">
                <img src="images\home.jpg" class="d-block w-100" alt="...">
                <div class="carousel-caption d-none d-md-block">
                <h3>Pubg Mobile</h3>
                <p>Play Pubg Mobile now</p>
                </div>
            </div>
            <div class="carousel-item">
                <img src="images\depositphotos_229444070-stock-illustration-online-test-concept-quiz-on.jpg" class="d-block w-100" alt="...">
                <div class="carousel-caption d-none d-md-block">
                    <h3>Call Of Duty</h3>
                    <p>Play Call Of Duty now</p>
                </div>
            </div>
            </div>
                <a class="carousel-control-prev" href="#carouselExampleFade" role="button" data-slide="prev">
                   <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                   <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleFade" role="button" data-slide="next">
                   <span class="carousel-control-next-icon" aria-hidden="true"></span>
                   <span class="sr-only">Next</span>
                </a>
            </div> 
         
            <div class=" login-box col-md-6 col-sm-12 skills-column">
                <form class="login-form" action="stu-dashboard.html">
                    <div class="form-group">
                        <label class="control-label">Email</label>
                        <input class="form-control" type="text" placeholder="Email">
                    </div>
                    <div class="form-group">
                        <label class="control-label">Message</label>
                        <textarea class="form-control" rows="4" placeholder="Enter your address"></textarea>
                    </div>
                    <div class="form-group btn-container">
                        <button class="btn btn-primary btn-block"><i class="fa fa-sign-in fa-lg fa-fw"></i>SEND</button>
                    </div>
                </form>
            </div>
          </div>
        </div> 

    </section>  -->
    <!--/.page-section-->

    <footer class="landing-footer">
        <div class="container">
            <div class="row">
                <div class="col-sm-12 text-center"> Copyright 2021 | All Rights Reserved -- Design by teeno Ayush </div>
            </div> 
        </div>
        <a href="#top" class="topHome"><i class="fa fa-chevron-up fa-2x"></i></a>
    </footer>
 
    <!-- Essential javascripts for application to work-->
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/popper.min.js"></script><!-- Notification ka dropdown -->
    <script src="js/bootstrap.min.js"></script>
    <script src="js/main.js"></script><!-- Dashboard ka dropdown -->
  </body>
</html>