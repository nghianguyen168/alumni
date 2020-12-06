package dtu.captone.alumni.controller.alumni;

import javax.servlet.http.HttpSession;

import dtu.captone.alumni.domain.Faculty;
import dtu.captone.alumni.domain.Kname;
import dtu.captone.alumni.domain.Major;
import dtu.captone.alumni.domain.Member;
import dtu.captone.alumni.service.FacultyService;
import dtu.captone.alumni.service.KnameService;
import dtu.captone.alumni.service.MajorService;
import dtu.captone.alumni.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;


@Controller
public class PublicLoginLogoutController {

	@Autowired
	private FacultyService facultyService;

	@Autowired
	private MajorService majorService;

	@Autowired
	private KnameService knameService;

	@Autowired
	private MemberService memberService;

	@GetMapping("/user/login")
	public String login() {
		return "public.login";
	}
	
	@GetMapping("/user/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("userInfo");
		return "redirect:/user/login";
	}

	@GetMapping("/user/register")
	public String register(Model model) {
		List<Faculty> facultyList = facultyService.findAll();
		List<Kname> knameList = knameService.findAll();
		List<Major> majorList = majorService.findAll();

		model.addAttribute("facultyList",facultyList);
		model.addAttribute("knameList",knameList);
		model.addAttribute("majorList",majorList);
		return "public.register";
	}
	@PostMapping("/user/register")
	public String registerPost(@ModelAttribute("member") Member member, @RequestParam("facultyId") int facultyId,
							   @RequestParam("majorId") int majorId,
							   @RequestParam("knameId") int knameId){
		member.setMajor(majorService.findById(majorId));
		member.setFaculty(facultyService.findById(facultyId));
		member.setKn(knameService.findById(knameId));

		Member memberSave = memberService.save(member);
		System.out.println("save:"+memberSave);
		return "public.register";

	}
}
