<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<div class="row mt">
    <div class="col-lg-12">
        <h4><i class="fa fa-angle-right"></i> THÊM NHÓM</h4>
        <div class="form-panel">
            <div class="form">
                <form class="cmxform form-horizontal style-form"  id="signupForm" method="post" action="${pageContext.request.contextPath }/admin/group/add">
                    <div class="form-group ">
                        <label  class="control-label col-lg-2">Tên Nhóm</label>
                        <div class="col-lg-10">
                            <input class=" form-control" id="groupName" name="groupName" type="text" required="required" style="width: 40%"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="control-label col-lg-2">Mô Tả</label>
                        <div class="col-lg-10">
                            <input type="text" class=" form-control"  class="default" name="groupDecription" style="width: 40%"/>
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