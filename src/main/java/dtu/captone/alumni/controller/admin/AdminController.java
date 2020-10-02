package dtu.captone.alumni.controller.admin;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import dtu.captone.alumni.domain.Member;

@Controller
@RequestMapping(value = "/admin")
public class AdminController {

	@ModelAttribute
	public void userinfo(HttpSession session,Model model) {
		Member member = (Member)session.getAttribute("userInfo");
		model.addAttribute("userLogin", member);
	}
	
	@GetMapping("/index")
	public String index() {
		return "admin.index";
	}
}
