<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/tags/taglib.jsp"%>
<!DOCTYPE div PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<div class="row mt">
	<c:set var="contextPath"
		value="${pageContext.request.contextPath }/admin/job" />
	<div class="col-md-12">
		<div class="content-panel">
			<c:if test="${not empty msg}">
				<div class="alert alert-success fade in alert-dismissible"
					style="margin-top: 18px;">
					<a href="#" class="close" data-dismiss="alert" aria-label="close"
						title="close">×</a> <strong>${msg}</strong>
				</div>
			</c:if>
			<table id="job-table" class="table table-striped table-advance table-hover">
				<h4>
					<strong><i class="fa fa-angle-right"></i> QUẢN LÝ VIỆC LÀM
						ALUMNI</strong> 
				</h4>
				<a type="button" class="btn btn-info" href="/admin/job/export">Xuất báo cáo</a>
				<hr>
				
				<thead>
					<tr>
						<th><i class="fa fa-bullhorn"></i> ID</th>
						<th class="hidden-phone"><i class="fa fa-question-circle"></i>
							Tên công ty
							</th>
						<th><i class=""></i>Vị trí tuyển dụng</th>
						<th><i class=""></i>Ngày đăng</th>
						
						<th><i class=""></i>Hạn nộp</th>
						<th><i class=""></i>Mức lương</th>
						<th><i class=""></i>Địa chỉ</th>
						<th><i class=""></i>Người đăng</th>
						<th>Tổng số Apply</th>
						<th><i class=""></i> Status</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${not empty listJob }">
						<c:forEach items="${listJob }" var="job">
						
						
					<tr>
						<td class="hidden-phone">${job.id }</td>
						<td><a href="basic_table.html#">${job.companyName}</a></td>
						<td><a href="basic_table.html#">${job.position}</a></td>
						<td><fmt:formatDate type="both" pattern="dd-MM-yyyy"  value="${job.postedOn }" /></td>
						<td><fmt:formatDate type="both" pattern="dd-MM-yyyy"  value="${job.deadlineApply }" /></td>
						<td>${job.salary }</td>
						<td>${job.location }</td>
						<td>${job.member.firstName} ${job.member.lastName }</td>
						<td><strong> ${jobApplyService.findByJob(job.id).size()}</strong></td>
						<c:choose >
								<c:when test="${job.enable eq 1 }">
									<c:set var="activeImg" value="on.png" />
								</c:when>
								<c:otherwise>
									<c:set var="activeImg" value="off.png" />
								</c:otherwise>
							</c:choose>
							<td id="active_news">
								<div id="jobactive-${job.id }" >
									<a href="javascript:void(0)"><img src="/resources/uploads/${activeImg}"></a>
								</div>
							</td>
							<script type="text/javascript">
								
								$(document).on('click','#jobactive-${job.id },#jobactive-${job.id }',function(e){
										
												var img =  $('#jobactive-${job.id } img').attr("src");
												
												var idjob = ${job.id}
												$.ajax({
													url: '${pageContext.request.contextPath}/admin/job/active',
												type : 'POST',
												cache : false,
												data : {
													//(key , value)
													img : img,
													idjob : idjob
												},
												success : function(response) {
													$('#jobactive-${job.id }').load(" #jobactive-${job.id }");
												},
												error : function(response) {
													alert('Có lỗi xảy ra');
												}
											});
											return false;
										});
										
								</script>	
						<td><a href="${pageContext.request.contextPath }/admin/job/del/${job.id}" style="margin-top: 10px" type="button"
							class="btn btn-danger btn-xs"> <i class="fa fa-trash-o "></i>
						</a></td>
					</tr>
					</c:forEach>
				</c:if>
				</tbody>
			</table>
		<script type="text/javascript">
			$(document).ready(function() {
			    $('#job-table').DataTable( {
			        order: [[0, 'desc']],
			        rowGroup: {
			            dataSrc: 2
			        }
			    } );
			} );
			</script>
		</div>
		<!-- /content-panel -->
	</div>
	<!-- /col-md-12 -->
</div>
<script>
document.getElementById("home").classList.remove('active');
	document.getElementById("job").classList.add('active');
</script>