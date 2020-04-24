<%@ page contentType="text/html;"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <!-- <meta charset="utf-8" /> -->
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Dashboard - SB Admin</title>
        <link href="css/styles.css" rel="stylesheet" />
        <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
        
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js" crossorigin="anonymous"></script>
    
     <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
    <script type="text/javascript">
    $(document).ready(function(){
		
    	 $.ajax({
    			type:"get"
    			,url:"graph2.do"
    			,dataType:"json"})
    			.done(function(args){
    				
				for(var i=0;i<args.length;i++){
					$("#body").append("<tr> <td>"+args[i].subjectName+"</td><td>"+args[i].startTime+"</td><td>"+args[i].endTime+"</td><td>"+args[i].subjecttag+"</td><td>"+args[i].studentCount+"</td></tr>");
		
				}
				$('#dataTable').DataTable();
    			})
    			
    	 $.ajax({
    			type:"get"
    			,url:"graph3.do"
    			,dataType:"json"})
    			.done(function(args){
    	
            	console.log(args);
				chart(args);
    			})		
    			
    		
    	});
    
function chart(args){
	
	  // Set new default font family and font color to mimic Bootstrap's default styling
    Chart.defaults.global.defaultFontFamily = 'Lato';
    Chart.defaults.global.defaultFontColor = '#292b2c';

    var ctx1 = document.getElementById("myBarChart1");
    var ctx2 = document.getElementById("myBarChart2");
    var ctx3 = document.getElementById("myBarChart3");
    var ctx4 = document.getElementById("myLineChart1");
    var ctx5 = document.getElementById("myRadarChart1");
    
    data1 = {
    	    datasets: [{
    	        data: args.month3_count,
    	        backgroundColor: [
					  "#bfff00",
					  "#5e7e9b",
					  "#8977ad",
					  "#f29886",
					  "#f7e600"
					]
    	    }],
    	    labels: args.month3_sub
    	};
    data2 = {
    	    datasets: [{
    	        data: args.month2_count,
    	        backgroundColor: [
					  "#90d5eb",
					  "#fbceb1",
					  "#8d192b",
					  "#3391b5",
					  "#f7e600"
					]
    	    }],
    	    labels: args.month2_sub
    	};
    data3 = {
    	    datasets: [{
    	        data: args.month1_count,
    	        backgroundColor: [
					  "#bfff00",
					  "#5e7e9b",
					  "#8977ad",
					  "#f29886",
					  "#f7e600"
					]
    	    }],
    	    labels: args.month1_sub
    	};
    
    
    
    
    data4 = {
        labels: args.year,
        datasets: [{
          label: "Sessions",
          lineTension: 0.3,
          backgroundColor: "rgba(2,117,216,0.2)",
          borderColor: "rgba(2,117,216,1)",
          pointRadius: 5,
          pointBackgroundColor: "rgba(2,117,216,1)",
          pointBorderColor: "rgba(255,255,255,0.8)",
          pointHoverRadius: 5,
          pointHoverBackgroundColor: "rgba(2,117,216,1)",
          pointHitRadius: 50,
          pointBorderWidth: 2,
          data: args.use_count,
        }],
      };
    
    var chartColors = {
    	    red: 'rgb(255, 99, 132)',
    	    orange: 'rgb(255, 159, 64)',
    	    yellow: 'rgb(255, 205, 86)',
    	    green: 'rgb(75, 192, 192)',
    	    blue: 'rgb(54, 162, 235)',
    	    purple: 'rgb(153, 102, 255)',
    	    grey: 'rgb(231,233,237)'
    	  };
    var color = Chart.helpers.color;
    
    data5= {
        labels: args.tagname,
        datasets: [
        	{
            label: "20ë",	
            data: args.user_hap_total_20,
            backgroundColor: color(chartColors.red).alpha(0.2).rgbString(),
            borderColor: chartColors.red,
            pointBackgroundColor: chartColors.red
         
        },
        {
            label: "30ë",	
            data: args.user_hap_total_30,
            backgroundColor: color(chartColors.blue).alpha(0.2).rgbString(),
            borderColor: chartColors.blue,
            pointBackgroundColor: chartColors.blue
         
        },
        {
            label: "40ë",	
            data: args.user_hap_total_40,
            backgroundColor: color(chartColors.orange).alpha(0.2).rgbString(),
            borderColor: chartColors.orange,
            pointBackgroundColor: chartColors.orange
         
        }
        	
        	
        	]
    }
    
  
    options1 = {
    	  elements: {
    	      center: {
    	      text: args.recent_date[0],
    	      color: '#36A2EB', //Default black
    	      fontStyle: 'Helvetica', //Default Arial
    	      sidePadding: 15 //Default 20 (as a percentage)
    	    }
    	  }
    	}
    options2 = {
      	  elements: {
      	      center: {
      	      text: args.recent_date[1],
      	      color: '#36A2EB', //Default black
      	      fontStyle: 'Helvetica', //Default Arial
      	      sidePadding: 15 //Default 20 (as a percentage)
      	    }
      	  }
      	}
    options3 = {
      	  elements: {
      	      center: {
      	      text: args.recent_date[2],
      	      color: '#36A2EB', //Default black
      	      fontStyle: 'Helvetica', //Default Arial
      	      sidePadding: 15 //Default 20 (as a percentage)
      	    }
      	  }
      	}
    
    
    options4 = {
        scales: {
          xAxes: [{
            time: {
              unit: 'date'
            },
            gridLines: {
              display: false
            },
            ticks: {
              maxTicksLimit: 12
            }
          }],
          yAxes: [{
            ticks: {
              min: 0,
              max: 400,
              maxTicksLimit: 8
            },
            gridLines: {
              color: "rgba(0, 0, 0, .125)",
            }
          }],
        },
        legend: {
          display: false
        }
      }
      	
      	
    options5 = {
    	    scale: {
    	    	
    	        angleLines: {
    	            display: false
    	        },
    	        pointLabels:{
    	        	fontSize: 18,
    	        	fontColor:"green"
    	        },
    	        
    	        ticks: {
    	            suggestedMin: 0,
    	            suggestedMax: 130
    	        }
    	    }
    	};
    
    
    var myPieChart1 = new Chart(ctx3, {
        type: 'doughnut',
        data: data1,
        options:options1
    });
    var myPieChart2 = new Chart(ctx2, {
        type: 'doughnut',
        data: data2,
        options:options2
    });
    var myPieChart3 = new Chart(ctx1, {
        type: 'doughnut',
        data: data3,
        options:options3
    });
    
    var myLineChart = new Chart(ctx4, {
        type: 'line',
        data: data4,
        options: options4
    });
    
    var myRadarChart = new Chart(ctx5, {
        type: 'radar',
        data: data5,
        options: options5
    });
    
    
    
    
    
    Chart.pluginService.register({
    	  beforeDraw: function (chart) {
    	    if (chart.config.options.elements.center) {
    	      //Get ctx from string
    	      var ctx = chart.chart.ctx;

    	      //Get options from the center object in options
    	      var centerConfig = chart.config.options.elements.center;
    	      var fontStyle = centerConfig.fontStyle || 'Arial';
    	      var txt = centerConfig.text;
    	      var color = centerConfig.color || '#000';
    	      var sidePadding = centerConfig.sidePadding || 20;
    	      var sidePaddingCalculated = (sidePadding/100) * (chart.innerRadius * 2)
    	      //Start with a base font of 30px
    	      ctx.font = "30px " + fontStyle;

    	      //Get the width of the string and also the width of the element minus 10 to give it 5px side padding
    	      var stringWidth = ctx.measureText(txt).width;
    	      var elementWidth = (chart.innerRadius * 2) - sidePaddingCalculated;

    	      // Find out how much the font can grow in width.
    	      var widthRatio = elementWidth / stringWidth;
    	      var newFontSize = Math.floor(30 * widthRatio);
    	      var elementHeight = (chart.innerRadius * 2);

    	      // Pick a new font size so it will not be larger than the height of label.
    	      var fontSizeToUse = Math.min(newFontSize, elementHeight);

    	      //Set font settings to draw it correctly.
    	      ctx.textAlign = 'center';
    	      ctx.textBaseline = 'middle';
    	      var centerX = ((chart.chartArea.left + chart.chartArea.right) / 2);
    	      var centerY = ((chart.chartArea.top + chart.chartArea.bottom) / 2);
    	      ctx.font = fontSizeToUse+"px " + fontStyle;
    	      ctx.fillStyle = color;

    	      //Draw text in center
    	      ctx.fillText(txt, centerX, centerY);
    	    }
    	  }
    	});
    
    
    
    
}
    </script>
    	


    </head>
    <body class="sb-nav-fixed">
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top py-3" id="mainNav">
            <div class="container">
                <a class="navbar-brand js-scroll-trigger" href="main.do">MatchingService</a><button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ml-auto my-2 my-lg-0">
                      
                        <c:if test="${loginData.who eq 't'}">
                        <li class="nav-item"><a class="nav-link js-scroll-trigger" href="upload.do">ê°ì¢ ìë¡ë</a></li>
                        </c:if>
                        <c:if test="${loginData.who eq 's'}">
          				<li class="nav-item"><a class="nav-link js-scroll-trigger" href="index1.do?name=ì»´í¨í°">ìê°ì ì²­</a></li>
          				</c:if>
          				<li class="nav-item"><a class="nav-link js-scroll-trigger" href="graph1.do">íµê³</a></li>
          				<li class="nav-item"><a class="nav-link js-scroll-trigger" href="BoardList.do">QnA</a></li>
                        <li class="nav-item"><a class="nav-link js-scroll-trigger" id = "logIn" href="loginSelect.do">ë¡ê·¸ì¸</a></li>
                        <li class="nav-item"><a class="nav-link js-scroll-trigger" href="RegistSelect.do">íìê°ì</a></li>

               
                          <c:if test="${loginData.name ne null}">
                        	<li class="nav-item"><a class="nav-link js-scroll-trigger" onclick="logout()">ë¡ê·¸ìì</a></li>
                        	<li class="nav-item"><a class="nav-link js-scroll-trigger" href="index" >[íì : ${loginData.name}]</a></li>
                        </c:if>
                         
                    </ul>
                </div>
            </div>
        </nav>
    
     <!--  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top"> --> -->
      
      
