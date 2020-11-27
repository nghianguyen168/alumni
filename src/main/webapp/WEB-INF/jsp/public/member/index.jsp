<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/tags/taglib.jsp"%>
<!DOCTYPE html>
<div id="alumni">
        <div class="container">
            <div class="chia2">
                <div class="danh-muc">
                    <div class="sub-title">BỘ LỌC</div>
                    <form action="/member/search" method="post">
                    <div class="md-form mt-0">
					  <input class="form-control" type="text" placeholder="Tìm theo tên..." aria-label="Search">
					</div>
					<input type="submit" 
				       style="position: absolute; left: -9999px; width: 1px; height: 1px;"
				       tabindex="-1" />
					<br>
					</form>
                    <ul>
                        <li class="category-list">
                            <span onclick="return myFunction();" class="category-span">Khóa</span>
                        </li>
                       
                         <select id="khoa-select" style="display: none;" class="browser-default custom-select custom-select-lg mb-3" >
						  <option selected>--Chọn khóa học--</option>
						 <c:if test="${not empty knameService.findAll() }">
						 	<c:forEach items="${knameService.findAll() }" var="kn">
						 	
						 	 <option value="${kn.id }">${kn.k }</option>
						 	 </c:forEach>
						  </c:if>
						</select>
							
						<script>
						
						function myFunction() {
						  document.getElementById("khoa-select").style.display = "block";
						}
						</script>
                        <script type="text/javascript">
								$(document).on('change','#khoa-select,#khoa-select',function(e){
												
												$.ajax({
													url: '${pageContext.request.contextPath}/member/search',
												type : 'POST',
												cache : false,
												data : {
													//(key , value)
													
													k : $(this).val();
												},
												success : function(response) {
													/* $('#check-apply').html("Đã check!");
													$('#checkApply-table').load(" #checkApply-table");
													 swal({
														    title: 'Check ứng viên thành công!',
														
														    icon: 'success',
														    timer: 2000,
														    buttons: true,
														    type: 'success'
														}) */
													alert('success');
												},
												error : function(response) {
													alert('Có lỗi xảy ra');
												}
											});
											return false;
										});
										
						</script>	  
                       
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
                <div class="dang-tin" style="background-color: white;">
                    <div class="banner" style="background-color: #428bca;">
                        <div>
                            <span>${memberList.size()} Thành Viên Trong Cộng Đồng</span>
                        </div>
                    </div>
                    <div id="member-list" class="member">
	                
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
                                		 <a  class="font-color" href="/member/detail/${member.id}">${member.firstName } ${member.lastName }</a>
                                	</div>	
                                	<div style="float: right;">
                                		<button title="Nhắn tin" style="border: none;" ><img src="/resources/templates/public/chat.png"></button>
                                	</div>
                                	</div>
                                   <br>
                                 	<br>
                                    <div>
                                        <div class="margin-bottom-2 overflow padding-top1">${member.memberType.typeName }, ${member.kn.k }</div>
                                        <div class="margin-bottom-2 overflow">${member.major.majorName }</div>
                                        <div class="overflow">${member.addressNow}</div>
                                    </div>
                                </div>
                                <div class="add-network" id="add-friend-${member.id }">
                                    <i class="fa fa-user-plus"></i>
                                    <span>THÊM BẠN BÈ</span>
                                </div>
                            </div>
                        </div>
                        <script type="text/javascript">
								
								$(document).on('click','#add-friend-${member.id },add-friend-${member.id }',function(e){
												var id = ${member.id}
												$.ajax({
													url: '${pageContext.request.contextPath}/network/add-friend',
												type : 'POST',
												cache : false,
												data : {
													//(key , value)
												
													 id : id
												},
												success : function(response) {
												$('#add-friend-${member.id}').html("<i class=\"fa fa-check\" aria-hidden=\"true\"></i>\r\n" + 
														"				                                    <span>Đã gửi yêu cầu</span>");
													
													
												},
												error : function(response) {
													alert('Có lỗi xảy ra');
												}
											});
											return false;
										});
										
								</script>	
                        
                    	</c:forEach>
                    </c:if>
              
                      
                    </div>
                </div>
            </div>
        </div>
    </div>
    <br>
     <script src="/resources/templates/public/js/jquery.simpleLoadMore.js"></script>
    <script src="/resources/templates/public/js/loading.js"></script>
  <!-- <script src="jquery.simpleLoadMore.js"></script> -->
  <script>
    $('#member-list').simpleLoadMore({
      item: '.chia4',
      count: 4,
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