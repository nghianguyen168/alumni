<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/tags/taglib.jsp"%>
<header>
	<div class="container">
		<div class="logo-dtu">
			<a href="/home"><img
				src="/resources/templates/public/IMAGE/HEADER/logo1.jpg"></a>
		</div>
<<<<<<< HEAD

		<div class="profile-infor">
			<div class="profile-infor2">
				<a href=""><img src="IMAGE/IMG/thanhha.jpg" alt=""
					class="comment-avatar"> <span style="vertical-align: super;">Lê
						Thanh Hà</span></a>
			</div>
			<div>

				<div class="menu-item">
					<div class="dropbtn">
						<span class="material-icons"> notifications </span>

					</div>
					<div class="dropdown-content">
						<ul>
							<li>
								<p href="" style="text-align: center; color: red; padding: 5px;">Thông
									báo</p>
							</li>
							<li style="display: inline;"><a
								href="https://www.google.com.vn/">
									<div style="float: left; padding: 5px;">
										<img src="IMAGE/IMG/thanhha.jpg" class="comment-avatar" alt="">
									</div>
									<p style="float: right; overflow: hidden;">
									<p class="style-p" style="color: blue; padding-top: 9px;">Mai
										9h nhậu nha</p> <!-- <p class="style-p"><br></p> -->
									<p class="style-p" style="font-size: 12px; color: gray;">10-10-2020</p>
									</p>
							</a></li>

							<li style="display: inline;"><a href="#">
									<div style="float: left; padding: 5px;">
										<img src="IMAGE/IMG/thanhha.jpg" class="comment-avatar" alt="">
									</div>
									<p style="float: right; overflow: hidden;">
									<p class="style-p" style="color: blue; padding-top: 9px;">Mai
										9h nhậu nha</p>
									<p class="style-p" style="font-size: 12px; color: gray;">10-10-2020</p>
									</p>
							</a></li>
							<li style="display: inline;"><a href="#">
									<div style="float: left; padding: 5px;">
										<img src="IMAGE/IMG/thanhha.jpg" class="comment-avatar" alt="">
									</div>
									<p style="float: right; overflow: hidden;">
									<p class="style-p" style="color: blue; padding-top: 9px;">Thay
										đổi giao diện website</p>
									<p class="style-p" style="font-size: 12px; color: gray;">10-10-2020</p>
									</p>
							</a></li>
							<li><a href=""
								style="text-align: center; color: red; border-top: 1px solid rgba(0, 0, 0, 0.1);">Xem
									thêm</a></li>
						</ul>
					</div>

				</div>
				<div class="menu-item">

					<!-- <span class="material-icons">
                            message
                            </span> -->


					<div class="dropbtn">
						<span class="material-icons"> message </span>

					</div>
					<div class="dropdown-content">
						<ul>
							<li>
								<p href="" style="text-align: center; color: red; padding: 5px;">Tin
									nhắn</p>
							</li>
							<li style="display: inline;"><a href="#">
									<div style="float: left; padding: 5px;">
										<img src="IMAGE/IMG/thanhha.jpg" class="comment-avatar" alt="">
									</div>
									<p style="float: right; overflow: hidden;">
									<p class="style-p" style="color: blue;">Le Thanh Ha</p>
									<p class="style-p">hello you</p>
									<p class="style-p" style="font-size: 12px; color: gray;">10-10-2020</p>
									</p>
							</a></li>
							<li style="display: inline;"><a href="#">
									<div style="float: left; padding: 5px;">
										<img src="IMAGE/IMG/thanhha.jpg" class="comment-avatar" alt="">
									</div>
									<p style="float: right; overflow: hidden;">
									<p class="style-p" style="color: blue;">Le Thanh Ha</p>
									<p class="style-p">hello you</p>
									<p class="style-p" style="font-size: 12px; color: gray;">10-10-2020</p>
									</p>
							</a></li>
							<li style="display: inline;"><a href="#">
									<div style="float: left; padding: 5px;">
										<img src="IMAGE/IMG/thanhha.jpg" class="comment-avatar" alt="">
									</div>
									<p style="float: right; overflow: hidden;">
									<p class="style-p" style="color: blue;">Le Thanh Ha</p>
									<p class="style-p">hello you</p>
									<p class="style-p" style="font-size: 12px; color: gray;">10-10-2020</p>
									</p>
							</a></li>
							<li><a href=""
								style="text-align: center; color: red; padding: 5px; border-top: 1px solid rgba(0, 0, 0, 0.1);">Xem
									thêm</a></li>
						</ul>
					</div>

				</div>

				<div class="menu-item">
					<div class="dropbtn">
						<span class="material-icons"> more_vert </span>

					</div>
					<div class="dropdown-content">
						<ul>
							<li><a href="" style="line-height: 30px;">Thiết lập</a></li>
							<li><a href="" style="line-height: 30px;">Thông tin của
									tôi</a></li>
							<li><a href="" style="line-height: 30px;">Các mối quan
									hệ của tôi</a></li>
							<li><a href="" style="line-height: 30px;">Điều khoản sử
									dụng</a></li>
							<li><a href="" style="line-height: 30px;">Đăng xuất</a></li>
						</ul>
					</div>
				</div>


			</div>

			<%-- <c:choose>
