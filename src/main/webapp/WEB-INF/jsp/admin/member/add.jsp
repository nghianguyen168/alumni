<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/WEB-INF/templates/tags/taglib.jsp"%>
<div class="row mt">
          <div class="col-lg-12">
            <h4><i class="fa fa-angle-right"></i> THÊM THÀNH VIÊN</h4>
            <div class="form-panel">
              <div class="form">
                <form class="cmxform form-horizontal style-form" enctype="multipart/form-data" id="signupForm" method="post" action="${pageContext.request.contextPath }/admin/member/add">
                 
                  <div class="form-group ">
                    <label for="firstname" class="control-label col-lg-2">Chọn Khoa</label>
                    <div class="col-lg-10">
                    	<select class=" form-control" name="facultyId" style="width: 30%;">
                    		<c:if test="${not empty facultyList}">
                    			<c:forEach var="f" items="${facultyList }">
                    				<option value="${f.id }">${f.facultyName }</option>
                    			</c:forEach>
                    		
                    		</c:if>
                    		
                    	</select>
                    	<br>
                    </div>
                    
                  
                    <label for="firstname" class="control-label col-lg-2">Chọn Khoa</label>
                     <div class="col-lg-10">
                    	<select class=" form-control" name="kId" style="width: 30%;">
                    		<c:if test="${not empty knamesList}">
                    			<c:forEach var="kn" items="${knamesList }">
                    				<option value="${kn.id }">${kn.k }</option>
                    			</c:forEach>
                    		
                    		</c:if>
                    		
                    	</select>
                    	<br>
                    </div>
                    
                     <label for="firstname" class="control-label col-lg-2">Chọn File (Danh sách Excel)</label>
                     <div class="col-lg-10" style="width: 20%;">
                    	<input id="member-list" name="memberList" class="form-control" type="file">
                    	<br>
                    	<div id="error-message" style="display: none;">
                     		<div class="alert alert-danger" role="alert">
							  Sai định dạng file! Vui lòng chọn file exel!
							</div>
                     </div>
                    </div>
                     
                  </div>
                  
                
              
                  <div class="form-group">
                    <div class="col-lg-offset-2 col-lg-10">
                      <button id="member-add-submit" class="btn btn-theme" type="submit">Save</button>
                      <button class="btn btn-theme04" type="button">Cancel</button>
                    </div>
                  </div>
                    <script type="text/javascript">
										  $("#member-list").change(function () {
										        var fileExtension = ['xls', 'xlsx','xlsm'];
										        if ($.inArray($(this).val().split('.').pop().toLowerCase(), fileExtension) == -1) {
										        	$('#member-add-submit').attr('disabled','disabled');
										        
										        	$('#error-message').show();
										        } else{
										        	$('#member-add-submit').removeAttr('disabled','disabled');
										        	
										        }
										    });
				</script>
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