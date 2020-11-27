<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/WEB-INF/templates/tags/taglib.jsp"%>
<div class="row mt">
          <div class="col-lg-12">
            <h4><i class="fa fa-angle-right"></i>CẬP NHẬT SỰ KIỆN</h4>
            <div class="form-panel">
              <div class="form">
                <form class="cmxform form-horizontal style-form" enctype="multipart/form-data" id="signupForm" method="post" action="${pageContext.request.contextPath }/admin/event/edit/${event.id}">
                  <div class="form-group ">
                    <label for="firstname" class="control-label col-lg-2">Tên Sự kiện</label>
                    <div class="col-lg-10">
                      <input class=" form-control" id="firstname" value="${event.event_name }" name="event_name" type="text" />
                    </div>
                  </div>
                  <div class="form-group">
                  <label for="lastname" class="control-label col-lg-2">Hình ảnh mô tả</label>
                  <div class="col-md-4">
                    <input class="form-control" type="file" class="default" name="hinhanh"/>
                    <br>
                    <img style="width: 50%;height: 50%;" alt="" src="${pageContext.request.contextPath }/resources/uploads/${event.image}">
                  </div>
                </div>
            	
                  <div class="form-group ">
                    <label for="lastname" class="control-label col-lg-2">Thời gian bắt đầu:</label>
                    <div class="col-lg-10 col-sm-9">
                  
				    <input class="form-control"  name="time_start" type="datetime-local" value="${event.time_start}" id="example-datetime-local-input">
				  </div>
                  </div>
                  <div class="form-group ">
                    <label for="lastname" class="control-label col-lg-2">Thời gian kết thúc:</label>
                    <div class="col-lg-10 col-sm-9">
					    <input class="form-control" name="time_end" type="datetime-local" value="${event.time_end}" id="example-datetime-local-input">
					  </div>
                  </div>
                   <div class="form-group ">
                    <label for="firstname" class="control-label col-lg-2">Địa điểm</label>
                    <div class="col-lg-10">
                      <input class=" form-control" id="firstname" value="${event.place }" name="place" type="text" />
                    </div>
                  </div>
                 <div class="form-group ">
                    <label for="lastname" class="control-label col-lg-2">Mô tả</label>
                    <div class="col-lg-10">
                      <textarea class=" form-control" name="decription" rows="" cols="">${event.decription }</textarea>
                    </div>
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