<!--     <div class="container"> -->
<!--       <a class="navbar-brand" href="index.jsp">íë¡ì í¸</a> -->
<!--       <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"> -->
<!--         <span class="navbar-toggler-icon"></span> -->
<!--       </button> -->
<!--       <div class="collapse navbar-collapse" id="navbarResponsive"> -->
<!--         <ul class="navbar-nav ml-auto"> -->
<!--           <li class="nav-item active"> -->
<!--             <a class="nav-link" href="index.jsp">Home -->
<!--               <span class="sr-only">(current)</span> -->
<!--             </a> -->
<!--           </li> -->
<!--           <li class="nav-item"> -->
<!--             <a class="nav-link" href="index1.do">ìê°ì ì²­</a> -->
<!--           </li> -->
          
<!--           <li class="nav-item"> -->
<!--             <a class="nav-link" href="graph1.do">íµê³</a> -->
<!--           </li> -->
       
<!--         </ul> -->
<!--       </div> -->
<!--     </div> -->


<!--   <div class="container"> -->
<!--                 <a class="navbar-brand js-scroll-trigger" href="main.do">MatchingService</a><button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button> -->
<!--                 <div class="collapse navbar-collapse" id="navbarResponsive"> -->
<!--                     <ul class="navbar-nav ml-auto my-2 my-lg-0"> -->
<!--                         <li class="nav-item"><a class="nav-link js-scroll-trigger" href="#about">About</a></li> -->
<!--                         <li class="nav-item"><a class="nav-link js-scroll-trigger" href="">Services</a></li> -->
<!--                         <li class="nav-item"><a class="nav-link js-scroll-trigger" href="upload.do">ê°ì¢ ìë¡ë</a></li> -->
<!--           				<li class="nav-item"><a class="nav-link js-scroll-trigger" href="index1.do">ìê°ì ì²­</a></li> -->
<!--           				<li class="nav-item"><a class="nav-link js-scroll-trigger" href="graph1.do">íµê³</a></li> -->
<!--           				<li class="nav-item"><a class="nav-link js-scroll-trigger" href="BoardList.do">QnA</a></li> -->
<!--                         <li class="nav-item"><a class="nav-link js-scroll-trigger" id = "logIn" href="loginSelect.do">ë¡ê·¸ì¸</a></li> -->
<!--                         <li class="nav-item"><a class="nav-link js-scroll-trigger" href="RegistSelect.do">íìê°ì</a></li> -->

               
     
                         
<!--                     </ul> -->
<!--                 </div> -->
<!--             </div> -->
            
            
            
