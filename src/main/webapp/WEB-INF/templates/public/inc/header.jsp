<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/tags/taglib.jsp"%>
<header>
	<div class="container">
		<div class="logo-dtu">
			<a href="/home"><img style="width: 30%;"
				src="/resources/templates/public/IMAGE/HEADER/logoit.png"></a>
		</div>

		<div class="iq-top-navbar" style="z-index: 5">
			<div class="iq-navbar-custom" >
				<nav class="navbar navbar-expand-lg navbar-light p-0">
					<button   class="navbar-toggler" type="button" data-toggle="collapse"
						data-target="#navbarSupportedContent"
						aria-controls="navbarSupportedContent"
						aria-label="Toggle navigation">
						<i class="ri-menu-3-line"></i>
					</button>
					<c:choose>
					<c:when test="${userInfo ne null }">
						<div class="collapse navbar-collapse" id="navbarSupportedContent">
						<ul class="navbar-nasv ml-auto navbar-list" >
							<li><a href="/profile/edit"
								class="iq-waves-effect d-flex align-items-center"> <img
									src="/resources/uploads/${userInfo.avatar }" class="img-fluid rounded-circle mr-3"
									alt="user">
									<div class="caption">
										<h6 class="mb-0 line-height">${userInfo.firstName } ${userInfo.lastName}</h6>
									</div>
							</a></li>

							<li class="nav-item" ><a
								class="search-toggle iq-waves-effect" onclick='reloadDIV ();' href=""><i
									class="ri-group-line"><small
									class="badge badge-light float-right" style="margin-top: 18px; border:solid 0.5px #0f74a8; "><span style="color: red; margin-top: 10px;">${newRequestFriendList.size()}</span></small></i></a>
									<script type="text/javascript">
										function reloadDIV () {$('#addfriend1').reload())} 
									</script>
								<div class="iq-sub-dropdown iq-sub-dropdown-large">
									<div class="iq-card shadow-none m-0">
										<div class="iq-card-body p-0 ">
											<div class="bg-primary p-3" id="sum_request">
												<h5 class="mb-0 text-white">
													Yêu cầu kết bạn<small
														class="badge badge-light float-right pt-1" style=""><span style="color: red;">${newRequestFriendList.size()}</span></small>
												</h5>
											</div>
											<div class="iq-friend-request" id="addfriend1">
											<c:if test="${not empty newRequestFriendList }">
													<c:forEach items="${newRequestFriendList }" var="add">
												<div
													class="iq-sub-card iq-sub-card-big d-flex align-items-center justify-content-between" id="request_friend_${add.id }">
													<div class="d-flex align-items-center">
														<div class="">
															<img class="avatar-40 rounded" src="/resources/uploads/${add.member.avatar }"
																alt="">
														</div>
														<div class="media-body ml-3">
															<h6 class="mb-0 ">${add.member.firstName } ${add.member.lastName}</h6>
															<p class="mb-0">40 bạn</p>
														</div>
													</div>
													<div class="d-flex align-items-center" id="friend_${add.id }">
														<a type="button" id="confirm_friend_${add.id }" href="javascript:void();"
															class="mr-3 btn btn-primary rounded">Xác nhận</a> 
														<a  id="del_request_friend_${add.id }" href="javascript:void();"
															class="mr-3 btn btn-secondary rounded">Xóa bỏ yêu cầu</a>
													</div>
													<script type="text/javascript">
								
														$(document).on('click','#confirm_friend_${add.id },#confirm_friend_${add.id }',function(e){
																
																		var id = ${add.id}
																		$.ajax({
																			url: '${pageContext.request.contextPath}/network/confirm',
																		type : 'POST',
																		cache : false,
																		data : {
																			//(key , value)
																			id : id
																		},
																		success : function(response) {
																			$('#friend_${add.id }').html("<button type=\"button\" class=\"btn btn-success\"><i class=\"fa fa-check\" aria-hidden=\"true\"></i>Bạn bè</button>");
																		},
																		error : function(response) {
																			alert('Có lỗi xảy ra');
																		}
																	});
																	return false;
																});
															
													</script>
													<script type="text/javascript">
								
														$(document).on('click','#del_request_friend_${add.id },#del_request_friend_${add.id }',function(e){
																
																		var id = ${add.id}
																		$.ajax({
																			url: '${pageContext.request.contextPath}/network/cancel',
																		type : 'POST',
																		cache : false,
																		data : {
																			//(key , value)
																			id : id
																		},
																		success : function(response) {
																			
																			$('#request_friend_${add.id }').load(" #request_friend_${add.id }");
																			$('#sum_request').load(" #sum_request");
																		},
																		error : function(response) {
																			alert('Có lỗi xảy ra');
																		}
																	});
																	return false;
																});
															
													</script>		
												</div>
												</c:forEach>
												</c:if>
											</div>
										
											<div class="text-center">
												<a href="#" class="mr-3 btn text-primary">Xem thêm yêu
													cầu kết bạn</a>
											</div>
										</div>
									</div>
								</div></li>
							<li class="nav-item"><a href="#"
								class="search-toggle iq-waves-effect"> <i
									class="ri-notification-3-line"></i>
								<c:if test="${eventService.findCommingSoon(0).size() > 0}">
									<small
											class="badge badge-light float-right" style="margin-top: 18px; border:solid 0.5px #0f74a8; "><span style="color: red; margin-top: 10px;">${eventService.findCommingSoon(0).size()}</span></small></i> <!-- <i class="ri-group-line"></i> -->
									<!-- <span class="bg-danger dots"></span> -->
								</c:if><!-- <i class="ri-group-line"></i> -->
									<!-- <span class="bg-danger dots"></span> -->
							</a>
								<div class="iq-sub-dropdown">
									<div class="iq-card shadow-none m-0">
										<div class="iq-card-body p-0 ">
											<div class="bg-primary p-3">
												<h5 class="mb-0 text-white">
													Thông báo<small class="badge  badge-light float-right pt-1"><span style="color: red;">${eventService.findCommingSoon(0).size()}</span></small>
												</h5>
											</div>
											<c:if test="${eventService.findCommingSoon(0).size() >0}">
												<c:forEach items="${eventService.findCommingSoon(0)}" var="event">
													<a href="/event/detail/${event.id}" class="iq-sub-card">
														<div class="media align-items-center">
															<div class="">
																<img class="avatar-40 rounded" src="/resources/uploads/${event.image}"
																	 alt="">
															</div>
															<fmt:parseDate value="${event.timeStart }" pattern="yyyy-MM-dd HH:mm" var="start"/>

															<div class="media-body ml-3">
																<h6 class="mb-0 ">${event.eventName}</h6>
																<small class="float-right font-size-12"><fmt:formatDate value="${start}"  pattern="dd-MM-yyyy HH:mm a"/></small>

															</div>
														</div>
													</a>
												</c:forEach>
											</c:if>


											<div class="text-center">
												<a href="#" class="mr-3 btn text-primary">Xem tất cả
													thông báo</a>
											</div>
										</div>
									</div>
								</div></li>
							<li class="nav-item dropdown"><a href="#"
								class="search-toggle iq-waves-effect"> <i
									class="ri-messenger-line"></i> <!-- <span class="bg-primary count-mail"></span> -->
							</a>
								<div class="iq-sub-dropdown">
									<div class="iq-card shadow-none m-0">
										<div class="iq-card-body p-0 ">
											<div class="bg-primary p-3">
												<h5 class="mb-0 text-white">
													Tin nhắn<small class="badge  badge-light float-right pt-1">4</small>
												</h5>
											</div>
											<a href="#" class="iq-sub-card">
												<div class="media align-items-center">
													<div class="">
														<img class="avatar-40 rounded" src="images/user/01.jpg"
															alt="">
													</div>
													<div class="media-body ml-3">
														<h6 class="mb-0 ">Lê Thanh Hà</h6>
														<small class="float-left font-size-12">13/10/2020</small>
													</div>
												</div>
											</a> <a href="#" class="iq-sub-card">
												<div class="media align-items-center">
													<div class="">
														<img class="avatar-40 rounded" src="images/user/02.jpg"
															alt="">
													</div>
													<div class="media-body ml-3">
														<h6 class="mb-0 ">Lê Thanh Hà</h6>
														<small class="float-left font-size-12">09/10/2020</small>
													</div>
												</div>
											</a> <a href="#" class="iq-sub-card">
												<div class="media align-items-center">
													<div class="">
														<img class="avatar-40 rounded" src="images/user/03.jpg"
															alt="">
													</div>
													<div class="media-body ml-3">
														<h6 class="mb-0 ">Why do we use it?</h6>
														<small class="float-left font-size-12">30 Jun</small>
													</div>
												</div>
											</a> <a href="#" class="iq-sub-card">
												<div class="media align-items-center">
													<div class="">
														<img class="avatar-40 rounded" src="images/user/04.jpg"
															alt="">
													</div>
													<div class="media-body ml-3">
														<h6 class="mb-0 ">Variations Passages</h6>
														<small class="float-left font-size-12">12 Sep</small>
													</div>
												</div>
											</a>

											<div class="text-center">
												<a href="#" class="mr-3 btn text-primary">Xem tất cả tin
													nhắn</a>
											</div>
										</div>
									</div>
								</div></li>
													<li><a href="#"
								class="search-toggle iq-waves-effect d-flex align-items-center">
									<i class="ri-arrow-down-s-fill"></i>

							</a>
								<div class="iq-sub-dropdown iq-user-dropdown">
									<div class="iq-card shadow-none m-0">
										<div class="iq-card-body p-0 ">
											<div class="bg-primary p-3 line-height">
												<h5 class="mb-0 text-white line-height">Xin chào ${userInfo.firstName} ${userInfo.lastName}</h5>
												<span class="text-white font-size-12">Sẵn sàng</span>
											</div>
											<a href="/member/detail/${userInfo.id }" class="iq-sub-card iq-bg-primary-hover">
												<div class="media align-items-center">
													<div class="rounded iq-card-icon iq-bg-primary">
														<i class="ri-file-user-line"></i>
													</div>
													<div class="media-body ml-3">
														<h6 class="mb-0 ">Thông tin của tôi</h6>
														<p class="mb-0 font-size-12">Xem chi tiết hồ sơ cá
															nhân.</p>
													</div>
												</div>
											</a> <a href="/profile/edit" class="iq-sub-card iq-bg-warning-hover">
												<div class="media align-items-center">
													<div class="rounded iq-card-icon iq-bg-warning">
														<i class="ri-profile-line"></i>
													</div>
													<div class="media-body ml-3">
														<h6 class="mb-0 ">Chỉnh sửa thông tin</h6>
														<p class="mb-0 font-size-12">Sửa đổi thông tin cá nhân
															của bạn.</p>
													</div>
												</div>
											</a> <a href="#" class="iq-sub-card iq-bg-info-hover">
												<div class="media align-items-center">
													<div class="rounded iq-card-icon iq-bg-info">
														<i class="ri-account-box-line"></i>
													</div>
													<div class="media-body ml-3">
														<h6 class="mb-0 ">Thiết lập tài khoản</h6>
														<p class="mb-0 font-size-12">Quản lý tài khoản của
															bạn.</p>
													</div>
												</div>
											</a> <a href="#" class="iq-sub-card iq-bg-danger-hover">
												<div class="media align-items-center">
													<div class="rounded iq-card-icon iq-bg-danger">
														<i class="ri-lock-line"></i>
													</div>
													<div class="media-body ml-3">
														<h6 class="mb-0 ">Điều khoản sử dụng</h6>
														<p class="mb-0 font-size-12">Những điều khoản sử dụng</p>
													</div>
												</div>
											</a>
											<div class="d-inline-block w-100 text-center p-3">
												<a class="bg-primary iq-sign-btn" href="/user/logout"  role="button">Đăng
													xuất<i class="ri-login-box-line ml-2"></i>
												</a>
											</div>
										</div>
									</div>
								</div></li>
						</ul>
						
					</div>
		               
               </c:when>
				<c:otherwise>
				<div class="login-align" style="margin-top: 10px;">
				   <ul class="nav navbar-nav navbar-right">
			        <li><a href="/user/register"><span class="glyphicon glyphicon-user"></span> Đăng Ký</a></li>
			        <li><a href="/user/login"><span class="glyphicon glyphicon-log-in"></span> Đăng Nhập</a></li>
			      </ul>
					<!-- <ul>
						<li class="login"><a href="/login">log in</a></li>
						<li class="regiatration"><a href="/Login/register.html">register</a>
						</li>
						<div id="avatarLogin"></div>
					</ul> -->
				</div>
				</c:otherwise>
			</c:choose>
					
				</nav>
			</div>
		</div>
		</div>
