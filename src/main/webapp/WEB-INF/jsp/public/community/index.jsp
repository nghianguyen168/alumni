<%@page import="dtu.captone.alumni.service.GroupPostService"%>
<%@page import="org.springframework.web.bind.annotation.PostMapping"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@include file="/WEB-INF/templates/tags/taglib.jsp"%>
<!DOCTYPE html>
<div id="group">
        <div class="container">
            <div class="chia2">
                <div class="menu-group">
                    <div style="background-image: url(/resources/templates/public/community/images/bg1.jpg) ; height: 140px;">
                        <p style="text-align: center; padding: 55px 40px; color: white; font-size: 25px;">${alumni_group.group_name }</p>
                    </div>
                    <div class="iq-sidebar">
                        <div id="sidebar-scrollbars">
                            <nav class="iq-sidebar-menu">
                                <ul id="iq-sidebar-toggle" class="iq-menu" style="padding-top: 15px;">
                                    <li class="active">
                                        <a href="#" class="iq-waves-effect"><i class="ri-newspaper-line"></i><span>Thảo luận</span></a>
                                    </li>
                                    <li>
                                        <a href="#" class="iq-waves-effect"><i class="ri-group-line"></i><span>Thành viên</span></a>
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
                                    <ul class="post-opt-block d-flex align-items-center list-inline m-0 p-0">
                                        <li class="iq-bg-primary rounded p-2 pointer mr-3">
                                            <a href="#"></a><img src="/resources/templates/public/community/images/small/07.png" alt="icon" class="img-fluid">
                                            	<input id="file-input" name="media" type="file" multiple style="display: none">
                                            	<label for="file-input" style="cursor: pointer;">Ảnh/Video</label>
                                            	 <progress style="display:none;" id="progressBar" value="0" max="100" style="width:300px;"></progress>
												  <h3 id="status"></h3>
												  <p id="loaded_n_total"></p>
												<div id="preview"></div>
                                            </li>
                                            
                                            <li class="iq-bg-primary rounded p-2 pointer mr-3">
                                            <a href="#"></a><img src="/resources/templates/public/community/images/small/07.png" alt="icon" class="img-fluid">
                                            	<input id="file-dinhkem-input" name="file" type="file"  style="display: none">
                                            	<label for="file-input" style="cursor: pointer;">Đính kèm file</label>
                                            	 <progress style="display:none;" id="progressBar" value="0" max="100" style="width:300px;"></progress>
												  <h3 id="status"></h3>
												  <p id="loaded_n_total"></p>
												<div id="preview"></div>
                                            </li>
                                        <li class="iq-bg-primary rounded p-2 pointer mr-3">
                                            <a href="#"></a><img src="resources/templates/public/community/images/small/08.png" alt="icon" class="img-fluid"> Tag bạn bè</li>
										

                                    </ul>
                                    <script type="text/javascript">
                                    function previewImages() {

                                    	  var preview = document.querySelector('#preview');
                                    	  
                                    	  if (this.files) {
                                    	    [].forEach.call(this.files, readAndPreview);
                                    	  }

                                    	  function readAndPreview(file) {

                                    	    // Make sure `file.name` matches our extensions criteria
                                    	    if (!/\.(jpe?g|png|gif|mp4|mov|avi|wmv|flv)$/i.test(file.name)) {
                                    	      return alert(file.name + " is not an image");
                                    	    } // else...
                                    	    
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
                                    
                                    

                                    	document.querySelector('#file-input').addEventListener("change", previewImages);
                                    </script>
                                </div>
                                <button type="submit" class="btn-loading btn btn-primary d-block w-100 mt-3" data-loading-text="<i class='fa fa-spinner fa-spin'></i> Đang tải lên...">Đăng</button>
								</form>
                            </div>
                        </div>


						<c:forEach var="post" items="${groupPostList }">
							<div class="col-sm-12">
                            <div class="iq-card iq-card-block iq-card-stretch iq-card-height">
                                <div class="iq-card-body">
                                    <div class="user-post-data">
                                        <div class="d-flex flex-wrap">
                                            <div class="media-support-user-img mr-3">
                                                <img class="rounded-circle img-fluid" src="/resources/uploads/${post.member.avatar }" alt="">
                                            </div>
                                            <div class="media-support-info mt-2">
                                                <h5 class="mb-0 d-inline-block"><a href="#" class="">${post.member.firstName } ${post.member.lastName}</a></h5>

                                                <p class="mb-0 text-primary">${post.time_post}</p>
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
                                        <br>
                                        <a href="/resources/uploads/${post.file }">${post.file }</a>
                                    </div>
                              
                                    <div class="user-post">
                                      	<c:set var="media_array" value="${fn:split(post.media, '|')}" />
                                  		<c:forEach var="media" items="${media_array }">
                                  	 		 <a href="javascript:void();"><img src="/resources/uploads/${media }" alt="post-image" class="img-fluid rounded w-100"></a>
                                  		</c:forEach>
                                    </div>
                                    
                                    
                                    
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
                                                       	<button style="border: none; background-color: #4caf5000;">
                                                           <img  alt="" src="/resources/templates/public/love_deactive.png">
                                                        </button>
                                                            <span class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" role="button">
                                                   140 Like
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
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="total-comment-block">
                                                    <div class="dropdown">
                                                        <span class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" role="button">
                                                20 Comment
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
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                        <hr>
                                        <ul id="post-commnet-${post.id }" class="post-comments p-0 m-0">
                                        	<c:forEach var="cm" items="${commentService.findByPostId(post.id)}">
                                        	<div class="current-tab">
	                                            <li class="mb-2">
	                                                <div class="d-flex flex-wrap">
	                                                    <div class="user-img">
	                                                        <img src="/resources/uploads/${cm.member.avatar}" alt="userimg" class="avatar-35 rounded-circle img-fluid">
	                                                    </div>
	                                                    <div class="comment-data-block ml-3">
	                                                        <h5>${cm.member.firstName } ${cm.member.lastName }</h5>
	                                                        <p  class="mb-0">${cm.comment }</p>
	                                                        <div class="d-flex flex-wrap align-items-center comment-activity">
	                                                            <a href="javascript:void();">like</a>
	                                                            <a href="javascript:void();" id="reply-${cm.id }">reply</a>
	                                                            <span> 5 min </span>
	                                                        </div>
	                                                    </div>
	                                                </div>
	                                            </li>
	                                            <div id="rep-comment-${cm.id }" style="display: none;">
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
                                           </c:forEach>
                                        </ul>
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
												$('#comment-${post.id}').on('keypress', function(e) {
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
																$('#post-commnet-${post.id }').load(" #post-commnet-${post.id }"); 
																$('#comment-${post.id}').val('');
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
							  <script>
							    $('#post-commnet-${post.id }').simpleLoadMore({
							      item: '.current-tab',
							      count: 3,
							      counterInBtn: true,
							      btnText: 'Xem thêm {showing}/{total}',
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
						</c:forEach>
                        
                    </div>

                </div>
            </div>

        </div>
        <!-- <script src="https://code.jquery.com/jquery-1.12.4.min.js" integrity="sha384-nvAa0+6Qg9clwYCGGPpDQLVpLNn0fRaROjHqs13t4Ggj3Ez50XnGQqc/r8MhnRDZ" crossorigin="anonymous"></script> -->
 
</div>