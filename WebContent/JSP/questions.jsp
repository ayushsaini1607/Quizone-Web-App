<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <meta property="og:type" content="website">
    <meta property="og:site_name" content="Create Quiz">
    <title>Quizone - Create Quiz</title>
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

	    <div class="logo">
	          <a href="<%=request.getContextPath()%>/teacher-dashboard"><h1 style="color:white">Quizone</h1></a>   
	      </div>
    <div class="row">
        <div class="col-md-12">
          <div class="tile">
            <h3 class="tile-title">Questions</h3>
            <div class="tile-body">
              <form  method="post" action="<%= request.getContextPath() %>/CreateQuiz">
                <div class="form-group">
                  <label class="control-label">Question</label>
                  <textarea class="form-control" rows="4" placeholder="Enter your Question" name="question" required></textarea>
                </div>
                <div class="form-group">
                  <label class="control-label">Option A</label>
                  <input class="form-control" type="text" placeholder="Enter Option A" name="option1" required>
                </div>
                <div class="form-group">
                  <label class="control-label">Option B</label>
                  <input class="form-control" type="text" placeholder="Enter Option B" name="option2" required>
                </div>
                <div class="form-group">
                  <label class="control-label">Option C</label>
                  <input class="form-control" type="text" placeholder="Enter Option C" name="option3" required>
                </div>
                <div class="form-group">
                  <label class="control-label">Option D</label>
                  <input class="form-control" type="text" placeholder="Enter Option D" name="option4" required>
                </div>
                <div class="form-group">
                  <label class="control-label">Correct Option</label>
                  <div class="utility">
                  <div class="animated-radio-button">
                    <label class="form-group btn-container">
                      <input type="radio" id="A" value="1" name="correct" required><span class="label-text"> A  </span>
                    </label>
                    <label class="form-group btn-container">
                      <input type="radio" id="B" value="2" name="correct"><span class="label-text"> B </span>
                    </label>
                    <label class="form-group btn-container">
                      <input type="radio" id="C" value="3" name="correct"><span class="label-text"> C </span>
                    </label>
                    <label class="form-group btn-container">
                      <input type="radio" id="D" value="4" name="correct"><span class="label-text"> D </span>
                    </label>
                  </div>
                  </div>
                </div>
                <div class="form-group">
                  <label class="control-label">Marks</label>
                  <input class="form-control" type="number" placeholder="Enter Marks for this question" name="marks" required>
                </div>
                <div class="tile-footer">
                  <button class="btn btn-primary" type="submit" name="next"><i class="fa fa-fw fa-lg fa-check-circle"></i>NEXT</button>&nbsp;&nbsp;&nbsp;<button class="btn btn-primary" type="submit" name="create"><i class="fa fa-fw fa-lg fa-check-circle"></i>CREATE</button>
                </div>
              </form>
            </div>
          </div>
           <!--  <a href="<%=request.getContextPath()%>/teacher-dashboard"><button class="btn btn-primary"><i class="fa fa-fw fa-lg fa-check-circle"></i>HOME</button>&nbsp;&nbsp;&nbsp;</a> -->
        </div>
      </div>
    <!-- Essential javascripts for application to work-->
    <script src="<%=request.getContextPath()%>/js/jquery-3.3.1.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/popper.min.js"></script><!-- Notification ka dropdown -->
    <script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/main.js"></script><!-- Dashboard ka dropdown -->
    <script type="text/javascript">
        function preventBack() {
            window.history.forward(); 
        }
          
        setTimeout("preventBack()", 0);
          
        window.onunload = function () { null };
    </script>
  </body>
</html>