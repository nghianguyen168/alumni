<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@include file="/WEB-INF/templates/tags/taglib.jsp"%>
 <div id="profile">
        <div class="container">
<div class="container py-2" style="background-color: white;">
<c:if test="${not empty msg}">
					<div class="alert alert-danger fade in alert-dismissible" style="margin-top: 18px;">
						<a href="#" class="close" data-dismiss="alert" aria-label="close" title="close">×</a> <strong>${msg}</strong>
					</div>
		</c:if>
    <div class="row my-2">
        <!-- edit form column -->
        <div class="col-lg-4">
            <h2 class="text-center font-weight-light">THÔNG TIN CÁ NHÂN</h2>
        </div>
        <div class="col-lg-8">
            <div class="alert alert-info alert-dismissable"><i class="fa fa-handshake-o" aria-hidden="true"></i> Vui lòng hoàn thiện thông tin cá nhân để góp phần xây dựng cộng đồng DTU Alumni! </div>
        </div>
        <div class="col-lg-8 order-lg-1 personal-info">
            <form role="form" method="post" action="/profile/edit/" enctype="multipart/form-data">
                <div class="form-group row">
                    <label class="col-lg-3 col-form-label form-control-label">First name</label>
                    <div class="col-lg-9">
                        <input class="form-control" name="firstName" type="text" value="${userInfo.firstName }" />
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-lg-3 col-form-label form-control-label">Last name</label>
                    <div class="col-lg-9">
                        <input class="form-control" name="lastName" type="text" value="${userInfo.lastName }" />
                    </div>
                </div>
                 <div class="form-group row">
                    <label class="col-lg-3 col-form-label form-control-label">Date Of Birth</label>
                    <div class="col-lg-9">
                        <input class="form-control"  class="datepicker" name="dateOfBirth" type="date"  value="${userInfo.dateOfBirth }" />
                        
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-lg-3 col-form-label form-control-label">DTU Email</label>
                    <div class="col-lg-9">
                        <input class="form-control" name="dtuMail" type="text" readonly="readonly" value="${userInfo.dtuMail }" />
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-lg-3 col-form-label form-control-label">Email</label>
                    <div class="col-lg-9">
                        <input class="form-control" name="email" type="email" value="${userInfo.email}" />
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-lg-3 col-form-label form-control-label">Số điện thoại</label>
                    <div class="col-lg-9">
                        <input class="form-control" name="phone" type="text" value="${userInfo.phone }" />
                    </div>
                </div>
              <%--   <div class="form-group row">
                    <label class="col-lg-3 col-form-label form-control-label">Quê quán</label>
                    <div class="col-lg-9">
                        <input class="form-control" name="" type="text" value="${userInfo.hometown }" />
                    </div>
                </div> --%>
                <c:choose>
                	<c:when test="${empty userInfo.hometown }">
                		  <div class="form-group row">
		                <label class="col-lg-3 col-form-label form-control-label">Chọn khu vực</label>
		                  <div class="col-lg-9">
							 <select  onchange="set_country(this,country,hometown)" class="form-control" size="1" name="region">
							 
								<option value="" selected="selected">--Chọn khu vực--</option>
								 <option  size="1" disabled="disabled"  onchange="set_city_state(this,hometown)"></option>
								<script type="text/javascript">
								setRegions(this);
								</script>
								</select>
							</div>
						</div>
						<div class="form-group row">
						 <label class="col-lg-3 col-form-label form-control-label">Quốc Gia</label>
							 <div class="col-lg-9">
						 		<select name="country"  class="form-control" id="countryhihi" size="1"  disabled="disabled" onchange="set_city_state(this,hometown)"></select>
							 </div>
						 </div>
						 
						 <div class="form-group row">
						 <label class="col-lg-3 col-form-label form-control-label">Tỉnh/Thành Phố</label>
							 <div class="col-lg-9">
						 		 <select name="hometown" size="1" disabled="disabled" class="form-control" onchange="print_city_state(country,this)"></select>
							 </div>
						 </div>
                	</c:when>
                	<c:otherwise>
                		<div class="form-group row" style="display: none;">
						 <label class="col-lg-3 col-form-label form-control-label">Quốc Gia</label>
							 <div class="col-lg-9">
						 		<select name="country"  class="form-control" id="countryhihi" size="1"  >
						 			<option selected="selected" value="${userInfo.country }"></option>
						 		</select>
							 </div>
						 </div>
						 
						 <div class="form-group row" style="display: none;">
						 <label class="col-lg-3 col-form-label form-control-label">Tỉnh/Thành Phố</label>
							 <div class="col-lg-9">
						 		 <select name="hometown" size="1" class="form-control" >
						 		 	<option selected="selected" value="${userInfo.hometown }"></option>
						 		 </select>
							 </div>
						 </div>
                	</c:otherwise>
                </c:choose>
            
		
                <div class="form-group row">
                    <label class="col-lg-3 col-form-label form-control-label">Địa chỉ hiện tại</label>
                    <div class="col-lg-9">
                        <input class="form-control"  name="addressNow" type="text" value="${userInfo.addressNow }" />
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-lg-3 col-form-label form-control-label">Giới tính</label>
                    <div class="col-lg-9">
                        <select id="user_time_zone" name="gender" class="form-control" size="0">
                        <c:choose>
                        	<c:when test="${userInfo.gender == 'Nam'}">
                        		<option value="Nam" selected="selected">Nam</option>
                        		<option value="Nữ">Nữ</option>
                        	</c:when>
                        	<c:otherwise>
                        		<option value="Nam">Nam</option>
                        		<option value="Nữ" selected="selected">Nữ</option>
                        	</c:otherwise>
                        </c:choose>
                       
                        
                        </select>
                    </div>
                </div>
                <div class="form-group row">
                	<c:set var="tthn" value="" />
                	<c:choose>
                		<c:when test="${userInfo.maritalStatus eq 1}">
                			<c:set var="tthn" value="Đã kết hôn" />
                		</c:when>
                		<c:otherwise>
                			<c:set var="tthn" value="Độc thân" />
                		</c:otherwise>
                	</c:choose>
                    <label class="col-lg-3 col-form-label form-control-label">Tình trạng hôn nhân</label>
                    <div class="col-lg-9">
                    <select id="user_time_zone" name="maritalStatus" class="form-control" size="0">
                         <c:choose>
                        	<c:when test="${userInfo.maritalStatus == 1}">
                        		<option value="1" selected="selected">Đã kết hôn</option>
                        		<option value="0">Độc thân</option>
                        	</c:when>
                        	<c:otherwise>
                        		<option value="1">Đã kết hôn</option>
                        		<option value="0" selected="selected">Độc thân</option>
                        	</c:otherwise>
                        </c:choose>
                    </select>
                    </div>
                </div>
                 <div class="form-group row">
                    <label class="col-lg-3 col-form-label form-control-label">Khoa</label>
                    <div class="col-lg-9">
                        <select id="user_time_zone" name="facultyId" class="form-control" size="0">
                        <c:forEach var="fal" items="${facultyList }">
                        	<option value="${fal.id }">${fal.facultyName }</option>
                        </c:forEach>
                            
                           
                        </select>
                    </div>
                </div>
                 <div class="form-group row">
                    <label class="col-lg-3 col-form-label form-control-label">Ngành học</label>
                    <div class="col-lg-9">
                        <select id="user_time_zone" name="majorId" class="form-control" size="0">
                        <c:forEach var="major" items="${majorList }">
                            <option value="${major.id }">${major.majorName }</option>
                        </c:forEach> 
                        </select>
                    </div>
                </div>
                 <div class="form-group row">
                    <label class="col-lg-3 col-form-label form-control-label">Hệ đào tạo</label>
                    <div class="col-lg-9">
                        <select id="user_time_zone" name="trainning_system_id" class="form-control" size="0">
                        <c:forEach items="${trainningList }" var="train">
                            <option value="${train.id }">${train.training_system_name }</option>
                         </c:forEach> 
                        </select>
                    </div>
                </div>
                 <div class="form-group row">
                    <label class="col-lg-3 col-form-label form-control-label">Khóa</label>
                    <div class="col-lg-9">
                        <select id="user_time_zone" name="knId" class="form-control" size="0">
                     		<c:forEach var="kl" items="${knameList }">
                     			 <option value="${kl.id }">${kl.k}</option>
                     		</c:forEach>
                           
                           
                        </select>
                    </div>
                </div>
              
                <div class="form-group row">
                    <label class="col-lg-3 col-form-label form-control-label">Công việc hiện tại</label>
                    <div class="col-lg-9">
                        <input class="form-control" name="positionJob" type="text" value="${userInfo.positionJob }" />
                    </div>
                </div>
                 <div class="form-group row">
                    <label class="col-lg-3 col-form-label form-control-label">Công ty</label>
                    <div class="col-lg-9">
                        <input class="form-control" name="company" type="text" value="${userInfo.company }" />
                    </div>
                </div>
                 <div class="form-group row">
                    <label class="col-lg-3 col-form-label form-control-label">Thời gian bắt đầu công việc</label>
                    <div class="col-lg-9">
                        <input class="form-control" name="" type="date"  value="" />
                    </div>
                </div>
                 <div class="form-group row">
                    <label class="col-lg-3 col-form-label form-control-label">Mức lương</label>
                    <div class="col-lg-9">
                        <input class="form-control" name="salary" type="text" value="${userInfo.salary }" />
                    </div>
                </div>
                 <div class="form-group row">
                    <label class="col-lg-3 col-form-label form-control-label">Địa chỉ làm việc</label>
                    <div class="col-lg-9">
                        <input class="form-control" name="workAt" type="text" value="${userInfo.workAt }" />
                    </div>
                </div>
             	<div class="form-group row">
                    <label class="col-lg-3 col-form-label form-control-label">Mô tả bản thân</label>
                    <div class="col-lg-9">
                        <textarea class="form-control" name="decription" type="text" value="" >${userInfo.decription }</textarea>
                    </div>
                </div>
                <div class="form-group row">
                    <div class="col-lg-9 ml-auto text-right">
                        <input type="reset" class="btn btn-outline-secondary" value="Cancel"  onclick="window.history.go(-1); return false;" />
                        <button type="submit" class="btn-loading btn btn-primary"  data-loading-text="<i class='fa fa-spinner fa-spin'></i> Đang cập nhật">Cập nhật</button>
                    </div>
                </div>
        </div>
        <div class="col-lg-4 order-lg-0 text-center">
            <img src="/resources/uploads/${userInfo.avatar }" class="comment-avatar-edit"  alt="avatar" />
            <h6 class="my-4">Thay đổi ảnh đại diện</h6>
            <div class="input-group px-xl-4" style="display:flex; ">
                <div class="custom-file">
                   <input type="file" name="anhdaidien" class="form-control">
                    <label class="custom-file-label" for="inputGroupFile02" aria-describedby="inputGroupFileAddon02">Choose file</label>
                </div>
              
            </div>
        </div>
         </form>
         
        
         
    </div>
</div>
</div>
</div>

