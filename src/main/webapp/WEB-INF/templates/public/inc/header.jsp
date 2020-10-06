<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@include file="/WEB-INF/templates/tags/taglib.jsp"%>
<header>
	<div class="container">
		<div class="logo-dtu">
				<a href="/home"><img src="/resources/templates/public/IMAGE/HEADER/logo1.jpg"></a>
		</div>
		<c:choose>
				<c:when test="${userInfo ne null }">
				<div class="profile-infor">
                <div class="profile-infor2" style="margin-left: 40%;">
                    <a href=""><img src="/resources/uploads/${userInfo.avatar }" alt="" class="comment-avatar">
                        <span style="vertical-align: middle ;">${userInfo.firstName } ${userInfo.lastName}</span></a>
                </div>
                <div>
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


                </div>
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
			url: "/api/admin/logout", 
			type: "GET",
			success: function(result){
				$("#wait").css("display", "none");
	     	 	if(result.code == '200') {
	     	 		localStorage.removeItem("token");
	     	 		localStorage.removeItem("userInfo");
	     	 		window.location = "/login";
	     	 		return;
	     	 	} 
	      	}, 
    	    error: function(xhr, status, error) {
    	    	$("#wait").css("display", "none");
    	    	window.location = "/login";
    		}
		});
	}
	
</script>