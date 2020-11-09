package dtu.captone.alumni.error;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ErrorController {

	@GetMapping("/error")
	public String eror() {
		return "admin.error";
	}
	
	@GetMapping("/error403")
	public String accessDenine() {
		return "admin.error.403";
	}

}
