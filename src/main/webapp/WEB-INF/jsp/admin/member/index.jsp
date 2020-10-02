<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/tags/taglib.jsp"%>

<div class="row mt">
	<c:set var="contextPath"
		value="${pageContext.request.contextPath }/admin/news" />
	<div class="col-md-12">
		<div class="content-panel">
			<c:if test="${not empty msg}">
				<div class="alert alert-success fade in alert-dismissible"
					style="margin-top: 18px;">
					<a href="#" class="close" data-dismiss="alert" aria-label="close"
						title="close">×</a> <strong>${msg}</strong>
				</div>
			</c:if>
			<table id="member-table" class="table table-bordered table-striped table-condensed">
			<c:set var="typee" value="" />
			<c:choose>
				<c:when test="${type == 1 }">
					<c:set var="typee" value="CỰU SINH VIÊN" />
				</c:when>
				<c:when test="${type eq 2 }">
					<c:set var="typee" value="SINH VIÊN" />
				</c:when>
				<c:when test="${type eq 3 }">
					<c:set var="typee" value="GIẢNG VIÊN" />
				</c:when>
			</c:choose>
				<h4>
					<strong><i class="fa fa-angle-right"></i> QUẢN LÝ THÀNH VIÊN  <i class="fa fa-angle-right"></i>  ${typee }
						</strong> <a type="button"
						href="${pageContext.request.contextPath }/admin/news/add"
						class="btn btn-success" style="margin-left: 20px;">Thêm Thành Viên</a>
				</h4>
				<hr>
				
				<thead>
					<tr>
						<th><i class="fa fa-bullhorn"></i> ID</th>
						<th>First Name</th>
						<th>Last Name</th>
						<th>Ngày sinh</th>
						<th>Giới tính</th>
						<th>Quê quán</th>
						<th>Chổ ở hiện tại</th>
						<th>Nơi làm việc hiện tại</th>
						<th>Số điện thoại</th>
						<th>Năm tôt nghiệp</th>
						<th><i class=" fa fa-edit"></i> Status</th>
						<th></th>
					</tr>
				</thead>
				<tbody>

			<c:if test="${not empty memberList }">
				<c:forEach items="${memberList }" var="member">
				
				
					<tr>
						<td class="hidden-phone">${member.id }</td>
						<td><a href="basic_table.html#">${member.firstName }</a></td>
						
						<td>${member.lastName}</td>
						<td>${member.dateOfBirth }</td>
						<td>${member.gender }</td>
						<td>${member.hometown }</td>
						<td>${member.addressNow }</td>
						<td>${member.workAt }</td>
						<td>${member.phone }</td>
						<td>${member.yearGreduate }</td>
							<c:set var="activeImg" value="" />
							<c:choose >
								<c:when test="${member.enable eq 1 }">
									<c:set var="activeImg" value="on.png" />
								</c:when>
								<c:otherwise>
									<c:set var="activeImg" value="off.png" />
								</c:otherwise>
							</c:choose>
							<td id="active_member">
								<div  id="memberactive-${member.id }" >
									<a  href="javascript:void(0)"><img style="width: 40px;" src="/resources/uploads/${activeImg}"></a>
								</div>
								
								
							</td>
							<script type="text/javascript">
								
								$(document).on('click','#memberactive-${member.id },#memberactive-${member.id }',function(e){
										
												var img =  $('#memberactive-${member.id } img').attr("src");
												var id = $('#memberactive-${member.id }').val();
												var idmember = ${member.id}
												
									
												$.ajax({
													url: '${pageContext.request.contextPath}/admin/member/active',
												type : 'POST',
												cache : false,
												data : {
													//(key , value)
													img : img,
													idmember : idmember
												},
												success : function(response) {
													$('#memberactive-${member.id }').load(" #memberactive-${member.id }");
												},
												error : function(response) {
													alert('Có lỗi xảy ra');
												}
											});
											return false;
										});
										
								</script>	
						
						<td><a style="margin-top: 10px;" href="${pageContext.request.contextPath }/admin/member/profile/${member.id}" type="button"
							class="btn btn-primary btn-xs"> <i class="fa fa-pencil"></i>
						</a> <a style="margin-top: 10px" type="button"
							class="btn btn-danger btn-xs"> <i class="fa fa-trash-o "></i>
						</a></td>
					</tr>
					
					</c:forEach>
			
			</c:if>

				</tbody>
			</table>
			
			<script type="text/javascript">
			$(document).ready(function() {
			    $('#member-table').DataTable( {
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
	document.getElementById("member").classList.add('active');
	
	
</script>