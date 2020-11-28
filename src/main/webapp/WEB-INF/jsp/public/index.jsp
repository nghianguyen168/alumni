<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Date"%>
<%@include file="/WEB-INF/templates/tags/taglib.jsp"%>
<div id="news">
	<div class="container">
		<div class="chia2">
			<h2>TIN MỚI</h2>
			<ul>
				<li><a href="/news/index">XEM TẤT CẢ</a></li>
			</ul>
		</div>

		
	 <div class="top-content">
    <div class="container-fluid">
        <div id="carousel-example" class="carousel slide" data-ride="carousel">
            <div class="carousel-inner row w-100 mx-auto" role="listbox">
            
                <div  class="carousel-item col-12 col-sm-6 col-md-4 col-lg-3 active">
                     <div>
						<a href="/news/detail/${newsList.get(newsList.size()-1).getId()}"><img
							style="width: 100%; object-fit: cover; height: 150px;"
							src="/resources/uploads/${newsList.get(newsList.size()-1).getPicture() }"></a>
						<div>
						<fmt:parseDate value="${newsList.get(newsList.size()-1).getCreateAt()}" pattern="yyyy-MM-dd HH:mm" var="time"/>
							<div class="date"><fmt:formatDate value="${time}"  pattern="dd-MM-yyyy HH:mm a"/></div>
							<a color: #33739E; href="/news/detail/${newsList.get(newsList.size()-1).getId() }"><strong>${newsList.get(newsList.size()-1).getNewsName()}</strong></a>
							<br>
							<div style="max-height: 150px;">
								<div>${newsList.get(newsList.size()-1).getDecription()}</div>

							</div>
							
						</div>
					</div>
                </div>
                 <c:if test="${not empty newsList }">
				<c:forEach items="${newsList }" var="news">
                <div class="carousel-item col-12 col-sm-6 col-md-4 col-lg-3">
                    <div>
						<a href="/news/detail/${news.id }"><img
							style="width: 100%; object-fit: cover; height: 150px;"
							src="/resources/uploads/${news.picture }"></a>
						<div>
						<fmt:parseDate value="${news.createAt }" pattern="yyyy-MM-dd HH:mm" var="time"/>
							<div class="date"><fmt:formatDate value="${time}"  pattern="dd-MM-yyyy HH:mm a"/></div>
							<a style="color: #33739E;" href="/news/detail/${news.id }"><strong>${news.newsName }</strong></a>
							<br>
							<div style="max-height: 150px;">
								<div>${news.decription }</div>

							</div>
							<br>
							<br>
							<!-- <div style="position: absolute;right:0;bottom:0; margin-top: 30px;">
								<a href="#">XEM THÊM</a>
							</div> -->
						</div>
					</div>
                </div>
                </c:forEach>
                </c:if>
                <a class="carousel-control-prev" href="#carousel-example" role="button" data-slide="prev" >
                <span style="background-color: #ccc;" class="carousel-control-prev-icon" aria-hidden="true"></span">
                <span style="background-color: #ccc;"  class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carousel-example" role="button" data-slide="next">
                <span style="background-color: #ccc;"  class="carousel-control-next-icon" aria-hidden="true"></span>
                <span style="background-color: #ccc;"  class="sr-only">Next</span>
            </a>
            </div>
           
        </div>
</div>


