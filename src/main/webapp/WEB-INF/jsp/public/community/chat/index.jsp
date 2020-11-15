<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
 <!-- Từ đây nha -->
    <div id="content-page" class="content-page">
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <div class="iq-card">
                        <div class="iq-card-body chat-page p-0">
                            <div class="chat-data-block">
                                <div class="row">
                                    <div class="col-lg-3 chat-data-left scroller">
                                        <div class="chat-search pt-3 pl-3">
                                            <div class="d-flex align-items-center">
                                                <div class="chat-profile mr-3">
                                                    <img src="images/user/1.jpg" alt="chat-user" class="avatar-60 ">
                                                </div>
                                                <div class="chat-caption">
                                                    <h5 class="mb-0">Lê Thanh Hà</h5>
                                                    <p class="m-0">Web Designer</p>
                                                </div>
                                                <button type="submit" class="close-btn-res p-3"><i class="ri-close-fill"></i></button>
                                            </div>

                                            <div class="chat-searchbar mt-4">
                                                <div class="form-group chat-search-data m-0">
                                                    <input type="text" class="form-control round" id="chat-search" placeholder="Tìm kiếm">
                                                    <i class="ri-search-line"></i>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="chat-sidebar-channel scroller mt-4 pl-3">
                                            <h5 class="">Chat</h5>
                                            <ul class="iq-chat-ui nav flex-column nav-pills">
                                                <li>
                                                    <a data-toggle="pill" href="#chatbox1">
                                                        <div class="d-flex align-items-center">
                                                            <div class="avatar mr-2">
                                                                <img src="images/user/05.jpg" alt="chatuserimage" class="avatar-50 ">
                                                                <span class="avatar-status"><i class="ri-checkbox-blank-circle-fill text-success"></i></span>
                                                            </div>
                                                            <div class="chat-sidebar-name">
                                                                <h6 class="mb-0">Team Discussions</h6>
                                                                <span>Lorem Ipsum is</span>
                                                            </div>
                                                            <div class="chat-meta float-right text-center mt-2 mr-1">
                                                                <div class="chat-msg-counter bg-primary text-white">20</div>
                                                                <span class="text-nowrap">05 min</span>
                                                            </div>
                                                        </div>
                                                    </a>
                                                </li>
                                                <li>
                                                    <a data-toggle="pill" href="#chatbox2">
                                                        <div class="d-flex align-items-center">
                                                            <div class="avatar mr-2">
                                                                <img src="images/user/06.jpg" alt="chatuserimage" class="avatar-50 ">
                                                                <span class="avatar-status"><i class="ri-checkbox-blank-circle-fill text-success"></i></span>
                                                            </div>
                                                            <div class="chat-sidebar-name">
                                                                <h6 class="mb-0">Announcement</h6>
                                                                <span>This Sunday we</span>
                                                            </div>
                                                            <div class="chat-meta float-right text-center mt-2 mr-1">
                                                                <div class="chat-msg-counter bg-primary text-white">10</div>
                                                                <span class="text-nowrap">10 min</span>
                                                            </div>
                                                        </div>
                                                    </a>
                                                </li>
                                                <li>
                                                    <a data-toggle="pill" href="#chatbox1">
                                                        <div class="d-flex align-items-center">
                                                            <div class="avatar mr-2">
                                                                <img src="images/user/05.jpg" alt="chatuserimage" class="avatar-50 ">
                                                                <span class="avatar-status"><i class="ri-checkbox-blank-circle-fill text-success"></i></span>
                                                            </div>
                                                            <div class="chat-sidebar-name">
                                                                <h6 class="mb-0">Team Discussions</h6>
                                                                <span>Lorem Ipsum is</span>
                                                            </div>
                                                            <div class="chat-meta float-right text-center mt-2 mr-1">
                                                                <div class="chat-msg-counter bg-primary text-white">20</div>
                                                                <span class="text-nowrap">05 min</span>
                                                            </div>
                                                        </div>
                                                    </a>
                                                </li>
                                                <li>
                                                    <a data-toggle="pill" href="#chatbox2">
                                                        <div class="d-flex align-items-center">
                                                            <div class="avatar mr-2">
                                                                <img src="images/user/06.jpg" alt="chatuserimage" class="avatar-50 ">
                                                                <span class="avatar-status"><i class="ri-checkbox-blank-circle-fill text-success"></i></span>
                                                            </div>
                                                            <div class="chat-sidebar-name">
                                                                <h6 class="mb-0">Announcement</h6>
                                                                <span>This Sunday we</span>
                                                            </div>
                                                            <div class="chat-meta float-right text-center mt-2 mr-1">
                                                                <div class="chat-msg-counter bg-primary text-white">10</div>
                                                                <span class="text-nowrap">10 min</span>
                                                            </div>
                                                        </div>
                                                    </a>
                                                </li>
                                            </ul>

                                        </div>
                                    </div>
                                    <div class="col-lg-9 chat-data p-0 chat-data-right">
                                        <div class="tab-content">
                                            <div class="tab-pane fade active show" id="default-block" role="tabpanel">
                                                <div class="chat-start">
                                                    <span class="iq-start-icon text-primary"><i class="ri-message-3-line"></i></span>
                                                    <button id="chat-start" class="btn bg-white mt-3">Bắt đầu chat</button>
                                                </div>
                                            </div>
                                            <div class="tab-pane fade" id="chatbox1" role="tabpanel">
                                                <div class="chat-head">
                                                    <header class="d-flex justify-content-between align-items-center bg-white pt-3 pr-3 pb-3">
                                                        <div class="d-flex align-items-center">
                                                            <div class="sidebar-toggle">
                                                                <i class="ri-menu-3-line"></i>
                                                            </div>
                                                            <div class="avatar chat-user-profile m-0 mr-3">
                                                                <img src="images/user/05.jpg" alt="avatar" class="avatar-50 ">
                                                                <span class="avatar-status"><i class="ri-checkbox-blank-circle-fill text-success"></i></span>
                                                            </div>
                                                            <h5 class="mb-0">Team Discussions</h5>
                                                        </div>
                                                        <div class="chat-user-detail-popup scroller">
                                                            <div class="user-profile text-center">
                                                                <button type="submit" class="close-popup p-3"><i class="ri-close-fill"></i></button>
                                                                <div class="user mb-4">
                                                                    <a class="avatar m-0">
                                                                        <img src="images/user/05.jpg" alt="avatar">
                                                                    </a>
                                                                    <div class="user-name mt-4">
                                                                        <h4>Lê Thanh Hà</h4>
                                                                    </div>
                                                                    <div class="user-desc">
                                                                        <p>Cape Town, RSA</p>
                                                                    </div>
                                                                </div>
                                                                <hr>
                                                                <div class="chatuser-detail text-left mt-4">
                                                                    <div class="row">
                                                                        <div class="col-6 col-md-6 title">Bni Name:</div>
                                                                        <div class="col-6 col-md-6 text-right">Bni</div>
                                                                    </div>
                                                                    <hr>
                                                                    <div class="row">
                                                                        <div class="col-6 col-md-6 title">Tel:</div>
                                                                        <div class="col-6 col-md-6 text-right">072 143 9920</div>
                                                                    </div>
                                                                    <hr>
                                                                    <div class="row">
                                                                        <div class="col-6 col-md-6 title">Date Of Birth:</div>
                                                                        <div class="col-6 col-md-6 text-right">July 12, 1989</div>
                                                                    </div>
                                                                    <hr>
                                                                    <div class="row">
                                                                        <div class="col-6 col-md-6 title">Gender:</div>
                                                                        <div class="col-6 col-md-6 text-right">Male</div>
                                                                    </div>
                                                                    <hr>
                                                                    <div class="row">
                                                                        <div class="col-6 col-md-6 title">Language:</div>
                                                                        <div class="col-6 col-md-6 text-right">Engliah</div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="chat-header-icons d-flex">
                                                            <a href="javascript:void();" class="chat-icon-delete iq-bg-primary">
                                                                <i class="ri-delete-bin-line"></i>
                                                            </a>
                                                            <span class="dropdown iq-bg-primary">
                                                       <i class="ri-more-2-line cursor-pointer dropdown-toggle nav-hide-arrow cursor-pointer pr-0" id="dropdownMenuButton02" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" role="menu"></i>
                                                       <span class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuButton02">
                                                       <a class="dropdown-item" href="JavaScript:void(0);"><i class="fa fa-thumb-tack" aria-hidden="true"></i> Đưa lên đầu</a>
                                                       <a class="dropdown-item" href="JavaScript:void(0);"><i class="fa fa-trash-o" aria-hidden="true"></i> Xóa chat</a>
                                                       <a class="dropdown-item" href="JavaScript:void(0);"><i class="fa fa-ban" aria-hidden="true"></i> Chặn</a>
                                                       </span>
                                                            </span>
                                                        </div>
                                                    </header>
                                                </div>
                                                <div class="chat-content scroller">
                                                    <div class="chat">
                                                        <div class="chat-user">
                                                            <a class="avatar m-0">
                                                                <img src="images/user/1.jpg" alt="avatar" class="avatar-35 ">
                                                            </a>
                                                            <span class="chat-time mt-1">6:45</span>
                                                        </div>
                                                        <div class="chat-detail">
                                                            <div class="chat-message">
                                                                <p>How can we help? We're here for you! 😄</p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="chat chat-left">
                                                        <div class="chat-user">
                                                            <a class="avatar m-0">
                                                                <img src="images/user/05.jpg" alt="avatar" class="avatar-35 ">
                                                            </a>
                                                            <span class="chat-time mt-1">6:48</span>
                                                        </div>
                                                        <div class="chat-detail">
                                                            <div class="chat-message">
                                                                <p>Hey John, I am looking for the best admin template.</p>
                                                                <p>Could you please help me to find it out? 🤔</p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="chat">
                                                        <div class="chat-user">
                                                            <a class="avatar m-0">
                                                                <img src="images/user/1.jpg" alt="avatar" class="avatar-35 ">
                                                            </a>
                                                            <span class="chat-time mt-1">6:49</span>
                                                        </div>
                                                        <div class="chat-detail">
                                                            <div class="chat-message">
                                                                <p>Absolutely!</p>
                                                                <p>SocialV Dashboard is the responsive bootstrap 4 admin template.</p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="chat chat-left">
                                                        <div class="chat-user">
                                                            <a class="avatar m-0">
                                                                <img src="images/user/05.jpg" alt="avatar" class="avatar-35 ">
                                                            </a>
                                                            <span class="chat-time mt-1">6:52</span>
                                                        </div>
                                                        <div class="chat-detail">
                                                            <div class="chat-message">
                                                                <p>Looks clean and fresh UI.</p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="chat">
                                                        <div class="chat-user">
                                                            <a class="avatar m-0">
                                                                <img src="images/user/1.jpg" alt="avatar" class="avatar-35 ">
                                                            </a>
                                                            <span class="chat-time mt-1">6:53</span>
                                                        </div>
                                                        <div class="chat-detail">
                                                            <div class="chat-message">
                                                                <p>Thanks, from ThemeForest.</p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="chat chat-left">
                                                        <div class="chat-user">
                                                            <a class="avatar m-0">
                                                                <img src="images/user/05.jpg" alt="avatar" class="avatar-35 ">
                                                            </a>
                                                            <span class="chat-time mt-1">6:54</span>
                                                        </div>
                                                        <div class="chat-detail">
                                                            <div class="chat-message">
                                                                <p>I will purchase it for sure. 👍</p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="chat">
                                                        <div class="chat-user">
                                                            <a class="avatar m-0">
                                                                <img src="images/user/1.jpg" alt="avatar" class="avatar-35 ">
                                                            </a>
                                                            <span class="chat-time mt-1">6:56</span>
                                                        </div>
                                                        <div class="chat-detail">
                                                            <div class="chat-message">
                                                                <p>Okay Thanks..</p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="chat-footer p-3 bg-white">
                                                    <form class="d-flex align-items-center" action="javascript:void(0);">
                                                        <div class="chat-attagement d-flex">
                                                            <a href="javascript:void();"><i class="fa fa-smile-o pr-3" aria-hidden="true"></i></a>
                                                            <a href="javascript:void();"><i class="fa fa-paperclip pr-3" aria-hidden="true"></i></a>
                                                        </div>
                                                        <input type="text" class="form-control mr-3" placeholder="Nhập tin nhắn">
                                                        <button type="submit" class="btn btn-primary d-flex align-items-center p-2" style="padding-right: 7px;"><i class="fa fa-paper-plane-o" aria-hidden="true"></i><span class="d-none d-lg-block ml-1">Gửi</span></button>
                                                    </form>
                                                </div>
                                            </div>
                                            <div class="tab-pane fade" id="chatbox2" role="tabpanel">
                                                <div class="chat-head">
                                                    <header class="d-flex justify-content-between align-items-center bg-white pt-3  pl-3 pr-3 pb-3">
                                                        <div class="d-flex align-items-center">
                                                            <div class="sidebar-toggle">
                                                                <i class="ri-menu-3-line"></i>
                                                            </div>
                                                            <div class="avatar chat-user-profile m-0 mr-3">
                                                                <img src="images/user/06.jpg" alt="avatar" class="avatar-50 ">
                                                                <span class="avatar-status"><i class="ri-checkbox-blank-circle-fill text-success"></i></span>
                                                            </div>
                                                            <h5 class="mb-0">Announcement</h5>
                                                        </div>
                                                        <div class="chat-user-detail-popup scroller">
                                                            <div class="user-profile text-center">
                                                                <button type="submit" class="close-popup p-3"><i class="ri-close-fill"></i></button>
                                                                <div class="user mb-4">
                                                                    <a class="avatar m-0">
                                                                        <img src="images/user/06.jpg" alt="avatar">
                                                                    </a>
                                                                    <div class="user-name mt-4">
                                                                        <h4>Mark Jordan</h4>
                                                                    </div>
                                                                    <div class="user-desc">
                                                                        <p>Atlanta, USA</p>
                                                                    </div>
                                                                </div>
                                                                <hr>
                                                                <div class="chatuser-detail text-left mt-4">
                                                                    <div class="row">
                                                                        <div class="col-6 col-md-6 title">Bni Name:</div>
                                                                        <div class="col-6 col-md-6 text-right">Mark</div>
                                                                    </div>
                                                                    <hr>
                                                                    <div class="row">
                                                                        <div class="col-6 col-md-6 title">Tel:</div>
                                                                        <div class="col-6 col-md-6 text-right">072 143 9920</div>
                                                                    </div>
                                                                    <hr>
                                                                    <div class="row">
                                                                        <div class="col-6 col-md-6 title">Date Of Birth:</div>
                                                                        <div class="col-6 col-md-6 text-right">July 12, 1989</div>
                                                                    </div>
                                                                    <hr>
                                                                    <div class="row">
                                                                        <div class="col-6 col-md-6 title">Gender:</div>
                                                                        <div class="col-6 col-md-6 text-right">Female</div>
                                                                    </div>
                                                                    <hr>
                                                                    <div class="row">
                                                                        <div class="col-6 col-md-6 title">Language:</div>
                                                                        <div class="col-6 col-md-6 text-right">Engliah</div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="chat-header-icons d-flex">
                                                            <a href="javascript:void();" class="chat-icon-delete">
                                                                <i class="ri-delete-bin-line"></i>
                                                            </a>
                                                            <span class="dropdown">
                                                       <i class="ri-more-2-line cursor-pointer dropdown-toggle nav-hide-arrow cursor-pointer" id="dropdownMenuButton01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" role="menu"></i>
                                                       <span class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuButton01">
                                                        <a class="dropdown-item" href="JavaScript:void(0);"><i class="fa fa-thumb-tack" aria-hidden="true"></i> Đưa lên đầu</a>
                                                        <a class="dropdown-item" href="JavaScript:void(0);"><i class="fa fa-trash-o" aria-hidden="true"></i> Xóa chat</a>
                                                        <a class="dropdown-item" href="JavaScript:void(0);"><i class="fa fa-ban" aria-hidden="true"></i> Chặn</a>
                                                       </span>
                                                            </span>
                                                        </div>
                                                    </header>
                                                </div>
                                                <div class="chat-content scroller">
                                                    <div class="chat">
                                                        <div class="chat-user">
                                                            <a class="avatar m-0">
                                                                <img src="images/user/1.jpg" alt="avatar" class="avatar-35 ">
                                                            </a>
                                                            <span class="chat-time mt-1">6:45</span>
                                                        </div>
                                                        <div class="chat-detail">
                                                            <div class="chat-message">
                                                                <p>How can we help? We're here for you! 😄</p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="chat chat-left">
                                                        <div class="chat-user">
                                                            <a class="avatar m-0">
                                                                <img src="images/user/06.jpg" alt="avatar" class="avatar-35 ">
                                                            </a>
                                                            <span class="chat-time mt-1">6:48</span>
                                                        </div>
                                                        <div class="chat-detail">
                                                            <div class="chat-message">
                                                                <p>Hey John, I am looking for the best admin template.</p>
                                                                <p>Could you please help me to find it out? 🤔</p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="chat">
                                                        <div class="chat-user">
                                                            <a class="avatar m-0">
                                                                <img src="images/user/1.jpg" alt="avatar" class="avatar-35 ">
                                                            </a>
                                                            <span class="chat-time mt-1">6:49</span>
                                                        </div>
                                                        <div class="chat-detail">
                                                            <div class="chat-message">
                                                                <p>Absolutely!</p>
                                                                <p>SocialV Dashboard is the responsive bootstrap 4 admin template.</p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="chat chat-left">
                                                        <div class="chat-user">
                                                            <a class="avatar m-0">
                                                                <img src="images/user/06.jpg" alt="avatar" class="avatar-35 ">
                                                            </a>
                                                            <span class="chat-time mt-1">6:52</span>
                                                        </div>
                                                        <div class="chat-detail">
                                                            <div class="chat-message">
                                                                <p>Looks clean and fresh UI.</p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="chat">
                                                        <div class="chat-user">
                                                            <a class="avatar m-0">
                                                                <img src="images/user/1.jpg" alt="avatar" class="avatar-35 ">
                                                            </a>
                                                            <span class="chat-time mt-1">6:53</span>
                                                        </div>
                                                        <div class="chat-detail">
                                                            <div class="chat-message">
                                                                <p>Thanks, from ThemeForest.</p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="chat chat-left">
                                                        <div class="chat-user">
                                                            <a class="avatar m-0">
                                                                <img src="images/user/06.jpg" alt="avatar" class="avatar-35 ">
                                                            </a>
                                                            <span class="chat-time mt-1">6:54</span>
                                                        </div>
                                                        <div class="chat-detail">
                                                            <div class="chat-message">
                                                                <p>I will purchase it for sure. 👍</p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="chat">
                                                        <div class="chat-user">
                                                            <a class="avatar m-0">
                                                                <img src="images/user/1.jpg" alt="avatar" class="avatar-35 ">
                                                            </a>
                                                            <span class="chat-time mt-1">6:56</span>
                                                        </div>
                                                        <div class="chat-detail">
                                                            <div class="chat-message">
                                                                <p>Okay Thanks..</p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="chat-footer p-3 bg-white">
                                                    <form class="d-flex align-items-center" action="javascript:void(0);">
                                                        <div class="chat-attagement d-flex">
                                                            <a href="javascript:void();"><i class="fa fa-smile-o pr-3" aria-hidden="true"></i></a>
                                                            <a href="javascript:void();"><i class="fa fa-paperclip pr-3" aria-hidden="true"></i></a>
                                                        </div>
                                                        <input type="text" class="form-control mr-3" placeholder="Nhập tin nhắn">
                                                        <button type="submit" class="btn btn-primary d-flex align-items-center p-2"><i class="fa fa-paper-plane-o" aria-hidden="true"></i><span class="d-none d-lg-block ml-1">Gửi</span></button>
                                                    </form>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>