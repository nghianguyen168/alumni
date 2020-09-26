<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="row mt">
	<div class="col-md-12">
		<div class="content-panel">

			<table class="table table-striped table-advance table-hover">
				<h4>
					<strong><i class="fa fa-angle-right"></i> QUẢN LÝ TIN TỨC ALUMNI</strong>
					<a type="button" class="btn btn-success" style="margin-left: 20px;">Thêm tin mới</a>
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
					<tr>
						<td><a href="basic_table.html#">Company Ltd</a></td>
						<td class="hidden-phone">Lorem Ipsum dolor</td>
						<td>12000.00$</td>
						<td><span class="label label-info label-mini">Due</span></td>
						<td>
							<button class="btn btn-success btn-xs">
								<i class="fa fa-check"></i>
							</button>
							<button class="btn btn-primary btn-xs">
								<i class="fa fa-pencil"></i>
							</button>
							<button class="btn btn-danger btn-xs">
								<i class="fa fa-trash-o "></i>
							</button>
						</td>
					</tr>
					<tr>
						<td><a href="basic_table.html#"> Dashio co </a></td>
						<td class="hidden-phone">Lorem Ipsum dolor</td>
						<td>17900.00$</td>
						<td><span class="label label-warning label-mini">Due</span></td>
						<td>
							<button class="btn btn-success btn-xs">
								<i class="fa fa-check"></i>
							</button>
							<button class="btn btn-primary btn-xs">
								<i class="fa fa-pencil"></i>
							</button>
							<button class="btn btn-danger btn-xs">
								<i class="fa fa-trash-o "></i>
							</button>
						</td>
					</tr>
					<tr>
						<td><a href="basic_table.html#"> Another Co </a></td>
						<td class="hidden-phone">Lorem Ipsum dolor</td>
						<td>14400.00$</td>
						<td><span class="label label-success label-mini">Paid</span></td>
						<td>
							<button class="btn btn-success btn-xs">
								<i class="fa fa-check"></i>
							</button>
							<button class="btn btn-primary btn-xs">
								<i class="fa fa-pencil"></i>
							</button>
							<button class="btn btn-danger btn-xs">
								<i class="fa fa-trash-o "></i>
							</button>
						</td>
					</tr>
					<tr>
						<td><a href="basic_table.html#">Dashio ext</a></td>
						<td class="hidden-phone">Lorem Ipsum dolor</td>
						<td>22000.50$</td>
						<td><span class="label label-success label-mini">Paid</span></td>
						<td>
							<button class="btn btn-success btn-xs">
								<i class="fa fa-check"></i>
							</button>
							<button class="btn btn-primary btn-xs">
								<i class="fa fa-pencil"></i>
							</button>
							<button class="btn btn-danger btn-xs">
								<i class="fa fa-trash-o "></i>
							</button>
						</td>
					</tr>
					<tr>
						<td><a href="basic_table.html#">Total Ltd</a></td>
						<td class="hidden-phone">Lorem Ipsum dolor</td>
						<td>12120.00$</td>
						<td><span class="label label-warning label-mini">Due</span></td>
						<td>
							<button class="btn btn-success btn-xs">
								<i class="fa fa-check"></i>
							</button>
							<button class="btn btn-primary btn-xs">
								<i class="fa fa-pencil"></i>
							</button>
							<button class="btn btn-danger btn-xs">
								<i class="fa fa-trash-o "></i>
							</button>
						</td>
					</tr>
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