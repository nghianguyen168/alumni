<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/tags/taglib.jsp"%>
<!DOCTYPE html>
<div class="container" style="display: flex; margin-top: 15px;">

        <div class="col-md-9 col-sm-8 news-detail">
        	
            <h2>
                ${news.newsName }
            </h2>
            	<fmt:parseDate value="${news.createAt }" pattern="yyyy-MM-dd HH:mm" var="time"/>
            <span><i><fmt:formatDate value="${time}"  pattern="dd-MM-yyyy HH:mm a"/></i></span> 
            <p>
               ${news.detail }
            </p>
          </div>
           
        <div class="col-md-3 col-sm-4" style="margin-top: 10px;">
            <div class="news-recent" style="margin-bottom: 15px;">
                <h3>
                    TIN MỚI NHẤT
                </h3>
            </div>
            <div>
            <c:if test="${not empty newsListRelated }">
		<c:forEach items="${newsListRelated }" var="news">
                <section style="padding-bottom: 5px;">
                    <a href="">
                        <div>
                            <img src="/resources/uploads/${news.picture }" style="margin-bottom: 10px; width: 100%;">
                        </div>
                    </a>
                    <a href="/news/detail/${news.id }" class="title-a">${news.newsName }</a>
                    <p>
                      
                    </p>
                </section>
                </c:forEach>
	</c:if>
            </div>
        </div>
        
  </div>
    
 