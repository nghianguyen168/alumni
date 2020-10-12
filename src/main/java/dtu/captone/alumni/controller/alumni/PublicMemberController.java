package dtu.captone.alumni.controller.alumni;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import dtu.captone.alumni.domain.Member;
import dtu.captone.alumni.domain.Network;
import dtu.captone.alumni.security.UserInfoHandler;
import dtu.captone.alumni.service.MemberService;
import dtu.captone.alumni.service.NetworkService;

@Controller
@RequestMapping("/member")
public class PublicMemberController extends UserInfoHandler {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private NetworkService networkService;
	
	@GetMapping("/index")
	public String index(Model model,HttpSession session) {
		if (isUserLogin(session) == null) {
			return "redirect:/login";
		}
		
		List<Member> memberList = memberService.findAllEnable(isUserLogin(session).getId());
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
	
	
}
