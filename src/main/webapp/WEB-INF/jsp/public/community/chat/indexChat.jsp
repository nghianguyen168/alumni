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
                                    <li >
                                        <a href="/community/index/0" class="iq-waves-effect"><i class="ri-newspaper-line"></i><span>Cộng đồng DTU</span></a>
                                    </li>
                                     <li class="active">
                                        <a href="/community/group" class="iq-waves-effect"><i class="fa fa-users" aria-hidden="true"></i><span>Nhóm</span></a>
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
           <div>
    <div id="username-page">
        <div class="username-page-container">
            <h1 class="title">Type your username</h1>
            <form id="usernameForm" name="usernameForm">
                <div class="form-group">
                    <input type="text" id="name" placeholder="Username" autocomplete="off" class="form-control" />
                </div>
                <div class="form-group">
                    <button type="submit" class="accent username-submit">Start Chatting</button>
                </div>
            </form>
        </div>
    </div>

    <div id="chat-page" class="hidden">
        <div class="chat-container">
            <div class="chat-header">
                <h2>Spring WebSocket Chat Demo</h2>
            </div>
            <div class="connecting">
                Connecting...
            </div>
            <ul id="messageArea">

            </ul>
            <form id="messageForm" name="messageForm" nameForm="messageForm">
                <div class="form-group">
                    <div class="input-group clearfix">
                        <input type="text" id="message" placeholder="Type a message..." autocomplete="off" class="form-control"/>
                        <button type="submit" class="primary">Send</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.4/sockjs.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
    <script src="/resources/templates/public/chat/js/main.js"></script>
        </div>
        
<style>
		#username-page {
    text-align: center;
}

.username-page-container {
    background: #fff;
    box-shadow: 0 1px 11px rgba(0, 0, 0, 0.27);
    border-radius: 2px;
    width: 100%;
    max-width: 500px;
    display: inline-block;
    margin-top: 42px;
    vertical-align: middle;
    position: relative;
    padding: 35px 55px 35px;
    min-height: 250px;
    position: absolute;
    top: 50%;
    left: 0;
    right: 0;
    margin: 0 auto;
    margin-top: -160px;
}

.username-page-container .username-submit {
    margin-top: 10px;
}


#chat-page {
    position: relative;
    height: 100%;
}

.chat-container {
    max-width: 700px;
    margin-left: auto;
    margin-right: auto;
    background-color: #fff;
    box-shadow: 0 1px 11px rgba(0, 0, 0, 0.27);
    margin-top: 30px;
    height: calc(100% - 60px);
    max-height: 600px;
    position: relative;
}

#chat-page ul {
    list-style-type: none;
    background-color: #FFF;
    margin: 0;
    overflow: auto;
    overflow-y: scroll;
    padding: 0 20px 0px 20px;
    height: calc(100% - 150px);
}

#chat-page #messageForm {
    padding: 20px;
}

#chat-page ul li {
    line-height: 1.5rem;
    padding: 10px 20px;
    margin: 0;
    border-bottom: 1px solid #f4f4f4;
}

#chat-page ul li p {
    margin: 0;
}

#chat-page .event-message {
    width: 100%;
    text-align: center;
    clear: both;
}

#chat-page .event-message p {
    color: #777;
    font-size: 14px;
    word-wrap: break-word;
}

#chat-page .chat-message {
    padding-left: 68px;
    position: relative;
}

#chat-page .chat-message i {
    position: absolute;
    width: 42px;
    height: 42px;
    overflow: hidden;
    left: 10px;
    display: inline-block;
    vertical-align: middle;
    font-size: 18px;
    line-height: 42px;
    color: #fff;
    text-align: center;
    border-radius: 50%;
    font-style: normal;
    text-transform: uppercase;
}

#chat-page .chat-message span {
    color: #333;
    font-weight: 600;
}

#chat-page .chat-message p {
    color: #43464b;
}

#messageForm .input-group input {
    float: left;
    width: calc(100% - 85px);
}

#messageForm .input-group button {
    float: left;
    width: 80px;
    height: 38px;
    margin-left: 5px;
}

.chat-header {
    text-align: center;
    padding: 15px;
    border-bottom: 1px solid #ececec;
}

.chat-header h2 {
    margin: 0;
    font-weight: 500;
}

.connecting {
    padding-top: 5px;
    text-align: center;
    color: #777;
    position: absolute;
    top: 65px;
    width: 100%;
}


@media screen and (max-width: 730px) {

    .chat-container {
        margin-left: 10px;
        margin-right: 10px;
        margin-top: 10px;
    }
}

@media screen and (max-width: 480px) {
    .chat-container {
        height: calc(100% - 30px);
    }

    .username-page-container {
        width: auto;
        margin-left: 15px;
        margin-right: 15px;
        padding: 25px;
    }

    #chat-page ul {
        height: calc(100% - 120px);
    }

    #messageForm .input-group button {
        width: 65px;
    }

    #messageForm .input-group input {
        width: calc(100% - 70px);
    }

    .chat-header {
        padding: 10px;
    }

    .connecting {
        top: 60px;
    }

    .chat-header h2 {
        font-size: 1.1em;
    }
</style>