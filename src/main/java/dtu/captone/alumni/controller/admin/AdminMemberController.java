package dtu.captone.alumni.controller.admin;

import java.util.List;

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
import dtu.captone.alumni.service.MemberService;

@Controller
@RequestMapping("/admin/member")
public class AdminMemberController {
	
	@Autowired
	private MemberService memberService;
	
	@GetMapping({"/index","/index/{id}"})
	public String indexGet(Model model,@PathVariable int id) {
		List<Member> memberList = memberService.findByMemberType(id);
		model.addAttribute("memberList", memberList);
		model.addAttribute("type", id);
		System.out.println(memberList);
		return "admin.member.index";
	}
	
	@PostMapping("/active") 
	public @ResponseBody String active(@RequestParam("img") String img,@RequestParam("idmember") int id) {
	 System.out.println(img+":"+id);
	  int active=0;
	  if(img.equals("/resources/uploads/off.png")) { 
		  active = memberService.active(1, id); 
		  return img; 
		  } else {
			  active=memberService.active(0, id);
			  return img; 
	  }
	}
	
	@GetMapping("/profile/{id}")
	public String profile(@PathVariable int id,Model model) {
		Member member = memberService.findById(id);
		model.addAttribute("member", member);
		return "admin.member.profile";
	}
	
}
