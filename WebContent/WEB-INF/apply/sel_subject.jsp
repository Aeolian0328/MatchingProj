<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Blog Post - Start Bootstrap Template</title>
  
 <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script>
$(document).ready(function(){
// 	a=document.getElementById('end').innerHTML;
// 	edDate = document.getElementById('end').innerHTML;

	  tid=setInterval('msg_time()',1000); // 타이머 1초간격으로 수행
	});

// edDate = new Date(a).getTime()

// var a = document.getElementById('end').innerHTML;

function msg_time() {

	var a = $('#end').text();
	var edDate = new Date(a).getTime();
// 	var edDate = new Date('2020-04-03 24:00:00').getTime();
	var stDate = new Date().getTime(); 
	var RemainDate = edDate - stDate;

  var day = Math.floor(RemainDate/86400000);	
  var hours = Math.floor(RemainDate/3600000%24);
  var miniutes = Math.floor(RemainDate/60000%60);
  var seconds = Math.floor(RemainDate/1000%60);
 
  m = day +"일"+ " "+ hours + ":" +  miniutes + ":" + seconds ; // 남은 시간 text형태로 변경
  
  document.all.timer.innerHTML = m;   // div 영역에 보여줌 
  
  if (RemainDate < 0) {      
    // 시간이 종료 되었으면..
    clearInterval(tid);   // 타이머 해제
  }else{
    RemainDate = RemainDate - 1000; // 남은시간 -1초
  }
}

function apply(){
	
    var sub=$("#sub").text();
//     var sub="aaa";
	var url="count.do";
// 	var params="subjectName="+sub;
    var params="subjectName="+sub+"&"+"s_email=bbb@naver.com"
	 $.ajax({
		type:"post"
		,url:url	
		,data:params
		,dataType:"json"})
		.done(function(map){

		alert(map.message);
		history.go(-1);
		})
		
}


function countfail(){
	
    var sub=$("#sub").text();
	var url="countfail.do";
	var params="subjectName="+sub;

	 $.ajax({
		type:"post"
		,url:url	
		,data:params
		,dataType:"json"})
		.done(function(a){
			console.log("fail값 : "+a);
		})
		.fail(function(e) {
			alert(e.responseText);
		 });	
}




</script>
  
  

  <!-- Bootstrap core CSS -->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="css/blog-post.css" rel="stylesheet">

</head>

<body>


 <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
      <a class="navbar-brand" href="index.jsp">프로젝트</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item active">
            <a class="nav-link" href="index.jsp">Home
              <span class="sr-only">(current)</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="index1.do">수강신청</a>
          </li>
          
          <li class="nav-item">
            <a class="nav-link" href="graph1.do">통계</a>
          </li>
       
        </ul>
      </div>
    </div>
  </nav>

  <!-- Page Content -->
  <div class="container">

    <div class="row">

      <!-- Post Content Column -->
      <div class="col-lg-8">

        <!-- Title -->
        <h1 class="mt-4">수강 신청</h1>

        <!-- Author -->
        <p class="lead">
    
<!--<a href="#">Start Bootstrap</a> -->
        </p>

        <hr>

        <!-- Date/Time -->
        
       	 시작일 : <span id="start">${sel_sub.startTime} </span>  
       	 
       	 마감일 : <span id="end">${sel_sub.endTime}</span> 
       	 
        <p></p>
		<span id="timer" style="color:red; font-size:1.5em;"></span>
        <hr>

        <!-- Preview Image -->
        <img class="img-fluid rounded" src="img/sub_img/${sel_sub.subjectImage}" alt="사진">
        <hr>
        
         <blockquote class="blockquote">
          <p class="mb-0" id="sub" >${sel_sub.subjectName}</p>
          <footer class="blockquote-footer">과목 소개
<%--             <cite title="Source Title">Source Title</cite> --%>
          </footer>
        </blockquote>
        
        

        <!-- Post Content -->
        <p class="lead">
        <p >${sel_sub.content}</p>	
        </p>

		 <p>${sel_sub.content}</p>	
		       

        <hr>

        <!-- Comments Form -->
      <%--   <div class="card my-4">
          <h5 class="card-header">Leave a Comment:</h5>
          <div class="card-body">
            <form>
              <div class="form-group">
                <textarea class="form-control" rows="3"></textarea>
              </div>
              <button type="수강신청" class="btn btn-primary">Submit</button>
            </form>
          </div>
        </div> --%>

        <!-- Single Comment -->
<!--         <div class="media mb-4">
          <img class="d-flex mr-3 rounded-circle" src="http://placehold.it/50x50" alt="">
          <div class="media-body">
            <h5 class="mt-0">Commenter Name</h5>
            Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.
          </div>
        </div> -->

        <!-- Comment with nested comments -->
        <div class="media mb-4">
<!--           <img class="d-flex mr-3 rounded-circle" src="http://placehold.it/50x50" alt=""> -->
          <div class="media-body">
     <!--        <h5 class="mt-0">Commenter Name</h5>
            Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.
 -->
        <!--     <div class="media mt-4">
              <img class="d-flex mr-3 rounded-circle" src="http://placehold.it/50x50" alt="">
              <div class="media-body">
                <h5 class="mt-0">Commenter Name</h5>
                Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.
              </div>
            </div>

            <div class="media mt-4">
              <img class="d-flex mr-3 rounded-circle" src="http://placehold.it/50x50" alt="">
              <div class="media-body">
                <h5 class="mt-0">Commenter Name</h5>
                Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.
              </div>
            </div> -->

          </div>
        </div>

      </div>

      <!-- Sidebar Widgets Column -->
      <div class="col-md-4">

        <!-- Search Widget -->
        <div class="card my-4">
          <h5 class="card-header">Class</h5>
          <div class="card-body">
         
           		 시작일 : <span id="start"> ${sel_sub.startTime} </span>  <br>
       			 마감일 : <span id="end"> ${sel_sub.endTime} </span> <br>
                                 가격 : <span> ${sel_sub.cost} </span>  
                 <br><br>
                <button class="btn btn-secondary" type="button" onclick="apply();" >수업신청하기</button>
                
          			
          
          </div>
        </div>

    
      </div>

    </div>
    <!-- /.row -->

  </div>
  <!-- /.container -->

  <!-- Footer -->
  <footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; Your Website 2019</p>
    </div>
    <!-- /.container -->
  </footer>

  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>
