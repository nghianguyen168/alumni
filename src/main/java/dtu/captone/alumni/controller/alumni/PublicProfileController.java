package dtu.captone.alumni.controller.alumni;

import java.io.IOException;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dtu.captone.alumni.auth.service.UserService;
import dtu.captone.alumni.constant.CommonConstants;
import dtu.captone.alumni.domain.Member;
import dtu.captone.alumni.domain.Network;
import dtu.captone.alumni.security.UserInfoHandler;
import dtu.captone.alumni.service.FacultyService;
import dtu.captone.alumni.service.KnameService;
import dtu.captone.alumni.service.MajorService;
import dtu.captone.alumni.service.MemberService;
import dtu.captone.alumni.service.NetworkService;
import dtu.captone.alumni.service.TrainningSystemService;
import dtu.captone.alumni.utils.FileUtil;

@Controller
@RequestMapping("/profile")
public class PublicProfileController extends UserInfoHandler{
	
	@Autowired
	private NetworkService networkService;

	@Autowired
	private FacultyService facultyService;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private TrainningSystemService trainningSystemService;
	
	@Autowired
	private MajorService majorService;
	
	@Autowired
	private KnameService knameService;
	
	@Autowired
	MessageSource messageSource;
	
	@Autowired
	UserService userService;

	@ModelAttribute
	public void network_new(Model model,HttpSession session) {
		if(isUserLogin(session)!=null) {
			List<Network> newRequestFriendList = networkService.getNewRequestFriendList(isUserLogin(session).getId());
			model.addAttribute("newRequestFriendList", newRequestFriendList);
		}
		
	}
	
	@GetMapping("/index")
	public String index(HttpSession session,Model model) {
		if (isUserLogin(session) == null) {
			return "redirect:/login";
		}
		Member member = memberService.findById(isUserLogin(session).getId());
		model.addAttribute("member", member);
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
	
	@PostMapping("/edit")
	public String edit(@ModelAttribute("member") Member member,
			@RequestParam("majorId") int majorId,@RequestParam("facultyId") int facultyId,
			@RequestParam("trainning_system_id") int trainning_system_id,
			@RequestParam("knId") int knId,@RequestParam("anhdaidien") MultipartFile anhdaidien,HttpServletRequest request,
			HttpSession session,RedirectAttributes rd) throws IllegalStateException, IOException {
	
		member.setPassword(userService.findById(isUserLogin(session).getId()).getPassword());
		member.setId(isUserLogin(session).getId());
		member.setToken(isUserLogin(session).getToken());
		member.setMajor(majorService.findById(majorId));
		member.setFaculty(facultyService.findById(facultyId));
		member.setTrainning_system(trainningSystemService.findById(trainning_system_id));
		member.setKn(knameService.findById(knId));
		member.setMemberType(isUserLogin(session).getMemberType());
		
		
		System.out.println(member);
		
		
		String avatar = FileUtil.upload(anhdaidien, request);
		member.setAvatar(avatar);
		
		Member memberEdit = memberService.update(member);
		if(memberEdit!=null) {
			 rd.addFlashAttribute(CommonConstants.MSG,
						messageSource.getMessage("edit_success", null, Locale.getDefault()));
				return "redirect:/profile/index";
		 } else {
			 rd.addFlashAttribute(CommonConstants.MSG, messageSource.getMessage("edit_error", null, Locale.getDefault()));
			 return "redirect:/profile/index";
		 }
		
	}
	
	
	
	
}