<!--   </nav> -->


    
 

<!--         <div id="layoutSidenav"> -->
         <!--    <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading">Core</div>
                            <a class="nav-link" href="index.html"
                                ><div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                Dashboard</a
                            >
                            <div class="sb-sidenav-menu-heading">Interface</div>
                            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts"
                                ><div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                Layouts
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div
                            ></a>
                            <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav"><a class="nav-link" href="layout-static.html">Static Navigation</a><a class="nav-link" href="layout-sidenav-light.html">Light Sidenav</a></nav>
                            </div>
                            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages" aria-expanded="false" aria-controls="collapsePages"
                                ><div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                                Pages
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div
                            ></a>
                            <div class="collapse" id="collapsePages" aria-labelledby="headingTwo" data-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
                                    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#pagesCollapseAuth" aria-expanded="false" aria-controls="pagesCollapseAuth"
                                        >Authentication
                                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div
                                    ></a>
                                    <div class="collapse" id="pagesCollapseAuth" aria-labelledby="headingOne" data-parent="#sidenavAccordionPages">
                                        <nav class="sb-sidenav-menu-nested nav"><a class="nav-link" href="login.html">Login</a><a class="nav-link" href="register.html">Register</a><a class="nav-link" href="password.html">Forgot Password</a></nav>
                                    </div>
                                    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#pagesCollapseError" aria-expanded="false" aria-controls="pagesCollapseError"
                                        >Error
                                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div
                                    ></a>
                                    <div class="collapse" id="pagesCollapseError" aria-labelledby="headingOne" data-parent="#sidenavAccordionPages">
                                        <nav class="sb-sidenav-menu-nested nav"><a class="nav-link" href="401.html">401 Page</a><a class="nav-link" href="404.html">404 Page</a><a class="nav-link" href="500.html">500 Page</a></nav>
                                    </div>
                                </nav>
                            </div>
                            <div class="sb-sidenav-menu-heading">Addons</div>
                            <a class="nav-link" href="charts.html"
                                ><div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                                Charts</a
                            ><a class="nav-link" href="tables.html"
                                ><div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                Tables</a
                            >
                        </div>
                    </div>
                    <div class="sb-sidenav-footer">
                        <div class="small">Logged in as:</div>
                        Start Bootstrap
                    </div>
                </nav>
            </div> -->
