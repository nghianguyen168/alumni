<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/tags/taglib.jsp"%>
<!DOCTYPE html>
<html>

<head>
<title>International School Alumni</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<link
	href='https://fonts.googleapis.com/css?family=Roboto&subset=latin,vietnamese'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet" type="text/css"
	href="/resources/templates/public/CSS/style.css">
<link rel="stylesheet" type="text/css"
	href="/resources/templates/public/CSS/nghenghiep.css">
<link rel="stylesheet" type="text/css"
	href="/resources/templates/public/CSS/jobview.css">
<link rel="stylesheet" type="text/css"
	href="/resources/templates/public/CSS/CuuSinhVien.css">
<link rel="stylesheet" type="text/css"
	href="/resources/templates/public/loading-bar.css">
<link rel="stylesheet" type="text/css"
	href="/resources/templates/public/loading-bar.min.css">
<link href="/your-path-to-fontawesome/css/fontawesome.css"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<script type=”text/javascript”
	src=”http://code.jquery.com/jquery-2.0.3.min.js”></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<script src="/resources/templates/public/js/slide.js"></script>
<script src="/resources/templates/public/auth.js"></script>
<script src="/resources/templates/public/loading-bar.js"></script>
<script src="/resources/templates/public/loading-bar.min.js"></script>
<script src="/libraries/ckeditor/ckeditor.js"></script>
<script src="/libraries/ckfinder/ckfinder.js"></script>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script data-require="jquery@*" data-semver="2.0.3"
	src="http://code.jquery.com/jquery-2.0.3.min.js"></script>
<script data-require="bootstrap@*" data-semver="3.1.1"
	src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<link data-require="bootstrap-css@3.1.1" data-semver="3.1.1"
	rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css" />
</head>

<body>
	<div>
		<!-- Ở đây đặt header -->
		<tiles:insertAttribute name="header" />
	</div>

	<!-- Ở slide ở đây-->
	<tiles:insertAttribute name="slide" />
	<section id="main-content">
		<!-- main content đặt ở đây -->
		<tiles:insertAttribute name="content" />
	</section>
	<footer>
		<!-- footer đặt ở đây -->
		<tiles:insertAttribute name="footer" />
	</footer>
	<div id="wait"
		style="display: none;background: #e9e9e9;  position: absolute; top: 0; right: 0; bottom: 0; left: 0; opacity: 0.5; text-align: center;">
		   <div id="loading-img" ></div>
		<!-- <img src='/resources/templates/loading8.gif' width="100" height="100" style="margin:auto;" /> -->
		<style>
			#loading-img {
			    background: url(/resources/templates/loading8.gif) center center no-repeat;
			    background-size:100px 100px;
			    height: 100%;
			    z-index: 10;
			}
		</style>
	</div>
	<div id="wait"
		style="background: #e9e9e9; display: none; position: absolute; top: 0; right: 0; bottom: 0; left: 0; opacity: 0.5; text-align: center;">
		<img src='/resources/templates/loading8.gif'
			style="height: 100px; margin-top: 20%; left: 47%; padding: 2px; z-index: 3" />
	</div>
</body>


</html>