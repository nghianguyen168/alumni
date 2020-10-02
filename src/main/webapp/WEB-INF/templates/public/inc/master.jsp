<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@include file="/WEB-INF/templates/tags/taglib.jsp"%>
<!DOCTYPE html>
<html>

<head>
    <title>International School Alumni</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <link href='https://fonts.googleapis.com/css?family=Roboto&subset=latin,vietnamese' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" type="text/css" href="/resources/templates/public/CSS/style.css">
    <link href="/your-path-to-fontawesome/css/fontawesome.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
     <script type=”text/javascript” src=”http://code.jquery.com/jquery-2.0.3.min.js”></script>
    <script src="/resources/templates/public/js/slide.js"></script>
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


</body>


</html>