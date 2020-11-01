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
<link href="/resources/templates/public/css/fontawesome.css"
	rel="stylesheet">
<link rel="stylesheet" href="/resources/templates/public/popup_noti/css/style-notify.css">

<!-- css community -->
 <link href="https://cdn.jsdelivr.net/npm/remixicon@2.0.0/fonts/remixicon.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="/resources/templates/public/community/css/congdong.css">
    <link rel="stylesheet" href="/resources/templates/public/community/css/bootstrap.min.css">
  	<link rel="stylesheet" href="/resources/templates/public/community/css/style-group.css">
  	


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
<script src="/resources/templates/public/js/state.js"></script>
<script src="/resources/templates/public/auth.js"></script>
<script src="/resources/templates/public/loading-bar.js"></script>
<script src="/resources/templates/public/loading-bar.min.js"></script>
<script src="/libraries/ckeditor/ckeditor.js"></script>
<script src="/libraries/ckfinder/ckfinder.js"></script>


<!-- JS notify -->
<script src="/resources/templates/public/community/js/jquery.min.js"></script>
<script src="/resources/templates/public/community/js/popper.min.js"></script>
<script src="/resources/templates/public/community/js/bootstrap.min.js"></script>
<script src="/resources/templates/public/community/js/select2.min.js"></script>
<script src="/resources/templates/public/community/js/jquery.magnific-popup.min.js"></script>
<script src="/resources/templates/public/community/js/custom.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert-dev.js"></script>
<script src="components/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.css">
     
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script data-require="jquery@*" data-semver="2.0.3"
	src="http://code.jquery.com/jquery-2.0.3.min.js"></script>
<script data-require="bootstrap@*" data-semver="3.1.1"
	src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>

    <link href="https://cdn.jsdelivr.net/npm/remixicon@2.5.0/fonts/remixicon.css" rel="stylesheet">

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




</body>

<script type="text/javascript">
$('.btn-loading').on('click', function() {
    var $this = $(this);
  $this.button('loading');
    setTimeout(function() {
       $this.button('reset');
   }, 8000);
});


</script>
 <script type="text/javascript" src='https://cdn.jsdelivr.net/gh/vietblogdao/js/districts.min.js'></script>
<script>
if (address_2 = localStorage.getItem('address_2_saved')) {
  $('select[name="calc_shipping_district"] option').each(function() {
    if ($(this).text() == address_2) {
      $(this).attr('selected', '')
    }
  })
  $('input.billing_address_2').attr('value', address_2)
}
if (district = localStorage.getItem('district')) {
  $('select[name="calc_shipping_district"]').html(district)
  $('select[name="calc_shipping_district"]').on('change', function() {
    var target = $(this).children('option:selected')
    target.attr('selected', '')
    $('select[name="calc_shipping_district"] option').not(target).removeAttr('selected')
    address_2 = target.text()
    $('input.billing_address_2').attr('value', address_2)
    district = $('select[name="calc_shipping_district"]').html()
    localStorage.setItem('district', district)
    localStorage.setItem('address_2_saved', address_2)
  })
}
$('select[name="calc_shipping_provinces"]').each(function() {
  var $this = $(this),
    stc = ''
  c.forEach(function(i, e) {
    e += +1
    stc += '<option value=' + e + '>' + i + '</option>'
    $this.html('<option value="">Tỉnh / Thành phố</option>' + stc)
    if (address_1 = localStorage.getItem('address_1_saved')) {
      $('select[name="calc_shipping_provinces"] option').each(function() {
        if ($(this).text() == address_1) {
          $(this).attr('selected', '')
        }
      })
      $('input.billing_address_1').attr('value', address_1)
    }
    $this.on('change', function(i) {
      i = $this.children('option:selected').index() - 1
      var str = '',
        r = $this.val()
      if (r != '') {
        arr[i].forEach(function(el) {
          str += '<option value="' + el + '">' + el + '</option>'
          $('select[name="calc_shipping_district"]').html('<option value="">Quận / Huyện</option>' + str)
        })
        var address_1 = $this.children('option:selected').text()
        var district = $('select[name="calc_shipping_district"]').html()
        localStorage.setItem('address_1_saved', address_1)
        localStorage.setItem('district', district)
        $('select[name="calc_shipping_district"]').on('change', function() {
          var target = $(this).children('option:selected')
          target.attr('selected', '')
          $('select[name="calc_shipping_district"] option').not(target).removeAttr('selected')
          var address_2 = target.text()
          $('input.billing_address_2').attr('value', address_2)
          district = $('select[name="calc_shipping_district"]').html()
          localStorage.setItem('district', district)
          localStorage.setItem('address_2_saved', address_2)
        })
      } else {
        $('select[name="calc_shipping_district"]').html('<option value="">Quận / Huyện</option>')
        district = $('select[name="calc_shipping_district"]').html()
        localStorage.setItem('district', district)
        localStorage.removeItem('address_1_saved', address_1)
      }
    })
  })
})
//]]></script>



</html>