<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Open Graph Meta-->
    <meta property="og:type" content="website">
    <meta property="og:site_name" content="Quizone Test">
    <title>Quizone - Test</title>
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
  <body>
    <section class="material-half-bg">
      <div class="cover"></div>
    </section>
    <section class="login-content">
      <div class="logo">
         <a href="<%=request.getContextPath()%>/teacher-dashboard"><h1 style="color:white">Quizone</h1></a>  
      </div>
      <div class="test-box">
        <form class="login-form " method="post" action="<%= request.getContextPath() %>/CreateTest">
          <h3 class="login-head"><i class="fa fa-lg fa fa-file-text"></i> Create Test</h3>
          <div class="form-group">
            <label class="control-label">TEST TITLE</label>
            <input class="form-control" type="text" placeholder="Enter Test Title" autofocus required name="testTitle">
          </div>
          <!--  <div class="form-group">
            <label class="control-label">Total Questions</label>
            <input class="form-control" type="text" placeholder="Enter Total Number of Questions" autofocus>
          </div>
          <div class="form-group">
            <label class="control-label">Total Marks</label>
            <input class="form-control" type="text" placeholder="Enter Total Marks" autofocus>
          </div>  
          <div class="form-group btn-container" >
            <button class="btn btn-primary btn-block" data-toggle="flip"><i class="fa fa-chevron-circle-right fa-lg fa-fw" ></i>NEXT</button>
          </div>
        </form>
        <form class="forget-form" action="questions.html"> -->
          <div class="form-group">
            <label class="control-label">Test Start time</label>
            <input id="startTime" class="form-control" type="time" placeholder="Enter Test start time" onchange="Compare()" required name="startTime">
            <div style="color:red"><%=(request.getAttribute("errSt") == null) ? "" : request.getAttribute("errSt")%></div>
          </div>
          <div class="form-group">
            <label class="control-label">Test End time</label>
            <input id="endTime" class="form-control" type="time" placeholder="Enter Test end time" onchange="Compare()" required name="endTime">
            <div style="color:red"><%=(request.getAttribute("errTime") == null) ? "" : request.getAttribute("errTime")%></div>
          </div>
          <div class="form-group">   
            <label class="control-label">Test Date</label>
            <input class="form-control" type="date" name="testDate" required>
            <div style="color:red"><%=(request.getAttribute("errDate") == null) ? "" : request.getAttribute("errDate")%></div>
          </div>
          <div class="form-group btn-container" >
            <a href="questions.html"><button class="btn btn-primary btn-block" type="submit"><i class="fa fa-chevron-circle-right fa-lg fa-fw" ></i>CONTINUE</button></a>
            <div style="color:green"><%=(request.getAttribute("quizCreMessage") == null	) ? "" : request.getAttribute("quizCreMessage")%></div>
          </div>
          <div class="form-group mt-3">
            <p class="semibold-text mb-0"><a href="<%=request.getContextPath()%>/teacher-dashboard"><i class="fa fa-angle-left fa-fw"></i> Home</a></p>
          </div>
        </form>
      </div>
    </section>
    
    <!-- Essential javascripts for application to work-->
    <script src="<%=request.getContextPath()%>/js/jquery-3.3.1.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/popper.min.js"></script><!-- Notification ka dropdown -->
    <script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/main.js"></script><!-- Dashboard ka dropdown -->
    
    
  <!--    <script type="text/javascript">
      // Mre Details Page Flipbox control
      $('.login-content [data-toggle="flip"]').click(function() {
        $('.login-box').toggleClass('flipped');
        return false;
      });
    </script>
   <script type="text/javascript">
    function Compare() {
        var strStartTime = document.getElementById("startTime").value;
        var strEndTime = document.getElementById("endTime").value;

        var startTime = new Date().setHours(GetHours(strStartTime), GetMinutes(strStartTime), 0);
        var endTime = new Date(startTime)
        endTime = endTime.setHours(GetHours(strEndTime), GetMinutes(strEndTime), 0);
        if (startTime > endTime) {
            alert("Start Time is greater than end time");
        }
        if (startTime == endTime) {
            alert("Start Time equals end time");
        }
        if (startTime < endTime) {
            alert("Start Time is less than end time");
        }
    }
    function GetHours(d) {
        var h = parseInt(d.split(':')[0]);
        if (d.split(':')[1].split(' ')[1] == "PM") {
            h = h + 12;
        }
        return h;
    }
    function GetMinutes(d) {
        return parseInt(d.split(':')[1].split(' ')[0]);
    }
    </script> -->
  </body>
</html>