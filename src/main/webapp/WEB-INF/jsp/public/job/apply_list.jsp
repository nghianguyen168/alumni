<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/tags/taglib.jsp"%>
<jsp:useBean id="now" class="java.util.Date" /> 
<!DOCTYPE html>
<div id="career">
	<div class="container">
		<div class="chia2">
			<div class="danh-muc">
				<div class="sub-title">DANH MỤC VIỆC LÀM</div>
				<ul>
				<a href="/job/index">
					<li class="category-list"><span class="category-span">Tất
							cả công việc</span> <span class="category-count">${total }</span></li>
				</a>
					
					<div style="margin: 0; padding: 15px 0 18px;">
						<c:if test="${not empty majorList }">
							<c:forEach items="${majorList }" var="major">

								<li><label> <span class="span-career"><a onclick="return loading();" href="/job/major/${major.id }">${major.majorName}</a></span>
								</label></li>
								
							</c:forEach>
						</c:if>


					</div>
					<li class="category-list"><span class="category-span">Tôi
							đăng tuyển</span> <span class="category-count">0</span></li>
					<li  class="category-list"><span class="category-span"><a style="text-decoration: none;"
											onclick="return loading();" href="/job/user-post">Tôi đăng tuyển</a></span>
								</li>

				</ul>
			</div>

			<div class="dang-tin">
			
				
				<div></div>
				<br>
	
				<div class="job-list" style="background-color: white;  box-shadow: 0 2px 2px 0 rgba(0, 0, 0, 0.14), 0 3px 1px -2px rgba(0, 0, 0, 0.2), 0 1px 5px 0 rgba(0, 0, 0, 0.12);"">
					<table class="table table-striped">
						  <thead>
						    <tr>
						      <th scope="col">#</th>
						      <th scope="col">Ứng viên</th>
						      <th scope="col">Dtu Mail</th>
						      <th scope="col">Email cá nhân</th>
						      <th scope="col">Apply time</th>
						      <th scope="col">CV</th>
						    </tr>
						  </thead>
						  <tbody>
						  <c:if test="${not empty applyList }">
						  	<c:forEach items="${applyList }" var="apply">
						  		<tr>
							      <th scope="row">1</th>
							      <td>${apply.member.firstName } ${apply.member.lastName }</td>
							      <td> <a style="display: inline; text-decoration: none" href="mailto: ${job.member.dtuMail}">${apply.member.dtuMail}</a></td>
							      <td><a style="display: inline; text-decoration: none" href="mailto: ${job.member.email}">${apply.member.email}</a></td>
							      <td>${apply.applyOn }</td>
							      <td ><a href="/resources/uploads/${apply.cv}">${apply.cv}</a>
							       </td>
							    </tr>
						  	</c:forEach>
						  </c:if>
						    
						   
						  </tbody>
						</table>
					
<p class="totop"> 
    <a href="#top">Back to top</a> 
</p>
<div id="wait" style="display:none;width:120px;height:120px;position:absolute;top:50%;left:47%;padding:2px;z-index:3"><img src='/resources/templates/loading8.gif' width="100" height="100" /></div>
 <script src="https://code.jquery.com/jquery-1.12.4.min.js" integrity="sha384-nvAa0+6Qg9clwYCGGPpDQLVpLNn0fRaROjHqs13t4Ggj3Ez50XnGQqc/r8MhnRDZ" crossorigin="anonymous"></script>
  <script src="/resources/templates/public/js/jquery.simpleLoadMore.js"></script>
    <script src="/resources/templates/public/js/loading.js"></script>
  <!-- <script src="jquery.simpleLoadMore.js"></script> -->
  <script>
    $('.job-list').simpleLoadMore({
      item: '.current-tab',
      count: 5,
      counterInBtn: true,
      btnText: 'View More {showing}/{total}',
    });
  </script>
  <script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-36251023-1']);
  _gaq.push(['_setDomainName', 'jqueryscript.net']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>
				</div>
					
			</div>
			
		</div>
		<script type="text/javascript">
			CKEDITOR.replace('decription');
		</script>
	</div>
</div>