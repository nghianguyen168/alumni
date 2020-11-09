package dtu.captone.alumni.controller.alumni;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.apache.poi.ss.usermodel.DataFormatter;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import dtu.captone.alumni.domain.Event;
import dtu.captone.alumni.domain.Faculty;
import dtu.captone.alumni.domain.Job;
import dtu.captone.alumni.domain.Major;
import dtu.captone.alumni.domain.Member;
import dtu.captone.alumni.domain.News;
import dtu.captone.alumni.domain.Trainning_system;
import dtu.captone.alumni.service.EventService;
import dtu.captone.alumni.service.FacultyService;
import dtu.captone.alumni.service.JobService;
import dtu.captone.alumni.service.KnameService;
import dtu.captone.alumni.service.MajorServiceImpl;
import dtu.captone.alumni.service.MemberService;
import dtu.captone.alumni.service.NewsService;
import dtu.captone.alumni.service.TrainningSystemService;

@RestController
public class TestController {
	
	@Autowired
	private FacultyService facultyService;

	@Autowired
	KnameService knameService;

	@Autowired
	private MajorServiceImpl majorServiceImpl;

	@Autowired
	private MemberService memberService;

	@Autowired
	private NewsService newsService;


	@Autowired
	private EventService eventService;

	@Autowired
	private TrainningSystemService trainningSystemService;

	@Autowired
	private JobService jobService;

	@GetMapping("/test")
	public String test() {
		Major major = new Major(3, "gfdg", "gdgd",new Faculty(1, ""));
		Major major2 = majorServiceImpl.save(major);
		return "demo";
	}

	@GetMapping("demo")
	public String test1() {
		return "admin.news.indexTest";
	}

	@GetMapping("/major")
	public @ResponseBody List<Major> tetsmajor() {
		return majorServiceImpl.findAll();
	}

	@GetMapping("delmajor")
	public @ResponseBody Major delMajor() {
		majorServiceImpl.delelte(1);
		return null;
	}

	/*
	 * @GetMapping("/member/add") public String addMember() {
	 * 
	 * Member member = new Member(6, "Nguyễn", "cường", null, "QB", "Male", "1",
	 * "DN", "a@gmail.com", "0968997331", "f.jpg", "hihi", new Major(3,"aad",
	 * "fdf"), 2017, 2021, new Trainning_system(1, "CN", "Cử nhân") , new
	 * Edu_level(1, "DH", "Đại Học"),null);
	 * 
	 * memberService.save(member); return "demo"; }
	 */

	@GetMapping("/member/get")
	public @ResponseBody List<Member> getMember() {
		System.out.println(memberService.findAll().size());
		return memberService.findAll();
	}

	@PostMapping("news/add")
	public @ResponseBody News newsAdd(@ModelAttribute("news") News news) {
		return newsService.save(news);
	}

	@GetMapping("news/find/{id}")
	public @ResponseBody News findnewsId(@PathVariable int id) {
		return newsService.findById(id);
	}

	@GetMapping("news/del/{id}")
	public @ResponseBody String delnewsId(@PathVariable int id) {
		newsService.deleteById(id);
		return "";
	}

	@GetMapping("news/acctive/{id}")
	public @ResponseBody int accnewsId(@PathVariable int id) {
		int enable = 1;
		return newsService.active(enable, id);
	}

	@GetMapping("news/findAll")
	public @ResponseBody Page<News> findNewALl() {
		return newsService.findAll(PageRequest.of(0, 5, Sort.by("id").descending()));
	}

	@GetMapping("news/findEnable")
	public @ResponseBody Page<News> findNewALlnble() {
		return newsService.getNewsListEnable(PageRequest.of(0, 5, Sort.by("id").descending()));
	}



	@GetMapping("training/findAll")
	public @ResponseBody List<Trainning_system> findtraining() {
		return trainningSystemService.findAll();
	}

	@PostMapping("trainning/add")
	public @ResponseBody Trainning_system addEdu(
			@ModelAttribute("trainning_system") Trainning_system trainning_system) {
		System.out.println(trainning_system.getTraining_system_name());
		return trainningSystemService.save(trainning_system);
	}

	@PostMapping("event/add")
	public @ResponseBody Event addEvent(@ModelAttribute("event") Event event) {
		return eventService.save(event);
	}

	@GetMapping("event/findAll")
	public @ResponseBody Page<Event> findAllEvent() {
		return eventService.findAll(PageRequest.of(0, 5, Sort.by("id")));
	}

	@PostMapping("job/addd")
	public @ResponseBody Job addjob(@ModelAttribute("job") Job Job) {
		return jobService.save(Job);
	}

	@GetMapping("job/findAll")
	public Page<Job> findAllJob() {
		return jobService.findAll(PageRequest.of(0, 5, Sort.by("id")));
	}

