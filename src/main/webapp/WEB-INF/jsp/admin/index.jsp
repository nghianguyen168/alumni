<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/WEB-INF/templates/tags/taglib.jsp"%>
<jsp:useBean id="now" class="java.util.Date" />
<!DOCTYPE html>

<div class="container-fluid">
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h3 mb-0 text-gray-800">THỐNG KÊ</h1>
	</div>

	<div class="row2">
		<!-- Earnings (Monthly) Card Example -->
		<div class="col-xl-3 col-md-6 mb-4">
			<div class="card2 border-left-primary shadow3 h-100 py-2">
				<div class="card-body2">
					<div class="row3 no-gutters2 align-items-center2 spacwbt">
						<div class="col mr-2">
							<div class="text-xs2 font-weight-bold text-primary text-uppercase mb-1">
								Tổng số thành viên</div>

							<br>
							<c:forEach items="${memberTypeService.findAll()}" var="type" >
								<div class="mb-0 font-weight text-gray-800">${type.typeName} - <strong>${	memberService.findByType(type.id).size()}</strong></div>
							</c:forEach>
						</div>
						<div class="col-auto">
							<span class="material-icons" style="color: #007bff; font-size: 30px; "> <i class="fa fa-users" aria-hidden="true"></i> </span>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- Earnings (Annual) Card Example -->
		<div class="col-xl-3 col-md-6 mb-4">
			<fmt:formatDate var="month" value="${now}" pattern="MM" />
			<div class="card2 border-left-success shadow3 h-100 py-2">
				<div class="card-body2">
					<div class="row3 no-gutters2 align-items-center2 spacwbt">
						<div class="col mr-2">
							<div class="text-xs3 font-weight-bold text-success text-uppercase mb-1">
								Số tin tuyển dụng - Tháng ${month}</div>
							<br>

							<c:forEach items="${majorService.findAll()}" var="major">
								<div class="mb-0 font-weight text-gray-800">${major.majorName} - <strong>${jobService.getJobListByMonthAndMajor(month,major.id).size()}</strong></div>
							</c:forEach>

						</div>
						<div class="col-auto">
							<span class="material-icons" style="color: #28a745; font-size: 30px;"> <i class="fa fa-handshake-o" aria-hidden="true"></i></span>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- Earnings (Annual) Card Example -->
		<div class="col-xl-3 col-md-6 mb-4">
			<div class="card2 border-left-primary shadow3 h-100 py-2">
				<div class="card-body2">
					<div class="row3 no-gutters2 align-items-center2 spacwbt">
						<div class="col mr-2">
							<div class="text-xs2 font-weight-bold text-primary text-uppercase mb-1">
								Số lượt ứng tuyển (Trong tháng)</div>
							<div class="mb-0 font-weight text-gray-800">Tổng số lượt ứng tuyển : <strong>${jobApplyService.sumJobApplyByMonth(month)}</strong></div>
						</div>
						<div class="col-auto">
							<span class="material-icons" style="color: #007bff; font-size: 30px;"> <i class="fa fa-check-square-o" aria-hidden="true"></i></span>
						</div>
					</div>
				</div>
			</div>
		</div>


		<div class="col-xl-3 col-md-6 mb-4">
			<div class="card2 border-left-success shadow3 h-100 py-2">
				<div class="card-body2">
					<div class="row3 no-gutters2 align-items-center2 spacwbt">
						<div class="col mr-2">
							<div class="text-xs3 font-weight-bold text-success text-uppercase mb-1">
								Tin tức - Sự kiện</div>
							<div class="mb-0 font-weight text-gray-800">Tin Tức: <strong>${newsService.findByMonth(month).size()}</strong></div>
							<div class="mb-0 font-weight text-gray-800">Sự kiện: <strong>${eventService.findByMonth(month).size()}</strong></div>
						</div>
						<div class="col-auto">
							<span class="material-icons" style="color: #28a745; font-size: 30px;"> <i class="fa fa-newspaper-o" aria-hidden="true"></i> </span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
window.onload = function() {

var dps = [[]];
var chart = new CanvasJS.Chart("chartContainer", {
	theme: "light2", // "light1", "dark1", "dark2"
	animationEnabled: true,
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

<script type="text/javascript">
	window.onload = function() {

		var dps1 = [[]];
		var chart1 = new CanvasJS.Chart("chartContainerCircle", {
			theme: "light2", // "light1", "dark1", "dark2"
			exportEnabled: true,
			animationEnabled: true,
			title: {
				text: "Biểu đồ tỷ lệ tuyển dụng theo ngày"
			},
			data: [{
				type: "pie",
				showInLegend: "true",
				legendText: "{label}",
				yValueFormatString: "#,###\"%\"",
				indexLabelFontSize: 16,
				indexLabel: "{label} - {y}",
				dataPoints: dps[0]
			}]
		});

		var yValue;
		var label;

		<c:forEach items="${canvasjsDataListCirlceMajor}" var="dataPoints" varStatus="loop">
		<c:forEach items="${dataPoints}" var="dataPoint">
		yValue = parseFloat("${dataPoint.y}");
		label = "${dataPoint.label}";
		dps1[parseInt("${loop.index}")].push({
			label : label,
			y : yValue,
		});
		</c:forEach>
		</c:forEach>

		chart1.render();
	}
</script>
<div id="chartContainerCircle" style="height: 370px; width: 50%;"></div>


	<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>

<script type="text/javascript">
	document.getElementById("home").classList.add('active');
</script>
