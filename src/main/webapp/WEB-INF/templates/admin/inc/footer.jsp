<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="text-center">
	<p>
		&copy; Copyrights <strong>Dashio</strong>. All Rights Reserved
	</p>
	<div class="credits">
		<!--
            You are NOT allowed to delete the credit link to TemplateMag with free version.
            You can delete the credit link only if you bought the pro version.
            Buy the pro version with working PHP/AJAX contact form: https://templatemag.com/dashio-bootstrap-admin-template/
            Licensing information: https://templatemag.com/license/
          -->
		Created with Dashio template by <a href="https://templatemag.com/">TemplateMag</a>
	</div>
	<a href="index.html#" class="go-top"> <i class="fa fa-angle-up"></i>
	</a>
</div>
<script>
	function logout() {
		$("#wait").css("display", "block");
		$.ajax({
			url: "/api/admin/logout", 
			type: "GET",
			success: function(result){
				$("#wait").css("display", "none");
	     	 	if(result.code == '200') {
	     	 		localStorage.removeItem("token");
	     	 		localStorage.removeItem("userInfo");
	     	 		window.location = "/auth/login";
	     	 		return;
	     	 	} 
	      	}, 
    	    error: function(xhr, status, error) {
    	    	$("#wait").css("display", "none");
    	    	window.location = "/auth/login";
    		}
		});
	}
	
</script>

