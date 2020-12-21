<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="/WEB-INF/templates/tags/taglib.jsp" %>
<!DOCTYPE html>
<div id="alumni">
<div class="container">
<div class="chia2">
<div class="danh-muc">
<div class="sub-title">BỘ LỌC</div>
<form action="/member/search" method="post">
    <div class="md-form mt-0">
        <input class="form-control" type="text" name="nameSearch" value="${nameSearch}" placeholder="Tìm theo tên..." aria-label="Search">
    </div>
    <input type="submit"
           style="position: absolute; left: -9999px; width: 1px; height: 1px;"
           tabindex="-1"/>
    <br>
</form>
    <c:if test="${not empty searchSize}">
        <div class="alert alert-success" role="alert">
            ${searchSize} kết quả tìm thấy
        </div>
    </c:if>
<ul>
<li class="category-list">
    <span onclick="return myFunction();" class="category-span">Khóa</span>
</li>

<form action="/member/search" method="post">
    <select id="khoa-select" name="khoa" style="display: none;"
            class="browser-default custom-select custom-select-lg mb-3"
            onchange="this.form.submit()">
        <option selected>-- Chọn khóa học --</option>
        <c:if test="${not empty knameService.findAll() }">
            <c:forEach items="${knameService.findAll() }" var="kn">

                <option value="${kn.id }">${kn.k }</option>
            </c:forEach>
        </c:if>
    </select>
</form>
<script>

    function myFunction() {
        document.getElementById("khoa-select").style.display = "block";
    }

    function majorSelect() {
        document.getElementById("major-select").style.display = "block";
    }

    function typeSelect() {
        document.getElementById("type-select").style.display = "block";
    }
</script>


<li class="category-list">
    <span onclick="return majorSelect();" class="category-span">Ngành</span>
</li>
<form action="/member/search" method="post">
<select id="major-select" name="major_id" style="display: none;"
class="browser-default custom-select custom-select-lg mb-3"
onchange="this.form.submit()">
<option selected>-- Chọn ngành học --</option>
<c:if test="${not empty majorService.findAll()}">
    <c:forEach items="${majorService.findAll() }" var="major">


        <option value="${major.id }">${major.majorName }</option>
</c:forEach>
</c:if>
        </select>
        </form>
        <li class="category-list">
        <span onclick="return typeSelect();" class="category-span">Kiểu thành viên</span>
        </li>
        <form action="/member/search" method="post">
        <select id="type-select" name="role_id" style="display: none;"
        class="browser-default custom-select custom-select-lg mb-3"
        onchange="this.form.submit()">
            <option value="0">-- Chọn kiểu thành viên --</option>
        <c:if test="${not empty roleService.findAll()}">
            <c:forEach items="${roleService.findAll() }" var="role">
                <c:if test="${role.name !='ADMIN' && role.name != 'MANAGER'}">
                    <option value="${role.id }">${role.name }</option>
                </c:if>


            </c:forEach>
        </c:if>
        </select>
        </form>



        </ul>
        </div>
        <div class="dang-tin" style="background-color: white;">
        <div class="banner" style="background-color: #428bca; ">
        <div>
        <span>${memberList.size()} Thành Viên Trong Cộng Đồng</span>
        </div>
        </div>
        <div id="member-list" class="member" >

        <c:if test="${not empty memberList }">
            <c:forEach items="${memberList }" var="member">
                <c:if test="${member.role.name !='ADMIN' && member.role.name != 'MANAGER'}">
                    <div class="chia4">
                        <div>
                            <div>
                                <c:choose>
                                    <c:when test="${not empty member.avatar}">
                                        <img class="avatar" href="" src="/resources/uploads/${member.avatar }">
                                    </c:when>
                                    <c:otherwise>
                                        <img  class="avatar" href="" src="/resources/uploads/no-avatar.png">
                                    </c:otherwise>
                                </c:choose>


                            </div>
                            <div class="padding-left">
                                <div style="display: block;">
                                    <div style="float: left;">
                                        <a class="font-color" style="color: #0f74a8"
                                           href="/member/detail/${member.id}"><strong>${member.firstName } ${member.lastName }</strong></a>
                                    </div>
                                    <div style="float: right;">
                                        <button title="Nhắn tin" style="border: none;"><img
                                                src="/resources/templates/public/chat.png"></button>
                                    </div>
                                </div>
                                <br>
                                <br>
                                <div>
                                    <div class="margin-bottom-2 overflow padding-top1">${member.role.name }, ${member.kn.k }</div>
                                    <div class="margin-bottom-2 overflow">${member.major.majorName }</div>
                                    <div class="overflow">${member.addressNow}</div>
                                </div>
                            </div>
                            <div class="add-network" id="add-friend-${member.id }">
                                <i class="fa fa-user-plus"></i>
                                <span>THÊM BẠN BÈ</span>
                            </div>
                        </div>
                    </div>
                </c:if>

                <script type="text/javascript">

                    $(document).on('click', '#add-friend-${member.id },add-friend-${member.id }', function (e) {
                        var id = ${member.id}
                            $.ajax({
                                url: '${pageContext.request.contextPath}/network/add-friend',
                                type: 'POST',
                                cache: false,
                                data: {
                                    //(key , value)

                                    id: id
                                },
                                success: function (response) {
                                    $('#add-friend-${member.id}').html("<i class=\"fa fa-check\" aria-hidden=\"true\"></i>\r\n" +
                                        "				                                    <span>Đã gửi yêu cầu</span>");


                                },
                                error: function (response) {
                                    alert('Có lỗi xảy ra');
                                }
                            });
                        return false;
                    });

                </script>

            </c:forEach>
        </c:if>


        </div>
        </div>
        </div>

<br>
        <br>
        <script src="/resources/templates/public/js/jquery.simpleLoadMore.js"></script>
        <script src="/resources/templates/public/js/loading.js"></script>
        <!-- <script src="jquery.simpleLoadMore.js"></script> -->

        <script>
        $('#member-list').simpleLoadMore({
        item: '.chia4',
        count: 20,
        counterInBtn: true,
        btnText: 'Xem thêm {showing}/{total}',
        });
        </script>
        <script type="text/javascript">

        var _gaq = _gaq || [];
        _gaq.push(['_setAccount', 'UA-36251023-1']);
        _gaq.push(['_setDomainName', 'jqueryscript.net']);
        _gaq.push(['_trackPageview']);

        (function () {
        var ga = document.createElement('script');
        ga.type = 'text/javascript';
        ga.async = true;
        ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
        var s = document.getElementsByTagName('script')[0];
        s.parentNode.insertBefore(ga, s);
        })();

        </script>
