<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<script type="text/javascript">
window.onload = function() {
 
var dps = [[]];
var chart = new CanvasJS.Chart("chartContainer", {
	theme: "light2", // "light1", "dark1", "dark2"
	animationEnabled: false,
	title: {
		text: "Biểu đồ công việc từ alumni"
	},
	axisX: {
		valueFormatString: "MMM"
	},
	axisY: {
		title: "Tổng số công việc",
		includeZero: true,
		suffix: " "
	},
	data: [{
		type: "line",
		xValueType: "dateTime",
		xValueFormatString: "MMM",
		yValueFormatString: "#,##0 Job",
		dataPoints: dps[0]
	}]
});
 
var xValue;
var yValue;
 
<c:forEach items="${dataPointsList}" var="dataPoints" varStatus="loop">	
	<c:forEach items="${dataPoints}" var="dataPoint">
		xValue = parseInt("${dataPoint.x}");
		yValue = parseFloat("${dataPoint.y}");
		dps[parseInt("${loop.index}")].push({
			x : xValue,
			y : yValue
		});		
	</c:forEach>	
</c:forEach> 
 
chart.render();
 
}
</script>
	<br>
	<div id="chartContainer" style="height: 370px; width: 50%;"></div>
	<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>

<script type="text/javascript">
	document.getElementById("home").classList.add('active');
</script>