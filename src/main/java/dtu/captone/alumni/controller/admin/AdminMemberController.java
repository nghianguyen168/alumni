package dtu.captone.alumni.controller.admin;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.Random;

import dtu.captone.alumni.auth.service.RoleService;
import dtu.captone.alumni.domain.*;
import dtu.captone.alumni.service.*;
import dtu.captone.alumni.utils.FileUtil;
import dtu.captone.alumni.utils.RandomString;
import dtu.captone.alumni.utils.SendGmailUtil;
import org.apache.commons.lang.time.DateUtils;
import org.apache.poi.ss.usermodel.DataFormatter;
import org.apache.poi.ss.usermodel.DateUtil;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.http.HttpStatus;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dtu.captone.alumni.constant.CommonConstants;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin/member")
public class AdminMemberController {

	@Autowired
	private MemberService memberService;

	@Autowired
	private FacultyService facultyService;

	@Autowired
	private KnameService knameService;

	@Autowired
	private TrainningSystemService trainningSystemService;
	
	@Autowired
	MessageSource messageSource;

	@Autowired
	private RoleService roleService;

	@Autowired
	private MajorService majorService;

	@Autowired
	private JobApplyService jobApplyService;


	
	
	@Autowired
	BCryptPasswordEncoder bCryptPasswordEncoder;

	@GetMapping({ "/index", "/index/{id}" })
	public String indexGet(Model model,HttpSession session) {
		if(session.getAttribute("userInfo")==null ) {
			return "redirect:/auth/login";
		} else {
			model.addAttribute("roleService", roleService);
			model.addAttribute("knameService",knameService);
			List<Member> memberList = memberService.findAll();
			model.addAttribute("memberList", memberList);
			System.out.println(memberList);
			return "admin.member.index";
		}
	}

	@PostMapping("/active")
	public @ResponseBody String active(@RequestParam("img") String img, @RequestParam("idmember") int id) {
		System.out.println(img + ":" + id);
		int active = 0;
		if (img.equals("/resources/uploads/off.png")) {
			active = memberService.active(1, id);
			return img;
		} else {
			active = memberService.active(0, id);
			return img;
		}
	}

	@GetMapping("/profile/{id}")
	public String profile(@PathVariable int id, Model model,HttpSession session) {
		if(session.getAttribute("userInfo")==null ) {
			return "redirect:/auth/login";
		}else {
			Member member = memberService.findById(id);
			model.addAttribute("member", member);
			model.addAttribute("majorList", majorService.findAll());
			model.addAttribute("facultyList", facultyService.findAll());
			model.addAttribute("trainningList", trainningSystemService.findAll());
			model.addAttribute("knameList", knameService.findAll());
			return "admin.member.profile";
		}
	}

	@PostMapping("/profile/{id}")
	public String edit(@PathVariable int id,@ModelAttribute("member") Member member, @RequestParam(name="matkhau",required = false) String matkhau,
					   @RequestParam(name = "majorId",required = false,defaultValue = "0") int majorId, @RequestParam("facultyId") int facultyId,
					   @RequestParam(name="trainning_system_id",required = false,defaultValue = "0") int trainning_system_id,
					   @RequestParam(name = "knId",required = false,defaultValue = "0") int knId,HttpServletRequest request,
					   HttpSession session, RedirectAttributes rd) throws IllegalStateException, IOException {

		System.out.println(member);
		member.setId(id);
		member.setToken(memberService.findById(id).getToken());
		member.setMajor(majorService.findById(majorId));
		member.setFaculty(facultyService.findById(facultyId));
		member.setTrainning_system(trainningSystemService.findById(trainning_system_id));
		member.setKn(knameService.findById(knId));
		member.setRole(memberService.findById(id).getRole());

		String imageOld = memberService.findById(id).getAvatar();

		System.out.println(member);
		if(!"".equals(matkhau)){
			member.setPassword(bCryptPasswordEncoder.encode(matkhau));
		} else {
			member.setPassword(memberService.findById(id).getPassword());
		}
		member.setEnable(1);
		member.setAvatar(imageOld);
		Member memberEdit = memberService.update(member);

		if(memberEdit!=null) {
			rd.addFlashAttribute(CommonConstants.MSG,
					messageSource.getMessage("edit_success", null, Locale.getDefault()));
			return "redirect:/admin/member/index";
		} else {
			rd.addFlashAttribute(CommonConstants.MSG, messageSource.getMessage("edit_error", null, Locale.getDefault()));
			return "redirect:/profile/"+id;
		}

	}

