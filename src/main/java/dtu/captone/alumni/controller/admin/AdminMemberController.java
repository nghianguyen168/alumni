package dtu.captone.alumni.controller.admin;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.apache.poi.ss.usermodel.DataFormatter;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import dtu.captone.alumni.domain.Faculty;
import dtu.captone.alumni.domain.Kname;
import dtu.captone.alumni.domain.Member;
import dtu.captone.alumni.domain.MemberType;
import dtu.captone.alumni.service.FacultyService;
import dtu.captone.alumni.service.KnameService;
import dtu.captone.alumni.service.MemberService;

@Controller
@RequestMapping("/admin/member")
public class AdminMemberController {

	@Autowired
	private MemberService memberService;

	@Autowired
	private FacultyService facultyService;

	@Autowired
	KnameService knameService;

	@GetMapping({ "/index", "/index/{id}" })
	public String indexGet(Model model, @PathVariable int id) {
		List<Member> memberList = memberService.findByMemberType(id);
		model.addAttribute("memberList", memberList);
		model.addAttribute("type", id);
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

		model.addAttribute("facultyList", facultyList);
		model.addAttribute("knamesList", knamesList);
		return "admin.member.add";
	}

	@PostMapping("/add")
	public String addMemberList(@RequestParam("facultyId") int facultyId, @RequestParam("kId") int kId,
			@RequestParam("memberList") MultipartFile files) throws IOException {
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
				member.setDateOfBirth(row.getCell(3).getDateCellValue());
				member.setDtuMail(row.getCell(4).getStringCellValue());
				member.setEmail(row.getCell(5).getStringCellValue());
				member.setHometown(row.getCell(6).getStringCellValue());
				member.setAddressNow(row.getCell(7).getStringCellValue());
				member.setGender(row.getCell(8).getStringCellValue());
				/* member.setPhone(formater.formatCellValue(row.getCell(9))); */
				member.setFaculty(facultyService.findById(id));
				member.setKn(knameService.findById(id));
				member.setPassword("hihi");
				member.setEnable(1);

				memberList.add(member);
			}
			memberService.saveAll(memberList);
		}

		return "redirect: /admin/member/index";

	}

}
