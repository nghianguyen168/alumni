<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@include file="/WEB-INF/templates/tags/taglib.jsp"%>
 <div id="profile">
        <div class="container">
<div class="container py-2" style="background-color: white;">
    <div class="row my-2">
        <!-- edit form column -->
        <div class="col-lg-4">
            <h2 class="text-center font-weight-light">THÔNG TIN CÁ NHÂN</h2>
        </div>
        <div class="col-lg-8">
            <div class="alert alert-info alert-dismissable"><i class="fa fa-handshake-o" aria-hidden="true"></i> Vui lòng hoàn thiện thông tin cá nhân để góp phần xây dựng cộng đồng DTU Alumni! </div>
        </div>
        <div class="col-lg-8 order-lg-1 personal-info">
            <form role="form">
                <div class="form-group row">
                    <label class="col-lg-3 col-form-label form-control-label">First name</label>
                    <div class="col-lg-9">
                        <input class="form-control" type="text" value="${userInfo.firstName }" />
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-lg-3 col-form-label form-control-label">Last name</label>
                    <div class="col-lg-9">
                        <input class="form-control" type="text" value="${userInfo.lastName }" />
                    </div>
                </div>
                 <div class="form-group row">
                    <label class="col-lg-3 col-form-label form-control-label">Date Of Birth</label>
                    <div class="col-lg-9">
                        <input class="form-control" type="date" value="${userInfo.dateOfBirth }" />
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-lg-3 col-form-label form-control-label">DTU Email</label>
                    <div class="col-lg-9">
                        <input class="form-control" type="email" value="${userInfo.dtuMail }" />
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-lg-3 col-form-label form-control-label">Email</label>
                    <div class="col-lg-9">
                        <input class="form-control" type="email" value="${userInfo.email}" />
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-lg-3 col-form-label form-control-label">Số điện thoại</label>
                    <div class="col-lg-9">
                        <input class="form-control" type="email" value="${userInfo.phone }" />
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-lg-3 col-form-label form-control-label">Quê quán</label>
                    <div class="col-lg-9">
                        <input class="form-control" type="email" value="${userInfo.hometown }" />
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-lg-3 col-form-label form-control-label">Địa chỉ hiện tại</label>
                    <div class="col-lg-9">
                        <input class="form-control" type="email" value="${userInfo.addressNow }" />
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-lg-3 col-form-label form-control-label">Giới tính</label>
                    <div class="col-lg-9">
                        <input class="form-control" type="email" value="${userInfo.gender}" />
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
                        <input class="form-control" type="email" value="${tthn }" />
                    </div>
                </div>
                 <div class="form-group row">
                    <label class="col-lg-3 col-form-label form-control-label">Khoa</label>
                    <div class="col-lg-9">
                        <select id="user_time_zone" class="form-control" size="0">
                        <c:forEach var="fal" items="${facultyList }">
                        	<option value="${fal.id }">${fal.facultyName }</option>
                        </c:forEach>
                            
                           
                        </select>
                    </div>
                </div>
                 <div class="form-group row">
                    <label class="col-lg-3 col-form-label form-control-label">Ngành học</label>
                    <div class="col-lg-9">
                        <select id="user_time_zone" class="form-control" size="0">
                        <c:forEach var="major" items="${majorList }">
                     
                            <option value="${major.id }">${major.majorName }</option>
                        
                        </c:forEach> 
                        </select>
                    </div>
                </div>
                 <div class="form-group row">
                    <label class="col-lg-3 col-form-label form-control-label">Hệ đào tạo</label>
                    <div class="col-lg-9">
                        <select id="user_time_zone" class="form-control" size="0">
                        <c:forEach items="${trainningList }" var="train">
                            <option value="${train.id }">${train.training_system_name }</option>
                         </c:forEach> 
                        </select>
                    </div>
                </div>
                 <div class="form-group row">
                    <label class="col-lg-3 col-form-label form-control-label">Khóa</label>
                    <div class="col-lg-9">
                        <select id="user_time_zone" class="form-control" size="0">
                     		<c:forEach var="kl" items="${knameList }">
                     			 <option value="${kl.id }">${kl.k}</option>
                     		</c:forEach>
                           
                           
                        </select>
                    </div>
                </div>
              
                <div class="form-group row">
                    <label class="col-lg-3 col-form-label form-control-label">Công việc hiện tại</label>
                    <div class="col-lg-9">
                        <input class="form-control" type="text" value="${userInfo.positionJob }" />
                    </div>
                </div>
                 <div class="form-group row">
                    <label class="col-lg-3 col-form-label form-control-label">Công ty</label>
                    <div class="col-lg-9">
                        <input class="form-control" type="text" value="" />
                    </div>
                </div>
                 <div class="form-group row">
                    <label class="col-lg-3 col-form-label form-control-label">Thời gian bắt đầu công việc</label>
                    <div class="col-lg-9">
                        <input class="form-control" type="date"  value="" />
                    </div>
                </div>
                 <div class="form-group row">
                    <label class="col-lg-3 col-form-label form-control-label">Mức lương</label>
                    <div class="col-lg-9">
                        <input class="form-control" type="text" value="" />
                    </div>
                </div>
                 <div class="form-group row">
                    <label class="col-lg-3 col-form-label form-control-label">Địa chỉ làm việc</label>
                    <div class="col-lg-9">
                        <input class="form-control" type="text" value="" />
                    </div>
                </div>
             
                <div class="form-group row">
                    <div class="col-lg-9 ml-auto text-right">
                        <input type="reset" class="btn btn-outline-secondary" value="Cancel"  onclick="window.history.go(-1); return false;" />
                        <button type="submit" class="btn-loading btn btn-primary"  data-loading-text="<i class='fa fa-spinner fa-spin'></i> Đang cập nhật">Cập nhật</button>
                    </div>
                </div>
            </form>
        </div>
        <div class="col-lg-4 order-lg-0 text-center">
            <img src="//api.adorable.io/avatars/120/trickst3r.png" class="mx-auto img-fluid rounded-circle" alt="avatar" />
            <h6 class="my-4">Upload a new photo</h6>
            <div class="input-group px-xl-4" style="display:flex; ">
                <div class="custom-file">
                   <input type="file" class="form-control">
                    <label class="custom-file-label" for="inputGroupFile02" aria-describedby="inputGroupFileAddon02">Choose file</label>
                </div>
              
            </div>
        </div>
    </div>
</div>
</div>
</div>
