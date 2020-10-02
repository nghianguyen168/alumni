<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import = "java.util.Date" %>
<%@include file="/WEB-INF/templates/tags/taglib.jsp"%>
<div id="news">
	<div class="container">
		<div class="chia2">
			<h2>TIN MỚI</h2>
			<ul>
				<li><a href="#">XEM TẤT CẢ</a></li>
			</ul>
		</div>

		<div class="chia3">
			<c:if test="${not empty newsList }">
				<c:forEach items="${newsList }" var="news">
					<div>
						<a href="#"><img
							style="width: 100%; object-fit: cover; height: 150px;"
							src="/resources/uploads/${news.picture }"></a>
						<div>
							<div class="date">Ngày 29/11/2018</div>
							<a href="#">${newsName }</a>
							<div>
								<div>${news.decription }</div>

							</div>
							<div>
								<a href="#">XEM THÊM</a>
							</div>
						</div>
					</div>
				</c:forEach>
			</c:if>

		</div>

	</div>
</div>

<div id="event">
	<div class="container">
		<div class="chia2">
			<h2>SỰ KIỆN</h2>
			<ul>
				<li><a href="#">XEM TẤT CẢ</a></li>
			</ul>
		</div>
		<div class="chia3">
			<c:if test="${not empty eventList}">
				<c:forEach var="event" items="${eventList }">

					<div>

						<div>
							<p>
								<a href="#">${event.event_name }</a>
							</p>

							<div class="past-event">Past Event</div>
							<%-- <fmt:parseDate pattern="yyyy-MM-dd HH:mm:ss"
								value="${event.time_start}" var="start" />
							<fmt:parseDate pattern="yyyy-MM-dd HH:mm:ss"
								value="${event.time_end}" var="end" /> --%>
							<%-- <fmt:parseDate value="${event.time_start}" var="start" type="date" pattern="dd/MM/yyyy HH:mm:ss a" /> --%>
							<%-- <fmt:formatDate type="both"  dateStyle="short" pattern="dd/MM/yyyy"
								value="${event.time_start}" /> --%>
						 <%-- <fmt:parseDate value="${event.time_start}" pattern="yyyy-MM-dd HH:mm:ss" var="myDate"/>
						 <fmt:formatDate value="${myDate}" var="startFormat" type="both" dateStyle="" pattern="yyyy-MM-dd"/> --%>
      			 
							<div class="time">
								<div>Thời gian: ${event.time_start } - ${event.time_end }</div>
								<div>Địa điểm: ${event.place }</div>
							</div>
							
							
							<a></a>
							<div>
								<a href="#">XEM THÊM</a>
							</div>

						</div>
					</div>
				</c:forEach>
			</c:if>


		</div>

	</div>

</div>
<div id="contact">

	<div id="map" class="container">
		<iframe
			src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3834.105041357983!2d108.20762381528414!3d16.06003804394906!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x314219b4239d8e51%3A0x96e408c6b0419760!2sDuy%20Tan%20University!5e0!3m2!1sen!2s!4v1599825739086!5m2!1sen!2s"
			width="100%" height="400" frameborder="0" style="border: 0;"
			allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
	</div>
	<div id="contact-info" class="container">
		<div class="contact-1of-2">
			<div>
				<h2>LIÊN HỆ</h2>
				<div class="icon1">
					<span class="material-icons"> place </span>
					<p>254 Nguyễn Văn Linh, Quận Thanh Khê, Tp Đà Nẵng</p>
				</div>

				<div class="icon1">
					<span class="material-icons"> call </span>

					<p>(+84) 333 456 789</p>
				</div>

				<div class="icon1">
					<span class="material-icons">attachment</span>
					<p>
						<a href="#">www.alumni.duytan.edu.vn</a>
					</p>
				</div>
				<div class="icon1">
					<span class="material-icons"> email </span>
					<p>contact@alumni.duytan.deu.vn</p>
				</div>

			</div>
		</div>

		<div class="contact-1of-2">
			<form>
				<div class="two-col ">
					<div>
						<label for="name ">Họ tên của bạn</label> <input type="name "
							name="name " id="name ">
					</div>
					<div>
						<label for="email ">địa chỉ email</label> <input type="email "
							name="email " id="email ">
					</div>
				</div>
				<div>
					<label for="message ">Lời nhắn</label>
					<textarea id="message " name="message " rows="10 "></textarea>
				</div>
				<div>
					<button type="submit ">Gửi Ý kiến</button>
				</div>
			</form>
		</div>

	</div>
</div>