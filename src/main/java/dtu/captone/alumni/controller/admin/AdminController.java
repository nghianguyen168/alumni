package dtu.captone.alumni.controller.admin;

import java.security.Principal;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import dtu.captone.alumni.auth.service.RoleService;
import dtu.captone.alumni.security.UserInfoHandler;
import dtu.captone.alumni.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import dtu.captone.alumni.auth.service.UserService;
import dtu.captone.alumni.domain.Member;

@Controller
@RequestMapping(value = "/admin")
public class AdminController extends UserInfoHandler {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private ChartService canvasjsChartService;



	@Autowired
	private MemberService memberService;

	@Autowired
	private MajorService majorService;

	@Autowired
	private JobService  jobService;

	@Autowired
	private JobApplyService jobApplyService;

	@Autowired
	private NewsService newsService;

	@Autowired
	private EventService eventService;

	@Autowired
	private RoleService roleService;

	@ModelAttribute
	public void addService(Model model){
		model.addAttribute("memberService",memberService);
		model.addAttribute("majorService",majorService);
		model.addAttribute("jobService",jobService);
		model.addAttribute("jobApplyService",jobApplyService);
		model.addAttribute("newsService",newsService);
		model.addAttribute("eventService",eventService);
		model.addAttribute("roleService",roleService);

	}
	
	@GetMapping("/index")
	public String index(HttpSession session, Principal principal,Model model){
		
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

		List<List<Map<Object, Object>>> canvasjsDataListCirlceMajor = canvasjsChartService.getCanvasjsDataListCircleMajor();
		System.out.println(canvasjsDataList);
		model.addAttribute("canvasjsDataListCirlceMajor", canvasjsDataListCirlceMajor);
		model.addAttribute("sumJob",jobService.findAll(Sort.by("id")).size());

		return "admin.index";
	}
}
