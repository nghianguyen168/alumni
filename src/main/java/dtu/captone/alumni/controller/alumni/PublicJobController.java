package dtu.captone.alumni.controller.alumni;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import dtu.captone.alumni.constant.CommonConstants;
import dtu.captone.alumni.domain.Job;
import dtu.captone.alumni.domain.Major;
import dtu.captone.alumni.domain.Member;
import dtu.captone.alumni.security.UserInfoHandler;
import dtu.captone.alumni.service.JobService;
import dtu.captone.alumni.service.MajorService;

@Controller
@RequestMapping("/job")
public class PublicJobController extends UserInfoHandler {

	@Autowired
	private JobService jobService;

	@Autowired
	private MajorService majorService;
	
	@ModelAttribute
	public void majorList(Model model) {
		List<Major> majorList = majorService.findAll();
		model.addAttribute("majorList", majorList);
	}

	@GetMapping({"/index","/index/{page}"})
	public String index(Model model,@PathVariable(required = false,name = "page") Integer page, HttpSession session) {
		if(page==null) {
			page=1;
		}
		if (isUserLogin(session) == null) {
			return "redirect:/login";
		}
		System.out.println("job active:"+jobService.sumJobEnable());
		List<Job> jobList = jobService.getJobListEnable();
		int total = jobList.size();
		List<Major> majorList = majorService.findAll();
		model.addAttribute("total", total);
		model.addAttribute("majorList", majorList);
		model.addAttribute("jobList", jobList);
		return "public.job.index";
	}

	@PostMapping("add")
	public String add(@ModelAttribute("job") Job job, @RequestParam("major_id") int major_id, HttpSession session) {
		if (session.getAttribute("userInfo") != null) {

			System.out.println(major_id);
			Major major = majorService.findById(major_id);
			job.setMajor(major);
			Member member = (Member) session.getAttribute("userInfo");
			job.setMember(member);
			job.setEnable(1);
			job.setPostedOn(Timestamp.valueOf(LocalDateTime.now()));

			Job jobadd = jobService.save(job);
		}
		System.out.println(job);
		return "redirect:/job/index";

	}
	
	@GetMapping({"/major","/major/{id}"})
	public String getJobLitByMajor(HttpSession session,Model model,@PathVariable int id) {
		if (isUserLogin(session) == null) {
			return "redirect:/login";
		}
		List<Job> jobListByMajor = jobService.getJobListByMajor(id);
		List<Job> jobList = jobService.getJobListEnable();
		int total = jobList.size();
		model.addAttribute("jobList", jobListByMajor);
		model.addAttribute("total", total);
		return "public.job.index";
		
	}
	
	@GetMapping({"/detail","/detail/{id}"})
	public String detailJob(@PathVariable int id,Model model) {
		Job job = jobService.findById(id);
		model.addAttribute("job", job);
		return "public.job.detail";
	}
}