<!--             <div id="layoutSidenav_content"> -->
                <main>
                    <div class="container-fluid">
                    <br>
                    <br>
                    
                        <h1 class="mt-4">Chart</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">Chart</li>
                        </ol>
                        <div class="row">
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-primary text-white mb-4">
                                    <div class="card-body">Ready...</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="#">Ready...</a>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-warning text-white mb-4">
                                    <div class="card-body">Ready...</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="#">Ready...</a>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-success text-white mb-4">
                                    <div class="card-body">Ready...</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="#">Ready...</a>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-danger text-white mb-4">
                                    <div class="card-body">Ready...</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="#">Ready...</a>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header"><i class="fas fa-chart-area mr-1"></i>ìë³ ìê° ì¸ì</div>
                                    <div class="card-body"><canvas id="myLineChart1" width="100%" height="54"></canvas></div>
                                    
                                     <div class="card-header"><i class="fas fa-chart-area mr-1"></i>ìê° íë§ë³ ë¶í¬ë</div>
                                    <div class="card-body"><canvas id="myRadarChart1" width="100%" height="54"></canvas></div>
                                    
                                </div>
                            </div>
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header"><i class="fas fa-chart-bar mr-1"></i>ì ë²ë¬ ì¸ê¸°ê°ì¢(ìµê·¼3ê°ì)</div>
                                    <div class="card-body"><canvas id="myBarChart1" width="100%" height="32"></canvas></div>
                                    
                                     <div class="card-header"><i class="fas fa-chart-bar mr-1"></i>ì ì ë²ë¬ ì¸ê¸°ê°ì¢(ìµê·¼3ê°ì)</div>
                                    <div class="card-body"><canvas id="myBarChart2" width="100%" height="32"></canvas></div>
                                    
                                     <div class="card-header"><i class="fas fa-chart-bar mr-1"></i>ì ì ì ë²ë¬ ì¸ê¸°ê°ì¢(ìµê·¼3ê°ì)</div>
                                    <div class="card-body"><canvas id="myBarChart3" width="100%" height="32"></canvas></div>
                                    
                                    
                                </div>
                            </div>
                        </div>
                        <div class="card mb-4">
                            <div class="card-header"><i class="fas fa-table mr-1"></i>DataTable Example</div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                        <thead>
                                            <tr>
                                                <th>subjectName</th>
                                                <th>startTime</th>
                                                <th>endTime</th>
                                                <th>subjecttag</th>
                                                <th>studentCount</th>
                                            </tr>
                                        </thead>
                                        <tfoot id="foot">
                                            <tr>
                                                <th>subjectName</th>
                                                <th>startTime</th>
                                                <th>endTime</th>
                                                <th>subjecttag</th>
                                                <th>studentCount</th>
                                            </tr>
                                        </tfoot>
                                        <tbody id="body">
                                        
                                        </tbody>
                                 
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; Your Website 2019</div>
                            <div>
                                <a href="#">Privacy Policy</a>
                                &middot;
                                <a href="#">Terms &amp; Conditions</a>
                            </div>
                        </div>
                    </div>
                </footer>
                
       <div>
       <span id="aa">asd</span>
       </div>
	
	
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.4.1.min.js" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="assets/demo/chart-area-demo.js"></script>
        <script src="assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
        <script src="assets/demo/datatables-demo.js"></script>
    </body>
</html>
