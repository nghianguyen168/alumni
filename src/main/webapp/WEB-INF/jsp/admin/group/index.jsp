<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/tags/taglib.jsp"%>

<div class="row mt">
<c:set var="contextPath" value="${pageContext.request.contextPath }/admin/group" />
	<div class="col-md-12">
		<div class="content-panel">

			<table class="table table-striped table-advance table-hover">
				<h4>
					<strong><i class="fa fa-angle-right"></i> QUẢN LÝ GROUP</strong>
					<a type="button" href="${pageContext.request.contextPath }/admin/group/add" class="btn btn-success" style="margin-left: 20px;">Tạo Group</a>
				</h4>
				<c:if test="${not empty msg}">
					<div class="alert alert-success fade in alert-dismissible" style="margin-top: 18px; width: 30%;margin-left: 30%;	">
						<a href="#" class="close" data-dismiss="alert" aria-label="close" title="close">×</a> <strong>${msg}</strong>
					</div>
				</c:if>
				<hr>

				<div class="row-fluid">
					<div class="span6">
						<div id="hidden-table-info_length" class="dataTables_length">
							<label><select size="1" name="hidden-table-info_length"
								aria-controls="hidden-table-info"><option value="10"
										selected="selected">10</option>
									<option value="25">25</option>
									<option value="50">50</option>
									<option value="100">100</option></select> records per page</label>
						</div>
						<div class="span6" style="float: right;">
						<div class="dataTables_filter" id="hidden-table-info_filter">
						<form action="">
							<input type="text" placeholder="Tìm kiếm">
							<input type="submit">
						</form>
							
								
						</div>
					</div>
					</div>
					
				</div>
				<thead>
					<tr>
						<th><i class="fa fa-bullhorn"></i> ID</th>
						<th class="hidden-phone"><i class="fa fa-question-circle"></i>
							Tên Group</th>
						<th><i class=""></i>Mô tả</th>
						<th><i class=""></i>Tạo Bởi</th>
						<th><i class=""></i>Số thành viên</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${not empty groupList }">
						<c:forEach items="${groupList }" var="group">
							<tr>
								<td class="hidden-phone">${group.id }</td>
								<td><a href="basic_table.html#">${group.groupName }</a></td>
								<td>${group.groupDecription }</td>
								<td>${group.member.firstName } ${group.member.lastName }</td>
								<td></td>
								<td>
									<a style="margin-top: 10px;" type="button" class="btn btn-primary btn-xs">
										<i class="fa fa-pencil"></i>
									</a>
									<a style="margin-top: 10px" type="button" class="btn btn-danger btn-xs">
										<i class="fa fa-trash-o "></i>
									</a>
								</td>
							</tr>
						</c:forEach>
					
					</c:if>
				</tbody>
			</table>
			<div class="row-fluid">
				<div class="span6">
					<div class="dataTables_info" id="hidden-table-info_info">Showing
						1 to 10 of 57 entries</div>
				</div>
				<div class="span6">
					<div class="dataTables_paginate paging_bootstrap pagination">
						<ul>
							<li class="prev disabled"><a href="#">← Previous</a></li>
							<li class="active"><a href="#">1</a></li>
							<li><a href="#">2</a></li>
							<li><a href="#">3</a></li>
							<li><a href="#">4</a></li>
							<li><a href="#">5</a></li>
							<li class="next"><a href="#">Next → </a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<!-- /content-panel -->
	</div>
	<!-- /col-md-12 -->
</div>
<script>
	document.getElementById("home").classList.remove('active');
	document.getElementById("group").classList.add('active');


</script>