	@GetMapping("add")
	public String memberadd(Model model, HttpSession session) {
		if(session.getAttribute("userInfo")==null ) {
			return "redirect:/auth/login";
		} else {
			List<Faculty> facultyList = facultyService.findAll();
			List<Kname> knamesList = knameService.findAll();
			List<Major> majorList = majorService.findAll();
			List<Role> rolesList = roleService.findAll();
			model.addAttribute("rolesList", rolesList);
			model.addAttribute("facultyList", facultyList);
			model.addAttribute("knamesList", knamesList);
			model.addAttribute("majorList", majorList);
			return "admin.member.add";
		}
	}

	@PostMapping("/add")
	public String addMemberList(Model model,@RequestParam(required = false,name = "facultyId") int facultyId,
								@RequestParam("majorId") int majorId,@RequestParam(required = false,name = "kId") int kId,
			@RequestParam("roleId") int roleId,
			@RequestParam("memberList") MultipartFile files,RedirectAttributes rd) throws IOException {
		List<Long> studentIdDuplicate = new ArrayList<>();
		HttpStatus status = HttpStatus.OK;
		List<Member> memberList = new ArrayList<>();

		XSSFWorkbook workbook = new XSSFWorkbook(files.getInputStream());
		XSSFSheet worksheet = workbook.getSheetAt(0);
		DataFormatter formater = new DataFormatter();
		for (int index = 0; index < worksheet.getPhysicalNumberOfRows(); index++) {
			if (index > 0) {
				Member member = new Member();

				XSSFRow row = worksheet.getRow(index);
				Integer id = 0;
				try{

				if(memberService.findByStudentId((long) row.getCell(4).getNumericCellValue())!=null){
					studentIdDuplicate.add((long) row.getCell(4).getNumericCellValue());
					continue;
					}
				member.setFirstName(row.getCell(1).getStringCellValue());
				member.setLastName(row.getCell(2).getStringCellValue());
				member.setDateOfBirth(new java.sql.Date(row.getCell(3).getDateCellValue().getTime()));
				member.setStudentId(((long) row.getCell(4).getNumericCellValue()));
				member.setDtuMail(row.getCell(5).getStringCellValue());
			
				member.setEmail(row.getCell(6).getStringCellValue());
				member.setCountry(row.getCell(7).getStringCellValue());
				member.setHometown(row.getCell(8).getStringCellValue());
				member.setAddressNow(row.getCell(9).getStringCellValue());
				member.setGender(row.getCell(10).getStringCellValue());
				member.setPhone(formater.formatCellValue(row.getCell(11)));


				member.setFaculty(facultyService.findById(facultyId));
				member.setKn(knameService.findById(kId));
				member.setMajor(majorService.findById(majorId));

				Role role  = roleService.findById(roleId);
				member.setRole(role);
				member.setTrainning_system(null);
				member.setMajor(null);
				SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
				String password = (formatter.format(new java.sql.Date((row.getCell(3).getDateCellValue().getTime()))).toString()).replace("/", "");
				member.setPassword(bCryptPasswordEncoder.encode(password));
				System.out.println(password);
				} catch (Exception e){
					e.printStackTrace();
					return "redirect:/admin/member/add?err=true";
				}
				member.setEnable(1);
				

				memberList.add(member);
			}

		memberService.saveAll(memberList);

		}
		
		rd.addFlashAttribute(CommonConstants.MSG,
				messageSource.getMessage("add_member_success", null, Locale.getDefault()));

		System.out.println(studentIdDuplicate);
		System.out.println(studentIdDuplicate.size());
		model.addAttribute("studentIdDuplicate",studentIdDuplicate);
		model.addAttribute("sizeDup",studentIdDuplicate.size());
		model.addAttribute("sumRecord",worksheet.getPhysicalNumberOfRows() - 1);
		List<Member> memberList1 = memberService.findAll();
		model.addAttribute("memberList", memberList1);
		System.out.println(memberList);
		model.addAttribute("msg1","success");
		return "admin.member.index";

	}

