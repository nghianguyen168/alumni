<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div id="group">
        <div class="container">
            <div class="chia2">
                <div class="menu-group">
                    <div style="background-image: url(images/bg1.jpg) ; height: 140px;">
                        <p style="text-align: center; padding: 55px 40px; color: white; font-size: 25px;">Khóa K25 CMU</p>
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
                    <div class="col-lg-8 row m-0 p-0">
                        <div class="col-sm-12">
                            <div id="post-modal-data" class="iq-card iq-card-block iq-card-stretch iq-card-height">
                                <div class="iq-card-header d-flex justify-content-between">
                                    <div class="iq-header-title">
                                        <h4 class="card-title">Tạo bài viết</h4>
                                    </div>
                                </div>
                                <div class="iq-card-body" data-toggle="modal" data-target="#post-modal">
                                    <div class="d-flex align-items-center">
                                        <div class="user-img">
                                            <img src="images/user/1.jpg" alt="userimg" class="avatar-60 rounded-circle">
                                        </div>
                                        <form class="post-text ml-3 w-100" action="javascript:void();">
                                            <textarea type="text" class="form-control rounded" placeholder="Viết gì đó ở đây..." style="border:none; "></textarea>
                                        </form>
                                    </div>
                                    <hr>
                                    <ul class="post-opt-block d-flex align-items-center list-inline m-0 p-0">
                                        <li class="iq-bg-primary rounded p-2 pointer mr-3">
                                            <a href="#"></a><img src="images/small/07.png" alt="icon" class="img-fluid"> Ảnh</li>
                                        <li class="iq-bg-primary rounded p-2 pointer mr-3">
                                            <a href="#"></a><img src="images/small/08.png" alt="icon" class="img-fluid"> Tag bạn bè</li>


                                    </ul>
                                </div>
                                <button type="submit" class="btn btn-primary d-block w-100 mt-3">Đăng</button>

                            </div>
                        </div>

                        <div class="col-sm-12">
                            <div class="iq-card iq-card-block iq-card-stretch iq-card-height">
                                <div class="iq-card-body">
                                    <div class="user-post-data">
                                        <div class="d-flex flex-wrap">
                                            <div class="media-support-user-img mr-3">
                                                <img class="rounded-circle img-fluid" src="images/user/03.jpg" alt="">
                                            </div>
                                            <div class="media-support-info mt-2">
                                                <h5 class="mb-0 d-inline-block"><a href="#" class="">Lê Thanh Hà</a></h5>

                                                <p class="mb-0 text-primary">1 giờ trước</p>
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
                                        <p>Hôm nay tôi vui quá!</p>
                                    </div>
                                    <div class="user-post">
                                        <a href="javascript:void();"><img src="images/page-img/p4.jpg" alt="post-image" class="img-fluid rounded w-100"></a>
                                    </div>
                                    <div class="comment-area mt-3">
                                        <div class="d-flex justify-content-between align-items-center">
                                            <div class="like-block position-relative d-flex align-items-center">
                                                <div class="d-flex align-items-center">
                                                    <div class="like-data">
                                                        <div class="dropdown">
                                                            <span class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" role="button">
                                                   <img src="images/icon/01.png" class="img-fluid" alt="">
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
                                        <ul class="post-comments p-0 m-0">
                                            <li class="mb-2">
                                                <div class="d-flex flex-wrap">
                                                    <div class="user-img">
                                                        <img src="images/user/02.jpg" alt="userimg" class="avatar-35 rounded-circle img-fluid">
                                                    </div>
                                                    <div class="comment-data-block ml-3">
                                                        <h6>Lê Thanh Hà</h6>
                                                        <p class="mb-0">Lorem ipsum dolor sit amet</p>
                                                        <div class="d-flex flex-wrap align-items-center comment-activity">
                                                            <a href="javascript:void();">like</a>
                                                            <a href="javascript:void();">reply</a>

                                                            <span> 5 min </span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="d-flex flex-wrap">
                                                    <div class="user-img">
                                                        <img src="images/user/03.jpg" alt="userimg" class="avatar-35 rounded-circle img-fluid">
                                                    </div>
                                                    <div class="comment-data-block ml-3">
                                                        <h6>Lê Thanh Hà</h6>
                                                        <p class="mb-0">Lorem ipsum dolor sit amet</p>
                                                        <div class="d-flex flex-wrap align-items-center comment-activity">
                                                            <a href="javascript:void();">like</a>
                                                            <a href="javascript:void();">reply</a>

                                                            <span> 5 min </span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                        </ul>
                                        <form class="comment-text d-flex align-items-center mt-3" action="javascript:void(0);">
                                            <input type="text" class="form-control rounded">
                                            <div class="comment-attagement d-flex">
                                                <a href="javascript:void();"><i class="ri-link mr-3"></i></a>
                                                <a href="javascript:void();"><i class="ri-user-smile-line mr-3"></i></a>
                                                <a href="javascript:void();"><i class="ri-camera-line mr-3"></i></a>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-12">
                            <div class="iq-card iq-card-block iq-card-stretch iq-card-height">
                                <div class="iq-card-body">
                                    <div class="user-post-data">
                                        <div class="d-flex flex-wrap">
                                            <div class="media-support-user-img mr-3">
                                                <img class="rounded-circle img-fluid" src="images/user/04.jpg" alt="">
                                            </div>
                                            <div class="media-support-info mt-2">
                                                <h5 class="mb-0 d-inline-block"><a href="#" class="">Lê Thanh Hà</a></h5>

                                                <p class="mb-0 text-primary">6 hour ago</p>
                                            </div>
                                            <div class="iq-card-post-toolbar">
                                                <div class="dropdown">
                                                    <span class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" role="button">
                                             <i class="ri-more-fill"></i>
                                             </span>
                                                    <div class="dropdown-menu m-0 p-0">
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
                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi nulla dolor, ornare at commodo non, feugiat non nisi. Phasellus faucibus mollis pharetra. Proin blandit ac massa sed rhoncus</p>
                                    </div>
                                    <div class="comment-area mt-3">
                                        <div class="d-flex justify-content-between align-items-center">
                                            <div class="like-block position-relative d-flex align-items-center">
                                                <div class="d-flex align-items-center">
                                                    <div class="like-data">
                                                        <div class="dropdown">
                                                            <span class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" role="button">
                                                   <img src="images/icon/01.png" class="img-fluid" alt="">
                                                   </span>
                                                            <div class="dropdown-menu">
                                                                <a class="ml-2 mr-2" href="#" data-toggle="tooltip" data-placement="top" title="" data-original-title="Like"><img src="images/icon/01.png" class="img-fluid" alt=""></a>
                                                                <a class="mr-2" href="#" data-toggle="tooltip" data-placement="top" title="" data-original-title="Love"><img src="images/icon/02.png" class="img-fluid" alt=""></a>
                                                                <a class="mr-2" href="#" data-toggle="tooltip" data-placement="top" title="" data-original-title="Happy"><img src="images/icon/03.png" class="img-fluid" alt=""></a>
                                                                <a class="mr-2" href="#" data-toggle="tooltip" data-placement="top" title="" data-original-title="HaHa"><img src="images/icon/04.png" class="img-fluid" alt=""></a>
                                                                <a class="mr-2" href="#" data-toggle="tooltip" data-placement="top" title="" data-original-title="Think"><img src="images/icon/05.png" class="img-fluid" alt=""></a>
                                                                <a class="mr-2" href="#" data-toggle="tooltip" data-placement="top" title="" data-original-title="Sade"><img src="images/icon/06.png" class="img-fluid" alt=""></a>
                                                                <a class="mr-2" href="#" data-toggle="tooltip" data-placement="top" title="" data-original-title="Lovely"><img src="images/icon/07.png" class="img-fluid" alt=""></a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="total-like-block ml-2 mr-3">
                                                        <div class="dropdown">
                                                            <span class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" role="button">
                                                   140 Likes
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
                                        <ul class="post-comments p-0 m-0">
                                            <li class="mb-2">
                                                <div class="d-flex flex-wrap">
                                                    <div class="user-img">
                                                        <img src="images/user/02.jpg" alt="userimg" class="avatar-35 rounded-circle img-fluid">
                                                    </div>
                                                    <div class="comment-data-block ml-3">
                                                        <h6>Lê Thanh Hà</h6>
                                                        <p class="mb-0">Lorem ipsum dolor sit amet</p>
                                                        <div class="d-flex flex-wrap align-items-center comment-activity">
                                                            <a href="javascript:void();">like</a>
                                                            <a href="javascript:void();">reply</a>

                                                            <span> 5 min </span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="d-flex flex-wrap">
                                                    <div class="user-img">
                                                        <img src="images/user/03.jpg" alt="userimg" class="avatar-35 rounded-circle img-fluid">
                                                    </div>
                                                    <div class="comment-data-block ml-3">
                                                        <h6>Paul Molive</h6>
                                                        <p class="mb-0">Lorem ipsum dolor sit amet</p>
                                                        <div class="d-flex flex-wrap align-items-center comment-activity">
                                                            <a href="javascript:void();">like</a>
                                                            <a href="javascript:void();">reply</a>

                                                            <span> 5 min </span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                        </ul>
                                        <form class="comment-text d-flex align-items-center mt-3" action="javascript:void(0);">
                                            <input type="text" class="form-control rounded">
                                            <div class="comment-attagement d-flex">
                                                <a href="javascript:void();"><i class="ri-link mr-3"></i></a>
                                                <a href="javascript:void();"><i class="ri-user-smile-line mr-3"></i></a>
                                                <a href="javascript:void();"><i class="ri-camera-line mr-3"></i></a>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-12">
                            <div class="iq-card iq-card-block iq-card-stretch iq-card-height">
                                <div class="iq-card-body">
                                    <div class="post-item">
                                        <div class="d-flex flex-wrap">
                                            <div class="media-support-user-img mr-3">
                                                <img class="rounded-circle img-fluid" src="images/user/1.jpg" alt="">
                                            </div>
                                            <div class="media-support-info mt-2">
                                                <h5 class="mb-0 d-inline-block"><a href="#" class="">Lê Thanh Hà</a></h5>
                                                <p class="mb-0">3 ngày trước</p>
                                            </div>
                                            <div class="iq-card-post-toolbar">
                                                <div class="dropdown">
                                                    <span class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" role="button">
                                             <i class="ri-more-fill"></i>
                                             </span>
                                                    <div class="dropdown-menu m-0 p-0">
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
                                    <div class="user-post text-center">
                                        <a href="javascript:void();"><img src="images/page-img/p5.jpg" alt="post-image" class="img-fluid rounded w-100 mt-3"></a>
                                    </div>
                                    <div class="comment-area mt-3">
                                        <div class="d-flex justify-content-between align-items-center">
                                            <div class="like-block position-relative d-flex align-items-center">
                                                <div class="d-flex align-items-center">
                                                    <div class="like-data">
                                                        <div class="dropdown">
                                                            <span class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" role="button">
                                                   <img src="images/icon/01.png" class="img-fluid" alt="">
                                                   </span>
                                                            <div class="dropdown-menu">
                                                                <a class="ml-2 mr-2" href="#" data-toggle="tooltip" data-placement="top" title="" data-original-title="Like"><img src="images/icon/01.png" class="img-fluid" alt=""></a>
                                                                <a class="mr-2" href="#" data-toggle="tooltip" data-placement="top" title="" data-original-title="Love"><img src="images/icon/02.png" class="img-fluid" alt=""></a>
                                                                <a class="mr-2" href="#" data-toggle="tooltip" data-placement="top" title="" data-original-title="Happy"><img src="images/icon/03.png" class="img-fluid" alt=""></a>
                                                                <a class="mr-2" href="#" data-toggle="tooltip" data-placement="top" title="" data-original-title="HaHa"><img src="images/icon/04.png" class="img-fluid" alt=""></a>
                                                                <a class="mr-2" href="#" data-toggle="tooltip" data-placement="top" title="" data-original-title="Think"><img src="images/icon/05.png" class="img-fluid" alt=""></a>
                                                                <a class="mr-2" href="#" data-toggle="tooltip" data-placement="top" title="" data-original-title="Sade"><img src="images/icon/06.png" class="img-fluid" alt=""></a>
                                                                <a class="mr-2" href="#" data-toggle="tooltip" data-placement="top" title="" data-original-title="Lovely"><img src="images/icon/07.png" class="img-fluid" alt=""></a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="total-like-block ml-2 mr-3">
                                                        <div class="dropdown">
                                                            <span class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" role="button">
                                                   140 Likes
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
                                        <ul class="post-comments p-0 m-0">
                                            <li class="mb-2">
                                                <div class="d-flex flex-wrap">
                                                    <div class="user-img">
                                                        <img src="images/user/02.jpg" alt="userimg" class="avatar-35 rounded-circle img-fluid">
                                                    </div>
                                                    <div class="comment-data-block ml-3">
                                                        <h6>Lê Thanh Hà</h6>
                                                        <p class="mb-0">Lê Thanh Hà</p>
                                                        <div class="d-flex flex-wrap align-items-center comment-activity">
                                                            <a href="javascript:void();">like</a>
                                                            <a href="javascript:void();">reply</a>


                                                            <span> 5 min </span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="d-flex flex-wrap">
                                                    <div class="user-img">
                                                        <img src="images/user/03.jpg" alt="userimg" class="avatar-35 rounded-circle img-fluid">
                                                    </div>
                                                    <div class="comment-data-block ml-3">
                                                        <h6>Paul Molive</h6>
                                                        <p class="mb-0">Lorem ipsum dolor sit amet</p>
                                                        <div class="d-flex flex-wrap align-items-center comment-activity">
                                                            <a href="javascript:void();">like</a>
                                                            <a href="javascript:void();">reply</a>


                                                            <span> 5 min </span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                        </ul>
                                        <form class="comment-text d-flex align-items-center mt-3" action="javascript:void(0);">
                                            <input type="text" class="form-control rounded">
                                            <div class="comment-attagement d-flex">
                                                <a href="javascript:void();"><i class="ri-link mr-3"></i></a>
                                                <a href="javascript:void();"><i class="ri-user-smile-line mr-3"></i></a>
                                                <a href="javascript:void();"><i class="ri-camera-line mr-3"></i></a>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-12">
                            <div class="iq-card iq-card-block iq-card-stretch iq-card-height">
                                <div class="iq-card-body">
                                    <div class="user-post-data">
                                        <div class="d-flex flex-wrap">
                                            <div class="media-support-user-img mr-3">
                                                <img class="rounded-circle img-fluid" src="images/user/02.jpg" alt="">
                                            </div>
                                            <div class="media-support-info mt-2">
                                                <h5 class="mb-0 d-inline-block"><a href="#" class="">Lê Thanh Hà</a></h5>

                                                <p class="mb-0 text-primary">1 ngày trước</p>
                                            </div>
                                            <div class="iq-card-post-toolbar">
                                                <div class="dropdown">
                                                    <span class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" role="button">
                                             <i class="ri-more-fill"></i>
                                             </span>
                                                    <div class="dropdown-menu m-0 p-0">
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
                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi nulla dolor, ornare at commodo non, feugiat non nisi. Phasellus faucibus mollis pharetra. Proin blandit ac massa sed rhoncus</p>
                                    </div>
                                    <div class="user-post">
                                        <div class="embed-responsive embed-responsive-16by9">
                                            <iframe class="embed-responsive-item" src="https://www.youtube.com/embed/j_GsIanLxZk?rel=0" allowfullscreen></iframe>
                                        </div>
                                    </div>
                                    <div class="comment-area mt-3">
                                        <div class="d-flex justify-content-between align-items-center">
                                            <div class="like-block position-relative d-flex align-items-center">
                                                <div class="d-flex align-items-center">
                                                    <div class="like-data">
                                                        <div class="dropdown">
                                                            <span class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" role="button">
                                                   <img src="images/icon/01.png" class="img-fluid" alt="">
                                                   </span>
                                                            <div class="dropdown-menu">
                                                                <a class="ml-2 mr-2" href="#" data-toggle="tooltip" data-placement="top" title="" data-original-title="Like"><img src="images/icon/01.png" class="img-fluid" alt=""></a>
                                                                <a class="mr-2" href="#" data-toggle="tooltip" data-placement="top" title="" data-original-title="Love"><img src="images/icon/02.png" class="img-fluid" alt=""></a>
                                                                <a class="mr-2" href="#" data-toggle="tooltip" data-placement="top" title="" data-original-title="Happy"><img src="images/icon/03.png" class="img-fluid" alt=""></a>
                                                                <a class="mr-2" href="#" data-toggle="tooltip" data-placement="top" title="" data-original-title="HaHa"><img src="images/icon/04.png" class="img-fluid" alt=""></a>
                                                                <a class="mr-2" href="#" data-toggle="tooltip" data-placement="top" title="" data-original-title="Think"><img src="images/icon/05.png" class="img-fluid" alt=""></a>
                                                                <a class="mr-2" href="#" data-toggle="tooltip" data-placement="top" title="" data-original-title="Sade"><img src="images/icon/06.png" class="img-fluid" alt=""></a>
                                                                <a class="mr-2" href="#" data-toggle="tooltip" data-placement="top" title="" data-original-title="Lovely"><img src="images/icon/07.png" class="img-fluid" alt=""></a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="total-like-block ml-2 mr-3">
                                                        <div class="dropdown">
                                                            <span class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" role="button">
                                                   140 Likes
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
                                        <ul class="post-comments p-0 m-0">
                                            <li class="mb-2">
                                                <div class="d-flex flex-wrap">
                                                    <div class="user-img">
                                                        <img src="images/user/02.jpg" alt="userimg" class="avatar-35 rounded-circle img-fluid">
                                                    </div>
                                                    <div class="comment-data-block ml-3">
                                                        <h6>Monty Carlo</h6>
                                                        <p class="mb-0">Lorem ipsum dolor sit amet</p>
                                                        <div class="d-flex flex-wrap align-items-center comment-activity">
                                                            <a href="javascript:void();">like</a>
                                                            <a href="javascript:void();">reply</a>

                                                            <span> 5 min </span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="d-flex flex-wrap">
                                                    <div class="user-img">
                                                        <img src="images/user/03.jpg" alt="userimg" class="avatar-35 rounded-circle img-fluid">
                                                    </div>
                                                    <div class="comment-data-block ml-3">
                                                        <h6>Paul Molive</h6>
                                                        <p class="mb-0">Lorem ipsum dolor sit amet</p>
                                                        <div class="d-flex flex-wrap align-items-center comment-activity">
                                                            <a href="javascript:void();">like</a>
                                                            <a href="javascript:void();">reply</a>

                                                            <span> 5 min </span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                        </ul>
                                        <form class="comment-text d-flex align-items-center mt-3" action="javascript:void(0);">
                                            <input type="text" class="form-control rounded">
                                            <div class="comment-attagement d-flex">
                                                <a href="javascript:void();"><i class="ri-link mr-3"></i></a>
                                                <a href="javascript:void();"><i class="ri-user-smile-line mr-3"></i></a>
                                                <a href="javascript:void();"><i class="ri-camera-line mr-3"></i></a>
                                            </div>
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