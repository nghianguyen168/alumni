package dtu.captone.alumni.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import dtu.captone.alumni.domain.Alumni_group;
import dtu.captone.alumni.service.GroupService;


@Controller
@RequestMapping(value = "/admin/group")
public class AdminGroupController {
	
	@Autowired
	MessageSource messageSource;
	
	@Autowired
	private GroupService groupService;

	@GetMapping("/index")
	public String index(Model model) {
		List<Alumni_group> groupList = groupService.findAll();
		model.addAttribute("groupList", groupList);
		return "admin.group.index";
	}
	
}
