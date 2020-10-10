package dtu.captone.alumni.controller.alumni;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/profile")
public class PublicProfileController {
	
	@GetMapping("/index")
	public String index() {
		return "public.profile.index";
	}
}
