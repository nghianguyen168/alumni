<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/tags/taglib.jsp"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="Dashboard">
<meta name="keyword"
	content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
<title>DTU-Alumni:Login</title>

<!-- Favicons -->
<link href="/resources/templates/admin/img/favicon.png" rel="icon">
<link href="/resources/templates/admin/img/apple-touch-icon.png"
	rel="apple-touch-icon">

<!-- Bootstrap core CSS -->
<link
	href="/resources/templates/admin/lib/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<!--external css-->
<link
	href="/resources/templates/admin/lib/font-awesome/css/font-awesome.css"
	rel="stylesheet" />
<!-- Custom styles for this template -->
<link href="/resources/templates/admin/css/style.css" rel="stylesheet">
<link href="/resources/templates/admin/css/style-responsive.css"
	rel="stylesheet">

<!-- =======================================================
    Template Name: Dashio
    Template URL: https://templatemag.com/dashio-bootstrap-admin-template/
    Author: TemplateMag.com
    License: https://templatemag.com/license/
  ======================================================= -->
</head>

<body>
	<!-- **********************************************************************************************************************************************************
      MAIN CONTENT
      *********************************************************************************************************************************************************** -->
	<div id="login-page">
		<div class="container">
			<form class="form-login" style="max-width: 600px;" method="post"  action="/user/register">
				<h2 class="form-login-heading">Đăng Ký Thành Viên DTU Alumni</h2>
				<br>
				<div id="message"></div>
				<div class="login-wrap">
					<div class="form-group row">
						<label style="margin-top: 8px;" class="col-sm-2 col-form-label"><strong>DTU
								Mail :</strong></label>
						<div class="col-sm-10">
							<input type="text" class="form-control" name="dtumail"
								id="dtumail" placeholder="Dtu Mail" autofocus>

							<span><i>Có thể dùng email cả nhân để đăng ký nếu quên email DTU</i></span>
						</div>
					</div>
					<div class="form-group row">
						<label style="margin-top: 8px;" class="col-sm-2 col-form-label"><strong>Email cá nhân:</strong></label>
						<div class="col-sm-10">
							<input type="text" class="form-control" name="email" required
								   id="email" placeholder="Dtu Mail" autofocus>
						</div>
					</div>
					<div class="form-group row">
						<label style="margin-top: 8px;" class="col-sm-2 col-form-label"><strong>Họ và tên lót:</strong></label>
						<div class="col-sm-10">
							<input type="text" class="form-control" name="firstName" required
								id="firstName" placeholder="Họ và tên lót" autofocus>
						</div>
					</div>

					<div class="form-group row">
						<label style="margin-top: 8px;" class="col-sm-2 col-form-label"><strong>Tên :</strong></label>
						<div class="col-sm-10">
							<input type="text" class="form-control" name="lastName" required
								id="lastName" placeholder="Tên" autofocus>
						</div>
					</div>
					<div class="form-group row">
						<label style="margin-top: 8px;" class="col-sm-2 col-form-label"><strong>Mã số sinh viên:</strong></label>
						<div class="col-sm-10">
							<input type="text" class="form-control" name="studentId"
								   id="studentId" required placeholder="Mã số sinh viên" autofocus>
						</div>
					</div>
					<div class="form-group row">
						<label style="margin-top: 8px;" class="col-sm-2 col-form-label"><strong>Ngày Sinh :</strong></label>
						<div class="col-sm-10">
							<input type="date" required class="form-control" name="dateOfBirth"
								id="dateOfBirth" placeholder="Ngày Sinh" autofocus>
						</div>
					</div>
					<div class="form-group row">
						<label style="margin-top: 8px;" class="col-sm-2 col-form-label"><strong>Số điện thoại :</strong></label>
						<div class="col-sm-10">
							<input type="text" required class="form-control" name="phone"
								   id="phone" placeholder="Ngày Sinh" autofocus>
						</div>
					</div>

					<div class="form-group row">
						<label style="margin-top: 8px;" class="col-sm-2 col-form-label"><strong>Khóa :</strong></label>
						<div class="col-sm-10">
							<select class="form-control"  id="kname" name="knameId"> required
								<option value="0">--Chọn khóa--</option>
								<c:if test="${not empty knameList}">
									<c:forEach var="kn" items="${knameList }">
										<option value="${kn.id }">${kn.k }</option>
									</c:forEach>

								</c:if>
							</select>
						</div>
							<br>
					</div>
					<div class="form-group row">
						<label style="margin-top: 8px;" class="col-sm-2 col-form-label"><strong>Khoa :</strong></label>
						<div class="col-sm-10">
							<select class=" form-control"  id="faculty" name="facultyId" required>
								<option value="0">--Chọn khoa--</option>
								<c:if test="${not empty facultyList}">
									<c:forEach var="f" items="${facultyList }">
										<option value="${f.id }">${f.facultyName}</option>
									</c:forEach>

								</c:if>
							</select>
						</div>
							<br>
					</div>
					<div class="form-group row">
						<label style="margin-top: 8px;" class="col-sm-2 col-form-label"><strong>Ngành học:</strong></label>
						<div class="col-sm-10">
							<select class=" form-control" name="majorId" id="major" required
										>
								<option value="0">--Chọn ngành học--</option>
								<c:if test="${not empty majorList}">
									<c:forEach var="major" items="${majorList }">
										<option value="${major.id }">${major.majorName}</option>
									</c:forEach>

								</c:if>
							</select>
						</div>
						<br>
					</div>


					<!--  <input class="btn btn-theme btn-block" type="submit" value="SIGN IN"> -->
					<button class="btn btn-theme btn-block"
						type="submit">ĐĂNG KÝ</button>
					<hr>


				</div>
				<!-- Modal -->

				<!-- modal -->
			</form>
		</div>
	</div>
	<div id="wait"
		style="display: none; width: 100%; height: 100%; background-color: rgba(0, 0, 0, 0.6); position: absolute; padding: 18% 49%; top: 0; z-index: 2">
		<svg style="height: 80px;" version="1.1" id="L4"
			xmlns="http://www.w3.org/2000/svg"
			xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
			viewBox="0 0 100 100" enable-background="new 0 0 0 0"
			xml:space="preserve">
  <circle fill="#fff" stroke="none" cx="6" cy="50" r="6">
    <animate attributeName="opacity" dur="1s" values="0;1;0"
				repeatCount="indefinite" begin="0.1" />    
  </circle>
  <circle fill="#fff" stroke="none" cx="26" cy="50" r="6">
    <animate attributeName="opacity" dur="1s" values="0;1;0"
				repeatCount="indefinite" begin="0.2" />       
  </circle>
  <circle fill="#fff" stroke="none" cx="46" cy="50" r="6">
    <animate attributeName="opacity" dur="1s" values="0;1;0"
				repeatCount="indefinite" begin="0.3" />     
  </circle>
</svg>
	</div>
	<!-- js placed at the end of the document so the pages load faster -->
	<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
	<script src="/resources/templates/public/login.js"></script>
	<script
		src="/resources/templates/admin/lib/bootstrap/js/bootstrap.min.js"></script>
	<script
		src="/resources/templates/admin/lib/bootstrap/js/bootstrap.min.js"></script>
	<!--BACKSTRETCH-->
	<!-- You can use an image of whatever size. This script will stretch to fit in any screen size.-->
	<script type="text/javascript"
		src="/resources/templates/admin/lib/jquery.backstretch.min.js"></script>
	<script>
		$.backstretch("/resources/templates/admin/img/backgound-login.jpg", {
			speed : 500
		});
	</script>
</body>

</html>
