<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="row mt">
          <div class="col-lg-12">
            <h4><i class="fa fa-angle-right"></i> THÊM TIN TỨC</h4>
            <div class="form-panel">
              <div class="form">
                <form class="cmxform form-horizontal style-form" enctype="multipart/form-data" id="signupForm" method="post" action="${pageContext.request.contextPath }/admin/news/add">
                  <div class="form-group ">
                    <label for="firstname" class="control-label col-lg-2">Tên Tin</label>
                    <div class="col-lg-10">
                      <input class=" form-control" id="firstname" name="news_name" type="text" />
                    </div>
                  </div>
              <div class="form-group">
                  <label class="control-label col-md-3">Hình ảnh</label>
                  <div class="col-md-4">
                    <input type="file" class="default" name="hinhanh"/>
                  </div>
                </div>
                  <div class="form-group ">
                    <label for="lastname" class="control-label col-lg-2">Mô tả</label>
                    <div class="col-lg-10">
                      <input class=" form-control" id="lastname" name="decription" type="text" />
                    </div>
                  </div>
                 <div class="form-group ">
                    <label for="lastname" class="control-label col-lg-2">Chi tiết</label>
                    <div class="col-lg-10">
                      <input class=" form-control" id="lastname" name="detail" type="text" />
                    </div>
                  </div>
                <div class="form-group ">
                    <label for="newsletter" class="control-label col-lg-2 col-sm-3">Hiển thị</label>
                    <div class="col-lg-10 col-sm-9">
                      <input type="checkbox" style="width: 20px" class="checkbox form-control" id="newsletter" name="enable" />
                    </div>
                  </div>
              
                  <div class="form-group">
                    <div class="col-lg-offset-2 col-lg-10">
                      <button class="btn btn-theme" type="submit">Save</button>
                      <button class="btn btn-theme04" type="button">Cancel</button>
                    </div>
                  </div>
                </form>
              </div>
            </div>
            <!-- /form-panel -->
          </div>
          <!-- /col-lg-12 -->
        </div>