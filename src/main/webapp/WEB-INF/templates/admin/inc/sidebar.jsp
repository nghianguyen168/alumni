<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/tags/taglib.jsp"%>
<ul class="sidebar-menu" id="nav-accordion">
          <p class="centered"><a href="/admin/member/profile/${userInfo.id }"><img src="/resources/uploads/${userInfo.avatar }" class="img-circle" width="80"></a></p>
            <a href="/admin/member/profile/${userInfo.id }" style="margin-left: 51px;,text-align: center;color: white;">${userInfo.firstName} ${userInfo.lastName}</a>
            <p style="text-align: center;color: white">${userInfo.role.name}</p>
          <a href="javascript:void(0)" class="centered" id="authorLogin"></a>
          <c:if test="${userInfo.role.name =='ADMIN' || userInfo.role.name =='MANAGER'}">
          <li class="mt">
            <a id="home" class="home active" href="${pagecontext.request.contextPath }/admin/index">
              <i class="fa fa-dashboard"></i>
              <span>Dashboard</span>
              </a>
          </li>
            <li>
            <a id="news" href="${pagecontext.request.contextPath }/admin/news/index">
              <i class="fa fa-newspaper-o"></i>
              <span>Quản Lý Tin Tức</span>
              </a>
          </li>
            <li>
            <a id="event" href="${pagecontext.request.contextPath }/admin/event/index">
              <i class="fa fa-calendar-o"></i>
              <span>Quản Lý Sự Kiện</span>
              </a>
          </li>
           <li>
            <a id="job"	 href="${pagecontext.request.contextPath }/admin/job/index">
                <i class="fa fa-briefcase" aria-hidden="true"></i>
              <span>Quản Lý Việc Làm</span>
              </a>
          </li>
           <li>
            <a id="group"	 href="${pagecontext.request.contextPath }/admin/group/index">
                <i class="fa fa-users" aria-hidden="true"></i>
              <span>Quản Lý Nhóm</span>
              </a>
          </li>
          <li class="sub-menu">
            <a id="member" href="${pageContext.request.contextPath }/admin/member/index">
                <i class="fa fa-user" aria-hidden="true"></i>
              <span>Quản Lý Thành Viên</span>
              </a>
          </li>
           </c:if>
    <c:if test="${userInfo.role.name =='ADMIN'}">
           <li class="sub-menu">
            <a id="adminstraitor" href="${pageContext.request.contextPath }/admin/member/admin">
              <i class="fa fa-desktop"></i>
              <span>Quản Trị Viên</span>
              </a>
          </li>
          </c:if>
    <c:if test="${userInfo.role.name =='ADMIN'}">
        <li class="sub-menu">
            <a id="contact-user" href="${pageContext.request.contextPath }/admin/contact/index">
                <i class="fa fa-envelope-o" aria-hidden="true"></i>
                <span>Đóng Góp Ý Kiến</span>
            </a>
        </li>
    </c:if>

         <!--  <li class="sub-menu">
            <a href="javascript:;">
              <i class="fa fa-cogs"></i>
              <span>Components</span>
              </a>
            <ul class="sub">
              <li><a href="grids.html">Grids</a></li>
              <li><a href="calendar.html">Calendar</a></li>
              <li><a href="gallery.html">Gallery</a></li>
              <li><a href="todo_list.html">Todo List</a></li>
              <li><a href="dropzone.html">Dropzone File Upload</a></li>
              <li><a href="inline_editor.html">Inline Editor</a></li>
              <li><a href="file_upload.html">Multiple File Upload</a></li>
            </ul>
          </li>
          <li class="sub-menu">
            <a href="javascript:;">
              <i class="fa fa-book"></i>
              <span>Extra Pages</span>
              </a>
            <ul class="sub">
              <li><a href="blank.html">Blank Page</a></li>
              <li><a href="login.html">Login</a></li>
              <li><a href="lock_screen.html">Lock Screen</a></li>
              <li><a href="profile.html">Profile</a></li>
              <li><a href="invoice.html">Invoice</a></li>
              <li><a href="pricing_table.html">Pricing Table</a></li>
              <li><a href="faq.html">FAQ</a></li>
              <li><a href="404.html">404 Error</a></li>
              <li><a href="500.html">500 Error</a></li>
            </ul>
          </li>
          <li class="sub-menu">
            <a href="javascript:;">
              <i class="fa fa-tasks"></i>
              <span>Forms</span>
              </a>
            <ul class="sub">
              <li><a href="form_component.html">Form Components</a></li>
              <li><a href="advanced_form_components.html">Advanced Components</a></li>
              <li><a href="form_validation.html">Form Validation</a></li>
              <li><a href="contactform.html">Contact Form</a></li>
            </ul>
          </li>
          <li class="sub-menu">
            <a href="javascript:;">
              <i class="fa fa-th"></i>
              <span>Data Tables</span>
              </a>
            <ul class="sub">
              <li><a href="basic_table.html">Basic Table</a></li>
              <li><a href="responsive_table.html">Responsive Table</a></li>
              <li><a href="advanced_table.html">Advanced Table</a></li>
            </ul>
          </li>
          <li>
            <a href="inbox.html">
              <i class="fa fa-envelope"></i>
              <span>Mail </span>
              <span class="label label-theme pull-right mail-info">2</span>
              </a>
          </li>
          <li class="sub-menu">
            <a href="javascript:;">
              <i class=" fa fa-bar-chart-o"></i>
              <span>Charts</span>
              </a>
            <ul class="sub">
              <li><a href="morris.html">Morris</a></li>
              <li><a href="chartjs.html">Chartjs</a></li>
              <li><a href="flot_chart.html">Flot Charts</a></li>
              <li><a href="xchart.html">xChart</a></li>
            </ul>
          </li>
          <li class="sub-menu">
            <a href="javascript:;">
              <i class="fa fa-comments-o"></i>
              <span>Chat Room</span>
              </a>
            <ul class="sub">
              <li><a href="lobby.html">Lobby</a></li>
              <li><a href="chat_room.html"> Chat Room</a></li>
            </ul>
          </li>
          <li>
            <a href="google_maps.html">
              <i class="fa fa-map-marker"></i>
              <span>Google Maps </span>
              </a>
          </li> -->
        </ul>