<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@include file="/WEB-INF/templates/tags/taglib.jsp"%>
<!DOCTYPE html>
 <div class="notice">
        <div class="background-black">
        </div>
        <div id="NEN1" >
            <div class="">
                <h2 class="title-text">
                    <span>Notification</span>
                </h2>
                
            </div>
        
            <ul style="margin-top: 20px;" class="notifications">
            <c:if test="${not empty newRequestFriendList }">
            	<c:forEach items="${newRequestFriendList }" var="add">
            	
                <li class="notification">
                <div>
                    <div style="float: left;">
                        <a href="#" style="text-decoration: none; font-weight: 400;">
                            <img src="/resources/uploads/${add.member.avatar }" alt="" class="avatar">
                            </a>
	                            <div style="text-align: left; ">
	                                <div class="notice-info">
									<strong>${add.member.firstName } ${add.member.lastName } </strong>	 đã gửi yêu cầu kết bạn.
	                                </div>
	                                <div class="notice-date">
	                                    Sep 17, 2020
	                                </div>
	                            </div>
	                  </div>
	                            <div style="float: right;">
	                            	<button type="button" class="btn btn-success">Đồng ý</button>
	                            	<button type="button" class="btn btn-secondary">Xóa</button>
	                            </div>
                            
                        
                    </div>
                </li>
                
            	</c:forEach>
            </c:if>
              
            </ul>
        </div>
  </div>
  