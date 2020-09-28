package dtu.captone.alumni.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping(value = "/admin/group")
public class AdminGroupController {

	@GetMapping("/index")
	public String index(Model model) {
		return "admin.group.index";
	}
	
}
