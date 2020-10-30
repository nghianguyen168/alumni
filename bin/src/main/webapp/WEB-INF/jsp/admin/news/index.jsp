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
			<table id="news-table" class="table table-striped table-advance table-hover">
				<h4>
					<strong><i class="fa fa-angle-right"></i> QUẢN LÝ TIN TỨC ALUMNI</strong>
					<a type="button" href="${pageContext.request.contextPath }/admin/news/add" class="btn btn-success" style="margin-left: 20px;">Thêm tin mới</a>
				</h4>
				<hr>
				
				
				<thead>
					<tr>
						<th><i class="fa fa-bullhorn"></i> ID</th>
						<th class="hidden-phone"><i class="fa fa-question-circle"></i>
							Tên</th>
						<th><i class="fa fa-bookmark"></i> Hình Ảnh</th>
						<th><i class="fa fa-bookmark"></i> Mô tả</th>
						<th><i class=" fa fa-edit"></i> Status</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
				
				<c:if test="${not empty newsList}">
					<c:forEach var="news" items="${newsList}" >
						<tr>
							<td class="hidden-phone"><div id="newsId${news.id}" >${news.id }</div></td>
							<td><a href="basic_table.html#">${news.newsName }</a></td>
							<td><img style="width: 200px;" src="/resources/uploads/${news.picture }"></td>
							<td>${news.decription }</td>
							<c:set var="activeImg" value="" />
							<c:choose >
								<c:when test="${news.enable eq 1 }">
									<c:set var="activeImg" value="on.png" />
								</c:when>
								<c:otherwise>
									<c:set var="activeImg" value="off.png" />
								</c:otherwise>
							</c:choose>
							<td id="active_news">
								<div id="newsactive-${news.id }" >
									<a href="javascript:void(0)"><img src="/resources/uploads/${activeImg}"></a>
								</div>
								
								
							</td>
							
								<script type="text/javascript">
								
								$(document).on('click','#newsactive-${news.id},#newsactive-${news.id}',function(e){
										
												var img =  $('#newsactive-${news.id} img').attr("src");
												var id = $('#newsId${news.id}').val();
												var idnews = ${news.id}
												
									
												$.ajax({
													url: '${pageContext.request.contextPath}/admin/news/active',
												type : 'POST',
												cache : false,
												data : {
													//(key , value)
													img : img,
													idnews : idnews
												},
												success : function(response) {
													$('#newsactive-${news.id}').load(" #newsactive-${news.id}");
												},
												error : function(response) {
													alert('Có lỗi xảy ra');
												}
											});
											return false;
										});
										
								</script>	
						
							<td>
								<a href="${contextPath }/edit/${news.id}" style="margin-top: 10px;" type="button" class="btn btn-primary btn-xs">
									<i class="fa fa-pencil"></i>
								</a>
								<a href="${contextPath }/del/${news.id}" onclick="return confirm('Bạn có chăc chắn muốn xóa?');" style="margin-top: 10px" type="button" class="btn btn-danger btn-xs">
									<i class="fa fa-trash-o "></i>
								</a>
							</td>
								
						</tr>
						
					</c:forEach>
				</c:if>
				</tbody>
			</table>
			<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
			<script src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>
			<script type="text/javascript">
			$(document).ready(function() {
			    $('#news-table').DataTable( {
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
	document.getElementById("news").classList.add('active');
</script>