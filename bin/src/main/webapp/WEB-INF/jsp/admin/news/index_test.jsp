<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/tags/taglib.jsp"%>

<div class="row mt">
<c:set var="contextPath" value="${pageContext.request.contextPath }/admin/news" />
	<div class="col-md-12">
		<div class="content-panel">
		<c:if test="${not empty msg}">
					<div class="alert alert-success fade in alert-dismissible" style="margin-top: 18px;">
						<a href="#" class="close" data-dismiss="alert" aria-label="close" title="close">×</a> <strong>${msg}</strong>
					</div>
				</c:if>
			<table id="news-table" class="table table-striped table-advance table-hover">
				<h4>
					<strong><i class="fa fa-angle-right"></i> QUẢN LÝ TIN TỨC ALUMNI</strong>
					<a type="button" href="${pageContext.request.contextPath }/admin/news/add" class="btn btn-success" style="margin-left: 20px;">Thêm tin mới</a>
				</h4>
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
							Tên</th>
						<th><i class="fa fa-bookmark"></i> Hình Ảnh</th>
						<th><i class="fa fa-bookmark"></i> Mô tả</th>
						<th><i class=" fa fa-edit"></i> Status</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
				
				
					
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
	<script>
$( document ).ready(function() {
	$(function () {
	    $("#news-table").DataTable({
	      "responsive": true,
	      "autoWidth" : false,
	      "pagingType": 'full_numbers',
	      "responsive": true,
	      "lengthMenu": [10, 20, 50],
	      "columnDefs": [
	    	    { 
	    	    	"searchable": false, 
	    	    	"orderable": false, 
	    	    	"targets": 3
	    	    },
	    	    { 
	    	    	"targets": 4,
	    	    	"render": function(data,type,full,meta) { 
	    	    		if(full.image != '') {
	    	    			return '<img width="250px" src="/resources/uploads/'+full.image+'">';
	    	    		}
	    	    		return 'No image';
	    	    	 }
	    	    }
	      ],
	      "ajax": {
	    	url: "/api/admin/news/index", 
	  		type: "POST",
	  		beforeSend: function (xhr) {
	  		    xhr.setRequestHeader ("Authorization", localStorage.getItem('token'));
	  		},
	  		"dataSrc": function ( json ) {
	  			console.log(json.data.news);
                return json.data.news;
	  	    },
	  	    error: function(xhr, status, error) {
	  	    	window.location = "/auth/login";
	  	    	return;
    		}
	      },
	      "columns": [
	            { "data": "id" },
	            { "data": "news_name" },
	            { "data": "picture" },
	            { "data": "desciption" },
	            { "data": "status" }
	     ]
	    });
	  });
});
</script>
	<!-- /col-md-12 -->
</div>