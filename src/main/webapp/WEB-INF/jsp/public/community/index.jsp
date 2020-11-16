<%@page import="dtu.captone.alumni.service.GroupPostService"%>
<%@page import="org.springframework.web.bind.annotation.PostMapping"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@include file="/WEB-INF/templates/tags/taglib.jsp"%>
<!DOCTYPE html>
<div id="group">
 
        <div class="container">
       <!--  <script type="text/javascript">
        function timeDifference(current, previous) {
            
            var msPerMinute = 60 * 1000;
            var msPerHour = msPerMinute * 60;
            var msPerDay = msPerHour * 24;
            var msPerMonth = msPerDay * 30;
            var msPerYear = msPerDay * 365;
            
            var elapsed = current - previous;
            
            if (elapsed < msPerMinute) {
                 return Math.round(elapsed/1000) + ' giây trước';   
            }
            else if (elapsed < msPerHour) {
                 return Math.round(elapsed/msPerMinute) + ' phút trước';   
            }
            
            else if (elapsed < msPerDay ) {
                 return Math.round(elapsed/msPerHour ) + ' giờ trước';   
            }

            else if (elapsed < msPerMonth) {
                 return 'khoảng ' + Math.round(elapsed/msPerDay) + ' ngày trước';   
            }
            
            else if (elapsed < msPerYear) {
                 return 'khoảng ' + Math.round(elapsed/msPerMonth) + ' tháng trước';   
            }
            
            else {
                 return 'khoảng ' + Math.round(elapsed/msPerYear ) + ' năm trước';   
            }
        }
        </script> -->
            <div class="chia2">
                <div class="menu-group">
                    <div style="background-image: url(/resources/templates/public/community/images/bg1.jpg) ; height: 140px;">
                        <p style="text-align: center; padding: 55px 40px; color: white; font-size: 25px;">${alumni_group.groupName }</p>
                    </div>
                    <div class="iq-sidebar">
                        <div id="sidebar-scrollbars">
                            <nav class="iq-sidebar-menu">
                                <ul id="iq-sidebar-toggle" class="iq-menu" style="padding-top: 15px;">
                                    <li class="active">
                                        <a href="#" class="iq-waves-effect"><i class="ri-newspaper-line"></i><span>Thảo luận</span></a>
                                    </li>
                                    <li>
                                        <a href="/community/group" class="iq-waves-effect"><i class="fa fa-users" aria-hidden="true"></i><span>Nhóm</span></a>
                                    </li>
                                    
                                    <li>
                                        <a href="/community/group/member/${alumni_group.id }" class="iq-waves-effect"><i class="ri-group-line"></i><span>Thành viên</span></a>
                                    </li>
                                    
                                    <li>
                                        <a href="#" class="iq-waves-effect"><i class="ri-calendar-event-fill"></i><span>Sự kiện</span></a>
                                    </li>
                                    <li>
                                        <a href="#" class="iq-waves-effect"><i class="ri-file-line"></i><span>Files</span></a>
                                    </li>
                                    <li>
                                        <a href="#" class="iq-waves-effect"><i class="ri-messenger-line"></i><span>Chat</span></a>
                                    </li>

                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>

                <div class="newfeed">
                <!-- sửa lại thành col-sm-12 -->
                    <div class="col-sm-12 row m-0 p-0">
                        <div class="col-sm-12">
                            <div id="post-modal-data" class="iq-card iq-card-block iq-card-stretch iq-card-height">
                                <div class="iq-card-header d-flex justify-content-between">
                                    <div class="iq-header-title">
                                        <h4 class="card-title">Tạo bài viết</h4>
                                    </div>
                                </div>
                                <form action="/community/add/${alumni_group.id }" method="post" enctype='multipart/form-data'>
                                <div class="iq-card-body" data-toggle="modal" data-target="#post-modal">
                                    <div class="d-flex align-items-center">
                                        <div class="user-img">
                                            <img src="/resources/uploads/${userInfo.avatar }" alt="userimg" class="avatar-60 rounded-circle">
                                        </div>
                                      
                                            <textarea type="text" class="form-control rounded" name="title" placeholder="Viết gì đó ở đây..." style="border:none; "></textarea>
                                      
                                    </div>
                                    <hr>
                                    <ul class="post-opt-block d-flex align-items-center list-inline m-0 p-0" style="float: left;">
                                        <li class="iq-bg-primary rounded p-2 pointer mr-3">
                                            <a href="#"></a><img src="/resources/templates/public/community/images/small/07.png" alt="icon" class="img-fluid">
                                            	<input  id="file-input" name="media" type="file" multiple style="display: none" >
                                            	<label for="file-input" style="cursor: pointer;">Ảnh/Video</label>
                                            	 <progress style="display:none;" id="progressBar" value="0" max="100" style="width:300px;"></progress>
												  <h3 id="status"></h3>
												  <p id="loaded_n_total"></p>
												<div id="preview"></div>
                                            </li>
                                            
                                    </ul>
                                    <ul style="float: left; class="post-opt-block d-flex align-items-center list-inline m-0 p-0">
                                    	  <li id="dinhkemfile" class="iq-bg-primary rounded p-2 pointer mr-3">
                                            <a href="#"></a><img src="/resources/templates/public/community/images/small/07.png" alt="icon" class="img-fluid">
                                            	<input id="file-dinhkem-input" name="file-dinh-kem" type="file"  style="display: none">
                                            	<label for="file-dinhkem-input" style="cursor: pointer;">Đính kèm file</label>
                                            	 <progress style="display:none;" id="progressBar" value="0" max="100" style="width:300px;"></progress>
												  <h3 id="status"></h3>
												  <p id="loaded_n_total"></p>
												<div id="preview-dinhkem"></div>
                                            </li>
                                    </ul >
                                    <script type="text/javascript">
                                    	  $("#file-input").change(function () {	
        								        var fileExtension = ['jpe?g','png','jpg','gif','mp4','mov','avi','wmv','flv'];
        								        if ($.inArray($(this).val().split('.').pop().toLowerCase(), fileExtension) == -1) {
        								           return alert("Chỉ châp nhận định dạng : "+fileExtension.join(', '));
        								        } else{
        								        	 var preview = document.querySelector('#preview');
        	                                    	  
        	                                    	  if (this.files) {
        	                                    	    [].forEach.call(this.files, readAndPreview);
        	                                    	  }
        	                                    	

        	                                    	  function readAndPreview(file) {
        	                                    	    var reader = new FileReader();
        	                                    	    
        	                                    	    reader.addEventListener("load", function() {
        	                                    	      var image = new Image();
        	                                    	      image.height = 100;
        	                                    	      image.title  = file.name;
        	                                    	      image.src    = this.result;
        	                                    	      preview.appendChild(image);
        	                                    	    });
        	                                    	    
        	                                    	    reader.readAsDataURL(file);
        	                                    	    
        	                                    	  }

        								        	
        								       }
                                    	  
        								    });
                                    		document.querySelector('#file-input').addEventListener("change", previewImages);
                                    		
                                    		  

                                    </script>
                                    <script>
                                    $("#file-dinhkem-input").change(function () {
  								        var fileExtension = ['doc','docx','xlsx','xlsm','pdf'];
  								        if ($.inArray($(this).val().split('.').pop().toLowerCase(), fileExtension) == -1) {
  								           return alert("Chỉ châp nhận định dạng : "+fileExtension.join(', '));
  								        } else{
  								        	$("#voltaic_holder").css("position", "relative");
  								        	 var preview = document.querySelector('#preview-dinhkem');
  	                                    	  
  	                                    	  if (this.files) {
  	                                    	    [].forEach.call(this.files, readAndPreview);
  	                                    	  }
  	                                    	

  	                                    	  function readAndPreview(file) {
  	                                    	    var reader = new FileReader();
  	                                    	    
  	                                    	    reader.addEventListener("load", function() {
  	                                    	      var image = new Image();
  	                                    	      image.height = 100;
  	                                    	      image.title  = file.name;
  	                                    	      image.src    = this.result;
  	                                    	      preview.appendChild(image);
  	                                    	    });
  	                                    	    
  	                                    	    reader.readAsDataURL(file);
  	                                    	    
  	                                    	  }

  								        	
  								       }
                              	  
  								    });
                                    document.querySelector('#file-dinhkem-input').addEventListener("change", previewImages);
                                    </script>
                                    
                                </div>
                                <button type="submit" class="btn-loading btn btn-primary d-block w-100 mt-3" data-loading-text="<i class='fa fa-spinner fa-spin'></i> Đang tải lên...">Đăng</button>
								</form>
                            </div>
                        </div>

			
						<c:forEach var="post" items="${groupPostList }">
							<div id="post-${post.id }" class="col-sm-12">
                            <div class="iq-card iq-card-block iq-card-stretch iq-card-height">
                                <div class="iq-card-body">
                                    <div class="user-post-data">
                                        <div class="d-flex flex-wrap">
                                            <div class="media-support-user-img mr-3">
                                                <img class="rounded-circle img-fluid" src="/resources/uploads/${post.member.avatar }" alt="">
                                            </div>
                                            <div class="media-support-info mt-2">
                                                <h5 class="mb-0 d-inline-block"><a href="#" class="">${post.member.firstName } ${post.member.lastName}</a></h5>
												      <fmt:parseDate value="${post.time_post}" var="dateObject"
             							   pattern="yyyy-MM-dd HH:mm:ss" />
                                                <fmt:formatDate var="year" value="${dateObject}" pattern="yyyy" />
                                                 <fmt:formatDate var="month" value="${dateObject}" pattern="MM" />
                                                  <fmt:formatDate var="day" value="${dateObject}" pattern="dd" />
                                                   <fmt:formatDate var="hour" value="${dateObject}" pattern="HH" />
                                                    <fmt:formatDate var="minute" value="${dateObject}" pattern="mm" />
                                                     <fmt:formatDate var="second" value="${dateObject}" pattern="ss" />
                                                <p class="mb-0 text-primary" id="time-${post.id }">
                                                	<script>
                                                		/* timeDifference(new Date(), new Date(${year}, ${month - 1}, ${day}, ${hour}, ${minute}, ${second}, 0));       */
                                                        document.getElementById("time-${post.id }").innerHTML = 	timeDifference(new Date(), new Date(${year}, ${month - 1}, ${day}, ${hour}, ${minute}, ${second}, 0));  
                                                	</script>
                                              </p>
                                            </div>
                                            <div class="iq-card-post-toolbar">
                                                <div class="dropdown">
                                                    <span class="dropdown-toggle" id="postdata-5" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" role="button">
                                             <i class="ri-more-fill"></i>
                                             </span>
                                                    <div class="dropdown-menu m-0 p-0" aria-labelledby="postdata-5">

                                                        <a class="dropdown-item p-3" href="#">
                                                            <div class="d-flex align-items-top">
                                                                <div class="icon font-size-20"><i class="ri-close-circle-line"></i></div>
                                                                <div class="data ml-2">
                                                                    <h6>Báo cáo</h6>
                                                                    <p class="mb-0">Báo cáo bài viết.</p>
                                                                </div>
                                                            </div>
                                                        </a>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="mt-3">
                                        <p>${post.title }</p>
                                        <a href="/resources/uploads/${post.file }">${post.file }</a>
                                    </div>
                                    <br>
                                    <c:if test="${not empty post.media }">
                                    	<div class="user-post">
                                      	<c:set var="media_array" value="${fn:split(post.media, '|')}" />
                                  		<c:forEach var="media" items="${media_array }">
                                  	 		 <a href="javascript:void();">
                                  	 		 <img src="/resources/uploads/${media }" id="myImg-${media}"  alt="post-image" class="img-fluid rounded w-100"></a>
                                  	 		 <div id="myModal-${media }" class="modal">
											  <span class="close">&times;</span>
											  <img class="modal-content" id="img-${media }">
											  <div id="caption"></div>
											</div>
											
											<script>
