package dtu.captone.alumni.controller.alumni;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PublicLoginLogoutController {

	@GetMapping("/login")
	public String login() {
		return "public.login";
	}
}
