<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/tags/taglib.jsp"%>
<div class="row mt">
    <div class="col-lg-12">
        <h4>
            <i class="fa fa-angle-right"></i> THÊM THÀNH VIÊN
        </h4>
        <div class="form-panel" style="height: 210px;">
            <div style="text-align: center;margin-top: 50px;">
                <button type="submit" id="add_member_list" class="btn-loading btn btn-primary"  data-loading-text="<i class='fa fa-spinner fa-spin'></i> Đang xử lý"><i class="fa fa-user-circle-o" aria-hidden="true"></i> Thêm 1 Thành Viên</button>
                <button type="submit" id="add_member_list" class="btn-loading btn btn-primary"  data-loading-text="<i class='fa fa-spinner fa-spin'></i> Đang xử lý"><i class="fa fa-list" aria-hidden="true"></i> Thêm Theo Danh Sách (Excel)</button>
            </div>
            </div>

    </div>
    <!-- /col-lg-12 -->
</div>
<script>
    document.getElementById("home").classList.remove('active');
    document.getElementById("news").classList.add('active');
</script>