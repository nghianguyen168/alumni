package dtu.captone.alumni.controller.alumni;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PublicCommunityController {
	
	@GetMapping("/community")
	public String community() {
		return "public.community";
	}
}
