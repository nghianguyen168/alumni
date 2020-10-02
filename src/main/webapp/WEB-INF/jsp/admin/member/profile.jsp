<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <section class="wrapper site-min-height">
        <div class="row mt">
          <div class="col-lg-12">
            <div class="row content-panel">
              <div class="col-md-4 profile-text mt mb centered">
                <div class="right-divider hidden-sm hidden-xs">
                  <h4>${member.dateOfBirth}</h4>
                  <h6>NGÀY SINH</h6>
                  <h4>${member.yearParticipate }</h4>
                  <h6>NĂM NHẬP HỌC</h6>
                  <h4>${member.yearGreduate }</h4>
                  <h6>NĂM TỐT NGHIỆP</h6>
                </div>
              </div>
              <!-- /col-md-4 -->
              <div class="col-md-4 profile-text">
                <h3>${member.firstName } ${member.lastName }</h3>
                <h6>${member.memberType.type_name }</h6>
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
                        <form role="form" class="form-horizontal">
                          <div class="form-group">
                            <label class="col-lg-2 control-label">Số Điện Thoại</label>
                            <div class="col-lg-6">
                              <input type="text" placeholder=" " value="${member.phone }" id="c-name" class="form-control" readonly>
                            </div>
                          </div>
                          <div class="form-group">
                            <label class="col-lg-2 control-label">DTU Mail</label>
                            <div class="col-lg-6">
                              <input type="text" placeholder=" " value="${member.dtuMail }" id="c-name" class="form-control" readonly>
                            </div>
                          </div>
                            <div class="form-group">
                            <label class="col-lg-2 control-label">Mật khẩu</label>
                            <div class="col-lg-6">
                              <input type="password" placeholder=" " value="${member.password }" id="c-name" class="form-control" readonly>
                            </div>
                          </div>
                          <div class="form-group">
                            <label class="col-lg-2 control-label">Quê Quán</label>
                            <div class="col-lg-6">
                              <input type="text" placeholder=" " value="${member.hometown }" id="lives-in" class="form-control" readonly>
                            </div>
                          </div>
                          <div class="form-group">
                            <label class="col-lg-2 control-label">Nơi Ở Hiện Tại</label>
                            <div class="col-lg-6">
                              <input type="text" placeholder=" " value="${member.addressNow }" id="lives-in" class="form-control" readonly>
                            </div>
                          </div>
                           <div class="form-group">
                            <label class="col-lg-2 control-label">Năm Nhập Học</label>
                            <div class="col-lg-6">
                              <input type="text" placeholder=" " value="${member.yearParticipate }" id="c-name" class="form-control" readonly>
                            </div>
                          </div>
                           <div class="form-group">
                            <label class="col-lg-2 control-label">Năm Tốt Nghiệp</label>
                            <div class="col-lg-6">
                              <input type="text" placeholder=" " value="${member.yearGreduate }" id="c-name" class="form-control" readonly>
                            </div>
                          </div>
                           <div class="form-group">
                            <label class="col-lg-2 control-label">Ngành Học</label>
                            <div class="col-lg-6">
                              <input type="text" placeholder=" " value="${member.major.majorName }" id="c-name" class="form-control" readonly>
                            </div>
                          </div>
                           <div class="form-group">
                            <label class="col-lg-2 control-label">Nơi Làm Việc Hiện Tại</label>
                            <div class="col-lg-6">
                              <input type="text" placeholder=" " value="${member.workAt }"  id="c-name" class="form-control" readonly>
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