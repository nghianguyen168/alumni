<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/tags/taglib.jsp"%>

<div class="row mt">
<c:set var="contextPath" value="${pageContext.request.contextPath }/admin/news" />
	<div class="col-md-12">
		<div class="content-panel">
		<c:if test="${not empty msg}">
					<div class="alert alert-success fade in alert-dismissible" style="margin-top: 18px;">
						<a href="#" class="close" data-dismiss="alert" aria-label="close" title="close">×</a> <strong>${msg}</strong>
					</div>
				</c:if>
			<table id="event-table" class="table table-striped table-advance table-hover">
				<h4>
					<strong><i class="fa fa-angle-right"></i> QUẢN LÝ SỰ KIỆN</strong>
					<a type="button" href="${pageContext.request.contextPath }/admin/event/add" class="btn btn-success" style="margin-left: 20px;">Thêm tin mới</a>
				</h4>
				<hr>
				
				<thead>
					<tr>
						<th><i class="fa fa-bullhorn"></i> ID</th>
						<th class="hidden-phone"><i class="fa fa-question-circle"></i>
							Sự Kiện</th>
						<th class="hidden-phone"><i class="fa fa-question-circle"></i>
							Bắt đầu</th>
						<th class="hidden-phone"><i class="fa fa-question-circle"></i>
							Kêt thúc</th>
						<th class="hidden-phone"><i class="fa fa-question-circle"></i>
							Địa điêm</th>
						<th><i class="fa fa-bookmark"></i> Mô tả</th>
						<th><i class=" fa fa-edit"></i> Status</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${not empty eventList }">
						<c:forEach items="${eventList }" var="event">
							<tr>
							<td class="hidden-phone">${event.id }</td>
							<td><a href="basic_table.html#">${event.event_name}</a></td>
							<fmt:parseDate pattern="yyyy-MM-dd HH:mm:ss" value="${event.time_start}" var="start" />
							<fmt:parseDate pattern="yyyy-MM-dd HH:mm:ss" value="${event.time_end}" var="end" />
							
							<td><fmt:formatDate type="both" dateStyle="short"  timeStyle="short" value="${start}" /></td>
							<td><fmt:formatDate type="both" dateStyle="short"  timeStyle="short" value="${end}" /></td>
							
							<td>${event.place}</td>
							<td>${event.decription}</a></td>
							<c:choose >
								<c:when test="${event.enable eq 1 }">
									<c:set var="activeImg" value="on.png" />
								</c:when>
								<c:otherwise>
									<c:set var="activeImg" value="off.png" />
								</c:otherwise>
							</c:choose>
							<td id="active_news">
								<div id="eventactive-${event.id }" >
									<a href="javascript:void(0)"><img src="/resources/uploads/${activeImg}"></a>
								</div>
								
								
							</td>
								<script type="text/javascript">
								
								$(document).on('click','#eventactive-${event.id},#eventactive-${event.id}',function(e){
										
												var img =  $('#eventactive-${event.id} img').attr("src");
												
												var idevent = ${event.id}
												
									
												$.ajax({
													url: '${pageContext.request.contextPath}/admin/event/active',
												type : 'POST',
												cache : false,
												data : {
													//(key , value)
													img : img,
													idevent : idevent
												},
												success : function(response) {
													$('#eventactive-${event.id}').load(" #eventactive-${event.id}");
												},
												error : function(response) {
													alert('Có lỗi xảy ra');
												}
											});
											return false;
										});
										
								</script>	
							<td>
								<a href="${pagecontext.request.contextPath}/admin/event/edit/${event.id}" style="margin-top: 10px;" type="button" class="btn btn-primary btn-xs">
									<i class="fa fa-pencil"></i>
								</a>
								<a href="${pagecontext.request.contextPath}/admin/event/del/${event.id}" onclick="return confirm('Bạn có chắc chăn muốn xóa?');" style="margin-top: 10px" type="button" class="btn btn-danger btn-xs">
									<i class="fa fa-trash-o "></i>
								</a>
							</td>
						</tr>
						</c:forEach>
					
					</c:if>
				
						
					
				</tbody>
			</table>
			
		</div>
		<script type="text/javascript">
			$(document).ready(function() {
			    $('#event-table').DataTable( {
			        order: [[0, 'desc']],
			        rowGroup: {
			            dataSrc: 2
			        }
			    } );
			} );
			</script>
		<!-- /content-panel -->
	</div>
	<!-- /col-md-12 -->
</div>