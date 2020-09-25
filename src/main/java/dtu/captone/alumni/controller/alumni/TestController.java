package dtu.captone.alumni.controller.alumni;

import java.util.List;

import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import dtu.captone.alumni.domain.Job;
import dtu.captone.alumni.domain.Edu_level;
import dtu.captone.alumni.domain.Event;
import dtu.captone.alumni.domain.Major;
import dtu.captone.alumni.domain.Member;
import dtu.captone.alumni.domain.News;
import dtu.captone.alumni.domain.Trainning_system;
import dtu.captone.alumni.service.EduLevelService;
import dtu.captone.alumni.service.EventService;
import dtu.captone.alumni.service.JobService;
import dtu.captone.alumni.service.MajorServiceImpl;
import dtu.captone.alumni.service.MemberService;
import dtu.captone.alumni.service.NewsService;
import dtu.captone.alumni.service.TrainningSystemService;

@RestController
public class TestController {

	@Autowired
	private MajorServiceImpl majorServiceImpl;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private NewsService newsService;
	
	@Autowired
	private EduLevelService eduLevelService;
	
	@Autowired
	private EventService eventService;
	
	
	@Autowired
	private TrainningSystemService trainningSystemService;
	
	@Autowired
	private JobService jobService;
	
	@GetMapping("/test")
	public String test() {
		Major major= new Major(3, "gfdg", "gdgd");
		Major major2 = majorServiceImpl.save(major);
		return "demo";
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
	public @ResponseBody Page<News> findNewALl(){
		return newsService.findAll(PageRequest.of(0, 5,Sort.by("id").descending()));
	}
	
	@GetMapping("news/findEnable")
	public @ResponseBody Page<News> findNewALlnble(){
		return newsService.getNewsListEnable(PageRequest.of(0, 5,Sort.by("id").descending()));
	}
	
	@GetMapping("level/findAll")
	public @ResponseBody List<Edu_level> findLevel(){
		return eduLevelService.findAll();
	}
	
	@PostMapping("level/add")
	public @ResponseBody Edu_level addEdu(@ModelAttribute("edu_level") Edu_level edu_level) {
		return eduLevelService.save(edu_level);
	}
	
	@GetMapping("training/findAll")
	public @ResponseBody List<Trainning_system> findtraining(){
		return trainningSystemService.findAll();
	}
	
	@PostMapping("trainning/add")
	public @ResponseBody Trainning_system addEdu(@ModelAttribute("trainning_system") Trainning_system trainning_system) {
		System.out.println(trainning_system.getTraining_system_name());
		return trainningSystemService.save(trainning_system);
	}
	
	@PostMapping("event/add")
	public @ResponseBody Event addEvent(@ModelAttribute("event") Event event) {
		return eventService.save(event);
	}
	
	@GetMapping("event/findAll")
	public @ResponseBody Page<Event> findAllEvent(){
		return eventService.findAll(PageRequest.of(0, 5, Sort.by("id")));
	}
	
	@PostMapping("job/add")
	public @ResponseBody Job addjob(@ModelAttribute("job") Job Job) {
		return jobService.save(Job);
	}
	
	@GetMapping("job/findAll")
	public Page<Job> findAllJob(){
		return jobService.findAll(PageRequest.of(0, 5, Sort.by("id")));
	}
	
	@GetMapping("job/findActive")
	public Page<Job> findAllJobActive(){
		return jobService.getJobListEnable(PageRequest.of(0, 5, Sort.by("id")));
	}
	
	@GetMapping("job/findByUser")
	public List<Job> findAllJobByUser(@RequestParam("author_id") int author_id){
		return jobService.findByAuthorId(author_id);
	}
	
	@GetMapping("job/del/{id}")
	public String delJob(@PathVariable int id){
		jobService.deleteById(id);
		return "aa";
	}
	
	@GetMapping("job/active/{id}")
	public int dactiveJob(@PathVariable int id,@RequestParam("author_id") int author_id){
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
	public @ResponseBody Page<Member> findAllEnabble(){
		return memberService.getListEnable(PageRequest.of(0, 5, Sort.by("id")));
	}
	
	@GetMapping("member/findAlumni")
	public @ResponseBody Page<Member> findAlumni(){
		return memberService.getListByTypeEnable(1,PageRequest.of(0, 5, Sort.by("id")));
	}
	
	
}
