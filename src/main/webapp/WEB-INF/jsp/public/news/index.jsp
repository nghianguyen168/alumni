<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/tags/taglib.jsp"%>
<!DOCTYPE html>
<div id="career">
	<div class="container">
		<div class="col-md-12 col-sm-12"
			style="display: flex; margin-top: 20px; flex-wrap: wrap;">
			<c:if test="${not empty newsList }">
				<c:forEach items="${newsList }" var="news">


					<div class="col-md-3 col-sm-3">
						<section style="padding-bottom: 12px;">
							<a href=" ">
								<div>
									<img src="/resources/uploads/${news.picture }"
										style="margin-bottom: 10px; width: 100%; height: 180px;">
								</div>
							</a> <a href="/news/detail/${news.id }" class="title-a ">${news.newsName }</a>
							<fmt:parseDate value="${news.createAt }" pattern="yyyy-MM-dd HH:mm" var="time"/>
            				<span><i><fmt:formatDate value="${time}"  pattern="dd-MM-yyyy HH:mm a"/></i></span> 
							<%--  <p>
                        ${news.decription.substring(0,400) }
                    </p> --%>
							<div style="text-align: end;">
								<a href="#" style="text-align: end;">Xem Tiếp</a>
							</div>
						</section>
					</div>
				</c:forEach>
			</c:if>

		</div>
	</div>
</div>
