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
					<li style="border-left: 3px solid #F06523;" class="category-list"><span class="category-span"><a style="text-decoration: none;"
											onclick="return loading();" href="/job/apply-me">Tôi ứng tuyển</a></span> <span class="category-count">${jobApplyService.sumJobApply(userInfo.id) }</span></li>
					 <c:if test="${userInfo.role.name =='ADMIN' || userInfo.role.name =='MANAGER'|| userInfo.role.name =='TEACHER'|| userInfo.role.name =='ALUMNI' }">
					<li class="category-list"><span class="category-span"><a
							style="text-decoration: none;" onclick="return loading();"
							href="/job/user-post">Tôi đăng tuyển</a></span></span> <span class="category-count">${jobService.findByAuthorId(userInfo.id).size() }</span></li>
					</c:if>
				</ul>
			</div>

			<div class="dang-tin">
				

				<h5 style="font-weight: bold;">BẠN ĐÃ APPLY VÀO ${jobApply.size()} VỊ TRÍ</h5>
				<div class="job-list" style=" box-shadow: 0 2px 2px 0 rgba(0, 0, 0, 0.14), 0 3px 1px -2px rgba(0, 0, 0, 0.2), 0 1px 5px 0 rgba(0, 0, 0, 0.12);"">
				<c:if test="${not empty msg}">
					<div class="alert alert-success fade in alert-dismissible" style="margin-top: 18px;">
						<a href="#" class="close" data-dismiss="alert" aria-label="close" title="close">×</a> <strong>${msg}</strong>
					</div>
				</c:if>
					<c:if test="${not empty jobApply }">
						<c:forEach items="${jobApply }" var="apply">

							<div class="current-tab">
								<div class="job-tab ">
									<div class="name-job ">
										<span class="font-medium ">${apply.job.position }</span> | <span>Công
											${apply.job.companyName }</span> <span> </span>
									</div>
									<div>
										<div class="chia3 ">
											<div>

												<div>
													<i class="fa fa-map-marker" aria-hidden="true"></i> <span
														class=" ">${apply.job.location }</span>
												</div>
											</div>
											<div>
												<div>
													<i class="fa fa-calendar-times-o" aria-hidden="true"></i> <span
														class=" "><fmt:formatDate type="both"
															pattern="dd-MM-yyyy" value="${apply.job.deadlineApply }" /></span>
												</div>

											</div>
											<div>
												<div>
													<i class="fa fa-money" aria-hidden="true"></i> <span
														class=" ">${apply.job.salary }</span>
												</div>
											</div>

										</div>
										<fmt:formatDate var="nows" value="${now}" type="both"
											pattern="dd-MM-yyyy" />
										<c:set var="job_status" value="" />

										<div>
											<c:choose>

												<c:when test="${apply.job.deadlineApply gt now }">
													<c:set var="job_status" value="Đang tuyển" />
													<div class="job-status-open ">${job_status }</div>
												</c:when>
												<c:otherwise>
													<c:set var="job_status" value="Đẵ hết hạn" />
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
														src="/resources/uploads/${apply.member.avatar } "></a>
												</div>


											</div>
											<div class="infor-detail">
												<div>
													<span class="font-medium">Đăng bởi ${apply.member.firstName } ${apply.member.lastName }</span>
												</div>
												<div>
													<span class=" ">Đăng lúc
														<td><i><fmt:formatDate type="both"
																	pattern="dd-MM-yyyy  HH:mm a" value="${apply.job.postedOn }" /></i>
													</span>
												</div>
											</div>
										
											<br>
											
										</div>
										<div>

												<p style="float: right;"><i >Apply CV vào <fmt:formatDate type="both"
																	pattern="dd-MM-yyyy  HH:mm a" value="${apply.applyOn }" /></i></p>
											</div>
										
									</div>
								</div>
							</div>

						</c:forEach>
					</c:if>


					<p class="totop">
						<a href="#top">Back to top</a>
					</p>
					
					<script src="https://code.jquery.com/jquery-1.12.4.min.js"
						integrity="sha384-nvAa0+6Qg9clwYCGGPpDQLVpLNn0fRaROjHqs13t4Ggj3Ez50XnGQqc/r8MhnRDZ"
						crossorigin="anonymous"></script>
					<script
						src="/resources/templates/public/js/jquery.simpleLoadMore.js"></script>
					<script src="/resources/templates/public/js/loading.js"></script>
					<!-- <script src="jquery.simpleLoadMore.js"></script> -->
					<script>
						$('.job-list').simpleLoadMore({
							item : '.current-tab',
							count : 5,
							counterInBtn : true,
							btnText : 'View More {showing}/{total}',
						});
					</script>
					<script type="text/javascript">
						var _gaq = _gaq || [];
						_gaq.push([ '_setAccount', 'UA-36251023-1' ]);
						_gaq.push([ '_setDomainName', 'jqueryscript.net' ]);
						_gaq.push([ '_trackPageview' ]);

						(function() {
							var ga = document.createElement('script');
							ga.type = 'text/javascript';
							ga.async = true;
							ga.src = ('https:' == document.location.protocol ? 'https://ssl'
									: 'http://www')
									+ '.google-analytics.com/ga.js';
							var s = document.getElementsByTagName('script')[0];
							s.parentNode.insertBefore(ga, s);
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