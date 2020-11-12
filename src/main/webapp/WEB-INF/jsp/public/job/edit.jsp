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
							href="/job/user-post">Tôi đăng tuyển</a></span></span> <span class="category-count">>${jobService.findByAuthorId(userInfo.id).size() }</span></li>
					</c:if>
				</ul>
			</div>

			<div class="dang-tin">
				
	
				<div class="job-list">
				<div class="" style="background-color: white;">
				<div>
				<br>
					<h5 style="font-weight: bold; color: #33739E; margin-left: 10px;"><i class="fa fa-hand-o-right" aria-hidden="true"></i> Chỉnh sửa tin tuyển dụng</h5>
				</div>
					<form action="${pageContext.request.contextPath }/job/edit/${job.id}"
						method="post">
						<div class="two-cool">
							<div>

								<div class="padding-top">
									<div class="md-form" style="margin-top: 10px;">
										<label for="company">Ngành tuyển dụng</label> <br> <select
											class="form-control" name="major_id" required>
											<option value="" disabled selected>--Chọn ngành bạn
												cần đăng tuyển--</option>
											<c:if test="${not empty majorList }">
												<c:forEach items="${majorList }" var="major">
													<c:choose>
														<c:when test="${job.major.id eq major.id }">
															<option selected="selected" value="${major.id }">${major.majorName}</option>
														</c:when>
														<c:otherwise>
															<option  value="${major.id }">${major.majorName}</option>
														</c:otherwise>
													</c:choose>
													
												</c:forEach>
											</c:if>
										</select>
									</div>
									<div class="md-form" style="margin-top: 10px;">
										<label for="company">Tên công ty</label> <br> <input
											class="form-control" name="companyName" value="${job.companyName }" required type="text"
											id="company" placeholder="Tên công ty">
									</div>
									<div class="md-form" style="margin-top: 10px;">
										<label for="company">Vị trí tuyển dụng</label> <br> <input value="${job.position }"
											class="form-control" required type="text" id="company"
											name="position" placeholder="Vị trí tuyển dụng">
									</div>


								</div>

							</div>
							<div>
								<div class="md-form" style="margin-top: 10px;">
									<label for="company">Địa điểm</label> <br> <input value="${job.location }"
										class="form-control" required type="text" id="company"
										name="location" placeholder="Địa điểm làm việc">
								</div>
								<div class="md-form" style="margin-top: 14px;">
									<label for="company">Hạn tuyển dụng</label> <br> <input value="${job.deadlineApply }"
										class="form-control" required type="date" id="company"
										name="deadlineApply" placeholder="Hạn tuyển dụng">
								</div>
								<div class="md-form" style="margin-top: 10px;">
									<label for="company">Mức lương</label> <br> <input value="${job.salary }"
										class="form-control" required type="text" id="company"
										name="salary" placeholder="Mức lương">
								</div>
							</div>
						</div>
						<div>
							<div class="textfield ">
								<label for="description">Mô tả công việc</label><br>
								<textarea class="form-control" id="decription" name="decription"
									rows="15" placeholder="Mô tả công việc">${job.decription }</textarea>
								<br>

							</div>
						</div>
						<div class="submit-1">
							<button onclick="window.history.go(-1); return false;" type="button" class="btn btn-danger">Hủy</button>
							<button type="submit" class="btn btn-primary">Cập nhật</button>
						</div>
					</form>
					
					
<p class="totop"> 
    <a href="#top">Back to top</a> 
</p>

 <script src="https://code.jquery.com/jquery-1.12.4.min.js" integrity="sha384-nvAa0+6Qg9clwYCGGPpDQLVpLNn0fRaROjHqs13t4Ggj3Ez50XnGQqc/r8MhnRDZ" crossorigin="anonymous"></script>
  <script src="/resources/templates/public/js/jquery.simpleLoadMore.js"></script>
    <script src="/resources/templates/public/js/loading.js"></script>
  <!-- <script src="jquery.simpleLoadMore.js"></script> -->
  <script>
    $('.job-list').simpleLoadMore({
      item: '.current-tab',
      count: 5,
      counterInBtn: true,
      btnText: 'View More {showing}/{total}',
    });
  </script>
  <script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-36251023-1']);
  _gaq.push(['_setDomainName', 'jqueryscript.net']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>
				</div>
					
			</div>
			
		</div>
		<script type="text/javascript">
			CKEDITOR.replace('decription');
		</script>
		</div>
	</div>
</div>