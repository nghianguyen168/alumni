<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/tags/taglib.jsp"%>
<div class="row mt">
          <div class="col-lg-12">
            <h4><i class="fa fa-angle-right"></i> CẬP NHẬT TIN TỨC</h4>
            <div class="form-panel">
              <div class="form">
              <c:if test="${not empty msg}">
					<div class="alert alert-success fade in alert-dismissible" style="margin-top: 18px;">
						<a href="#" class="close" data-dismiss="alert" aria-label="close" title="close">×</a> <strong>${msg}</strong>
					</div>
			</c:if>
                <form class="cmxform form-horizontal style-form" enctype="multipart/form-data" id="signupForm" method="post" action="${pageContext.request.contextPath }/admin/news/edit/${news.id}">
                  <div class="form-group ">
                    <label for="firstname" class="control-label col-lg-2">Tên Tin</label>
                    <div class="col-lg-10">
                      <input class=" form-control" id="firstname" value="${news.newsName }" name="newsName" type="text" />
                    </div>
                  </div>
              <div class="form-group">
                  <label for="lastname" class="control-label col-lg-2">Hình ảnh</label>
                  <div class="col-md-4">
                    <input class="form-control" type="file" class="default" name="hinhanh"/>
                    <br>
                    <img style="width: 50%;height: 50%;" alt="" src="${pageContext.request.contextPath }/resources/uploads/${news.picture}">
                  </div>
                </div>
                  <div class="form-group ">
                    <label for="lastname" class="control-label col-lg-2">Mô tả</label>
                    <div class="col-lg-10">
                      <textarea class="form-control" id="lastname" name="decription" type="text" >${news.decription }</textarea>
                    </div>
                  </div>
                 <div class="form-group ">
                    <label for="lastname" class="control-label col-lg-2">Chi tiết</label>
                    <div class="col-lg-10">
                      <textarea class=" form-control" id="lastname" name="detail" type="text" >${news.detail}</textarea>
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
        <script>
document.getElementById("home").classList.remove('active');
	document.getElementById("news").classList.add('active');
</script>