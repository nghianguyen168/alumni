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
  <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
  <title>Admin: Login</title>

  <!-- Favicons -->
<link rel="shortcut icon" type="image/png" href="/resources/templates/public/IMAGE/HEADER/favicon.png"/>

  <!-- Bootstrap core CSS -->
  <link href="/resources/templates/admin/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!--external css-->
  <link href="/resources/templates/admin/lib/font-awesome/css/font-awesome.css" rel="stylesheet" />
  <!-- Custom styles for this template -->
  <link href="/resources/templates/admin/css/style.css" rel="stylesheet">
  <link href="/resources/templates/admin/css/style-responsive.css" rel="stylesheet">
  
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
      <form class="form-login" action="/auth/login" method="post">
        <h2 class="form-login-heading">ĐĂNG NHẬP TRANG QUẢN TRỊ</h2>
        <br>
        <div id="message">
        	<c:if test="${not empty param['msg'] }">
	        	<div class="alert alert-danger" role="alert">
				  Sai tên đăng nhập hoặc mật khẩu!
				</div>
        	</c:if>
        </div>
        <div class="login-wrap">
          <input type="text" class="form-control" name="dtumail" id="dtumail" placeholder="Dtu Mail" autofocus>
          <br>
          <input type="password" class="form-control" id="pass" name="pass" placeholder="Mật khẩu">
          <label class="checkbox" style="margin-left: 20px !important;">
            <input  type="checkbox" value="remember-me"> Ghi nhớ đăng nhập
           
            </label>
          <input class="btn btn-theme btn-block" type="submit" value="ĐĂNG NHẬP"> 
          
       
        </div>
        <!-- Modal -->
        <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="myModal" class="modal fade">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">Quên mật khẩu ?</h4>
              </div>
              <div class="modal-body">
                <p>Nhập địa chỉ email của bạn để đặt lại mật khẩu!</p>
                <input type="text" name="email" placeholder="Email" autocomplete="off" class="form-control placeholder-no-fix">
              </div>
              <div class="modal-footer">
                <button data-dismiss="modal" class="btn btn-default" type="button">Hủy</button>
                <button class="btn btn-theme" type="button">Xác Nhận</button>
              </div>
            </div>
          </div>
        </div>
        <!-- modal -->
      </form>
    </div>
  </div>
  <div id="wait" style="display:none;width:120px;height:120px;position:absolute;top:50%;left:47%;padding:2px;z-index:2"><img src='/resources/templates/loading.gif' width="100" height="100" /></div>
  <!-- js placed at the end of the document so the pages load faster -->
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
  <script src="/resources/templates/admin/login.js"></script>
  <script src="/resources/templates/templates/auth.js"></script>
  <script src="/resources/templates/admin/lib/bootstrap/js/bootstrap.min.js"></script>
    <script src="/resources/templates/admin/lib/bootstrap/js/bootstrap.min.js"></script>
  <!--BACKSTRETCH-->
  <!-- You can use an image of whatever size. This script will stretch to fit in any screen size.-->
  <script type="text/javascript" src="/resources/templates/admin/lib/jquery.backstretch.min.js"></script>
  <script>
    $.backstretch("/resources/templates/admin/img/backgound-login.jpg", {
      speed: 500
    });
  </script>
</body>

</html>
