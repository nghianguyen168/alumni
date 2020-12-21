<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="Dashboard">
  <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
  <title>Login</title>

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
      <form class="form-login" method="post" <%-- action="${pageContext.request.contextPath}/user/login --%> action="javascript:void(0);">
        <h2 class="form-login-heading">Đăng Nhập</h2>
        <br>
        <div id="message">
        	
        </div>
        <div class="login-wrap">
          <input type="text" class="form-control" name="dtumail" id="dtumail" placeholder="Dtu Mail" autofocus>
          <br>
          <input type="password" class="form-control" id="pass" name="pass" placeholder="Mật khẩu">
          <label class="checkbox" style="margin-left: 20px !important;">
            <input  type="checkbox" value="remember-me" > Ghi nhớ đăng nhập
            <span class="pull-right">
            <a data-toggle="modal" data-target="#myModal1"> Quên mật khẩu?</a> <!-- login.html#myModal -->
            </span>
            </label>
         <!--  <input class="btn btn-theme btn-block" type="submit" value="SIGN IN"> -->
          <button class="btn btn-theme btn-block"  onclick="return handleLogin()">ĐĂNG NHẬP</button>
          <hr>
         
          <div class="registration">
            Bạn chưa có tài khoản DTU-Alumni?<br/>
            <a class="" href="#">
              Đăng ky tài khoản DTU-Alumni
              </a>
          </div>
        </div>
       <!--  aria-hidden="true" -->
        <!-- Modal -->
        <div  aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="myModal1" class="modal fade" aria-hidden="true">
          <div class="modal-dialog" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" aria-label="Close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">Quên mật khẩu ?</h4>
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
        <input type="hidden"
name="${_csrf.parameterName}"
value="${_csrf.token}"/>
        <!-- modal -->
      </form>
    </div>
  </div>
  <div id="wait" style="display:none;width:100%;height:100%; background-color:rgba(0,0,0,0.6);
  position:absolute;padding: 18% 49%; top:0; z-index:2">
  <svg style="height: 80px;" version="1.1" id="L4" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
  viewBox="0 0 100 100" enable-background="new 0 0 0 0" xml:space="preserve">
  <circle fill="#fff" stroke="none" cx="6" cy="50" r="6">
    <animate
      attributeName="opacity"
      dur="1s"
      values="0;1;0"
      repeatCount="indefinite"
      begin="0.1"/>    
  </circle>
  <circle fill="#fff" stroke="none" cx="26" cy="50" r="6">
    <animate
      attributeName="opacity"
      dur="1s"
      values="0;1;0"
      repeatCount="indefinite" 
      begin="0.2"/>       
  </circle>
  <circle fill="#fff" stroke="none" cx="46" cy="50" r="6">
    <animate
      attributeName="opacity"
      dur="1s"
      values="0;1;0"
      repeatCount="indefinite" 
      begin="0.3"/>     
  </circle>
</svg></div>
  <!-- js placed at the end of the document so the pages load faster -->
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
  <script src="/resources/templates/public/login.js"></script>
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
