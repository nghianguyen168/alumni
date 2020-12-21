<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/tags/taglib.jsp"%>

<div class="row mt">
	<c:set var="contextPath"
		value="${pageContext.request.contextPath }/admin/member" />
	<div class="col-md-12">
		<div class="content-panel">

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
					<div style="display: inline;">
						<strong><i class="fa fa-angle-right"></i> QUẢN LÝ THÀNH VIÊN  <i class="fa fa-angle-right"></i>  ${roleService.findById(typeId).getName() }
							</strong> <a type="button"
							href="${pageContext.request.contextPath }/admin/member/type-add"
							class="btn btn-success" style="margin-left: 20px;">Thêm Thành Viên</a>
						<div style="float: right;">
								<form action="/admin/member/search" method="post" style="float: right; margin-left: 200px;" >
									<select id="type-select" name="role_id"
										class="browser-default custom-select custom-select-lg mb-3"
										onchange="this.form.submit()">
										<option value="0">-- Chọn kiểu thành viên --</option>
										<c:if test="${not empty roleService.findAll()}">
											<c:forEach items="${roleService.findAll() }" var="role">
												<c:if test="${role.name !='ADMIN'}">
													<c:choose>
														<c:when test="${typeId == role.id}">
															<option selected value="${role.id }">${role.name }</option>
														</c:when>
														<c:otherwise>
															<option  value="${role.id }">${role.name }</option>
														</c:otherwise>
													</c:choose>
												</c:if>

											</c:forEach>
										</c:if>
									</select>
									</select>
									<select id="type-select" name="role_id"
											class="browser-default custom-select custom-select-lg mb-3"
											onchange="this.form.submit()">
										<option value="0">-- Chọn kiểu thành viên --</option>
										<c:if test="${not empty roleService.findAll()}">
											<c:forEach items="${roleService.findAll() }" var="role">
												<c:if test="${role.name !='ADMIN'}">
													<c:choose>
														<c:when test="${typeId == role.id}">
															<option selected value="${role.id }">${role.name }</option>
														</c:when>
														<c:otherwise>
															<option  value="${role.id }">${role.name }</option>
														</c:otherwise>
													</c:choose>
												</c:if>

											</c:forEach>
										</c:if>
									</select>
									</select>


							</form>
					</div>
					</div>
					<%--<div class="dropdown">
						<button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">Thêm thành viên<span class="caret"></span></button>
						<ul class="dropdown-menu">
							<li><a href="#">Thêm theo thành viên</a></li>
							<li><a href="${pageContext.request.contextPath }/admin/member/add">Thêm theo danh dách</a></li>

						</ul>
					</div>--%>
				</h4>
				<c:if test="${not empty msg1}">
					<div  class="alert alert-success fade in alert-dismissible"
						 style="margin-top: 18px;width: 30%; margin: 0 auto;">
						<a href="#" class="close" data-dismiss="alert"
						   title="close">×</a> <span> Thêm <strong> ${sumRecord- sizeDup} </strong>  thành viên thành công <br>
						<span style="color: #cb2020;"><strong>${sizeDup} </strong> thành viên đã tồn tại!</span>
						</span>

					</div>
				</c:if>
				<c:if test="${not empty msg}">
					<div class="alert alert-success fade in alert-dismissible" style="margin-top: 18px; width: 30%;margin-left: 30%;	">
						<a href="#" class="close" data-dismiss="alert" aria-label="close" title="close">×</a> <strong>${msg}</strong>
					</div>
				</c:if>
				<hr>
				
				<thead>
					<tr>
						<th><i class="fa fa-bullhorn"></i> ID</th>
						<th>First Name</th>
						<th>Last Name</th>
						<th>MSSV</th>
						<th>Kiểu thành viên</th>
						<th>Ngày sinh</th>
						<th>Giới tính</th>
						<th>DTU Mail</th>
						<th>Email Cá Nhân</th>
						<th>Quê quán</th>
						<th>Chổ ở hiện tại</th>
						<th>Nơi làm việc hiện tại</th>
						<th>Khóa</th>
						<th>Khoa</th>
						<th>Số điện thoại</th>
						<th><i class=" fa fa-edit"></i>Trạng thái</th>
						<th><i class=" fa fa-edit"></i>Xác nhận</th>
						<th></th>
					</tr>
				</thead>
				<tbody>

			<c:if test="${not empty memberList }">
				<c:forEach items="${memberList }" var="member">
				
				
					<tr>
						<td class="hidden-phone">${member.id }</td>
						<td><a href="">${member.firstName }</a></td>
						
						<td><a href="">${member.lastName}</a></td>
						<td>${member.studentId}</td>
						<td>${member.role.name}</td>
						<td>${member.dateOfBirth }</td>
						<td>${member.gender }</td>
						<td>${member.dtuMail}</td>
						<td>${member.email }</td>
						<td>${member.hometown },${member.country}</td>
						<td>${member.addressNow }</td>
						<td>${member.workAt }</td>
						<td>${member.kn.k }</td>
						<td>${member.faculty.facultyName }</td>
						<td>${member.phone }</td>
							<c:set var="activeImg" value="" />
							<c:choose >
								<c:when test="${member.enable eq 1 }">
									<c:set var="activeImg" value="on.png" />
								</c:when>

								<c:otherwise>
									<c:set var="activeImg" value="off.png" />
								</c:otherwise>
							</c:choose>
							<td id="active_member-${member.id}" style="text-align: center;">

								<c:choose >
									<c:when test="${member.enable eq 2 }">

										<span class="label label-warning label-mini">Mới</span>
									</c:when>
									<c:otherwise>
										<div  id="memberactive-${member.id }" >
											<a  href="javascript:void(0)"><img style="width: 40px;" src="/resources/uploads/${activeImg}"></a>
										</div>
									</c:otherwise>
								</c:choose>

							</td>

							<td style="text-align: center;">
								<c:if test="${member.enable eq 2 }">
									<div  id="xacnhan-${member.id}" >
										<a <%--onclick="validMember(${member.id});"--%>  href="javascript:void(0)" type="button" class="btn btn-primary btn-sm" style="font-size: 70%; margin-top: 7px;" id=""><i class="fa fa-check-square-o" aria-hidden="true"></i> Xác nhận</a>
									</div>
										</c:if>

								<script>
									$(document).ready(function() {
										$('.btn').on('click', function() {
											var $this = $(this);
											var loadingText = '<i class="fa fa-circle-o-notch fa-spin"></i> loading...';
											if ($(this).html() !== loadingText) {
												$this.data('original-text', $(this).html());
												$this.html(loadingText);
											}
											setTimeout(function() {
												$this.html($this.data('original-text'));
											}, 6000);
										});
									})

								</script>
								<script type="text/javascript">

									$(document).on('click','#xacnhan-${member.id},#xacnhan-${member.id}',function(e){



												$.ajax({
													url: '${pageContext.request.contextPath}/admin/member/valid',
													type : 'POST',
													cache : false,
													data : {
														//(key , value)

														idMember : ${member.id}
													},
													success : function(response) {

														$('#active_member-${member.id}').load(" #active_member-${member.id}");
														$('#memberactive-${member.id }').load(" #memberactive-${member.id }");
														$('#xacnhan-${member.id}').hide();
														swal({
															title: 'Check ứng viên thành công!',
															/* text: 'Redirecting...', */
															icon: 'success',
															timer: 2000,
															buttons: true,
															type: 'success'
														})
													},
													error : function(response) {
														alert('Có lỗi xảy ra');
													}
												});
										return false;
									});

								</script>
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
						
						<td>

								<c:choose>
								<c:when test="${userInfo.role.name =='MANAGER' && (userInfo.id ==member.id) }">
									<a style="margin-top: 10px;" href="${pageContext.request.contextPath }/admin/member/profile/${member.id}" type="button"
									class="btn btn-primary btn-xs"> <i class="fa fa-pencil"></i>
									</a> <a style="margin-top: 10px" type="button" href="/admin/member/del/${member.id}" nclick="return confirm('Bạn có chắc chắn muốn xóa thành viên này?');"
										class="btn btn-danger btn-xs"> <i class="fa fa-trash-o "></i>
									</a>
								</c:when>
									<c:when test="${userInfo.role.name =='ADMIN'}">
										<a style="margin-top: 10px;" href="${pageContext.request.contextPath }/admin/member/profile/${member.id}" type="button"
										   class="btn btn-primary btn-xs"> <i class="fa fa-pencil"></i>
										</a> <a style="margin-top: 10px" type="button" href="/admin/member/del/${member.id}" nclick="return confirm('Bạn có chắc chắn muốn xóa thành viên này?');"
												class="btn btn-danger btn-xs"> <i class="fa fa-trash-o "></i>
									</a>
									</c:when>

								</c:choose>

						</td>
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
<%--<script type="text/javascript">
	function validMember(id){

			var id = ${apply.id}

					$.ajax({
						url: '${pageContext.request.contextPath}/admin/member/valid',
						type : 'POST',
						cache : false,
						data : {
							//(key , value)

							idMember : id
						},
						success : function(response) {

							$('#active_member-${id}').load(" #active_member-${id}");
							/*$('#checkApply-table').load(" #checkApply-table");*/
							swal({
								title: 'Check ứng viên thành công!',
								/* text: 'Redirecting...', */
								icon: 'success',
								timer: 2000,
								buttons: true,
								type: 'success'
							})
						},
						error : function(response) {
							alert('Có lỗi xảy ra');
						}
					});
			return false;

	}
</script>--%>
