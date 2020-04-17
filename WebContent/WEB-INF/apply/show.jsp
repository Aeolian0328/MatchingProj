<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>

<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
  <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(graph1);
function graph(args){

	var data1 = new google.visualization.DataTable();
	
	 data1.addColumn ('string','과목');
	 data1.addColumn ('number','수강인원');
	 data1.addColumn ('number','누적횟수');
	 	 
	 for(var i=0; i < args.length; i++){
	data1.addRows ([
	  [args[i].subject,args[i].count, args[i].nu_count]
	]);
	 }

	 var options = {
	          title : $("#month").val()+'강좌별 분포도', //월별부분 값 받아서 처리 
	          vAxis: {title: 'total'},
	          hAxis: {title: 'Month'},
	          seriesType: 'bars',
	        /*   series: {5: {type: 'line'}
	          } */
	                  };

	        var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
	        chart.draw(data1, options);
}

function graph1(){
	
    var month=$("#month").val();
	var url="month.do";
	var params="month="+month;

	 $.ajax({
		type:"post"
		,url:url	
		,data:params
		,dataType:"json"})
		.done(function(args){
			console.log(args);
			graph(args);
		})
	    .fail(function(e) {
	    	alert(e.responseText);
	    });	
}

</script>



</head>



<body>

<!-- <select id="month" onchange="graph1()"> -->
<%-- <c:forEach var="rank_list" items="${list.month}" > --%>
<%-- 		<option value="${rank_list.month}">${rank_list.month}</option> --%>
		
<%-- </c:forEach> --%>
<!-- </select> -->



<select id="month" onchange="graph1()">

<%for(int i=1;i<=12;i++) {%>

<option value=<%=i+"월"%>><%=i+"월"%></option>
<%}
%>

</select>



<option value="">::부서선택::</option>



<div id="chart_div" style="width: 900px; height: 500px;"></div>




<!-- <button id ="btn" type="button" onclick="graph()"> -->
<!-- refresh</button> -->


<!-- <input type="button" value="확인" > -->


<%--  <form:form commandName="listlist">
<form:select path="month" items="${list}" itemLabel="month" itemValue="month"/>
<input type="submit" value="확인">    
</form:form>
 --%>
</body>
</html>