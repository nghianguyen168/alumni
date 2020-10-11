package dtu.captone.alumni.controller.alumni;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import dtu.captone.alumni.domain.Member;
import dtu.captone.alumni.service.MemberService;

@Controller
@RequestMapping("/member")
public class PublicMemberController {
	
	@Autowired
	private MemberService memberService;
	
	@GetMapping("/index")
	public String index(Model model) {
		List<Member> memberList = memberService.findAllEnable();
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
