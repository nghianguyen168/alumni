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
	private MemberTypeService memberTypeService;
	
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
	public String indexGet(Model model) {
		model.addAttribute("memberTypeService",memberTypeService);
		List<Member> memberList = memberService.findAll();
		model.addAttribute("memberList", memberList);
		System.out.println(memberList);
		return "admin.member.index";
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
	public String profile(@PathVariable int id, Model model) {
		Member member = memberService.findById(id);
		model.addAttribute("member", member);
		return "admin.member.profile";
	}

	@GetMapping("add")
	public String memberadd(Model model) {
		List<Faculty> facultyList = facultyService.findAll();
		List<Kname> knamesList = knameService.findAll();
		List<MemberType> memberTypeList = memberTypeService.findAll();
		List<Major> majorList = majorService.findAll();
		model.addAttribute("memberTypeList", memberTypeList);
		model.addAttribute("facultyList", facultyList);
		model.addAttribute("knamesList", knamesList);
		model.addAttribute("majorList",majorList);
		return "admin.member.add";
	}

	@PostMapping("/add")
	public String addMemberList(Model model,@RequestParam(required = false,name = "facultyId") int facultyId,
								@RequestParam("majorId") int majorId,@RequestParam(required = false,name = "kId") int kId,
			@RequestParam("memberType") int memberTypeId,
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

				Role role  = roleService.findById(memberTypeId);
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
				
				member.setMemberType(memberTypeService.findById(memberTypeId));
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
			member.setPassword(new BCryptPasswordEncoder().encode(passwordNew)+"!");
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
	public String typeAdd(){
		return "admin.member.typeadd";
	}
	
	@GetMapping("/add-one")
	public String addOne(Model model){
		List<Faculty> facultyList = facultyService.findAll();
		List<Kname> knameList = knameService.findAll();
		List<Major> majorList = majorService.findAll();
		List<MemberType> memberTypeList = memberTypeService.findAll();

		System.out.println("typesize_"+memberTypeList.size());
		model.addAttribute("facultyList",facultyList);
		model.addAttribute("knameList",knameList);
		model.addAttribute("majorList",majorList);
		model.addAttribute("memberTypeList",memberTypeList);
		return "admin.member.addone";
	}

	@PostMapping("/add-one")
	public String addOnePost(@ModelAttribute("member") Member member,@RequestParam("facultyId") int facultyId,
							 @RequestParam(name = "majorId",required = false) Integer majorId,
							 @RequestParam(name = "knameId",required = false) Integer knameId,
							 @RequestParam("typeId") int typeId,RedirectAttributes rd){
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
		MemberType memberType= memberTypeService.findById(typeId);
		member.setMemberType(memberType);
		member.setRole(roleService.findById(typeId));

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
			/*SendGmailUtil.sendGmail(member.getDtuMail(),"Approve_Account",message);*/
			rd.addFlashAttribute(CommonConstants.MSG,
					messageSource.getMessage("add-member-success", null, Locale.getDefault()));
			return "redirect:/admin/member/index";
		} else {
			return "admin.member.addone";
		}

	}

	@GetMapping("/del/{id}")
	public String delMember(@PathVariable int id,RedirectAttributes rd){
		jobApplyService.deleteByMemberId(id);
		memberService.delete(id);
		rd.addFlashAttribute(CommonConstants.MSG,
				messageSource.getMessage("del-member-success", null, Locale.getDefault()));
		return "redirect:/admin/member/index";
	}

	@PostMapping("search")
	public String memberSearchAdmin(@RequestParam("type_id") int typeId,Model model){
		List<Member> memberByType = memberService.findByType(typeId);
		model.addAttribute("memberTypeService",memberTypeService);

		model.addAttribute("memberList", memberByType);
		model.addAttribute("typeId",typeId);
		return "admin.member.index";

	}
}
