package dtu.captone.alumni.controller.alumni;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import dtu.captone.alumni.domain.Member;
import dtu.captone.alumni.domain.Network;
import dtu.captone.alumni.security.UserInfoHandler;
import dtu.captone.alumni.service.FacultyService;
import dtu.captone.alumni.service.KnameService;
import dtu.captone.alumni.service.MajorService;
import dtu.captone.alumni.service.NetworkService;
import dtu.captone.alumni.service.TrainningSystemService;

@Controller
@RequestMapping("/profile")
public class PublicProfileController extends UserInfoHandler{
	
	@Autowired
	private NetworkService networkService;

	@Autowired
	private FacultyService facultyService;
	
	@Autowired
	private TrainningSystemService trainningSystemService;
	
	@Autowired
	private MajorService majorService;
	
	@Autowired
	private KnameService knameService;

	@ModelAttribute
	public void network_new(Model model,HttpSession session) {
		if(isUserLogin(session)!=null) {
			List<Network> newRequestFriendList = networkService.getNewRequestFriendList(isUserLogin(session).getId());
			model.addAttribute("newRequestFriendList", newRequestFriendList);
		}
		
	}
	
	@GetMapping("/index")
	public String index(HttpSession session) {
		if (isUserLogin(session) == null) {
			return "redirect:/login";
		}
		return "public.profile.index";
	}
	
	@GetMapping("/edit")
	public String editProfile(HttpSession session,Model model) {
		if (isUserLogin(session) == null) {
			return "redirect:/login";
		}
		
		model.addAttribute("majorList", majorService.findAll());
		model.addAttribute("facultyList", facultyService.findAll());
		model.addAttribute("trainningList", trainningSystemService.findAll());
		model.addAttribute("knameList", knameService.findAll());
		return "public.profile.edit";
	}
	
	
	
	
}
