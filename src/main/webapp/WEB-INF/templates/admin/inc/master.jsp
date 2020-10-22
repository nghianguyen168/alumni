<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/tags/taglib.jsp"%>
<!DOCTYPE html>

<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="Dashboard">
  <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
  <title>DTU-Alumni : Trang quản trị</title>

   <link href="/resources/templates/admin/img/dt.png" rel="icon">
  <link href="/resources/templates/admin/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Bootstrap core CSS -->
  <link href="/resources/templates/admin/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!--external css-->
  <link href="/resources/templates/admin/lib/font-awesome/css/font-awesome.css" rel="stylesheet" />
  <link rel="stylesheet" type="text/css" href="/resources/templates/admin/css/zabuto_calendar.css">
  <link rel="stylesheet" type="text/css" href="/resources/templates/admin/lib/gritter/css/jquery.gritter.css" />
  <!-- Custom styles for this template -->
  <link href="/resources/templates/admin/css/style.css" rel="stylesheet" />
  <link href="/resources/templates/admin/css/style-responsive.css" rel="stylesheet">
  <script src="/resources/templates/admin/lib/chart-master/Chart.js"></script>
    <script src="/libraries/ckeditor/ckeditor.js"></script>
     <script src="/libraries/ckfinder/ckfinder.js"></script>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>
<script src="/resources/templates/auth.js"></script>
    

  <!-- =======================================================
    Template Name: Dashio
    Template URL: https://templatemag.com/dashio-bootstrap-admin-template/
    Author: TemplateMag.com
    License: https://templatemag.com/license/
  ======================================================= -->
</head>

<body>
  <section id="container">
    <!-- **********************************************************************************************************************************************************
        TOP BAR CONTENT & NOTIFICATIONS
        *********************************************************************************************************************************************************** -->
    <!--header start-->
    <header class="header black-bg">
       <tiles:insertAttribute name="navbar" />
    </header>
    <!--header end-->
    <!-- **********************************************************************************************************************************************************
        MAIN SIDEBAR MENU
        *********************************************************************************************************************************************************** -->
    <!--sidebar start-->
    <aside>
      <div id="sidebar" class="nav-collapse ">
        <!-- lefbar ở đây-->
        <tiles:insertAttribute name="sidebar" />
        </div>
    </aside>
    <!--sidebar end-->
    <!-- **********************************************************************************************************************************************************
        MAIN CONTENT
        *********************************************************************************************************************************************************** -->
    <!--main content start-->
    <section id="main-content">
      <section class="wrapper">
        <!--Dat content ow day-->
         <tiles:insertAttribute name="content" />
        
      </section>
    </section>
    <!--main content end-->
    <!--footer start-->
    <footer class="site-footer">
      <!--footer để ở đây-->
       <tiles:insertAttribute name="footer" />
    </footer>
    <!--footer end-->
   
  </section>
  <!-- js placed at the end of the document so the pages load faster -->


  <script src="/resources/templates/admin/lib/bootstrap/js/bootstrap.min.js"></script>
  <script class="include" type="text/javascript" src="/resources/templates/admin/lib/jquery.dcjqaccordion.2.7.js"></script>
  <script src="/resources/templates/admin/lib/jquery.scrollTo.min.js"></script>
  <script src="/resources/templates/admin/lib/jquery.nicescroll.js" type="text/javascript"></script>
  <script src="/resources/templates/admin/lib/jquery.sparkline.js"></script>
  <!--common script for all pages-->
  <script src="/resources/templates/admin/lib/common-scripts.js"></script>
  <script type="text/javascript" src="/resources/templates/admin/lib/gritter/js/jquery.gritter.js"></script>
  <script type="text/javascript" src="/resources/templates/admin/lib/gritter-conf.js"></script>
  <!--script for this page-->
  <script src="/resources/templates/admin/lib/sparkline-chart.js"></script>
  <script src="/resources/templates/admin/lib/zabuto_calendar.js"></script>

<!-- Bootstrap 4 -->

<!-- DataTables -->
<script src="/resources/templates/admin/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="/resources/templates/admin/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
<script src="/resources/templates/admin/plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
<script src="/resources/templates/admin/plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
  <script type="text/javascript">
    $(document).ready(function() {
      var unique_id = $.gritter.add({
        // (string | mandatory) the heading of the notification
        title: 'Welcome to Dashio!',
        // (string | mandatory) the text inside the notification
        text: 'Hover me to enable the Close Button. You can hide the left sidebar clicking on the button next to the logo. Developed by <a href="http://alvarez.is" target="_blank" style="color:#4ECDC4">Alvarez.is</a>.',
        // (string | optional) the image to display on the left
        image: 'img/ui-sam.jpg',
        // (bool | optional) if you want it to fade out on its own or just sit there
        sticky: false,
        // (int | optional) the time you want it to be alive for before fading out
        time: 8000,
        // (string | optional) the class name you want to apply to that specific message
        class_name: 'my-sticky-class'
      });

      return false;
    });
  </script>
  <script type="application/javascript">
    $(document).ready(function() {
      $("#date-popover").popover({
        html: true,
        trigger: "manual"
      });
      $("#date-popover").hide();
      $("#date-popover").click(function(e) {
        $(this).hide();
      });

      $("#my-calendar").zabuto_calendar({
        action: function() {
          return myDateFunction(this.id, false);
        },
        action_nav: function() {
          return myNavFunction(this.id);
        },
        ajax: {
          url: "show_data.php?action=1",
          modal: true
        },
        legend: [{
            type: "text",
            label: "Special event",
            badge: "00"
          },
          {
            type: "block",
            label: "Regular event",
          }
        ]
      });
    });

    function myNavFunction(id) {
      $("#date-popover").hide();
      var nav = $("#" + id).data("navigation");
      var to = $("#" + id).data("to");
      console.log('nav ' + nav + ' to: ' + to.month + '/' + to.year);
    }
  </script>
  
 


</body>

</html>
