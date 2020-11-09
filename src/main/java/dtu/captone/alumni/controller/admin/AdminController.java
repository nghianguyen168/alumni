package dtu.captone.alumni.controller.admin;

import java.security.Principal;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import dtu.captone.alumni.auth.service.UserService;
import dtu.captone.alumni.domain.Member;

@Controller
@RequestMapping(value = "/admin")
public class AdminController {
	
	@Autowired
	private UserService userService;
	
	@GetMapping("/index")
	public String index(HttpSession session, Principal principal) {
		
		String dtuMail="";
		try {
			 dtuMail = principal.getName();
			 Member memberLogin = userService.findByDtuMail(dtuMail);
				session.setAttribute("userInfo", memberLogin);
		} catch (Exception e) {
			// TODO: handle exception
			return "redirect:/auth/login";
		}
		
		
		return "admin.index";
	}
}
