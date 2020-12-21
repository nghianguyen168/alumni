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
    <title>DTU-Alumni:Login</title>

    <!-- Favicons -->
    <link href="/resources/templates/admin/img/favicon.png" rel="icon">
    <link href="/resources/templates/admin/img/apple-touch-icon.png" rel="apple-touch-icon">

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

            <!-- Modal -->
        <form action="/user/forgot-passord" method="post">
            <div class="" id="dangkythongbaojob"  style="display: block; margin-top: 15%;" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header" style="background-color: #761e25;">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title">Quên mật khẩu ?</h4>
                        </div>
                        <div class="modal-body">
                            <p>Nhập địa chỉ email DTU của bạn để đặt lại mật khẩu!</p>
                            <input type="text" name="email" placeholder="DTU Email" autocomplete="off" class="form-control placeholder-no-fix" required>
                        </div>
                        <c:if test="${not empty msg}">
                            <div class="alert alert-success fade in alert-dismissible" style="margin-top: 18px;margin: 0 auto;">
                                <a href="#" class="close" data-dismiss="alert" aria-label="close" title="close">×</a> <strong>${msg}</strong>
                            </div>
                        </c:if>
                        <div class="modal-footer">
                            <a data-dismiss="modal" class="btn btn-default" href="/user/login" type="button">Hủy</a>
                            <button class="btn btn-theme" type="submit">Xác Nhận</button>
                        </div>
                    </div>
                </div>
            </div>
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
