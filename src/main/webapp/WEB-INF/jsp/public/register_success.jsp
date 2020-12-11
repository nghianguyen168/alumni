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
<!-- ********************************************************************************************************************************************************
  MAIN CONTENT
  ********************************************************************************************************************************************************* -->
<div id="login-page">
    <div class="container">
        <style type="text/css">


            /* CLIENT-SPECIFIC STYLES */
            body,
            table,
            td,
            a {
                -webkit-text-size-adjust: 100%;
                -ms-text-size-adjust: 100%;
            }

            table,
            td {
                mso-table-lspace: 0pt;
                mso-table-rspace: 0pt;
            }

            img {
                -ms-interpolation-mode: bicubic;
            }

            /* RESET STYLES */
            img {
                border: 0;
                height: auto;
                line-height: 100%;
                outline: none;
                text-decoration: none;
            }

            table {
                border-collapse: collapse !important;
            }

            body {
                height: 100% !important;
                margin: 0 !important;
                padding: 0 !important;
                width: 100% !important;
            }

            /* iOS BLUE LINKS */
            a[x-apple-data-detectors] {
                color: inherit !important;
                text-decoration: none !important;
                font-size: inherit !important;
                font-family: inherit !important;
                font-weight: inherit !important;
                line-height: inherit !important;
            }

            /* MOBILE STYLES */
            @media screen and (max-width:600px) {
                h1 {
                    font-size: 32px !important;
                    line-height: 32px !important;
                }
            }

            /* ANDROID CENTER FIX */
            div[style*="margin: 16px 0;"] {
                margin: 0 !important;
            }
        </style>


        <br>
        <br>
        <br>
        <br>
        <br>
        <!-- HIDDEN PREHEADER TEXT -->
        <div style="display: none; font-size: 1px; color: #fefefe; line-height: 1px; font-family: 'Lato', Helvetica, Arial, sans-serif; max-height: 0px; max-width: 0px; opacity: 0; overflow: hidden;"> We're thrilled to have you here! Get ready to dive into your new account. </div>
        <table border="0" cellpadding="0" cellspacing="0" width="100%">
            <!-- LOGO -->

            <tr>
                <td bgcolor="" align="center" style="padding: 0px 10px 0px 10px;">
                    <table border="0" cellpadding="0" cellspacing="0" width="100%" style="max-width: 600px;">
                        <tr>
                            <td bgcolor="#ffffff" align="center" valign="top" style="padding: 40px 20px 20px 20px; border-radius: 4px 4px 0px 0px; color: #111111; font-family: 'Lato', Helvetica, Arial, sans-serif; font-size: 48px; font-weight: 400; letter-spacing: 4px; line-height: 48px;">
                                <h1 style="font-size: 48px; font-weight: 400; margin: 2;">ĐANG XÁC NHẬN!</h1> <img src="/resources/uploads/waiting.png" width="125" height="120" style="display: block; border: 0px;" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td bgcolor="" align="center" style="padding: 0px 10px 0px 10px;">
                    <table border="0" cellpadding="0" cellspacing="0" width="100%" style="max-width: 600px;">
                        <tr>
                            <td bgcolor="#ffffff" align="left" style="padding: 20px 30px 40px 30px; color: #666666; font-family: 'Lato', Helvetica, Arial, sans-serif; font-size: 18px; font-weight: 400; line-height: 25px;">
                                <p style="margin: 0;">Chúng tôi đã ghi nhận thông tin đăng ký tài khoản của bạn!<br><br>Chúng tôi sẽ kiểm tra thông tin tài khoản và thông báo cho bạn theo email Duy Tân hoặc email cá nhân của bạn!</p>
                            </td>
                        </tr>
                        <tr>
                            <td bgcolor="#ffffff" align="left">
                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td bgcolor="#ffffff" align="center" style="padding: 20px 30px 60px 30px;">
                                            <table border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                                    <td align="center" style="border-radius: 3px;" bgcolor="#ff7361"><a href="/home" style="font-size: 20px; font-family: Helvetica, Arial, sans-serif; color: #ffffff; text-decoration: none; color: #ffffff; text-decoration: none; padding: 15px 25px; border-radius: 2px; border: 1px solid #ff7361; display: inline-block;">Quay lại trang chủ</a></td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr> <!-- COPY -->

                    </table>
                </td>
            </tr>

        </table>


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