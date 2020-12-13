package dtu.captone.alumni.controller.alumni;

import java.util.List;

import javax.servlet.http.HttpSession;

import dtu.captone.alumni.auth.service.RoleService;
import dtu.captone.alumni.domain.Major;
import dtu.captone.alumni.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import dtu.captone.alumni.domain.Member;
import dtu.captone.alumni.domain.Network;
import dtu.captone.alumni.security.UserInfoHandler;

@Controller
@RequestMapping("/member")
public class PublicMemberController extends UserInfoHandler {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private NetworkService networkService;

	@Autowired
	public KnameService knameService;

	@Autowired
	private MajorService majorService;


	@Autowired
	private RoleService roleService;


	

	/*  @ModelAttribute public void memberL(Model model) {
		 model.addAttribute("memberList", memberList);

	  }
	 */
	
	@GetMapping("/index")
	public String index(Model model,HttpSession session) {
		if (isUserLogin(session) == null) {
			return "redirect:/user/login";
		}

		List<Member>  memberList = memberService.findAllEnable(isUserLogin(session).getId());
		System.out.println(memberList.size());
		model.addAttribute("memberList", memberList); 
		return "public.member.index";
	}
	
	@GetMapping("/detail/{id}")
	public String detail(@PathVariable int id,Model model) {
		Member member = memberService.findById(id);
		model.addAttribute("member", member);
		return "public.profile.index";
	}
	
	@GetMapping("/find-by-location")
	public String findbyLocation() {
		return "public.member.findByLocation";
	}
	
	
	@ModelAttribute
	public void network_new(Model model,HttpSession session) {
		if(isUserLogin(session)!=null) {
			List<Network> newRequestFriendList = networkService.getNewRequestFriendList(isUserLogin(session).getId());
			model.addAttribute("newRequestFriendList", newRequestFriendList);
			model.addAttribute("knameService", knameService);
			model.addAttribute("majorService",majorService);
			model.addAttribute("roleService",roleService);
		}
		
	}
	
	@PostMapping("/search")
	public String searchMember(@RequestParam(name = "khoa",required = false) Integer kid,
			@RequestParam(name="major_id",required = false) Integer major_id,
			@RequestParam(name = "role_id",required = false) Integer role_id,
			@RequestParam(name = "nameSearch",required = false) String nameSearch,Model model) {
		if(kid!=null){
			List<Member> memberList = memberService.findByKname(kid);
			model.addAttribute("memberList", memberService.findByKname(kid));
			model.addAttribute("searchSize",memberList.size());
			return "public.member.index";
		}
		if(major_id!=null){
			List<Member> memberList = memberService.findByMajor(major_id);
			model.addAttribute("memberList",memberList);
			model.addAttribute("searchSize",memberList.size());
			return "public.member.index";
		}
		if(role_id!=null){
			List<Member> memberList = memberService.findByRole(role_id);
			model.addAttribute("memberList",memberList);
			model.addAttribute("searchSize",memberList.size());
			return "public.member.index";
		}
		if(nameSearch!=null){

			List<Member> memberList = memberService.findByNameSearch("%"+nameSearch+"%",nameSearch);
			model.addAttribute("memberList",memberList);
			model.addAttribute("nameSearch",nameSearch);
			model.addAttribute("searchSize",memberList.size());
			return "public.member.index";
		}
		else {
			return  "";
		}

	}
	
}
