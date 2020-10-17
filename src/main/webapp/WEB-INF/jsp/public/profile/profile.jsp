<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/WEB-INF/templates/tags/taglib.jsp"%>
<!DOCTYPE html>
  <!-- bắt đầu profile -->
    <div id="profile">
        <div class="container">
            <div class="chia2-profile">
                <div class="danh-muc-profile">
                    <div class="profile-information shadow" style="background-color: white;">
                    <img class="team-avatar" src="/resources/uploads/${member.avatar}" alt="">
                        <div class="overflow">
                           <!--  <div class="change">
                                <div style="font-size: 12px;">Change</div>
                                <input type="file" name="pic" accept="image/*" id="eventPicChangengf" ngf-select="uploadImagesprofilePic($file)">
                            </div> -->

                        </div>

                        <div style="padding-bottom: 20px; padding-top: 5px;">
                            <div class="font-18 mdl-typography--font-medium ng-binding" style="display: inline; font-weight: bold;">${member.firstName } ${member.lastName }</div>
                            <a href="">
                                <span class="material-icons" style="font-size: 19px; color: blue;">edit</span>
                            </a>
                            <div><strong>${member.k},Khoa ${member.faculty.facultyName} </strong></div>
                            <div><strong>${member.memberType.typeName }</strong></div>
                        </div>
                    </div>

                    <div class="contact shadow" style="background-color: white;">
                        <div style="padding: 1px 16px;">
                            <span class="material-icons" style="text-align: center; font-size: 20px; padding: 10px; color: #005497;">
                                    info
                                    </span>
                            <span style="vertical-align: 4px;">Contact Information</span>
                            <a href="" style="color: orange; float: right; padding: 10px;">Edit</a>
                        </div>
                        <div class="contact-infor">
                            <div class="profile-info">
                                <span class="material-icons new-icon">
                                    email
                                    </span>
                                <div style="display:inline-block;vertical-align:top;">
                                    <span>${member.email }</span>
                                </div>
                            </div>
                            <div class="profile-info">
                                <span class="material-icons new-icon">
                                    phone
                                    </span>
                                <div style="display:inline-block;vertical-align:top;">
                                    <span>${member.phone }</span>
                                </div>
                            </div>
                            <div class="profile-info">
                                <span class="material-icons new-icon">
                                    location_on
                                    </span>
                                <div style="display:inline-block;vertical-align:top;">
                                    <span>${member.addressNow }</span>
                                </div>
                            </div>
                        </div>
                    </div>

                  <!--   <div class="expertise shadow" style="background-color: white;">
                        <div style="padding: 1px 16px;">
                            <span class="material-icons" style="text-align: center; font-size: 20px; padding: 10px; color: #005497;">
                                    info
                                    </span>
                            <span style="vertical-align: 4px;">Expertise</span>
                            <a href="" style="color: orange; float: right; padding: 10px;">Edit</a>
                        </div>
                        <div style="padding:20px;border-top: 1px solid rgba(0, 0, 0, 0.1);">
                            Kỹ năng chuyên môn:
                            <span style="color: rgb(117,117,117) !important;"> Social media marketing, </span>
                            <span style="color: rgb(117,117,117) !important;"> Team Building Skills</span>
                        </div>
                    </div> -->
                    <div class="basic-information shadow" style="background-color: white;">
                        <div style="padding: 1px 16px;">
                            <span class="material-icons" style="text-align: center; font-size: 20px; padding: 10px; color: #005497;">
                                    info
                                    </span>
                            <span style="vertical-align: 4px;">Basic Information</span>
                            <a href="" style="color: orange; float: right; padding: 10px;">Edit</a>
                        </div>
                        <div class="contact-infor">

                            <div class="profile-info">
                                <span class="material-icons new-icon">
                                    location_on
                                    </span>
                                <div style="display:inline-block;vertical-align:top;">
                                    <span>${member.addressNow }</span>
                                </div>
                            </div>
                          
                            <div class="profile-info">
                                <span class="material-icons new-icon">
                                    cake
                                    </span>
                                <div style="display:inline-block;vertical-align:top;">
                                    <span>${member.dateOfBirth }</span>
                                </div>
                            </div>
                            <div class="profile-info">
                                <span class="material-icons new-icon">
                                   wc
                                    </span>
                                <div style="display:inline-block;vertical-align:top;">
                                    <span>${member.gender }</span>
                                </div>
                            </div>
                            <div class="profile-info">
                                <span class="material-icons new-icon">
                                    family_restroom
                                    </span>
                                <div style="display:inline-block;vertical-align:top;">
                                    <span>Độc thân</span>
                                </div>
                            </div>
                        </div>

                    </div>


                </div>

                <div class="dang-tin-profile">
                   <!--  <div class="summnary shadow" style="background-color: white;">
                        <div style="padding: 1px 16px;">
                            <span class="material-icons" style="text-align: center; font-size: 20px; padding: 10px; color: #005497;">
                                assignment_turned_in
                                    </span>
                            <span style="vertical-align: 4px;">Summary</span>
                            <a href="" style="color: orange; float: right; padding: 10px;">Edit</a>
                        </div>
                        <div style="padding:20px;border-top: 1px solid rgba(0, 0, 0, 0.1);">
                            Kỹ năng chuyên môn:
                            <span style="color: rgb(117,117,117) !important;"> Social media marketing, </span>
                            <span style="color: rgb(117,117,117) !important;"> Team Building Skills</span>
                        </div>
                    </div> -->
                    <div class="educational-level shadow" style="background-color: white;">
                        <div style="padding: 1px 16px;">
                            <span class="material-icons" style="text-align: center; font-size: 20px; padding: 10px; color: #005497;">
                                school
                                    </span>
                            <span style="vertical-align: 4px;">Trình độ giáo dục</span>
                            <a href="" style="color: orange; float: right; padding: 10px;">Edit</a>
                        </div>
                        <div style="padding: 20px 7%;    border-top: 1px solid rgba(0, 0, 0, 0.1);">
                            <div style="margin-bottom: 12px; font-weight: bold"><strong>Đại học:</strong> Duy Tan University</div>
                            <div style="padding-top: 4px; padding-bottom: 5px;"><strong>Chuyên ngành:</strong> ${member.major.majorName }</div>
                              <div style="padding-top: 4px; padding-bottom: 5px;"><strong>Khoa:</strong> ${member.faculty.facultyName}</div>
                            <div style="padding-top: 4px; padding-bottom: 5px;"><strong>Khóa:</strong> ${member.k }</div>
                          

                        </div>
                    </div>
                    <div class="expertise-work shadow" style="background-color: white;">
                        <div style="padding: 1px 16px;">
                            <span class="material-icons" style="text-align: center; font-size: 20px; padding: 10px; color: #005497;">
                                work
                                    </span>
                            <span style="vertical-align: 4px;">Công việc hiện tại</span>
                            <a href="" style="color: orange; float: right; padding: 10px;">Edit</a>
                        </div>
                        <div style="padding: 20px 7%;    border-top: 1px solid rgba(0, 0, 0, 0.1);">
							 <div style="padding-top: 4px; padding-bottom: 5px;"><strong>Vị trí:</strong> ${member.positionJob }</div>
							 <div style="padding-top: 4px; padding-bottom: 5px;"><strong>Công ty:</strong> ${member.company}</div>
							 <div style="padding-top: 4px; padding-bottom: 5px;"><strong>Mức lương hiện tại:</strong> ${member.salary }</div>
							 <div style="padding-top: 4px; padding-bottom: 5px;"><strong>Địa chỉ làm việc:</strong> ${member.workAt }</div>
                        </div>
                    </div>
                    <div class="expertise-work shadow" style="background-color: white;">
                        <div style="padding: 1px 16px;">
                            <span class="material-icons" style="text-align: center; font-size: 20px; padding: 10px; color: #005497;">
                                work
                                    </span>
                            <span style="vertical-align: 4px;">Giới thiệu bản thân</span>
                            <a href="" style="color: orange; float: right; padding: 10px;">Edit</a>
                        </div>
                        <div style="padding: 20px 7%;    border-top: 1px solid rgba(0, 0, 0, 0.1);">
							 <div style="padding-top: 4px; padding-bottom: 5px;">
							 	<p>${member.decription }</p>
							 </div>

                        </div>

                    </div>


                </div>
            </div>

        </div>
    </div>