	@PostMapping("/valid")
	public @ResponseBody String validMember(@RequestParam("idMember") int idMember){

		int validMember = memberService.active(1,idMember);
		if(validMember > 0){
			Member member = memberService.findById(idMember);
			int numberOfCharactor = 8;
			RandomString rand = new RandomString();

			String passwordNew =rand.randomAlphaNumeric(numberOfCharactor);
			member.setPassword(new BCryptPasswordEncoder().encode(passwordNew));
			Member memberUpdate = memberService.save(member);
			String message ="Cảm ơn bạn đã quan tâm đến Cộng đồng sinh viên khoa đào tạo quốc tế"+
					"\nThông tin đăng ký tài khoản  của bản đã được duyệt thành công!"+
					"\nUsername:" +member.getDtuMail()+
					"\nPassword:"+passwordNew;

			SendGmailUtil.sendGmail(member.getEmail(),"Approve_Account",message);
			System.out.println(passwordNew);
			return "ok";
		}
		return null;
	}

	@GetMapping("/type-add")
	public String typeAdd(HttpSession session) {
		if (session.getAttribute("userInfo") == null) {
			return "redirect:/auth/login";
		} else {
			return "admin.member.typeadd";
		}
	}
	
	@GetMapping("/add-one")
	public String addOne(Model model,HttpSession session){
		if(session.getAttribute("userInfo")==null ) {
			return "redirect:/auth/login";
		}else {
			List<Faculty> facultyList = facultyService.findAll();
			List<Kname> knameList = knameService.findAll();
			List<Major> majorList = majorService.findAll();

			List<Role> rolesList = roleService.findAll();

			model.addAttribute("facultyList", facultyList);
			model.addAttribute("knameList", knameList);
			model.addAttribute("majorList", majorList);
			model.addAttribute("rolesList", rolesList);
			return "admin.member.addone";
		}
	}

	@PostMapping("/add-one")
	public String addOnePost(@ModelAttribute("member") Member member,@RequestParam("facultyId") int facultyId,
							 @RequestParam(name = "majorId",required = false) Integer majorId,
							 @RequestParam(name = "knameId",required = false) Integer knameId,
							 @RequestParam("roleId") int roleId,RedirectAttributes rd){
		Faculty faculty = facultyService.findById(facultyId);
		member.setFaculty(faculty);
		if(majorId!=null){
			Major major = majorService.findById(majorId);
			member.setMajor(major);
		}
		if(knameId!=null){
			Kname kname = knameService.findById(knameId);
			member.setKn(kname);
		}

		member.setRole(roleService.findById(roleId));

		RandomString rand = new RandomString();
		int numberOfCharactor = 8;
		String passwordNew =rand.randomAlphaNumeric(numberOfCharactor);
		member.setPassword(new BCryptPasswordEncoder().encode(passwordNew));
		Member memberAddOne = memberService.save(member);
		if(memberAddOne!=null){
			String message ="Cảm ơn bạn đã quan tâm đến Cộng đồng sinh viên khoa đào tạo quốc tế"+
					"\nThông tin đăng ký tài khoản  của bản đã được duyệt thành công!"+
					"\nUsername:" +member.getDtuMail()+
					"\nPassword:"+passwordNew;

			SendGmailUtil.sendGmail(member.getEmail(),"Approve_Account",message);
			SendGmailUtil.sendGmail(member.getDtuMail(),"Approve_Account",message);
			rd.addFlashAttribute(CommonConstants.MSG,
					messageSource.getMessage("add-member-success", null, Locale.getDefault()));
			return "redirect:/admin/member/index";
		} else {
			return "admin.member.addone";
		}

	}

	@GetMapping("/del/{id}")
	public String delMember(@PathVariable int id,RedirectAttributes rd,HttpSession session) {
		if(session.getAttribute("userInfo")==null ) {
			return "redirect:/auth/login";
		}else {
			jobApplyService.deleteByMemberId(id);
			memberService.delete(id);
			rd.addFlashAttribute(CommonConstants.MSG,
					messageSource.getMessage("del-member-success", null, Locale.getDefault()));
			return "redirect:/admin/member/index";
		}
	}

	@PostMapping("search")
	public String memberSearchAdmin(@RequestParam("role_id") int roleId,Model model){
		List<Member> memberByRole = memberService.findByRoleAll(roleId);
		System.out.println(memberByRole);
		model.addAttribute("roleService",roleService);
		model.addAttribute("memberList", memberByRole);
		model.addAttribute("typeId",roleId);
		model.addAttribute("roleService", roleService);
		model.addAttribute("knameService",knameService);

		model.addAttribute("memberList", memberByRole);

		return "admin.member.index";

	}
}
