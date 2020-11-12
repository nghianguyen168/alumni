<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/tags/taglib.jsp"%>
<jsp:useBean id="now" class="java.util.Date" />
<!DOCTYPE html>
<div id="career">
	<div class="container">
		<div class="chia2">
			<div class="danh-muc">
				<div class="sub-title">DANH MỤC VIỆC LÀM</div>
				<ul>
					<a href="/job/index">
						<li class="category-list"><span class="category-span">Tất
								cả công việc</span> <span class="category-count">${sumJob }</span></li>
					</a>

					<div style="margin: 0; padding: 15px 0 18px;">
						<c:if test="${not empty majorList }">
							<c:forEach items="${majorList }" var="major">

								<li><label> <span class="span-career"><a
											onclick="return loading();" href="/job/major/${major.id }">${major.majorName}</a></span>
								</label></li>

							</c:forEach>
						</c:if>


					</div>
					<li class="category-list"><span class="category-span"><a style="text-decoration: none;"
											onclick="return loading();" href="/job/apply-me">Tôi ứng tuyển</a></span> <span class="category-count">${sumApply }</span></li>
					 <c:if test="${userInfo.role.name =='ADMIN' || userInfo.role.name =='MANAGER'|| userInfo.role.name =='TEACHER'|| userInfo.role.name =='ALUMNI' }">
						<li class="category-list"><span class="category-span"><a
							style="text-decoration: none;" onclick="return loading();"
							href="/job/user-post">Tôi đăng tuyển</a></span></span> <span class="category-count">>${jobService.findByAuthorId(userInfo.id).size() } }</span></li>
					</c:if>
				</ul>
			</div>

			<div class="dang-tin"
				style="background: white; box-shadow: 0 2px 2px 0 rgba(0, 0, 0, 0.14), 0 3px 1px -2px rgba(0, 0, 0, 0.2), 0 1px 5px 0 rgba(0, 0, 0, 0.12);">
				<div class="job-list">
					<div class="about-job">
						<p>${job.position }| ${job.companyName }</p>
					</div>
					<div>
						<div class=""></div>
						<div class="basic-title" style="padding-left: 10px; color: blue;">
							<i class="fa fa-file-text" aria-hidden="true"
								style="color: blue;"></i> Thông tin cơ bản
						</div>
						<div>
							<div class="basic">
								<!-- <div class="chia2">
									<div>
										<i class="fa fa-building" aria-hidden="true">Tên Công Ty</i>
										<p style="padding-left: 18px;">Công ty Hybrid Technologies</p>
									</div>
									<div>
										<i class="fa fa-money" aria-hidden="true"> Mức Lương</i>
										<p style="padding-left: 18px;">Up to $1000</p>
									</div>
									<div>
										<i class="fa fa-money" aria-hidden="true"> Mức Lương</i>
										<p style="padding-left: 18px;">Up to $1000</p>
									</div>
									
								</div> -->
								<div class="chia2" style="margin-left: 20px;">
									<div  style="width: 200px;">
										<strong><i
											style="font-size: 16px; font-weight: bold;"
											class="fa fa-building" aria-hidden="true"> Công Ty:</i></strong>
										<p style="padding-left: 18px;">${job.companyName }</p>
									</div>
									<div  style="width: 200px;">
										<i style="font-size: 16px; font-weight: bold;"
											class="fa fa-map-marker" aria-hidden="true"> Địa điểm làm
											việc:</i>
										<p style="padding-left: 10px;">${job.location }</p>
									</div>
									<div  style="width: 200px;">
										<i style="font-size: 16px; font-weight: bold;"
											class="fa fa-check" aria-hidden="true"> Vị trí tuyển dụng</i>
										<p style="padding-left: 18px;">${job.position }</p>
									</div>

									<div style="width: 200px;">
										<i style="font-size: 16px; font-weight: bold;"
											class="fa fa-money" aria-hidden="true"> Mức lương</i>
										<p style="padding-left: 18px;">${job.salary}</p>
										<div style="width: 200px;">
											<i style="font-size: 16px; font-weight: bold;"
												class="fa fa-calendar-times-o" aria-hidden="true"> Hạn
												tuyển:</i>
											<p style="padding-left: 18px;">${job.deadlineApply }</p>
										</div>

									</div>
									<br>


								</div>
							</div>



							<div class="description">
								<div class="basic-title"
									style="padding-left: 10px; color: blue;">
									<i class="fa fa-file-text" aria-hidden="true"
										style="color: blue;"></i> Mô tả chi tiết tuyển dụng
								</div>
								<div style="margin-left: 30px;">
									<p>${job.decription }</p>

								</div>

							</div>


							<div class="post-by">
								<div class="basic-title"
									style="padding-left: 10px; color: blue;">
									<i class="fa fa-user" aria-hidden="true" style="color: blue;"></i>
									Post by

								</div>
								<div
									style="padding-left: 40px; padding-bottom: 5px; padding-top: 5px;">
									<div class="infor ">
										<div>
											<a href=" "><img class="comment-avatar "
												src="/resources/uploads/${job.member.avatar }"></a>
										</div>

										<div class="infor-font" >
											<div>
												<span  class="font-medium ">${job.member.firstName}
													${job.member.lastName}</span>
											</div>
											<div>
												<span class=" ">Đăng tuyển lúc:  <fmt:formatDate type="both"
																	pattern="dd-MM-yyyy  HH:mm a" value="${job.postedOn}" /> </span>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="contact">
								<div class="basic-title"
									style="padding-left: 10px; color: blue;">
									<i class="fa fa-envelope" aria-hidden="true"
										style="color: blue;"></i> Contact
								</div>

								<div style="padding-left: 35px; padding-bottom: 5px;">
									<p>
										DTU Mail: <a style="display: inline;" href="mailto: ${job.member.dtuMail}">${job.member.dtuMail}</a>
									</p>
									<p>
									    Email cá nhân: <a style="display: inline;" href="mailto: ${job.member.email}">${job.member.email}</a>
									</p>

								</div>
							</div>
							<div class="apply">
								<div class="basic-title"
									style="padding-left: 10px; color: blue;">
									<i class="fa fa-file-text" aria-hidden="true"
										style="color: blue;"></i> Gửi CV cho người đăng tuyển
								</div>
								<div style="padding-left: 35px; padding-bottom: 5px;">
									<form action="/job/apply/${job.id }" method="post" enctype="multipart/form-data">
										<label for="myfile">Chọn files:</label> <input type="file" 
											id="cvfile" name="cvfile" required><br>
										<div class="apply-1">
											<button class="apply-2" id="uploadButton" type="next" >APPLY</button>
										</div>
										<script type="text/javascript">
										  $("#cvfile").change(function () {
										        var fileExtension = ['pdf', 'docx'];
										        if ($.inArray($(this).val().split('.').pop().toLowerCase(), fileExtension) == -1) {
										        	$('#uploadButton').attr('disabled','disabled');
										            alert("Chỉ châp nhận định dạng : "+fileExtension.join(', '));
										        } else{
										        	$('#uploadButton').removeAttr('disabled','disabled');
										        	
										        	
										        }
										    });
										</script>
									</form>
								</div>
							</div>
						</div>


					</div>
					<script type="text/javascript">
						CKEDITOR.replace('decription');
					</script>
				</div>
			</div>