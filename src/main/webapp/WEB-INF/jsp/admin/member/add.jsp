<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/tags/taglib.jsp"%>
<div class="row mt">
	<div class="col-lg-12">
		<h4>
			<i class="fa fa-angle-right"></i> THÊM THÀNH VIÊN
		</h4>
		<div class="form-panel">
			<h5>><strong>Thêm thành viên theo danh sách <strong></h5>
			<div class="form">
				<form class="cmxform form-horizontal style-form"
					enctype="multipart/form-data" id="signupForm" method="post"
					action="${pageContext.request.contextPath }/admin/member/add">

					<div class="form-group ">

						<label for="firstname" class="control-label col-lg-2">Chọn
							kiểu thành viên</label>
						<div class="col-lg-10">
							<select class=" form-control" name="memberType" id="memberType"
								style="width: 30%;">
								<option value="0">--Chọn kiểu thành viên--</option>
								<c:if test="${not empty memberTypeList}">
									
									<c:forEach var="type" items="${memberTypeList }">
										<c:if test="${type.typeName ne 'ADMIN'  && type.typeName ne 'MANAGER'}">
											<option value="${type.id }">${type.typeName }</option>
										</c:if>
									</c:forEach>
								</c:if>
							</select> <br>
						</div>

						<div id="student_alumni" style="display: none;">
							<label for="firstname" class="control-label col-lg-2">Chọn
								Khoa</label>
							<div class="col-lg-10">
								<select class=" form-control" name="facultyId"
									style="width: 30%;">
									<option value="0">--Chọn khoa đào tạo--</option>
									<c:if test="${not empty facultyList}">
										<c:forEach var="f" items="${facultyList }">
											<option value="${f.id }">${f.facultyName }</option>
										</c:forEach>

									</c:if>

								</select> <br>
							</div>

							<div id="student_major" style="">
								<label for="firstname" class="control-label col-lg-2">Chọn
									Khoa</label>
								<div class="col-lg-10">
									<select class=" form-control" name="majorId"
											style="width: 30%;">
										<option value="0">-- Chọn ngành --</option>
										<c:if test="${not empty majorList}">
											<c:forEach var="major" items="${majorList }">
												<option value="${major.id }">${major.majorName }</option>
											</c:forEach>

										</c:if>

									</select> <br>
								</div>

								<div id="student_k" >
							<label for="firstname" class="control-label col-lg-2">Chọn
								Khóa</label>
							<div class="col-lg-10">
								<select class=" form-control" name="kId" id="kname"
									style="width: 30%;">
									<option value="0">--Chọn khóa--</option>
									<c:if test="${not empty knamesList}">
										<c:forEach var="kn" items="${knamesList }">
											<option value="${kn.id }">${kn.k }</option>
										</c:forEach>

									</c:if>

								</select> <br>
							</div>

						</div>
							</div>

						<script type="text/javascript">
							$("select").change(function() {
								var id = $("#memberType").val();

								if (id != 2 && id != 1) {
									$('#student_alumni').show();
									$('#student_major').show();
								} else {
									$('#student_alumni').hide();
								}


							});
						</script>

						<label for="firstname" class="control-label col-lg-2">Chọn
							File (Danh sách Excel)</label>
						<div class="col-lg-10" style="width: 20%;">
							<input id="member-list" name="memberList" class="form-control"
								type="file" required="required"> <br>
							<div id="error-message" style="display: none;">
								<div class="alert alert-danger" role="alert">Sai định dạng
									file! Vui lòng chọn file exel!</div>
							</div>
						</div>

					</div>
					</div>
						<c:if test="${param.err ne null}">
							<div class="alert alert-danger" style="width: 25%;margin-left: 17%;" role="alert">
								Tệp không phù hợp! Vui lòng chọn đúng định dạng format theo hướng dẫn!
							</div>

						</c:if>

					<div class="form-group">
						<div class="col-lg-offset-2 col-lg-10">
							
							<button type="submit" id="add_member_list" class="btn-loading btn btn-primary"  data-loading-text="<i class='fa fa-spinner fa-spin'></i> Đang xử lý">Thêm</button>	
							<button onclick="window.history.go(-1); return false;"  class="btn btn-theme04" type="button">Cancel</button>
							 
							
						</div>
					</div>
					<script type="text/javascript">
						$("#member-list")
								.change(
										function() {
											var fileExtension = [ 'xls',
													'xlsx', 'xlsm' ];
											if ($.inArray($(this).val().split(
													'.').pop().toLowerCase(),
													fileExtension) == -1) {
												$('#member-add-submit').attr(
														'disabled', 'disabled');

												$('#error-message').show();
											} else {
												$('#member-add-submit')
														.removeAttr('disabled',
																'disabled');

											}
										});
					
						
					</script>
					<script type="text/javascript">
				
						  $("#add_member_list").click(function () {
						    var btn = $(this);
						    btn.button('loading');
						    var resetButton = function () {
						      btn.button('reset');
						    };
						    window.setTimeout(resetButton, 2000);
						  });
						
					
					</script>
				
				</form>
				
			</div>
		</div>

	</div>
	<!-- /col-lg-12 -->
</div>
<script>
	document.getElementById("home").classList.remove('active');
	document.getElementById("news").classList.add('active');
</script>