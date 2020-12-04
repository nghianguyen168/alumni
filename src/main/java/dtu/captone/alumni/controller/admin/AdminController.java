package dtu.captone.alumni.controller.admin;

import java.security.Principal;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import dtu.captone.alumni.auth.service.UserService;
import dtu.captone.alumni.domain.Member;
import dtu.captone.alumni.service.ChartService;

@Controller
@RequestMapping(value = "/admin")
public class AdminController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private ChartService canvasjsChartService;
	
	@GetMapping("/index")
	public String index(HttpSession session, Principal principal,Model model) {
		
		String dtuMail="";
		try {
			 dtuMail = principal.getName();
			 Member memberLogin = userService.findByDtuMail(dtuMail);
				session.setAttribute("userInfo", memberLogin);
		} catch (Exception e) {
			// TODO: handle exception
			return "redirect:/auth/login";
		}
		List<List<Map<Object, Object>>> canvasjsDataList = canvasjsChartService.getCanvasjsChartData();
		model.addAttribute("dataPointsList", canvasjsDataList);
System.out.println(LocalDateTime.now().getMonthValue());
		return "admin.index";
	}
}