</header>
<div id="menu">
	<div class="container ">
		<ul class="navbar">
			<li><a href="/home">Trang Chủ</a></li>
			<li><a href="/news/index">Tin Tức</a></li>
			<li><a href="/event/index">Sự Kiện</a></li>
			<li><a href="/job/index">Việc làm</a></li>
			<li><a href="/community/index/0">Cộng Đồng</a></li>
			<li><a href="/member/index">Cựu Sinh Viên</a></li>
			<li><a href="/home#contact">Liên hệ</a></li>
		</ul>
	</div>
</div>

<script>
$(function(){
	var liElements = $("#menu .container ul li");
	console.log('liElements', liElements);
	for(var i = 0; i < liElements.length; i++){
		var li = liElements[i];
		var hyperlink = $(li).find('a');
		if(!hyperlink){
			continue;
		}
		console.log('hyperlink', hyperlink);
		
		var href = $(hyperlink).attr('href');
		if(href && href.length && location.pathname.startsWith(href)){
			$(li).addClass('active');
		} else {
			$(li).removeClass('active');
		}
	}
})();
</script>

<!-- <script>
	function logout() {
		$("#wait").css("display", "block");
		$.ajax({
			url : "/api/admin/logout",
			type : "GET",
			success : function(result) {
				$("#wait").css("display", "none");
				if (result.code == '200') {
					localStorage.removeItem("token");
					localStorage.removeItem("userInfo");
					window.location = "/user/login";
					return;
				}
			},
			error : function(xhr, status, error) {
				$("#wait").css("display", "none");
				window.location = "/user/login";
			}
		});
	}
</script> -->

