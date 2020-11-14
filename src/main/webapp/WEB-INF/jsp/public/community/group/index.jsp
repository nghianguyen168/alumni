<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@include file="/WEB-INF/templates/tags/taglib.jsp"%>
<!DOCTYPE html>
<div id="group">
<div class="container">
 <div class="chia2">
                <div class="menu-group">
                    <div style="background-image: url(/resources/templates/public/community/images/bg1.jpg) ; height: 140px;">
                        <p style="text-align: center; padding: 55px 40px; color: white; font-size: 25px;">${alumni_group.group_name }</p>
                    </div>
                    <div class="iq-sidebar">
                        <div id="sidebar-scrollbars">
                            <nav class="iq-sidebar-menu">
                                <ul id="iq-sidebar-toggle" class="iq-menu" style="padding-top: 15px;">
                                    <li >
                                        <a href="/community/index/0" class="iq-waves-effect"><i class="ri-newspaper-line"></i><span>Cộng đồng DTU</span></a>
                                    </li>
                                     <li class="active">
                                        <a href="/community/group" class="iq-waves-effect"><i class="fa fa-users" aria-hidden="true"></i><span>Nhóm</span></a>
                                    </li>
                                    <li>
                                        <a href="#" class="iq-waves-effect"><i class="ri-group-line"></i><span>Thành viên</span></a>
                                    </li>
                                    <li>
                                        <a href="#" class="iq-waves-effect"><i class="ri-calendar-event-fill"></i><span>Sự kiện</span></a>
                                    </li>
                                    <li>
                                        <a href="#" class="iq-waves-effect"><i class="ri-file-line"></i><span>Files</span></a>
                                    </li>
                                    <li>
                                        <a href="#" class="iq-waves-effect"><i class="ri-messenger-line"></i><span>Chat</span></a>
                                    </li>

                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
               
<div class="newfeed">
            <div class="iq-search-bar">
                <form action="#" class="searchbox">
                    <input type="text" class="text search-input" placeholder="Tìm kiếm nhóm...">
                    <a class="search-link" href="#"><i class="ri-search-line"></i></a>
                </form>
            </div>
            <div class="row">
             <c:if test="${not empty groupList }">
             <c:forEach items="${groupList }" var="group">
            
                <div class="col-md-6 col-lg-4">
                    <div class="iq-card">
                      <!--   <div class="top-bg-image">
                            <img src="images/page-img/profile-bg2.jpg" class="img-fluid w-100" alt="group-bg">
                        </div> -->
                        <div class="iq-card-body text-center">
                            <div class="group-icon">
                                <a href="#"><img src="/resources/templates/public/community/images/page-img/gi-2.jpg" alt="profile-img" class="rounded-circle img-fluid avatar-80" style="margin-top: 60px;"></a>
                            </div>
                            <div class="group-info pt-3 pb-3">
                                <a href="/community/index/${group.id }">
                                    <h4>${group.groupName }</h4>
                                </a>
                            </div>
                            <div class="group-details d-inline-block pb-3">
                                <ul class="d-flex align-items-center justify-content-between list-inline m-0 p-0">
                                    <li class="pl-3 pr-3">
                                        <p class="mb-0">Thành viên</p>
                                        <h6>${group.sumMember }</h6>
                                    </li>
                                </ul>
                            </div>
                           
                            <button type="submit" class="btn btn-primary d-block w-100">Tham gia nhóm</button>
                        </div>
                    </div>
                </div>
                 </c:forEach>
                </c:if>
                </div>
            </div>
        </div>
        </div>
        
        </div>
        </div>
        