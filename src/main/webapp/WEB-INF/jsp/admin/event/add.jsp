<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="row mt">
          <div class="col-lg-12">
            <h4><i class="fa fa-angle-right"></i> THÊM TIN TỨC</h4>
            <div class="form-panel">
              <div class="form">
                <form class="cmxform form-horizontal style-form" enctype="multipart/form-data" id="signupForm" method="post" action="${pageContext.request.contextPath }/admin/event/add">
                  <div class="form-group ">
                    <label for="firstname" class="control-label col-lg-2">Tên Sự kiện</label>
                    <div class="col-lg-10">
                      <input class=" form-control" id="firstname" name="eventName" type="text" required="required"/>
                    </div>
                  </div>
            	 <div class="form-group">
                  <label for="firstname" class="control-label col-lg-2">Hình ảnh mô tả</label>
                  <div class="col-lg-10">
                    <input type="file" class=" form-control"  class="default" name="hinhanh"/>
                  </div>
                </div>
                  <div class="form-group ">
                    <label for="lastname" class="control-label col-lg-2">Thời gian bắt đầu:</label>
                    <div class="col-lg-10 col-sm-9">
				    <input class="form-control"  name="timeStart" type="datetime-local" value="" id="example-datetime-local-input" required="required">
				  </div>
                  </div>
                  <div class="form-group ">
                    <label for="lastname" class="control-label col-lg-2">Thời gian kết thúc:</label>
                    <div class="col-lg-10 col-sm-9">
					    <input class="form-control" name="timeEnd" type="datetime-local" value="" id="example-datetime-local-input" required="required">
					  </div>
                  </div>
                   <div class="form-group ">
                    <label for="firstname" class="control-label col-lg-2">Địa điểm</label>
                    <div class="col-lg-10">
                      <input class=" form-control" id="firstname" name="place" type="text" />
                    </div>
                  </div>
                 <div class="form-group ">
                    <label for="lastname" class="control-label col-lg-2">Mô tả</label>
                    <div class="col-lg-10">
                      <input class=" form-control" id="lastname" name="decription" type="text" />
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
                      <button class="btn btn-theme04" type="reset">Cancel</button>
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