	@GetMapping("job/findActive")
	public Page<Job> findAllJobActive() {
		return jobService.getJobListEnable(PageRequest.of(0, 5, Sort.by("id")));
	}

	@GetMapping("job/findByUser")
	public List<Job> findAllJobByUser(@RequestParam("author_id") int author_id) {
		return jobService.findByAuthorId(author_id);
	}

	@GetMapping("job/del/{id}")
	public String delJob(@PathVariable int id) {
		jobService.deleteById(id);
		return "aa";
	}

	@GetMapping("job/active/{id}")
	public int dactiveJob(@PathVariable int id, @RequestParam("author_id") int author_id) {
		return jobService.active(1, id, author_id);
	}

	@GetMapping("job/findId/{id}")
	public @ResponseBody Job findById(@PathVariable int id) {
		return jobService.findById(id);
	}

	@PostMapping("member/add")
	public @ResponseBody Member addMember(@ModelAttribute("member") Member member) {
		return memberService.save(member);
	}

	@GetMapping("member/findById/{id}")
	public @ResponseBody Member findMemberByID(@PathVariable int id) {
		return memberService.findById(id);
	}

	@GetMapping("member/findEnablePage")
	public @ResponseBody Page<Member> findAllEnabble() {
		return memberService.getListEnable(PageRequest.of(0, 5, Sort.by("id")));
	}

	@GetMapping("member/findAlumni")
	public @ResponseBody Page<Member> findAlumni() {
		return memberService.getListByTypeEnable(1, PageRequest.of(0, 5, Sort.by("id")));
	}

	@RequestMapping(value = "/import-excel", method = RequestMethod.POST)
	public String importExcelFile(@RequestParam("file") MultipartFile files) throws IOException {
		HttpStatus status = HttpStatus.OK;
		List<Major> productList = new ArrayList<>();

		XSSFWorkbook workbook = new XSSFWorkbook(files.getInputStream());
		XSSFSheet worksheet = workbook.getSheetAt(0);

		for (int index = 0; index < worksheet.getPhysicalNumberOfRows(); index++) {
			if (index > 0) {
				Major major = new Major();

				XSSFRow row = worksheet.getRow(index);
				Integer id = (int) row.getCell(0).getNumericCellValue();
				
				major.setId(id);
				major.setMajorCode(row.getCell(1).getStringCellValue());
				major.setMajorName(row.getCell(2).getStringCellValue());
				

				productList.add(major);
			}
		}
		 majorServiceImpl.saveAll(productList); 

		return "ok";
	}
	
	@RequestMapping(value = "/add-member",method = RequestMethod.POST)
	public ResponseEntity<List<Member>> memberAadd(@RequestParam("file") MultipartFile files,@RequestParam("facultyId") int facultyId, @RequestParam("kId") int kId) throws IOException{
		HttpStatus status = HttpStatus.OK;
		List<Member> memberList = new ArrayList<>();

		XSSFWorkbook workbook = new XSSFWorkbook(files.getInputStream());
		XSSFSheet worksheet = workbook.getSheetAt(0);
		DataFormatter formater = new DataFormatter();
		for (int index = 0; index < worksheet.getPhysicalNumberOfRows(); index++) {
			if (index > 0) {
				Member member = new Member();

				XSSFRow row = worksheet.getRow(index);
				Integer id = null;

				member.setFirstName(row.getCell(1).getStringCellValue());
				member.setLastName(row.getCell(2).getStringCellValue());
				/* member.setDateOfBirth(row.getCell(3).getDateCellValue()); */
				member.setDtuMail(row.getCell(4).getStringCellValue());
				member.setEmail(row.getCell(5).getStringCellValue());
				member.setHometown(row.getCell(6).getStringCellValue());
				member.setAddressNow(row.getCell(7).getStringCellValue());
				member.setGender(row.getCell(8).getStringCellValue());
				
				/*
				 * if (row.getCell(9).getCellType() == Cell.CELL_TYPE_STRING)
				 * member.setPhone(row.getCell(9).getStringCellValue()); else
				 * member.setPhone(String.valueOf(row.getCell(9).getNumericCellValue()));
				 */
				
				/*
				 * member.setPhone(NumberToTextConverter.toText(row.getCell(9).
				 * getNumericCellValue()));
				 */
				
				member.setFaculty(facultyService.findById(id));
				member.setKn(knameService.findById(id));
				member.setPassword(Date.valueOf(row.getCell(3).getStringCellValue()).toString().replace("/", ""));
				member.setEnable(1);

				memberList.add(member);
			}
			memberService.saveAll(memberList);
		}
		return new ResponseEntity<List<Member>>(memberList, status);

		
	}

}
