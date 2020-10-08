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
								cả công việc</span> <span class="category-count">${sumJob }</span></li>
					</a>

					<div style="margin: 0; padding: 15px 0 18px;">
						<c:if test="${not empty majorList }">
							<c:forEach items="${majorList }" var="major">

								<li><label> <span class="span-career"><a
											onclick="return loading();" href="/job/major/${major.id }">${major.majorName}</a></span>
								</label></li>

							</c:forEach>
						</c:if>


					</div>
					<li class="category-list"><span class="category-span"><a style="text-decoration: none;"
											onclick="return loading();" href="/job/apply-me">Tôi ứng tuyển</a></span> <span class="category-count">${sumApply }</span></li>
					<li class="category-list"><span class="category-span"><a
							style="text-decoration: none;" onclick="return loading();"
							href="/job/user-post">Tôi đăng tuyển</a></span></span> <span class="category-count">${sumUserPost }</span></li>
				</ul>
			</div>

			<div class="dang-tin">
			
				
				<div></div>
				<br>
					
				<div class="job-list" style="background-color: white;  box-shadow: 0 2px 2px 0 rgba(0, 0, 0, 0.14), 0 3px 1px -2px rgba(0, 0, 0, 0.2), 0 1px 5px 0 rgba(0, 0, 0, 0.12);"">
					<div>
						<div style="float: left;">
							<br>
							<h5 style="font-weight: bold; margin-left: 10px; ">Có ${sumApply} ứng viên apply vào job "<span style="color: #33739E"><i>${jobName }</i></span> "!</h5>
							<br>
						</div>
						<div style="float: right;">
							<br>
							<button id="check-apply" style="margin-right: 20px;" type="button" class="btn btn-success"><i class="fa fa-check" aria-hidden="true"></i> Đánh dấu đã check</button>
							<br>
							<script type="text/javascript">
								
								$(document).on('click','#check-apply,#check-apply',function(e){
										
												
											
												var id = ${idJob}
												
									
												$.ajax({
													url: '${pageContext.request.contextPath}/job/apply/checked',
												type : 'POST',
												cache : false,
												data : {
													//(key , value)
													
													idJob : id
												},
												success : function(response) {
													$('#check-apply').html("Đã check!");
													$('#checkApply-table').load(" #checkApply-table");
												},
												error : function(response) {
													alert('Có lỗi xảy ra');
												}
											});
											return false;
										});
										
								</script>	
						</div>
						
					</div>
					<table id="checkApply-table" class="table table-striped">
						  <thead>
						    <tr>
						      <th scope="col">#</th>
						      <th scope="col">Ứng viên</th>
						      <th scope="col">Dtu Mail</th>
						      <th scope="col">Email cá nhân</th>
						      <th scope="col">Apply time</th>
						      <th scope="col">CV</th>
						      <th scope="col">Status</th>
						    </tr>
						  </thead>
						  <tbody >
						  <c:if test="${not empty applyList }">
						  	
						  	<c:forEach items="${applyList }" var="apply" varStatus="stt" begin="0" end="${applyList.size() }">
						  	
						  	
						  		<tr>
							      <th scope="row" >${stt.index+1 }</th>
							      <td>${apply.member.firstName } ${apply.member.lastName }</td>
							      <td> <a style="display: inline; text-decoration: none" href="mailto: ${job.member.dtuMail}">${apply.member.dtuMail}</a></td>
							      <td><a style="display: inline; text-decoration: none" href="mailto: ${job.member.email}">${apply.member.email}</a></td>
							      <td class="timeApply"><fmt:formatDate type="both"
																	pattern="dd-MM-yyyy  HH:mm a" value="${apply.applyOn}" /></td>
							     
							      <td ><a href="/resources/uploads/${apply.cv}">${apply.cv}</a>
							       </td>
							       <td >
							       <c:choose>
							       		<c:when test="${apply.checkStatus ==0}">
							       				<span class="label label-warning label-mini">Mới</span>
							       		</c:when>
							       		<c:otherwise>
							       			<span class="label label-success label-mini">Đã check</span>
							       		</c:otherwise>
							       </c:choose>
							       
							       	
							       </td>
							    </tr>
						  	</c:forEach>
						  </c:if>
						    
						   
						  </tbody>
						</table>
				</div>
					<ul style="float: right; margin-top: -10px;" class="pagination">
					
						  	<c:choose>
						  		<c:when test="${page eq 1 }">
						  			  <li class="page-item"><a  class="page-link disable"   href="javascript:void(0);">Trang trước</a></li>
						  		</c:when>
						  		<c:otherwise>
						  			 <li class="page-item"><a  class="page-link"  href="/job/apply/${idJob }/${page-1}">Trang trước</a></li>
						  		</c:otherwise>
						  	</c:choose>
						
						 
						   <c:forEach var="pageT" begin="1" end="${totalPage }">
						  	
						  	<c:choose>
						  		<c:when test="${page == pageT }">
						  			<li class="page-item active"><a class="page-link" href="/job/apply/${idJob }/${pageT}">${pageT }</a></li>
						  		</c:when>
						  		<c:otherwise>
						  			 <li class="page-item"><a class="page-link" href="/job/apply/${idJob }/${pageT}">${pageT }</a></li>
						  		</c:otherwise>
						  	</c:choose>
						  </c:forEach>
						    	<c:choose>
						  		<c:when test="${page eq totalPage }">
						  			  <li class="page-item"><a  class="page-link disable"   href="javascript:void(0);">Trang sau</a></li>
						  		</c:when>
						  		<c:otherwise>
						  			 <li class="page-item"><a  class="page-link"  href="/job/apply/${idJob }/${page+1}">Trang sau</a></li>
						  		</c:otherwise>
						  	</c:choose>
						
						</ul>
			</div>
			
		</div>
		<script type="text/javascript">
			CKEDITOR.replace('decription');
		</script>
	</div>
</div>
