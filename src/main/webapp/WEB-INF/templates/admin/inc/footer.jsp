<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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