<script>
$('#carousel-example').on('slide.bs.carousel', function (e) {
    /*
        CC 2.0 License Iatek LLC 2018 - Attribution required
    */
    var $e = $(e.relatedTarget);
    var idx = $e.index();
    var itemsPerSlide = 5;
    var totalItems = $('.carousel-item').length;
 
    if (idx >= totalItems-(itemsPerSlide-1)) {
        var it = itemsPerSlide - (totalItems - idx);
        for (var i=0; i<it; i++) {
            // append slides to end
            if (e.direction=="left") {
                $('.carousel-item').eq(i).appendTo('.carousel-inner');
            }
            else {
                $('.carousel-item').eq(0).appendTo('.carousel-inner');
            }
        }
    }
});
</script>
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
						<img
							style="width: 100%; object-fit: cover; height: 150px;"
							src="/resources/uploads/${event.image }">
							<div>
								<a style="font-size: 18px;" href="/event/detail/${event.id }">${event.eventName }</a>
							</div>
							<%-- <fmt:parseDate value="${event.time_start }" pattern="yyyy-MM-dd" var="start"/>
								<c:choose >
											
											<c:when test="${start gt now }">
													<c:set var="event_status" value="Sắp diễn ra"/>
													<div class="job-status-open" style="color: white;">${ event_status }</div>
											</c:when>
											<c:otherwise>
												<c:set var="event_status" value="Đã kết thúc"/>
													<div class="job-status-close" style="color: white;">${ event_status }</div>
											</c:otherwise>
								</c:choose> --%>
										
							
							<%-- <fmt:parseDate pattern="yyyy-MM-dd HH:mm:ss"
								value="${event.time_start}" var="start" />
							<fmt:parseDate pattern="yyyy-MM-dd HH:mm:ss"
								value="${event.time_end}" var="end" /> --%>
							<%-- <fmt:parseDate value="${event.time_start}" var="start" type="date" pattern="dd/MM/yyyy HH:mm:ss a" /> --%>
							<%-- <fmt:formatDate type="both"  dateStyle="short" pattern="dd/MM/yyyy"
								value="${event.time_start}" /> --%>
							

							<div class="time">
							<fmt:parseDate value="${event.timeStart }" pattern="yyyy-MM-dd HH:mm" var="start"/>
							
								<div>
									<strong>Bắt đầu:</strong>
									<%-- <fmt:formatDate type="both" dateStyle="short" timeStyle="short"
										value="${event.time_start }" /> --%>
										<fmt:formatDate value="${start}"  pattern="dd-MM-yyyy HH:mm a"/>
								</div>
							
							<fmt:parseDate value="${event.timeEnd }" pattern="yyyy-MM-dd HH:mm" var="end"/>
								<div>
									<strong>Kết thúc:</strong>
									<%-- <fmt:formatDate type="both" dateStyle="short" timeStyle="short"
										value="${event.time_end }" /> --%>
										<fmt:formatDate value="${end}" pattern="dd-MM-yyyy HH:mm a"/>
								
								</div>
								<br>
								<div><i class="fa fa-map-marker" aria-hidden="true"></i>  ${event.place }</div>
							</div>


							<a></a>
							<div>
								<div style="float: right;">
								<br>
									<a href="#">XEM THÊM</a>
								</div>
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
<Style>
		@media (min-width: 768px) and (max-width: 991px) {
    /* Show 4th slide on md if col-md-4*/
    .carousel-inner .active.col-md-4.carousel-item + .carousel-item + .carousel-item + .carousel-item {
        position: absolute;
        top: 0;
        right: -33.3333%;  /*change this with javascript in the future*/
        z-index: -1;
        display: block;
        visibility: visible;
    }
}
@media (min-width: 576px) and (max-width: 768px) {
    /* Show 3rd slide on sm if col-sm-6*/
    .carousel-inner .active.col-sm-6.carousel-item + .carousel-item + .carousel-item {
        position: absolute;
        top: 0;
        right: -50%;  /*change this with javascript in the future*/
        z-index: -1;
        display: block;
        visibility: visible;
    }
}
@media (min-width: 576px) {
    .carousel-item {
        margin-right: 0;
    }
    /* show 2 items */
    .carousel-inner .active + .carousel-item {
        display: block;
    }
    .carousel-inner .carousel-item.active:not(.carousel-item-right):not(.carousel-item-left),
    .carousel-inner .carousel-item.active:not(.carousel-item-right):not(.carousel-item-left) + .carousel-item {
        transition: none;
    }
    .carousel-inner .carousel-item-next {
        position: relative;
        transform: translate3d(0, 0, 0);
    }
    /* left or forward direction */
    .active.carousel-item-left + .carousel-item-next.carousel-item-left,
    .carousel-item-next.carousel-item-left + .carousel-item,
    .carousel-item-next.carousel-item-left + .carousel-item + .carousel-item {
        position: relative;
        transform: translate3d(-100%, 0, 0);
        visibility: visible;
    }
    /* farthest right hidden item must be also positioned for animations */
    .carousel-inner .carousel-item-prev.carousel-item-right {
        position: absolute;
        top: 0;
        left: 0;
        z-index: -1;
        display: block;
        visibility: visible;
    }
    /* right or prev direction */
    .active.carousel-item-right + .carousel-item-prev.carousel-item-right,
    .carousel-item-prev.carousel-item-right + .carousel-item,
    .carousel-item-prev.carousel-item-right + .carousel-item + .carousel-item {
        position: relative;
        transform: translate3d(100%, 0, 0);
        visibility: visible;
        display: block;
        visibility: visible;
    }
}
/* MD */
@media (min-width: 768px) {
    /* show 3rd of 3 item slide */
    .carousel-inner .active + .carousel-item + .carousel-item {
        display: block;
    }
    .carousel-inner .carousel-item.active:not(.carousel-item-right):not(.carousel-item-left) + .carousel-item + .carousel-item {
        transition: none;
    }
    .carousel-inner .carousel-item-next {
        position: relative;
        transform: translate3d(0, 0, 0);
    }
    /* left or forward direction */
    .carousel-item-next.carousel-item-left + .carousel-item + .carousel-item + .carousel-item {
        position: relative;
        transform: translate3d(-100%, 0, 0);
        visibility: visible;
    }
    /* right or prev direction */
    .carousel-item-prev.carousel-item-right + .carousel-item + .carousel-item + .carousel-item {
        position: relative;
        transform: translate3d(100%, 0, 0);
        visibility: visible;
        display: block;
        visibility: visible;
    }
}
/* LG */
@media (min-width: 991px) {
    /* show 4th item */
    .carousel-inner .active + .carousel-item + .carousel-item + .carousel-item {
        display: block;
    }
    .carousel-inner .carousel-item.active:not(.carousel-item-right):not(.carousel-item-left) + .carousel-item + .carousel-item + .carousel-item {
        transition: none;
    }
    /* Show 5th slide on lg if col-lg-3 */
    .carousel-inner .active.col-lg-3.carousel-item + .carousel-item + .carousel-item + .carousel-item + .carousel-item {
        position: absolute;
        top: 0;
        right: -25%;  /*change this with javascript in the future*/
        z-index: -1;
        display: block;
        visibility: visible;
    }
    /* left or forward direction */
    .carousel-item-next.carousel-item-left + .carousel-item + .carousel-item + .carousel-item + .carousel-item {
        position: relative;
        transform: translate3d(-100%, 0, 0);
        visibility: visible;
    }
    /* right or prev direction //t - previous slide direction last item animation fix */
    .carousel-item-prev.carousel-item-right + .carousel-item + .carousel-item + .carousel-item + .carousel-item {
        position: relative;
        transform: translate3d(100%, 0, 0);
        visibility: visible;
        display: block;
        visibility: visible;
    }
}
</Style>