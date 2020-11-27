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
											onclick="return loading();" href="/job/apply-me">Tôi ứng tuyển</a></span> <span class="category-count">${jobApplyService.sumJobApply(userInfo.id) }</span></li>
					<c:if test="${userInfo.role.name =='ADMIN' || userInfo.role.name =='MANAGER'|| userInfo.role.name =='TEACHER'|| userInfo.role.name =='ALUMNI' }">
					<li class="category-list"><span class="category-span"><a
							style="text-decoration: none;" onclick="return loading();"
							href="/job/user-post">Tôi đăng tuyển</a></span></span> <span class="category-count">${jobService.findByAuthorId(userInfo.id).size() }</span></li>
					</c:if>
				</ul>
			</div>

			<div class="dang-tin">
				

				<h5 style="font-weight: bold;">BẠN CÓ ${jobList.size() } TIN
					TUYỂN DỤNG - CẢM ƠN BẠN ĐÃ CHIA SẺ CÙNG DTU ALUMNI</h5>
				<div class="job-list" style=" box-shadow: 0 2px 2px 0 rgba(0, 0, 0, 0.14), 0 3px 1px -2px rgba(0, 0, 0, 0.2), 0 1px 5px 0 rgba(0, 0, 0, 0.12);"">
				<c:if test="${not empty msg}">
					<div class="alert alert-success fade in alert-dismissible" style="margin-top: 18px;">
						<a href="#" class="close" data-dismiss="alert" aria-label="close" title="close">×</a> <strong>${msg}</strong>
					</div>
				</c:if>
					<c:if test="${not empty jobList }">
						<c:forEach items="${jobList }" var="job">

							<div class="current-tab">
								<div class="job-tab ">
									<div class="name-job ">
										<span class="font-medium ">${job.position }</span> | <span>Công
											${job.companyName }</span> <span> </span>
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
										<fmt:formatDate var="nows" value="${now}" type="both"
											pattern="dd-MM-yyyy" />
										<c:set var="job_status" value="" />

										<div>
											<c:choose>

												<c:when test="${job.deadlineApply gt now }">
													<c:set var="job_status" value="Open" />
													<div class="job-status-open ">${job_status }</div>
												</c:when>
												<c:otherwise>
													<c:set var="job_status" value="Closed" />
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
													<span class="font-medium">Đăng bởi bạn</span>
												</div>
												<div>
													<span class=" ">Đăng lúc
														<td><i><fmt:formatDate type="both"
																	pattern="dd-MM-yyyy  HH:mm a" value="${job.postedOn }" /></i>
													</span>
												</div>
											</div>
											<div style="margin-left: 20px;">
												<br> <span style="margin-left: 60px;"><i
													class="fa fa-eye" aria-hidden="true"></i> ${job.views }</span>
											</div>
											<br>
											<div>

												<a href="/job/apply/${job.id }"><i class="fa fa-hand-o-right"
													aria-hidden="true"></i> Xem danh sách apply cho job này!</a>
											</div>
										</div>
										<ul>
											<a class="btn btn-success btn-sm rounded-0" style="margin-top: 10px;"
												type="button" data-toggle="tooltip" data-placement="top"
												title="Edit" href="/job/edit/${job.id }">
												<i class="fa fa-edit"></i>
											</a>
											
											   <div class="modal fade" id="confirm-delete" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
											        <div class="modal-dialog">
											            <div class="modal-content">
											            
											                <div class="modal-header">
											                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
											                    <h4 class="modal-title" id="myModalLabel">Xác nhận xóa</h4>
											                </div>
											            
											                <div class="modal-body">
											                    <p>Bạn có chắc chắn muốn xóa bài tuyển dụng này?</p>
											                    <p class="debug-url"></p>
											                </div>
											                
											                <div class="modal-footer">
											                    <button style="margin-top: 10px;" type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
											                    <a href="/job/user-post/del/${job.id }" class="btn btn-danger btn-ok">Delete</a>
											                </div>
											            </div>
											        </div>
											    </div>
											
											   <button style="margin-top: 10px;" data-toggle="modal" data-target="#confirm-delete" class="btn btn-danger btn-sm rounded-0" type="button"
												data-toggle="tooltip" data-placement="top" title="Delete">
												<i class="fa fa-trash"></i>
												</button>
											  
											
											
											    <script>
											        $('#confirm-delete').on('show.bs.modal', function(e) {
											            $(this).find('.btn-ok').attr('href', $(e.relatedTarget).data('href'));
											          
											        });
											    </script>

										</ul>
										
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