package dtu.captone.alumni.controller.alumni;

import javax.servlet.http.HttpSession;
import javax.validation.constraints.Null;

import dtu.captone.alumni.auth.service.RoleService;
import dtu.captone.alumni.constant.CommonConstants;
import dtu.captone.alumni.domain.*;
import dtu.captone.alumni.service.*;
import dtu.captone.alumni.utils.RandomString;
import dtu.captone.alumni.utils.SendGmailUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;
import java.util.Locale;


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
	MessageSource messageSource;



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
		return "public.register.success";
	}
	@GetMapping("/user/forgot-password")
	public String forgotPassword(){
		return "public.forgotPassword";
	}

	@PostMapping("/user/forgot-passord")
	public String forgotPassword(@RequestParam("email") String email, RedirectAttributes rd){
		Member memberByEmail = memberService.findByDtuMail(email);
		if(memberByEmail!=null) {
			RandomString rand = new RandomString();
			int numberOfCharactor = 8;
			String passwordNew = rand.randomAlphaNumeric(numberOfCharactor);
			memberByEmail.setPassword(new BCryptPasswordEncoder().encode(passwordNew));
			Member memberUpdate = memberService.save(memberByEmail);
			if (memberUpdate != null) {
				String message = "Yêu cầu đặt lại mật khẩu thành công:" +
						"\nUsername:" + memberByEmail.getDtuMail() +
						"\nPassword:" + passwordNew;

				/*SendGmailUtil.sendGmail(memberByEmail.getEmail(),"Approve_Account",message);*/
				SendGmailUtil.sendGmail(memberByEmail.getDtuMail(), "Reset_Password", message);
				rd.addFlashAttribute(CommonConstants.MSG,
						messageSource.getMessage("reset-password-success", null, Locale.getDefault()));
				return "redirect:/user/forgot-password";
			}
		} else {
			rd.addFlashAttribute(CommonConstants.MSG,
					messageSource.getMessage("reset-password-notexist", null, Locale.getDefault()));
			return "redirect:/user/forgot-password";
		}
		return  "public.forgotPassword";

	}

}
