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
							cả công việc</span> <span class="category-count">${total }</span></li>
				</a>
					
					<div style="margin: 0; padding: 15px 0 18px;">
						<c:if test="${not empty majorList }">
							<c:forEach items="${majorList }" var="major">

								<li><label> <span class="span-career"><a onclick="return loading();" href="/job/major/${major.id }">${major.majorName}</a></span>
								</label></li>
								
							</c:forEach>
						</c:if>


					</div>
					<li class="category-list"><span class="category-span">Tôi
							đăng tuyển</span> <span class="category-count">0</span></li>
					<li class="category-list"><span class="category-span">Tôi
							ứng tuyển</span> <span class="category-count">0</span></li>

				</ul>
			</div>

			<div class="dang-tin">
				<div class="banner">
					<div>
						<p class="biding">Công ty của bạn muốn tuyển dụng? Hãy chia sẻ
							cơ hội nghề nghiệp với nguồn nhân lực chất lượng của Cộng đồng</p>
					</div>
					<div class="button-dang-viec">
					
						<button class="dang-viec"
							onclick="document.getElementById('post-job').style.display='block'">
							<span class="material-icons"> add </span>
							<p>Đăng một công việc / thực tập</p>

						</button>
					</div>

				</div>
				<div id="post-job">
					<div class="post-job-title">
						Đăng một công việc/thực tập <a style="float: right; color: white;"
							href="javascript:void(0)"
							onclick="document.getElementById('post-job').style.display='none'">Đóng</a>
					</div>
					<form action="${pageContext.request.contextPath }/job/add"
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


													<option value="${major.id }">${major.majorName}</option>
												</c:forEach>
											</c:if>
										</select>
									</div>
									<div class="md-form" style="margin-top: 10px;">
										<label for="company">Tên công ty</label> <br> <input
											class="form-control" name="companyName" required type="text"
											id="company" placeholder="Tên công ty">
									</div>
									<div class="md-form" style="margin-top: 10px;">
										<label for="company">Vị trí tuyển dụng</label> <br> <input
											class="form-control" required type="text" id="company"
											name="position" placeholder="Vị trí tuyển dụng">
									</div>


								</div>

							</div>
							<div>
								<div class="md-form" style="margin-top: 10px;">
									<label for="company">Địa điểm</label> <br> <input
										class="form-control" required type="text" id="company"
										name="location" placeholder="Địa điểm làm việc">
								</div>
								<div class="md-form" style="margin-top: 14px;">
									<label for="company">Hạn tuyển dụng</label> <br> <input
										class="form-control" required type="date" id="company"
										name="deadlineApply" placeholder="Hạn tuyển dụng">
								</div>
								<div class="md-form" style="margin-top: 10px;">
									<label for="company">Mức lương</label> <br> <input
										class="form-control" required type="text" id="company"
										name="salary" placeholder="Mức lương">
								</div>
							</div>
						</div>
						<div>
							<div class="textfield ">
								<label for="description">Mô tả công việc</label><br>
								<textarea class="form-control" id="decription" name="decription"
									rows="15" placeholder="Mô tả công việc"></textarea>
								<br>

							</div>
						</div>
						<div class="submit-1">
							<button class="submit-2" type="next">SUBMIT</button>
						</div>
					</form>
				</div>
				<div></div>
				<br>
	
				<div class="job-list">
					<c:if test="${not empty jobList }">
						<c:forEach items="${jobList }" var="job">
					
							<div class="current-tab">
								<div class="job-tab ">
									<div class="name-job ">
										<span class="font-medium ">${job.position }</span> | <span>Công
											${job.companyName }</span> <span>
										</span>
									</div>
									<div>
										<div class="chia3 ">
											<div>

												<div>
													<i class="fa fa-map-marker" aria-hidden="true"></i> <span
														class=" ">${job.location }</span>
												</div>
											</div>
											<div>
												<div>
													<i class="fa fa-calendar-times-o" aria-hidden="true"></i> <span
														class=" "><fmt:formatDate type="both"
															pattern="dd-MM-yyyy" value="${job.deadlineApply }" /></span>
												</div>

											</div>
											<div>
												<div>
													<i class="fa fa-money" aria-hidden="true"></i> <span
														class=" ">${job.salary }</span>
												</div>
											</div>

										</div>
										<fmt:formatDate var="nows" value="${now}" type="both" pattern="dd-MM-yyyy" /> 
										<c:set var="job_status" value=""/>
										
										<div>
										<c:choose >
											
											<c:when test="${job.deadlineApply gt now }">
													<c:set var="job_status" value="Open"/>
													<div class="job-status-open ">${job_status }</div>
											</c:when>
											<c:otherwise>
												<c:set var="job_status" value="Closed"/>
												<div class="job-status-close ">${job_status }</div>
											</c:otherwise>
										</c:choose>
											

										</div>
									</div>
									<div class="chia2-2 ">
										<div>
											<div class="infor-img">
												<div>
													<a href=" "><img class="comment-avatar "
														src="/resources/uploads/${job.member.avatar } "></a>
												</div>


											</div>
											<div class="infor-detail">
												<div>
													<span class="font-medium">${job.member.firstName }
														${job.member.lastName }</span>
												</div>
												<div>
													<span class=" ">Đăng lúc
														<td><i><fmt:formatDate type="both"
																	pattern="dd-MM-yyyy  HH:mm a" value="${job.postedOn }" /></i>
													</span>
												</div>
											</div>
										</div>
										<ul>
											<li><a class="view " href="/job/detail/${job.id }">CHI TIẾT</a></li>

										</ul>
									</div>
								</div>
							</div>
							
						</c:forEach>
					</c:if>
					
<p class="totop"> 
    <a href="#top">Back to top</a> 
</p>
<div id="wait" style="display:none;width:120px;height:120px;position:absolute;top:50%;left:47%;padding:2px;z-index:3"><img src='/resources/templates/loading8.gif' width="100" height="100" /></div>
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