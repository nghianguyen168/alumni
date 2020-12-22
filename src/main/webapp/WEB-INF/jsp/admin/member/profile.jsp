<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/tags/taglib.jsp"%>
 <section class="wrapper site-min-height">
        <div class="row mt">
          <div class="col-lg-12">
            <div class="row content-panel">
              <div class="col-md-4 profile-text mt mb centered">
                <div class="right-divider hidden-sm hidden-xs">
                  <h4>${member.dateOfBirth}</h4>
                  <h6>NGÀY SINH</h6>
                  <h4>${member.kn.k }</h4>
                  <h6>KHÓA</h6>
                 
                </div>
              </div>
              <!-- /col-md-4 -->
              <div class="col-md-4 profile-text">
                <h3>${member.firstName } ${member.lastName }</h3>
                <h6>${member.role.name }</h6>
                <p>${member.decription}</p>
                <br>
                <p><button class="btn btn-theme"><i class="fa fa-envelope"></i> Send Message</button></p>
              </div>
              <!-- /col-md-4 -->
              <div class="col-md-4 centered">
                <div class="profile-pic">
                  <p><img src="/resources/uploads/${member.avatar }" class="img-circle"></p>
                  <p>
                    <button class="btn btn-theme"><i class="fa fa-check"></i> Follow</button>
                    <button class="btn btn-theme02">Add</button>
                  </p>
                </div>
              </div>
              <!-- /col-md-4 -->
            </div>
            <!-- /row -->
          </div>
          <!-- /col-lg-12 -->
          <div class="col-lg-12 mt">
            <div class="row content-panel">
              <div class="panel-heading">
                <ul class="nav nav-tabs nav-justified">
                  
                  <li>
                    <a data-toggle="tab" href="#edit">THÔNG TIN CÁ NHÂN</a>
                  </li>
                </ul>
              </div>
              <!-- /panel-heading -->
              <div class="panel-body">
                <div class="tab-content">
                  <div id="overview" class="tab-pane active">
                    
                
                  <!-- /tab-pane -->
                  <div id="edit" class="tab-pane">
                    <div class="row">
                      <div class="col-lg-8 col-lg-offset-2 detailed">
                        <h4 class="mb">Personal Information</h4>
                        <form role="form" class="form-horizontal" action="/admin/member/profile/${member.id}" method="post" enctype="multipart/form-data">
                          <div class="form-group row">
                            <label class="col-lg-3 col-form-label form-control-label">Họ và tên lót</label>
                            <div class="col-lg-9">
                              <input class="form-control" name="firstName" type="text" value="${member.firstName }" />
                            </div>
                          </div>
                          <div class="form-group row">
                            <label class="col-lg-3 col-form-label form-control-label">Tên</label>
                            <div class="col-lg-9">
                              <input class="form-control" name="lastName" type="text" value="${member.lastName }" />
                            </div>
                          </div>
                          <div class="form-group row">
                            <label class="col-lg-3 col-form-label form-control-label">Ngày sinh</label>
                            <div class="col-lg-9">
                              <input class="form-control"  class="datepicker" name="dateOfBirth" type="date"  value="${member.dateOfBirth }" />

                            </div>
                          </div>
                          <div class="form-group row">
                            <label class="col-lg-3 col-form-label form-control-label">Địa chỉ email DTU</label>
                            <div class="col-lg-9">
                              <input class="form-control" name="dtuMail" type="text" readonly="readonly" value="${member.dtuMail }" />
                            </div>
                          </div>
                          <div class="form-group row">
                            <label class="col-lg-3 col-form-label form-control-label">Email</label>
                            <div class="col-lg-9">
                              <input class="form-control" name="email" type="email" value="${member.email}" />
                            </div>
                          </div>
                          <div class="form-group row">
                            <label class="col-lg-3 col-form-label form-control-label">Mật khẩu</label>
                            <div class="col-lg-9">
                              <input class="form-control" name="matkhau" type="password" value="" />
                            </div>
                          </div>
                          <div class="form-group row">
                            <label class="col-lg-3 col-form-label form-control-label">Số điện thoại</label>
                            <div class="col-lg-9">
                              <input class="form-control" name="phone" type="text" value="${member.phone }" />
                            </div>
                          </div>

                          <div class="form-group row">
                            <label class="col-lg-3 col-form-label form-control-label">Địa chỉ hiện tại</label>
                            <div class="col-lg-9">
                              <input class="form-control"  name="addressNow" type="text" value="${member.addressNow }" />
                            </div>
                          </div>
                          <div class="form-group row">
                            <label class="col-lg-3 col-form-label form-control-label">Giới tính</label>
                            <div class="col-lg-9">
                              <select id="" name="gender" class="form-control" size="0">
                                <c:choose>
                                  <c:when test="${member.gender == 'Nam'}">
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
                              <c:when test="${member.maritalStatus eq 1}">
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
                                  <c:when test="${member.maritalStatus == 1}">
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
                              <select id="" name="facultyId" class="form-control" size="0">
                                <c:forEach var="fal" items="${facultyList }">
                                  <option value="${fal.id }">${fal.facultyName }</option>
                                </c:forEach>


                              </select>
                            </div>
                          </div>
                          <c:if test="${member.role.name =='ALUMNI' || member.role.name =='STUDENT' }">

                          <div class="form-group row">
                            <label class="col-lg-3 col-form-label form-control-label">Ngành học</label>
                            <div class="col-lg-9">
                              <select id="" name="majorId" class="form-control" size="0">
                                <option value="0"selected>Chọn ngành học</option>
                                <c:forEach var="major" items="${majorList }">
                                  <option value="${member.id }">${major.majorName }</option>
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
                          </c:if>
                          <c:if test="${member.role.name =='ALUMNI' || member.role.name =='TEACHER' }">
                          <div class="form-group row">
                            <label class="col-lg-3 col-form-label form-control-label">Công việc hiện tại</label>
                            <div class="col-lg-9">
                              <input class="form-control" name="positionJob" type="text" value="${member.positionJob }" />
                            </div>
                          </div>
                          <div class="form-group row">
                            <label class="col-lg-3 col-form-label form-control-label">Công ty</label>
                            <div class="col-lg-9">
                              <input class="form-control" name="company" type="text" value="${member.company }" />
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
                              <input class="form-control" name="salary" type="text" value="${member.salary }" />
                            </div>
                          </div>
                          <div class="form-group row">
                            <label class="col-lg-3 col-form-label form-control-label">Địa chỉ làm việc</label>
                            <div class="col-lg-9">
                              <input class="form-control" name="workAt" type="text" value="${member.workAt }" />
                            </div>
                          </div>
                          </c:if>

                          <div class="form-group row">
                            <label class="col-lg-3 col-form-label form-control-label">Mô tả bản thân</label>
                            <div class="col-lg-9">
                              <textarea class="form-control" name="decription" type="text" value="" >${member.decription }</textarea>
                            </div>
                          </div>
                          <div class="form-group row">
                            <div class="col-lg-9 ml-auto text-right">
                              <input type="reset" class="btn btn-outline-secondary" value="Cancel"  onclick="window.history.go(-1); return false;" />
                              <button type="submit" class="btn-loading btn btn-primary"  data-loading-text="<i class='fa fa-spinner fa-spin'></i> Đang cập nhật">Cập nhật</button>
                            </div>
                          </div>
                      </div>

                          
                      
                        </form>
                      </div>
                      
                      <!-- /col-lg-8 -->
                    </div>
                    <!-- /row -->
                  </div>
                  <!-- /tab-pane -->
                </div>
                <!-- /tab-content -->
              </div>
              <!-- /panel-body -->
            </div>
            <!-- /col-lg-12 -->
          </div>
          <!-- /row -->
        </div>
        <!-- /container -->
      </section>