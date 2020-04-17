<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Shop Homepage - Start Bootstrap Template</title>
  
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<!-- <script>
 $(function(){
	 console.log(subject[0].subjectImage)
	 for(var i=0; i < subject.length; i++) {
		 $(".updates").append("<div class=col-lg-4 col-md-6 mb-4>");
		 $(".updates").append("<div class=card h-100>");
		 $(".updates").append("<a href=#><img class=card-img-top src=img/"subject[i].subjectImage" alt=""></a>");
		 $(".updates").append( "<div class=card-body>");
		 $(".updates").append(   "<h4 class=card-title>");
		 $(".updates").append( "<a href=#>"subject[i].subjectName"</a>");
		 $(".updates").append("</h4>");
		 $(".updates").append( "<h5>$24.99</h5>");
		 $(".updates").append( " <p class=card-text>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur!</p>");
		 $(".updates").append(   " </div>");
		 $(".updates").append(   "<div class=card-footer>");
		 $(".updates").append(  " <small class=text-muted>&#9733; &#9733; &#9733; &#9733; &#9734;</small>");
		 $(".updates").append(    " </div>");
		 $(".updates").append(  "  </div>");
		        
	 }
});
</script> -->





  <!-- Bootstrap core CSS -->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="css/shop-homepage.css" rel="stylesheet">

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

      <div class="col-lg-3">

        <h1 class="my-4">Class</h1>
        <div class="list-group">
          <a href="#" class="list-group-item active">Computer</a>
          <a href="#" class="list-group-item">Hobby</a>
          <a href="#" class="list-group-item">Music</a>
        </div>
        
<!--       <div class="bg-light border-right" id="sidebar-wrapper"> -->
<!--       <div class="sidebar-heading">Start Bootstrap </div> -->
<!--       <div class="list-group list-group-flush"> -->
<!--         <a href="#" class="list-group-item list-group-item-action bg-light">Dashboard</a> -->
<!--         <a href="#" class="list-group-item list-group-item-action bg-light">Shortcuts</a> -->
<!--         <a href="#" class="list-group-item list-group-item-action bg-light">Overview</a> -->
<!--         <a href="#" class="list-group-item list-group-item-action bg-light">Events</a> -->
<!--         <a href="#" class="list-group-item list-group-item-action bg-light">Profile</a> -->
<!--         <a href="#" class="list-group-item list-group-item-action bg-light">Status</a> -->
<!--       </div> -->
<!--     </div> -->
    
    

      </div>
      <!-- /.col-lg-3 -->

      <div class="col-lg-9">

        <div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel">
          <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
          </ol>
          <div class="carousel-inner" role="listbox">
            <div class="carousel-item active">
              <img class="d-block img-fluid" src="img/main_img/main1.jpg" alt="First slide">
            </div>
            <div class="carousel-item">
              <img class="d-block img-fluid" src="img/main_img/main2.jpg" alt="Second slide">
            </div>
            <div class="carousel-item">
              <img class="d-block img-fluid" src="img/main_img/main3.jpg" alt="Third slide">
            </div>
          </div>
          <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
          </a>
          <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
          </a>
        </div>

        <div class="row">
        
		
		<c:forEach var="subject" items="${subject}">
			   <div class="col-lg-4 col-md-6 mb-4">
            <div class="card h-100">
              <a href="#" onclick="c_sub(); return false;"><img class="card-img-top" src="img/sub_img/${subject.subjectImage}" alt="a"></a>
              <div class="card-body">
                <h4 class="card-title">
                  <a href="list.do?subjectName=${subject.subjectName}">${subject.subjectName}</a>
                </h4>
                <h5>${subject.cost}원</h5>
                <p class="card-text">${subject.content}</p>
              </div>
              <div class="card-footer">
              
               <c:choose>
       			  <c:when test = "${subject.subjectScore>90 and subject.subjectScore<=100 }">
         			<small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9733;</small>
       				  </c:when>
       			  <c:when test = "${subject.subjectScore>80 and subject.subjectScore<=90 }">
          			<small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
         			  </c:when>
         		 <c:when test = "${subject.subjectScore>70 and subject.subjectScore<=80 }">
          			<small class="text-muted">&#9733; &#9733; &#9733; &#9734; &#9734;</small>
         			  </c:when>
         			   <c:when test = "${subject.subjectScore>60 and subject.subjectScore<=70 }">
          			<small class="text-muted">&#9733; &#9733; &#9734; &#9734; &#9734;</small>
         			  </c:when>
         			  <c:when test = "${subject.subjectScore>50 and subject.subjectScore<=60 }">
          			<small class="text-muted">&#9733; &#9734; &#9734; &#9734; &#9734;</small>
         			  </c:when>
         			  	  
       		  <c:otherwise>
        		<small class="text-muted">&#9734; &#9734; &#9734; &#9734; &#9734;</small>
      		   </c:otherwise>
     				 </c:choose>
      
              </div>
            </div>
          </div>
			
		</c:forEach>
		
     
        </div>
        <!-- /.row -->

      </div>
      <!-- /.col-lg-9 -->

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
