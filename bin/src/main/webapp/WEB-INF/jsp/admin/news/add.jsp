<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/WEB-INF/templates/tags/taglib.jsp"%>
<div class="row mt">
          <div class="col-lg-12">
            <h4><i class="fa fa-angle-right"></i> THÊM TIN TỨC</h4>
            <div class="form-panel">
              <div class="form">
                <form class="cmxform form-horizontal style-form" enctype="multipart/form-data" id="signupForm" method="post" action="${pageContext.request.contextPath }/admin/news/add">
                  <div class="form-group ">
                    <label for="firstname" class="control-label col-lg-2">Tên Tin</label>
                    <div class="col-lg-10">
                      <input class=" form-control" id="firstname" name="newsName" type="text" required/>
                    </div>
                  </div>
              <div class="form-group">
                  <label for="firstname" class="control-label col-lg-2">Hình ảnh</label>
                  <div class="col-lg-10">
                    <input type="file" class=" form-control"  class="default" name="hinhanh" required/>
                  </div>
                </div>
                  <div class="form-group ">
                    <label for="lastname" class="control-label col-lg-2">Mô tả</label>
                    <div class="col-lg-10">
                      <textarea class=" form-control" id="decription" name="decription" type="text" required ></textarea>
                    </div>
                  </div>
                 <div class="form-group ">
                    <label for="lastname" class="control-label col-lg-2">Chi tiết</label>
                    <div class="col-lg-10">
                      <textarea class=" form-control" id="detail" name="detail" type="text" required ></textarea>
                    </div>
                  </div>
                <div class="form-group ">
                    <label for="newsletter" class="control-label col-lg-2 col-sm-3">Hiển thị</label>
                    <div class="col-lg-10 col-sm-9">
                      <input type="checkbox" style="width: 20px" value="0" class="checkbox form-control" id="enable" name="enable" />
                    </div>
                    <script type="text/javascript">
                    $('#enable').on('change', function(){
                    	   this.value = this.checked ? 1 : 0;
                    	   // alert(this.value);
                    	}).change();
                    </script>
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
            <script type="text/javascript">
            	var ckeditor = CKEDITOR.replace('decription');
            	var ckeditor1 = CKEDITOR.replace('detail');
            	CKFinder.setupCKEditor(ckeditor,'/libraries/ckfinder/');
            	
            </script>
          </div>
          <!-- /col-lg-12 -->
        </div>
        <script>
document.getElementById("home").classList.remove('active');
	document.getElementById("news").classList.add('active');
</script>