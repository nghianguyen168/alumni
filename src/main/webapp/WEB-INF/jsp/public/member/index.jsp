<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/tags/taglib.jsp"%>
<!DOCTYPE html>
<div id="alumni">
        <div class="container">
            <div class="chia2">
                <div class="danh-muc">
                    <div class="sub-title">BỘ LỌC</div>
                    <ul>
                        <li class="category-list">
                            <span class="category-span">Tìm kiếm theo</span>
                        </li>

                        <li class="category-list">
                            <span class="category-span">Năm tham gia</span>
                        </li>
                        <li class="category-list">
                            <span class="category-span">Năm tốt nghiệp</span>
                        </li>
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
                    <div class="banner">
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
                                        <div class="margin-bottom-2 overflow padding-top1">${member.memberType.typeName }, Tốt nghiệp năm ${member.yearGreduate }</div>
                                        <div class="margin-bottom-2 overflow">${member.major.majorName }</div>
                                        <div class="overflow">${member.addressNow}</div>
                                    </div>
                                </div>
                                <div class="add-network">
                                    <i class="fa fa-user-plus"></i>
                                    <span>THÊM BẠN BÈ</span>
                                </div>
                            </div>
                        </div>
                        
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