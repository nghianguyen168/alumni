<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/tags/taglib.jsp"%>
<!DOCTYPE html>
<div id="alumni">
        <div class="container">
            <div class="chia2">
                <div class="danh-muc">
                    <div class="sub-title">BỘ LỌC</div>
                    <ul>
                        <li class="category-list">
                            <span class="category-span">Tìm kiếm theo</span>
                        </li>

                        <li class="category-list">
                            <span class="category-span">Năm tham gia</span>
                        </li>
                        <li class="category-list">
                            <span class="category-span">Năm tốt nghiệp</span>
                        </li>
                        <li class="category-list">
                            <span class="category-span">Ngành</span>
                        </li>
                        <li class="category-list">
                            <span class="category-span">Trình độ</span>
                        </li>
                        <li class="category-list">
                            <span class="category-span">Hệ đào tạo</span>
                        </li>



                    </ul>
                </div>
                <div class="dang-tin">
                    <div class="banner">
                        <div>
                            <span>${memberList.size()} Thành Viên Trong Cộng Đồng</span>
                        </div>
                    </div>
                    <div class="member">
                    
                    <c:if test="${not empty memberList }">
                    	<c:forEach items="${memberList }" var="member">
                    		 <div class="chia4">
                            <div>
                                <div>
                                    <img class="avatar" href="" src="/resources/uploads/${member.avatar }">
                                </div>
                                <div class="padding-left">
                                	<div style="display: block;">
                                	<div style="float: left;">
                                		 <a  class="font-color" href="/profile/index/${member.id}">${member.firstName } ${member.lastName }</a>
                                	</div>	
                                	<div style="float: right;">
                                		<button title="Nhắn tin" style="border: none;" ><img src="/resources/templates/public/chat.png"></button>
                                	</div>
                                			
                                	</div>
                                   <br>
                                 	<br>
                                    <div>
                                        <div class="margin-bottom-2 overflow padding-top1">${member.memberType.typeName }, Tốt nghiệp năm ${member.yearGreduate }</div>
                                        <div class="margin-bottom-2 overflow">${member.major.majorName }</div>
                                        <div class="overflow">${member.addressNow}</div>
                                    </div>
                                </div>
                                <div class="add-network">
                                    <i class="fa fa-user-plus"></i>
                                    <span>THÊM BẠN BÈ</span>
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