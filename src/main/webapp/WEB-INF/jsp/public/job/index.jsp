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
							href="/job/user-post">Tôi đăng tuyển</a></span></span> <span class="category-count">${jobService.findByAuthorId(userInfo.id).size() }</span></li>
					</c:if>
				</ul>
			</div>

			<div class="dang-tin" >
			 <c:if test="${userInfo.role.name =='ADMIN' || userInfo.role.name =='MANAGER'|| userInfo.role.name =='TEACHER'|| userInfo.role.name =='ALUMNI' }">
				<div class="banner" style="background-color: #346a98;">
				
					<div>
						<p class="biding">Công ty của bạn muốn tuyển dụng? Hãy chia sẻ
							cơ hội nghề nghiệp với nguồn nhân lực chất lượng của Cộng đồng</p>
					</div>
					<div class="button-dang-viec">
					
						<button class="btn btn-secondary" 
							onclick="document.getElementById('post-job').style.display='block'">
							<span class="material-icons"> add </span>
							<p>Đăng một công việc / thực tập</p>

						</button>
					</div>

				</div></c:if>
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
				<div>
				<div style="float: left; margin-top: 5px;">
					<a data-toggle="modal" data-target="#dangkythongbaojob" style="border: solid 1px red; width: 200px; height: 40px; text-align: center; margin: auto; padding: 10px; text-decoration: none;" href=""><i style="color: red;" class="fa fa-bell-o" aria-hidden="true"></i> Đăng ký nhận email</a>
				<div class="modal fade" id="dangkythongbaojob" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
				  aria-hidden="true">
				  <div class="modal-dialog" role="document">
				    <div class="modal-content">
				      <div class="modal-header text-center">
				        <h4 ><strong>Đăng ký nhận thông báo việc làm</strong></h4>
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				          <span aria-hidden="true">&times;</span>
				        </button>
				      </div>
				      <form action="">
				      <div class="modal-body mx-3">
				     
				
				        <div class="md-form mb-4">
				           <i class="fa fa-envelope" aria-hidden="true"></i>
				          <label data-error="wrong" data-success="right" for="defaultForm-email">Nhập địa chỉ email bạn muốn nhận thông báo</label>
				          <input type="email" required="required" class="form-control"  id="mail-followJob" name="email" aria-describedby="emailHelp" placeholder="Enter email">
				        
				        </div>
				        <br>
				        <div id="messgae-follow">
				        
				        </div>
				
				      </div>
				      <div id="btn_followJob" class="modal-footer d-flex justify-content-center">
				        <a type="button" href=" javascript:void(0);"  class="btn btn-default"><Strong>Đăng ký</Strong></a>
				      </div>
				      </form>
				    </div>
				  </div>
				</div>
				<script type="text/javascript">
								
						function validateEmail(email) {
							  const re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
							  return re.test(email);
							}

								
								$(document).on('click','#btn_followJob,#btn_followJob',function(e){
												var email = $('#mail-followJob').val();
												if(email ===''){
													$('#messgae-follow').html("<div class=\"alert alert-danger\" role=\"alert\">\r\n" + 
															"Vui lòng nhập địa chỉ email  nhận thông báo!\r\n" + 
															"</div>");
													return;
												} 
												if(!validateEmail(email)){
													$('#messgae-follow').html("<div class=\"alert alert-danger\" role=\"alert\">\r\n" + 
															"Vui lòng nhập đúng định dạng email!\r\n" + 
															"</div>");
													return;
												}
												
												$.ajax({
													url: '${pageContext.request.contextPath}/job/follow',
												type : 'POST',
												cache : false,
												data : {
													//(key , value)
													email : email
												},
												success : function(response) {
													
													$('#messgae-follow').html("<div class=\"alert alert-success\" role=\"alert\">\r\n" + 
															"Đăng ký nhận thông báo bài đăng tuyển dụng thành công!\r\n" + 
															"</div>");
												},
												error : function(response) {
													alert('Có lỗi xảy ra');
												}
											});
											return false;
										});
										
								</script>	
			</div>
				<div style="float: right: ;">
					<form action="/job/search" method="post">
					  <div class="input-group" style="width: 50%; float: right; margin-bottom: 20px;">
					    <input type="text" name="search" class="form-control" placeholder="Tìm kiếm tin tuyển dụng...">
					    <div class="input-group-btn">
					      <button class="btn btn-default" type="submit">
					        <i class="glyphicon glyphicon-search"></i>
					      </button>
					    </div>
					  </div>
					</form>
				</div>
				</div>
				<div></div>
				<br>
				<br>
				<c:if test="${searchText ne null }">
					
					<c:choose>
						<c:when test="${countSearch gt 0 }">
						<div class="alert alert-success" role="alert">
							Có <strong>${countSearch } </strong> Công việc <strong> ${searchText } </strong> bạn cần tìm!</div>
						</c:when>
						<c:otherwise>
							<div class="alert alert-danger" role="alert">
							  Không tìm thấy kết quả cho <strong>${searchText }</strong>
							</div>
						</c:otherwise>
					</c:choose>
						
				</c:if>
				
				<div class="job-list">
					<c:if test="${not empty jobList }">
						<c:forEach items="${jobList }" var="job">
					
							<div class="current-tab">
								<div class="job-tab ">
									<div class="name-job ">
										<span class="font-medium ">${job.position }</span> | <span>
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
													<span style="font-size: 12px;" class=" ">Đăng lúc
														<td><i><fmt:formatDate type="both"
																	pattern="dd-MM-yyyy  HH:mm a" value="${job.postedOn }" /></i>
													</span>
													
												</div>
											</div>
											<div style="margin-left:20px;">
											<br>
												<span style="margin-left: 60px;"><i class="fa fa-eye" aria-hidden="true"></i> ${job.views }</span>
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

 <!-- <script src="https://code.jquery.com/jquery-1.12.4.min.js" integrity="sha384-nvAa0+6Qg9clwYCGGPpDQLVpLNn0fRaROjHqs13t4Ggj3Ez50XnGQqc/r8MhnRDZ" crossorigin="anonymous"></script> -->
 
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
