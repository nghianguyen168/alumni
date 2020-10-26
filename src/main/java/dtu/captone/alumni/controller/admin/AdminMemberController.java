package dtu.captone.alumni.controller.admin;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dtu.captone.alumni.constant.CommonConstants;
import dtu.captone.alumni.domain.Faculty;
import dtu.captone.alumni.domain.Kname;
import dtu.captone.alumni.domain.Member;
import dtu.captone.alumni.domain.MemberType;
import dtu.captone.alumni.service.FacultyService;
import dtu.captone.alumni.service.KnameService;
import dtu.captone.alumni.service.MemberService;
import dtu.captone.alumni.service.MemberTypeService;

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
	BCryptPasswordEncoder bCryptPasswordEncoder;

	@GetMapping({ "/index", "/index/{id}" })
	public String indexGet(Model model) {
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
		model.addAttribute("memberTypeList", memberTypeList);
		model.addAttribute("facultyList", facultyList);
		model.addAttribute("knamesList", knamesList);
		return "admin.member.add";
	}

	@PostMapping("/add")
	public String addMemberList(@RequestParam(required = false,name = "facultyId") int facultyId, @RequestParam(required = false,name = "kId") int kId,
			@RequestParam("memberType") int memberTypeId,
			@RequestParam("memberList") MultipartFile files,RedirectAttributes rd) throws IOException {
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

				member.setFirstName(row.getCell(1).getStringCellValue());
				member.setLastName(row.getCell(2).getStringCellValue());
				member.setDateOfBirth(new java.sql.Date(row.getCell(3).getDateCellValue().getTime()));
				member.setDtuMail(row.getCell(4).getStringCellValue());
			
				member.setEmail(row.getCell(5).getStringCellValue());
				member.setCountry(row.getCell(6).getStringCellValue());
				member.setHometown(row.getCell(7).getStringCellValue());
				member.setAddressNow(row.getCell(8).getStringCellValue());
				member.setGender(row.getCell(9).getStringCellValue());
				member.setPhone(formater.formatCellValue(row.getCell(10))); 
				member.setFaculty(facultyService.findById(facultyId));
				member.setKn(knameService.findById(kId));
				
				member.setTrainning_system(null);
				member.setMajor(null);
				SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
				String password = (formatter.format(new java.sql.Date((row.getCell(3).getDateCellValue().getTime()))).toString()).replace("/", "");
				member.setPassword(bCryptPasswordEncoder.encode(password));
				System.out.println(password);
				
				member.setEnable(1);
				
				member.setMemberType(memberTypeService.findById(memberTypeId));
				memberList.add(member);
			}
			memberService.saveAll(memberList);
		}
		
		rd.addFlashAttribute(CommonConstants.MSG,
				messageSource.getMessage("add_member_success", null, Locale.getDefault()));
		return "redirect:/admin/member/index/1";

	}

}
