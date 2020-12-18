package dtu.captone.alumni.controller.admin;

import java.util.List;
import java.util.Locale;

import dtu.captone.alumni.constant.CommonConstants;
import dtu.captone.alumni.domain.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import dtu.captone.alumni.domain.AlumniGroup;
import dtu.captone.alumni.service.GroupService;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;


@Controller
@RequestMapping(value = "/admin/group")
public class AdminGroupController {
	
	@Autowired
	MessageSource messageSource;
	
	@Autowired
	private GroupService groupService;

	@GetMapping("/index")
	public String index(Model model,HttpSession session) {
		if(session.getAttribute("userInfo")==null ) {
			return "redirect:/auth/login";
		}else {
			List<AlumniGroup> groupList = groupService.findAll();
			model.addAttribute("groupList", groupList);
			return "admin.group.index";
		}
	}

	@GetMapping("/add")
	public String add(HttpSession session){
		if(session.getAttribute("userInfo")==null ) {
			return "redirect:/auth/login";
		}else {
			return "admin.group.add";
		}
	}

	@PostMapping("/add")
	public String addPost(@ModelAttribute("alumniGroup") AlumniGroup alumniGroup, HttpSession session, RedirectAttributes rd){
		Member member = (Member)session.getAttribute("userInfo");
		alumniGroup.setMember(member);
		System.out.println(alumniGroup);
		AlumniGroup alumniGroupAdd = groupService.save(alumniGroup);
		if(alumniGroupAdd!=null) {
			rd.addFlashAttribute(CommonConstants.MSG,
					messageSource.getMessage("add-group-success", null, Locale.getDefault()));
			return "redirect:/admin/group/index";
		} else {return "admin.group.add";}
	}
}
