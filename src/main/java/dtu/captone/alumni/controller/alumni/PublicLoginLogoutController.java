package dtu.captone.alumni.controller.alumni;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;



@Controller
public class PublicLoginLogoutController {

	@GetMapping("/user/login")
	public String login() {
		return "public.login";
	}
	
	@GetMapping("/user/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("userInfo");
		return "redirect:/user/login";
	}

	@GetMapping("/user/register")
	public String register() {
		return "public.register";
	}
}
