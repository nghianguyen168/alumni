<a class="btn btn-success btn-sm rounded-0"
												type="button" data-toggle="tooltip" data-placement="top"
												title="Edit" href="/job/edit/${job.id }">
												<i class="fa fa-edit"></i>
											</a>
											
											   <div class="modal fade" id="confirm-delete" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
											        <div class="modal-dialog">
											            <div class="modal-content">
											            
											                <div class="modal-header">
											                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
											                    <h4 class="modal-title" id="myModalLabel">Xác nhận xóa</h4>
											                </div>
											            
											                <div class="modal-body">
											                    <p>Bạn có chắc chắn muốn xóa bài tuyển dụng này?</p>
											                    <p class="debug-url"></p>
											                </div>
											                
											                <div class="modal-footer">
											                    <button style="margin-top: 10px;" type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
											                    <a  class="btn btn-danger btn-ok">Delete</a>
											                </div>
											            </div>
											        </div>
											    </div>
											
											   <button style="margin-top: 10px;" data-toggle="modal" data-target="#confirm-delete" class="btn btn-danger btn-sm rounded-0" type="button"
												data-toggle="tooltip" data-placement="top" title="Delete">
												<i class="fa fa-trash"></i>
												</button>
											  
											
											
											    <script>
											        $('#confirm-delete').on('show.bs.modal', function(e) {
											            $(this).find('.btn-ok').attr('href', $(e.relatedTarget).data('href'));
											          
											        });
											    </script>