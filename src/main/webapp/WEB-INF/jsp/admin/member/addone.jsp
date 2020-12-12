<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/tags/taglib.jsp"%>
<div class="row mt">
	<div class="col-lg-12">
		<h4>
			<i class="fa fa-angle-right"></i> THÊM THÀNH VIÊN
		</h4>
		<div class="form-panel">
			<h5>><strong>Thêm thành viên<strong></h5>
			<div class="form">
				<form class="cmxform form-horizontal style-form"
					enctype="multipart/form-data" id="signupForm" method="post"
					action="${pageContext.request.contextPath }/admin/member/add">

					<div class="form-group " >

							<label style="margin-top: 8px;" class="col-sm-2 col-form-label"><strong>DTU
								Mail :</strong></label>
							<div class="col-sm-10">
								<input type="dtuMail" class="form-control" value="" name="dtuMail" style="width: 30%;"
									   id="dtumail1" placeholder="Dtu Mail" autofocus>

								<span><i>Có thể dùng email cả nhân để đăng ký nếu quên email DTU</i></span>
							</div>
						</div>
						<div class="form-group row">
							<label style="margin-top: 8px;" class="col-sm-2 col-form-label"><strong>Email cá nhân:</strong></label>
							<div class="col-sm-10">
								<input type="email" value="" class="form-control" name="email" required style="width: 30%;"
									   id="email" placeholder="Email cá nhân" autofocus>
							</div>
						</div>
						<div class="form-group row">
							<label style="margin-top: 8px;" class="col-sm-2 col-form-label"><strong>Họ và tên lót:</strong></label>
							<div class="col-sm-10">
								<input type="text" value="" class="form-control" width="50%;" name="firstName" required style="width: 30%;"
									   id="firstName" placeholder="Họ và tên lót" autofocus>
							</div>
						</div>

						<div class="form-group row">
							<label style="margin-top: 8px;" class="col-sm-2 col-form-label"><strong>Tên :</strong></label>
							<div class="col-sm-10">
								<input type="text" value="" class="form-control" name="lastName" required style="width: 30%;"
									   id="lastName" placeholder="Tên" autofocus>
							</div>
						</div>
					<div class="form-group row">
						<label style="margin-top: 8px;" class="col-sm-2 col-form-label"><strong>Giới tính :</strong></label>
						<div class="col-sm-10">
							<select class="form-control"  id="gender" name="gender"	 required style="width: 30%;">

								<option value="0">--Nam/Nữ--</option>
								<option value="Nam">Nam</option>
								<option value="Nữ">Nữ</option>
							</select>
						</div>
						<br>
					</div>


					<div class="form-group row">
						<label style="margin-top: 8px;" class="col-sm-2 col-form-label"><strong>Ngày Sinh :</strong></label>
						<div class="col-sm-10">
							<input type="date" value="${memberExist.dateOfBirth}" required class="form-control" name="dateOfBirth" style="width: 30%;"
								   id="dateOfBirth" placeholder="Ngày Sinh" autofocus>
						</div>
					</div>
					<div class="form-group row">
						<label style="margin-top: 8px;" class="col-sm-2 col-form-label"><strong>Số điện thoại :</strong></label>
						<div class="col-sm-10">
							<input type="text" value="" required class="form-control" name="phone" style="width: 30%;"
								   id="phone" placeholder="Số điện thoại" autofocus>
						</div>
					</div>

					<div class="form-group row">
						<label style="margin-top: 8px;" class="col-sm-2 col-form-label"><strong>Kiểu thành viên :</strong></label>
						<div class="col-sm-10">
							<select class="form-control"  id="membertype_re" name="typeId" required style="width: 30%;">
								<option value="0">--Bạn là....--</option>
								<c:if test="${not empty memberTypeList}">
									<c:forEach var="type" items="${memberTypeList }">
										<c:if test="${type.typeName !='ADMIN'}" >
											<option value="${type.id }">${type.typeName}</option>
										</c:if>


									</c:forEach>

								</c:if>
							</select>
						</div>
						<br>
					</div>

					<script type="text/javascript">
						$("select").change(function() {
							var id = $("#membertype_re").val();

							if(id == 3 || id==2){
								$('#faculty_re').show();
								$('#mssv_re').hide();
								$('#major_re').hide();
								$('#khoa_re').hide();
							};
							if(id == 4 || id==5) {
								$('#mssv_re').show();
								$('#faculty_re').show();
								$('#major_re').show();
								$('#khoa_re').show();
							}


						});
					</script>


					<div class="form-group row" style="display: none;" id="mssv_re">
						<label style="margin-top: 8px;" class="col-sm-2 col-form-label"><strong>Mã số sinh viên:</strong></label>
						<div class="col-sm-10">
							<input type="text" value="${memberExist.studentId}" class="form-control" name="studentId" minlength="9" maxlength="10" style="width: 30%;"
								   id="studentId" placeholder="Mã số sinh viên" autofocus>
						</div>
					</div>
					<div class="form-group row" id="khoa_re" style="display: none;">
						<label style="margin-top: 8px;" class="col-sm-2 col-form-label"><strong>Khóa :</strong></label>
						<div class="col-sm-10">
							<select class="form-control"  id="kname" name="knameId" required style="width: 30%;">
								<option value="0">--Chọn khóa--</option>
								<c:if test="${not empty knameList}">
									<c:forEach var="kn" items="${knameList }">
										<option value="${kn.id }">${kn.k }</option>
									</c:forEach>

								</c:if>
							</select>
						</div>
						<br>
					</div>
					<div class="form-group row" id="faculty_re" style="display: none;">
						<label style="margin-top: 8px;" class="col-sm-2 col-form-label"><strong>Khoa :</strong></label>
						<div class="col-sm-10">
							<select class=" form-control"  id="faculty" name="facultyId" required style="width: 30%;">
								<option value="0">--Chọn khoa--</option>
								<c:if test="${not empty facultyList}">
									<c:forEach var="f" items="${facultyList }">
										<option value="${f.id }">${f.facultyName}</option>
									</c:forEach>

								</c:if>
							</select>
						</div>
						<br>
					</div>
					<div class="form-group row" id="major_re" style="display: none;">
						<label style="margin-top: 8px;" class="col-sm-2 col-form-label"><strong>Ngành học:</strong></label>
						<div class="col-sm-10">
							<select class=" form-control" name="majorId" id="major" required style="width: 30%;">
								<option value="0">--Chọn ngành học--</option>
								<c:if test="${not empty majorList}">
									<c:forEach var="major" items="${majorList }">
										<option value="${major.id }">${major.majorName}</option>
									</c:forEach>

								</c:if>
							</select>
						</div>
						<br>
					</div>

					<!--  <input class="btn btn-theme btn-block" type="submit" value="SIGN IN"> -->

					<div class="form-group">
						<div class="col-lg-offset-2 col-lg-10">

							<button type="submit" id="add_member_list" class="btn-loading btn btn-primary"  data-loading-text="<i class='fa fa-spinner fa-spin'></i> Đang xử lý">Thêm</button>
							<button onclick="window.history.go(-1); return false;"  class="btn btn-theme04" type="button">Cancel</button>


						</div>
					</div>
					<hr>



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