<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/tags/taglib.jsp"%>
<div id="profile">
    <div class="container">
        <div class="container py-2" style="background-color: white; margin-bottom: 450px;">
            <c:if test="${not empty msg}">
                <div class="alert alert-danger fade in alert-dismissible" style="margin-top: 18px;">
                    <a href="#" class="close" data-dismiss="alert" aria-label="close" title="close">×</a> <strong>${msg}</strong>
                </div>
            </c:if>
            <div class="row my-2">
                <!-- edit form column -->
                <div class="col-lg-4">

                    <div class="alert alert-info alert-dismissable"> <h3 class="text-center font-weight-light">CẬP NHẬT MẬT KHẨU</h3> </div>
                </div>

                <div class="col-lg-8 order-lg-1 personal-info">
                    <form role="form" method="post" action="/profile/reset-password" >
                        <div class="form-group row">
                            <label class="col-lg-3 col-form-label form-control-label">Mật khẩu cũ</label>
                            <div class="col-lg-9">
                                <input class="form-control" name="password" type="text" value="" required/>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-lg-3 col-form-label form-control-label">Mật khẩu mới</label>
                            <div class="col-lg-9">
                                <input class="form-control" id="newpassword" name="newpassword" type="password" value="" required minlength="6"/>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-lg-3 col-form-label form-control-label">Xác nhận mật khẩu mới</label>
                            <div class="col-lg-9">
                                <input class="form-control"   class="datepicker"  id="re-newpassword"  name="re-newpassword" type="password"   value="" required minlength="6"/>

                            </div>
                        </div>
                            <script>
                                var password = document.getElementById("newpassword")
                                    , confirm_password = document.getElementById("renewpassword");

                                function validatePassword(){
                                    if(password.value != confirm_password.value) {
                                        confirm_password.setCustomValidity("Passwords Don't Match");
                                    } else {
                                        confirm_password.setCustomValidity('');
                                    }
                                }

                                password.onchange = validatePassword;
                                confirm_password.onkeyup = validatePassword;
                            </script>
                        <div class="form-group row">
                            <div class="col-lg-9 ml-auto text-right">
                                <input type="reset" class="btn btn-outline-secondary" value="Cancel"  onclick="window.history.go(-1); return false;" />
                                <button type="submit" class="btn-loading btn btn-primary"  data-loading-text="<i class='fa fa-spinner fa-spin'></i> Đang cập nhật">Cập nhật</button>
                            </div>
                        </div>
                    </form>
            </div>
        </div>
    </div>
</div>

