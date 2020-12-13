package dtu.captone.alumni.controller.alumni;

import javax.servlet.http.HttpSession;
import javax.validation.constraints.Null;

import dtu.captone.alumni.auth.service.RoleService;
import dtu.captone.alumni.domain.*;
import dtu.captone.alumni.service.*;
import dtu.captone.alumni.utils.SendGmailUtil;
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

	@Autowired
	private RoleService roleService;


	@Autowired
	private TrainningSystemService trainningSystemService;

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
		List<Role> memberTypeList = roleService.findAll();

		System.out.println("typesize_"+memberTypeList.size());
		model.addAttribute("facultyList",facultyList);
		model.addAttribute("knameList",knameList);
		model.addAttribute("majorList",majorList);
		model.addAttribute("memberTypeList",memberTypeList);
		return "public.register";
	}
	@PostMapping("/user/register")
	public String registerPost(Model model,@ModelAttribute("member") Member member, @RequestParam("facultyId") int facultyId,
							   @RequestParam("majorId") int majorId,
							   @RequestParam("knameId") int knameId,
							   @RequestParam("typeId") int typeId) {
		member.setMajor(majorService.findById(majorId));
		member.setFaculty(facultyService.findById(facultyId));
		member.setKn(knameService.findById(knameId));
		member.setTrainning_system(trainningSystemService.findById(1));
		member.setId(null);
		member.setEnable(2);
		member.setRole(roleService.findById(typeId));

		if("".equals(member.getDtuMail())){
			member.setDtuMail(member.getEmail());
		}
		//2 - waiting aprove
		Member isExist = memberService.findByStudentId(member.getStudentId());

		if (isExist != null) {
			model.addAttribute("memberExist", member);
			return "public.register";
		} else {

			Member memberSave = memberService.save(member);
			System.out.println("save:" + memberSave);
			if (memberSave != null) {

				return "redirect:/user/register/success";
			} else {
				return "public.register";

			}
		}
	}

	@GetMapping("/user/register/success")
	public String successRegister(){
		return "public.register.success";}
}
