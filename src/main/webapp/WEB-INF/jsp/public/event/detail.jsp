<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/tags/taglib.jsp"%>
<jsp:useBean id="now" class="java.util.Date" /> 
<!DOCTYPE html>
<div class="container" style="display: flex; margin-top: 15px;">

        <div class="col-md-9 col-sm-8 news-detail">
          <div class="col-md-4 col-sm-4 shadow" style="margin-top: 10px; background-color: #dee2e6; height: 500px;">
            <div>
                <section style="padding-bottom: 5px;">
                    <a href="">
                        <div>
                            <img src="/resources/uploads/${event.image }" style="margin-bottom: 10px; width: 100%;">
                        </div>
                    </a>
                </section>
                <div class="detail-event" style="padding: 15px; font-size: 14px;">
                    <div>
                        <p>Ngày và giờ:</p>
                    </div>
                    <div>
                    	<fmt:parseDate value="${event.timeStart }" pattern="yyyy-MM-dd HH:mm" var="start"/>
                        <span>Bắt đầu: <strong><fmt:formatDate value="${start}"  pattern="dd-MM-yyyy HH:mm a"/></strong></span>
                    </div>
                    <div>
                    <fmt:parseDate value="${event.timeEnd }" pattern="yyyy-MM-dd HH:mm" var="end"/>
                        <span>Kết thúc: <strong><fmt:formatDate value="${end}"  pattern="dd-MM-yyyy HH:mm a"/></strong></span>
                    </div>
                    
                
                    <c:choose>
                    	<c:when test="${event.timeStart lt now}">
                    		<span class="badge badge-pill badge-danger">Sự kiện đã kết thúc</span>
                    	</c:when>
                    	<c:when test="${event.timeStart ge now} AND ${event.timeEnd le now} ">
                    		<span class="badge badge-pill badge-success">Sự kiện đang diễn ra</span>
                    	</c:when>
                    	<c:otherwise>
                    			<span class="badge badge-pill badge-warning">Sự kiện sắp diễn ra</span>
                    	</c:otherwise>
                    
                    </c:choose>
                    
                </div>

            </div>
        </div>
        <div class="col-md-7 col-sm-8 news-detail" style="margin: 0px 10px 10px 30px;">
            <div style="margin-bottom: 30px;">
                <h3><strong>${event.eventName }</strong> 
                </h3>
                <div style="padding-top: 15px;">
                    <i class="fa fa-calendar" aria-hidden="true" style="font-size: larger; color: #777;"></i> <fmt:formatDate value="${start}"  pattern="dd-MM-yyyy HH:mm a"/>
                </div>
            </div>
            <div style="padding-bottom: 30px;">
                <div><i class="fa fa-map-marker" aria-hidden="true" style="font-size: x-large; color: #777;"></i> ${event.place }</div>
            </div>
            <div>
                <div>
                    <i class="fa fa-file-text" aria-hidden="true" style="color: #777; font-size: larger;"></i> Mô tả sự kiện:
                </div>
                <p>
                	${event.decription }
                </p>
            </div>
        </div>
          </div>
           
        <div class="col-md-3 col-sm-4" style="margin-top: 10px;">
            <div class="news-recent" style="margin-bottom: 15px;">
                <h4>
                    <strong>SỰ KIỆN SẮP DIỄN RA</strong>
                </h4>
            </div>
            <div>
           	<c:if test="${not empty comingSoonList }">
		<c:forEach items="${comingSoonList }" var="com"> 
                <section style="padding-bottom: 5px;">
                    <a href="">
                        <div>
                            <img src="/resources/uploads/${com.image }" style="margin-bottom: 10px; width: 100%;">
                        </div>
                    </a>
                    <fmt:parseDate value="${com.timeStart }" pattern="yyyy-MM-dd HH:mm" var="start1"/>
                     <div style="padding-top: 15px;">
                    <i class="fa fa-calendar" aria-hidden="true" style="font-size: larger; color: #777;"></i> <fmt:formatDate value="${start1}"  pattern="dd-MM-yyyy HH:mm a"/>
               		 </div>
                    <a href="/event/detail/${com.id }" class="title-a">${com.eventName }</a>
                    <p>
                      
                    </p>
                </section>
                </c:forEach>
	</c:if> 
            </div>
        </div>
        
  </div>
  <Style>
  	.detail-event-end {
    padding: 3px 12px;
    margin: 13px 30px 0px;
    border-radius: 12px;
    display: inline-block;
    background-color: #ff8040 !important;
    
}
footer{
	 position: absolute;
    bottom: 0;
    left: 0;
    width: 100%;
    text-align: center;
}
  </Style>
    
 