=======
		
		<c:choose>
>>>>>>> 362b32b5395550382094702250b2bd383cefa469
				<c:when test="${userInfo ne null }">
				<div class="profile-infor">
                <div class="profile-infor2" style="margin-left: 40%;">
                    <a href=""><img src="/resources/uploads/${userInfo.avatar }" alt="" class="comment-avatar">
                        <span style="vertical-align: middle ;">${userInfo.firstName } ${userInfo.lastName}</span></a>
                </div>
                  <div>
                    <div class="menu-item">
                        <div class="dropbtn">
                            <span class="material-icons">
                                notifications
                                    </span>
                        </div>
                        <div class="dropdown-content">
                            <ul>
                                <li>
                                    <p href="" style="text-align: center;color: red; padding: 5px;">Thông báo</p>
                                </li>
                                <li style="display: inline; ">
                                    <a href="https://www.google.com.vn/">
                                        <div style="float: left; padding: 5px;">
                                            <img src="/resources/uploads/nghia.jpg" class="comment-avatar" alt="">
                                        </div>
                                        <p style="float: right; overflow: hidden;">
                                            <p class="style-p" style="color: blue; padding-top: 9px;">Mai 9h nhậu nha</p>
                                            <p class="style-p" style="font-size: 12px; color: gray;">10-10-2020</p>
                                        </p>
                                    </a>
                                </li>

                                <li style="display: inline;">
                                    <a href="#">
                                        <div style="float: left; padding: 5px;">
                                            <img src="/resources/uploads/nghia.jpg" class="comment-avatar" alt="">
                                        </div>
                                        <p style="float: right; overflow: hidden;">
                                            <p class="style-p" style="color: blue; padding-top: 9px;">Mai 9h nhậu nha</p>
                                            <p class="style-p" style="font-size: 12px; color: gray;">10-10-2020</p>
                                        </p>
                                    </a>
                                </li>
                                <li style="display: inline;">
                                    <a href="#">
                                        <div style="float: left; padding: 5px;">
                                            <img src="/resources/uploads/nghia.jpg" class="comment-avatar" alt="">
                                        </div>
                                        <p style="float: right; overflow: hidden;">
                                            <p class="style-p" style="color: blue;padding-top: 9px;">Thay đổi giao diện website</p>
                                            <p class="style-p" style="font-size: 12px; color: gray;">10-10-2020</p>
                                        </p>
                                    </a>
                                </li>
                                <li>
                                    <a href="" style="text-align: center;color: red; border-top: 1px solid rgba(0, 0, 0, 0.1);">Xem thêm</a>
                                </li>
                            </ul>
                        </div>

                    </div>
                    <div class="menu-item">
                        <div class="dropbtn">
                            <span class="material-icons">
                                    message
                                    </span>
                        </div>
                        <div class="dropdown-content">
                            <ul>
                                <li>
                                    <p href="" style="text-align: center;color: red; padding: 5px;">Tin nhắn</p>
                                </li>
                                <li style="display: inline; ">
                                    <a href="#">
                                        <div style="float: left; padding: 5px;">
                                            <img src="/resources/uploads/nghia.jpg" class="comment-avatar" alt="">
                                        </div>
                                        <p style="float: right; overflow: hidden;">
                                            <p class="style-p" style="color: blue;">Le Thanh Ha</p>
                                            <p class="style-p">hello you</p>
                                            <p class="style-p" style="font-size: 12px; color: gray;">10-10-2020</p>
                                        </p>
                                    </a>
                                </li>
                                <li style="display: inline;">
                                    <a href="#">
                                        <div style="float: left; padding: 5px;">
                                            <img src="/resources/uploads/nghia.jpg" class="comment-avatar" alt="">
                                        </div>
                                        <p style="float: right; overflow: hidden;">
                                            <p class="style-p" style="color: blue;">Le Thanh Ha</p>
                                            <p class="style-p">hello you</p>
                                            <p class="style-p" style="font-size: 12px; color: gray;">10-10-2020</p>
                                        </p>
                                    </a>
                                </li>
                                <li style="display: inline;">
                                    <a href="#">
                                        <div style="float: left; padding: 5px;">
                                            <img src="/resources/uploads/nghia.jpg" class="comment-avatar" alt="">
                                        </div>
                                        <p style="float: right; overflow: hidden;">
                                            <p class="style-p" style="color: blue;">Le Thanh Ha</p>
                                            <p class="style-p">hello you</p>
                                            <p class="style-p" style="font-size: 12px; color: gray;">10-10-2020</p>
                                        </p>
                                    </a>
                                </li>
                                <li>
                                    <a href="" style="text-align: center;color: red; padding: 5px;border-top: 1px solid rgba(0, 0, 0, 0.1);">Xem thêm</a>
                                </li>
                            </ul>
                        </div>

                    </div>



                    <div class="menu-item">
                        <div class="dropbtn">
                            <span class="material-icons">
                                more_vert
                                </span>

                        </div>
                        <div class="dropdown-content">
                            <ul>
                                <li>
                                    <a href="" style="line-height: 30px;">Thiết lập</a>
                                </li>
                                <li>
                                    <a href="" style="line-height: 30px;">Thông tin của tôi</a>
                                </li>
                                <li>
                                    <a href="" style="line-height: 30px;">Các mối quan hệ của tôi</a>
                                </li>
                                <li>
                                    <a href="" style="line-height: 30px;">Điều khoản sử dụng</a>
                                </li>
                                <li>
                                    <a href="" style="line-height: 30px;">Đăng xuất</a>
                                </li>
                            </ul>
                        </div>
                    </div>

                </div>
               <!--  <div>
                    <div>
                        <span class="material-icons">
                            notifications
                            </span>
                    </div>
                    <div>
                        <span class="material-icons">
                            message
                            </span>
                    </div>


                    <div class="menu-item">

                        <div class="dropbtn">
                            <span class="material-icons">
                                more_vert
                                </span>
                        </div>

                        <div class="dropdown-content" >
                            <ul> 
                                <li>
                                    <a href="">Thiết lập</a>
                                </li>
                                <li>
                                    <a href="">Thông tin của tôi</a>
                                </li>
                                <li>
                                    <a href="">Các mối quan hệ của tôi</a>
                                </li>
                                <li>
                                    <a href="">Điều khoản sử dụng</a>
                                </li>
                                <li>
                                    <a href="/logout">Đăng xuất</a>
                                </li>
                            </ul>
                        </div>

                    </div>


                </div> -->
            </div>
				
				</c:when>
				<c:otherwise>
				<div class="login-align">
					<ul>
						<li class="login"><a href="/login">log in</a></li>
						<li class="regiatration"><a href="/Login/register.html">register</a>
						</li>
						<div id="avatarLogin"></div>
					</ul>
				</div>
				</c:otherwise>
			</c:choose>
		   --%>


		</div>
</header>
<div id="menu">
	<div class="container">
		<ul>
			<li><a href="">Tin Tức</a></li>
			<li><a href="">Sự Kiện</a></li>
			<li><a href="/job/index">Nghề nghiệp</a></li>
			<li><a href="Nhom.html">Cộng Đồng</a></li>
			<li><a href="CuuSinhVien.html">Cựu Sinh Viên</a></li>
			<li><a href="">Thêm</a></li>
		</ul>
	</div>
</div>
<script>
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
					window.location = "/login";
					return;
				}
			},
			error : function(xhr, status, error) {
				$("#wait").css("display", "none");
				window.location = "/login";
			}
		});
	}
</script>