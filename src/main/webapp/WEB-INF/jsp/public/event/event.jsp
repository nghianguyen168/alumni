<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/tags/taglib.jsp"%>
<!DOCTYPE html>
<div id="career">
    <div class="container">
        <div class="col-md-12 col-sm-12"
             style="display: flex; margin-top: 20px; flex-wrap: wrap;">
            <c:if test="${not empty eventList }">
                <c:forEach items="${eventList }" var="event">


                    <div class="col-md-3 col-sm-3">
                        <section style="padding-bottom: 12px;">
                            <a href=" ">
                                <div>
                                    <img src="/resources/uploads/${event.image }"
                                         style="margin-bottom: 10px; width: 100%; height: 180px;">
                                </div>
                            </a> <a href="/event/detail/${event.id }" class="title-a ">${event.eventName }</a>
                            <fmt:parseDate value="${event.timeStart }" pattern="yyyy-MM-dd HH:mm" var="start"/>
                            <fmt:parseDate value="${event.timeEnd }" pattern="yyyy-MM-dd HH:mm" var="end"/>
                            <span>Bắt đầu: <i><fmt:formatDate value="${start}"  pattern="dd-MM-yyyy HH:mm a"/></i></span><br>
                            <span>Kết thúc: <i><fmt:formatDate value="${end}"  pattern="dd-MM-yyyy HH:mm a"/></i></span>
                                <%--  <p>
                            ${news.decription.substring(0,400) }
                        </p> --%>
                            <div style="text-align: end;">
                                <a href="/event/detail/${event.id}" style="text-align: end;">Chi tiết</a>
                            </div>
                        </section>
                    </div>
                </c:forEach>
            </c:if>

        </div>
    </div>
</div>