// Get the modal
								var modal = document.getElementById("myModal-${media }");
								
								// Get the image and insert it inside the modal - use its "alt" text as a caption
								var img = document.getElementById("myImg-${media }");
								var modalImg = document.getElementById("img-${media }");
								var captionText = document.getElementById("caption");
								img.onclick = function(){
								  modal.style.display = "block";
								  modalImg.src = this.src;
								  captionText.innerHTML = this.alt;
								}
								
								// Get the <span> element that closes the modal
								var span = document.getElementsByClassName("close")[0];
								
								// When the user clicks on <span> (x), close the modal
								span.onclick = function() { 
								  modal.style.display = "none";
								}
								</script>
                                  		</c:forEach>
                                    </div>
                                    
                                    </c:if>
                                 <style>
                                    .img-fluid {
										  border-radius: 5px;
										  cursor: pointer;
										  transition: 0.3s;
										}
										
										#myImg:hover {opacity: 0.7;}
										
										/* The Modal (background) */
										.modal {
										  display: none; /* Hidden by default */
										  position: fixed; /* Stay in place */
										  z-index: 1; /* Sit on top */
										  padding-top: 100px; /* Location of the box */
										  left: 0;
										  top: 0;
										  width: 100%; /* Full width */
										  height: 100%; /* Full height */
										  overflow: auto; /* Enable scroll if needed */
										  background-color: rgb(0,0,0); /* Fallback color */
										  background-color: rgba(0,0,0,0.9); /* Black w/ opacity */
										}
										
										/* Modal Content (image) */
										.modal-content {
										  margin: auto;
										  display: block;
										  width: 80%;
										  max-width: 700px;
										}
										
										/* Caption of Modal Image */
										#caption {
										  margin: auto;
										  display: block;
										  width: 80%;
										  max-width: 700px;
										  text-align: center;
										  color: #ccc;
										  padding: 10px 0;
										  height: 150px;
										}
										
										/* Add Animation */
										.modal-content, #caption {  
										  -webkit-animation-name: zoom;
										  -webkit-animation-duration: 0.6s;
										  animation-name: zoom;
										  animation-duration: 0.6s;
										}
										
										@-webkit-keyframes zoom {
										  from {-webkit-transform:scale(0)} 
										  to {-webkit-transform:scale(1)}
										}
										
										@keyframes zoom {
										  from {transform:scale(0)} 
										  to {transform:scale(1)}
										}
										
										/* The Close Button */
										.close {
										  position: absolute;
										  top: 15px;
										  right: 35px;
										  color: #f1f1f1;
										  font-size: 40px;
										  font-weight: bold;
										  transition: 0.3s;
										}
										
										.close:hover,
										.close:focus {
										  color: #bbb;
										  text-decoration: none;
										  cursor: pointer;
										}
										
										/* 100% Image Width on Smaller Screens */
										@media only screen and (max-width: 700px){
										  .modal-content {
										    width: 100%;
										  }
										}
										</style>
										                                    
                                    
                                    <div class="comment-area mt-3">
                                        <div class="d-flex justify-content-between align-items-center">
                                            <div class="like-block position-relative d-flex align-items-center">
                                                <div class="d-flex align-items-center">
                                                    <div class="like-data">
                                                        <div class="dropdown">
                                                            <span class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" role="button">
                                                   <img src="" class="img-fluid" alt="">
                                                   </span>
                                                            <div class="dropdown-menu">
                                                                <a class="ml-2 mr-2" href="#" data-toggle="tooltip" data-placement="top" title=""><img src="images/icon/01.png" class="img-fluid" alt=""></a>
                                                                <a class="mr-2" href="#" data-toggle="tooltip" data-placement="top" title=""><img src="images/icon/02.png" class="img-fluid" alt=""></a>
                                                                <a class="mr-2" href="#" data-toggle="tooltip" data-placement="top" title=""><img src="images/icon/03.png" class="img-fluid" alt=""></a>
                                                                <a class="mr-2" href="#" data-toggle="tooltip" data-placement="top" title=""><img src="images/icon/04.png" class="img-fluid" alt=""></a>
                                                                <a class="mr-2" href="#" data-toggle="tooltip" data-placement="top" title=""><img src="images/icon/05.png" class="img-fluid" alt=""></a>
                                                                <a class="mr-2" href="#" data-toggle="tooltip" data-placement="top" title=""><img src="images/icon/06.png" class="img-fluid" alt=""></a>
                                                                <a class="mr-2" href="#" data-toggle="tooltip" data-placement="top" title=""><img src="images/icon/07.png" class="img-fluid" alt=""></a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="total-like-block ml-2 mr-3">
                                                        <div class="dropdown">
                                                        <div id="btn-like-${post.id }" style="display: inline;">
                                                        <div id="likepost-${post.id }" style="float: left;">
	                                                       	<a style="border: none; background-color: #4caf5000; " href="javascript:void(0);">
	                                                       		<c:choose>
	                                                       			<c:when test="${likePostService.findUserLike(userInfo.id, post.id) ne null }">
	                                                       				<img alt="" src="/resources/templates/public/love_active.png">
	                                                       			</c:when>
	                                                       			<c:otherwise>
	                                                       				<img alt="" src="/resources/templates/public/love_deactive.png">
	                                                       			</c:otherwise>
	                                                       		</c:choose>
	                                                          	
	                                                        </a>
	                                                        </div>
	                                                       </div>
	                                                           
	                                                        <%--  <span style="float: left;" class="dropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" role="button"> 
			                                                 &nbsp;${likePostService.findByPostId(post.id).size() } Yêu thích
			                                                   </span>
				                                                   <div class="dropdown-menu">
	                                                                <a class="dropdown-item" href="#">Max Emum</a>
	                                                                <a class="dropdown-item" href="#">Bill Yerds</a>
	                                                                <a class="dropdown-item" href="#">Hap E. Birthday</a>
	                                                                <a class="dropdown-item" href="#">Tara Misu</a>
	                                                                <a class="dropdown-item" href="#">Midge Itz</a>
	                                                                <a class="dropdown-item" href="#">Sal Vidge</a>
	                                                                <a class="dropdown-item" href="#">Other</a>
	                                                            </div>
	                                                        </div> --%>
                                                        <div id="sum-like-${post.id }" class="dropdown" style="float: left;">
                                                            <span  >
		                                                     &nbsp;${likePostService.findByPostId(post.id).size() } Yêu thích
		                                                   </span>
                                                            <div id="droplike-${post.id }" class="dropdown-menu">
	                                                            <c:forEach var="userLike" items="${likePostService.findByPostId(post.id)}">
	                                                            	<a class="dropdown-item" href="#">${userLike.member.firstName} ${userLike.member.lastName}</a>
	                                                            </c:forEach>
                                                            
                                                              <!-- <script>
															    $('#droplike-${post.id }').simpleLoadMore({
															      item: '.dropdown-item',
															      count: 1,
															      counterInBtn: true,
															      btnText: 'Xem thêm {showing}/{total}',
															    });
															  </script> -->

															<div class="text-center">
															  <a href="javascript:void(0);" onclick="javascript:void(0);" on style="color: white;" class="" data-toggle="modal" data-target="#modalContactForm-${post.id }">Xem thêm</a>
																
                                                            </div>
                                                                <script type="text/javascript">
					
																		$(document).on('click','#btn-like-${post.id },btn-like-${post.id }',function(e){
																			var img =  $('#likepost-${post.id } img').attr("src");
																			
																						$.ajax({
																							url: '${pageContext.request.contextPath}/community/like-post/${post.id}',
																						type : 'POST',
																						cache : false,
																						data : {
																							//(key , value)
																						img:img
																							
																						},
																						success : function(response) {
																							$('#likepost-${post.id }').load(" #likepost-${post.id }");
																							$('#sum-like-${post.id }').load(" #sum-like-${post.id }");
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
                                                        </div>
                                                    </div>
                                                      <div class="modal fade" id="modalContactForm-${post.id }" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
														  aria-hidden="true">
														  <div class="modal-dialog" role="document">
														    <div class="modal-content">
														      <div class="modal-header text-center">
														        <h4 class="modal-title w-100 font-weight-bold">Thành viên yêu thích bài viết</h4>
														        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
														          <span aria-hidden="true">&times;</span>
														        </button>
														      </div>
														      
														      <div class="reaction-box" style="overflow: scroll;" >
                                                                    <c:forEach var="userL" items="${likePostService.findByPostId(post.id)}">
                                                                    	 <div class="like-box" style="padding: 0px;">
                                                                    	 <div class="infor-like">
                                                                    	 <div style="width: 200px; margin-left: 20px; ">
                                                                            <div style="float: left;">
                                                                                <a href=" "><img class="like-avatar" src="/resources/uploads/${userL.member.avatar }"></a>
                                                                            </div>
                                                                            <div style="padding-right: 10px; float: left; margin-top: 20px;">
                                                                                <div><a href="/member/detail/${userL.member.id }">${userL.member.firstName } ${userL.member.lastName} </a></div>
                                                                            </div>
                                                                           </div>
                                                                            <div style="margin-left: 100px; margin-bottom: 30px; border: none" class="add-network" id="add-friend-${userL.member.id  }">
											                                    <i class="fa fa-user-plus"></i>
											                                    <span>THÊM BẠN BÈ</span>
											                                </div>
                                                                        </div>
                                                                        </div>
                                                                    
                                                                    <script type="text/javascript">
								
																		$(document).on('click','#add-friend-${userL.member.id  },add-friend-${userL.member.id  }',function(e){
																						var id = ${userL.member.id}
																			
																						$.ajax({
																							url: '${pageContext.request.contextPath}/network/add-friend',
																						type : 'POST',
																						cache : false,
																						data : {
																							//(key , value)
																						
																							 id : id
																						},
																						success : function(response) {
																						$('#add-friend-${userL.member.id }').html("<i class=\"fa fa-check\" aria-hidden=\"true\"></i>\r\n" + 
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

                                                                </div>
														       
														    </div>
														  </div>
														</div>
                                                  
                                                </div>
                                                <div class="total-comment-block" id="sum-comment-${post.id }">
                                                    <div class="dropdown">
                                                        <span class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" role="button">
                                                ${commentService.findByPostIdSum(post.id).size()} Bình luận
                                                </span>
                                                        
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                        <hr>
                                        <ul id="post-commnet-${post.id }" class="post-comments p-0 m-0">
                                        	<c:forEach var="cm" items="${commentService.findByPostId(post.id)}">
                                        	<div class="tab">
	                                            <li class="mb-2">
	                                                <div class="d-flex flex-wrap" style="background-color: #f2f3f5; border-radius: 10px;">
	                                                    <div class="user-img">
	                                                        <img src="/resources/uploads/${cm.member.avatar}" alt="userimg" class="avatar-35 rounded-circle img-fluid">
	                                                    </div>
	                                                    <div class="comment-data-block ml-3">
		                                                        <a href="/member/detail/${cm.member.id }">${cm.member.firstName } ${cm.member.lastName }</a>
		                                                        <p  class="mb-0">${cm.comment }</p>
	                                                        <div class="d-flex flex-wrap align-items-center comment-activity">
	                                                            <a  style="font-size: 12px;" href="javascript:void();" id="reply-${cm.id }">Trả lời</a>
	                                                            <span style="font-size: 12px;" id="time-comment-${cm.id }"> </span>
						                                       <fmt:parseDate value="${cm.timeComment}" var="dateObject"
					             							   pattern="yyyy-MM-dd HH:mm:ss" />
					                                                <fmt:formatDate var="year" value="${dateObject}" pattern="yyyy" />
					                                                 <fmt:formatDate var="month" value="${dateObject}" pattern="MM" />
					                                                  <fmt:formatDate var="day" value="${dateObject}" pattern="dd" />
					                                                  
					                                                   <fmt:formatDate var="hour" value="${dateObject}" pattern="HH" />
					                                                    <fmt:formatDate var="minute" value="${dateObject}" pattern="mm" />
					                                                     <fmt:formatDate var="second" value="${dateObject}" pattern="ss" />
                                                	<script>
                                                		/* timeDifference(new Date(), new Date(${year}, ${month - 1}, ${day}, ${hour}, ${minute}, ${second}, 0));       */
                                                        document.getElementById("time-comment-${cm.id }").innerHTML = 	timeDifference(new Date(), new Date(${year}, ${month - 1}, ${day}, ${hour}, ${minute}, ${second}, 0));  
                                                	</script>
	                                                            
	                                                        </div>
	                                                    </div>
	                                                </div>
	                                               <!--  reply comment -->
                                               		<div id="area-rep-${cm.id }" style="margin-left: 50px;">
	                                                	<ul id="rep-comment-area-${cm.id}" class="post-rep-comments p-0 m-0">
				                                            <c:forEach var="rep" items="${commentService.findByParentId(cm.id)}">
				                                            <div class="aa" style="background-color: #f2f3f5; border-radius: 10px;">
					                                            <li style="margin-top: 3px;">
					                                                <div class="d-flex flex-wrap">
					                                                    <div class="user-img">
					                                                        <img src="/resources/uploads/${rep.member.avatar}" alt="userimg" class="avatar-30 rounded-circle img-fluid">
					                                                    </div>
					                                                    
					                                                    <div class="comment-data-block ml-3">
					                                                        <p><a style="float: left;" href="/member/detail/${rep.member.id }">${rep.member.firstName } ${rep.member.lastName } </a> <span  style="float: left; fon" id="rep-comment-${rep.id }"> </span></p> 
					                                                        <p class="mb-0">${rep.comment }</p>
					                                                        <div class="d-flex flex-wrap align-items-center comment-activity">
					                                                        </div>
					                                                    </div>
					                                                </div>
					                                            </li>
					                                            </div>
					                                             <fmt:parseDate value="${rep.timeComment}" var="dateObject"
					             							   pattern="yyyy-MM-dd HH:mm:ss" />
					                                                <fmt:formatDate var="year" value="${dateObject}" pattern="yyyy" />
					                                                 <fmt:formatDate var="month" value="${dateObject}" pattern="MM" />
					                                                  <fmt:formatDate var="day" value="${dateObject}" pattern="dd" />
					                                                  
					                                                   <fmt:formatDate var="hour" value="${dateObject}" pattern="HH" />
					                                                    <fmt:formatDate var="minute" value="${dateObject}" pattern="mm" />
					                                                     <fmt:formatDate var="second" value="${dateObject}" pattern="ss" />
					                                                <p class="mb-0 text-primary" id="time-${post.id }">
                                                	<script>
                                                		/* timeDifference(new Date(), new Date(${year}, ${month - 1}, ${day}, ${hour}, ${minute}, ${second}, 0));       */
                                                        document.getElementById("rep-comment-${rep.id }").innerHTML = "&ensp;"+	timeDifference(new Date(), new Date(${year}, ${month - 1}, ${day}, ${hour}, ${minute}, ${second}, 0));  
                                                	</script>
					                                           
				                                             </c:forEach>
				                                          
				                                        </ul>
													</div>		
													   <script>
															    $('#rep-comment-area-${cm.id}').simpleLoadMoreRepComment({
															      item: '.aa',
															      count: 5,
															      counterInBtn: false,
															      btnText: 'Xem thêm {showing}/{total}',
															    });
															  </script>
													
													
													   
				                                        <!--  reply comment -->                                        
	                                            </li>
	                                            <div class="repcomment" id="rep-comment-${cm.id }" style="display: none;">
	                                            	 <form style="margin-left: 30px; " class="comment-text d-flex align-items-center mt-3" action="javascript:void(0);">
			                                            <input type="text" id="reply-comment-${cm.id}" class="form-control rounded">
			                                            <div class="comment-attagement d-flex">
			                                                <a href="javascript:void();"><i class="ri-link mr-3"></i></a>
			                                                <a href="javascript:void();"><i class="ri-user-smile-line mr-3"></i></a>
			                                                <a href="javascript:void();"><i class="ri-camera-line mr-3"></i></a>
			                                            </div>
			                                           <%--  <input type="button" id="comment_submit_${post.id }" value="Gui"> --%>
			                                        </form>
			                                        </div>
			                                        <script type="text/javascript">
			                                        $("#reply-${cm.id }").click(function(){
			                                        	  $("#rep-comment-${cm.id }").show();
			                                        	});
			                                        </script>
	                                            </div>
	                                             <script type="text/javascript">
	                                         	$(document).on('keypress','#reply-comment-${cm.id},#reply-comment-${cm.id}',function(e){
												    var code = e.keyCode || e.which;
												    if(code==13){
												    	var comment = $('#reply-comment-${cm.id}').val();
												    	if(comment !='' ){
												    		$.ajax({
																url: '${pageContext.request.contextPath}/community/rep-comment/${post.id}/${cm.id}',
															type : 'POST',
															cache : false,
															data : {
																comment : comment
															},
															success : function(response) {
																$('#rep-comment-area-${cm.id }').load(" #rep-comment-area-${cm.id }"); 
																$('#sum-comment-${post.id }').load(" #sum-comment-${post.id }"); 
																$('#reply-comment-${cm.id}').val('');
																
															},
															error : function(response) {
																alert('Có lỗi xảy ra');
															}
														});
														return false;
													    }
												    	}});
												
														
								</script>	
							
                                           </c:forEach>
                                        </ul>
                                          <script>
										    $('#post-commnet-${post.id }').simpleLoadMore({
										      item: '.tab',
										      count: 5,
										      counterInBtn: true,
										      btnText: 'Xem thêm {showing}/{total}',
										    });
										  </script>
                                        <form class="comment-text d-flex align-items-center mt-3" action="javascript:void(0);">
                                            <input type="text" id="comment-${post.id}" class="form-control rounded">
                                            <div class="comment-attagement d-flex">
                                                <a href="javascript:void();"><i class="ri-link mr-3"></i></a>
                                                <a href="javascript:void();"><i class="ri-user-smile-line mr-3"></i></a>
                                                <a href="javascript:void();"><i class="ri-camera-line mr-3"></i></a>
                                            </div>
                                           <%--  <input type="button" id="comment_submit_${post.id }" value="Gui"> --%>
                                        </form>
                                        <script type="text/javascript">
                                        $(document).on('keypress','#comment-${post.id},#comment-${post.id}',function(e){
												    var code = e.keyCode || e.which;
												    if(code==13){
												    	var comment = $('#comment-${post.id}').val();
												    	if(comment !='' ){
												    		$.ajax({
																url: '${pageContext.request.contextPath}/community/comment/${post.id}',
															type : 'POST',
															cache : false,
															data : {
																comment : comment
															},
															success : function(response) {
																$('#comment-${post.id}').val('');																
																$('#post-commnet-${post.id }').load(" #post-commnet-${post.id }");
																$('#sum-comment-${post.id }').load(" #sum-comment-${post.id }"); 
															
																
															},
															error : function(response) {
																alert('Có lỗi xảy ra');
															}
														});
														return false;
													    }
												    	}});
												
														
								</script>	
                                        
                                    </div>
                                </div>
                            </div>
                        
                        </div>
                        
							  <script src="/resources/templates/public/js/jquery.simpleLoadMore.js"></script>
							    <script src="/resources/templates/public/js/loading.js"></script>
							  <!-- <script src="jquery.simpleLoadMore.js"></script> -->
							
							  
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
							
						
						</c:forEach>
                        </div>
                    </div>

                </div>
            </div>

        </div>
        
        <!-- <script src="https://code.jquery.com/jquery-1.12.4.min.js" integrity="sha384-nvAa0+6Qg9clwYCGGPpDQLVpLNn0fRaROjHqs13t4Ggj3Ez50XnGQqc/r8MhnRDZ" crossorigin="anonymous"></script> -->
       
 
