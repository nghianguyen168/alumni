package dtu.captone.alumni.controller.alumni;

import java.io.IOException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dtu.captone.alumni.constant.CommonConstants;
import dtu.captone.alumni.domain.Job;
import dtu.captone.alumni.domain.JobApply;
import dtu.captone.alumni.domain.Major;
import dtu.captone.alumni.domain.Member;
import dtu.captone.alumni.security.UserInfoHandler;
import dtu.captone.alumni.service.JobApplyService;
import dtu.captone.alumni.service.JobService;
import dtu.captone.alumni.service.MajorService;
import dtu.captone.alumni.utils.FileUtil;

@Controller
@RequestMapping("/job")
public class PublicJobController extends UserInfoHandler {

	@Autowired
	private JobService jobService;

	@Autowired
	private MajorService majorService;
	
	@Autowired
	private JobApplyService jobApplyService;

	@Autowired
	MessageSource messageSource;
	
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
	public String add(@ModelAttribute("job") Job job, @RequestParam("major_id") int major_id, HttpSession session,RedirectAttributes rd) {
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
		rd.addFlashAttribute(CommonConstants.MSG,
				messageSource.getMessage("add-job-success", null, Locale.getDefault()));
		return "redirect:/job/user-post";

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
	public String detailJob(@PathVariable int id,Model model,HttpSession session) {
		if (isUserLogin(session) == null) {
			return "redirect:/login";
		}
		jobService.updateViews(id);
		Job job = jobService.findById(id);
		model.addAttribute("job", job);
		return "public.job.detail";
	}
	
	@PostMapping("/apply/{id}")
	public String apply(@PathVariable int id,@RequestParam("cvfile") MultipartFile cvUpload,HttpSession session,HttpServletRequest request) throws IllegalStateException, IOException {
		Member member = isUserLogin(session);
		Job job = jobService.findById(id);
		String cv = FileUtil.upload(cvUpload, request);
		JobApply jobApply = new JobApply(null, cv, Timestamp.valueOf(LocalDateTime.now()), job, member,0);
		
		System.out.println(jobApply);
		JobApply jobApplyAdd = jobApplyService.save(jobApply);
		return "redirect:/job/index";
	}
	
	@GetMapping("/user-post")
	public String userPost(HttpSession session,Model model) {
		if (isUserLogin(session) == null) {
			return "redirect:/login";
		}
		Member member = isUserLogin(session);
		List<Job> jobListByAuthor = jobService.findByAuthorId(member.getId());
		model.addAttribute("jobList", jobListByAuthor);
		return "public.job.userpost";
	}
	
	@GetMapping("/edit/{id}")
	public String edit(@PathVariable int id,Model model,HttpSession session) {
		if (isUserLogin(session) == null) {
			return "redirect:/login";
		}
		Job job = jobService.findById(id);
		model.addAttribute("job", job);
		return "public.job.edit";
	}
	
	@PostMapping("/edit/{id}")
	public String editPost(HttpSession session,@PathVariable int id,@ModelAttribute("job") Job job,@RequestParam("major_id") int major_id,RedirectAttributes rd) {
		
		Member member = (Member) session.getAttribute("userInfo");
		Major major = majorService.findById(major_id);
		job.setId(id);
		job.setMember(member);
		job.setEnable(1);
		job.setMajor(major);
		System.out.println(job);
		job.setPostedOn(Timestamp.valueOf(LocalDateTime.now()));

		Job jobadd = jobService.save(job);
		if(jobadd!=null) {
			rd.addFlashAttribute(CommonConstants.MSG,
					messageSource.getMessage("edit_success", null, Locale.getDefault()));
			return "redirect:/job/user-post";
		} else {
			rd.addFlashAttribute(CommonConstants.MSG,
					messageSource.getMessage("edit_error", null, Locale.getDefault()));
			return "redirect:/job/edit";
		}
	}
	
	@GetMapping("/user-post/del/{id}")
	public String del(@PathVariable int id,RedirectAttributes rd,HttpSession session) {
		if (isUserLogin(session) == null) {
			return "redirect:/login";
		}
		jobApplyService.deleteByJob_id(id);
		jobService.deleteById(id);
		rd.addFlashAttribute(CommonConstants.MSG,
				messageSource.getMessage("del_success", null, Locale.getDefault()));
		return "redirect:/job/user-post";
	}
	
	@GetMapping({"/apply/{id}","/apply/{id}/{page}"})
	public String apply(Model model,@PathVariable int id,@PathVariable(required = false,name = "page") Integer page,HttpSession session) {
		if (isUserLogin(session) == null) {
			return "redirect:/login";
		}
		if(page==null) {
			page=1;
		}
		int offset = (page - 1)*CommonConstants.LIMIT_PAGE_JOB_APPLY;
		List<JobApply> applyList = jobApplyService.findByJob(id, offset, CommonConstants.LIMIT_PAGE_JOB_APPLY);
		String jobName = jobService.findById(id).getPosition() + " - "+jobService.findById(id).getCompanyName();
		
		int totalRow = jobApplyService.sumJobApply(id);
		int totalPage = (int)Math.ceil((float)totalRow / CommonConstants.LIMIT_PAGE_JOB_APPLY);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("sumApply", totalRow);
		model.addAttribute("page", page);
		model.addAttribute("jobName", jobName);
		model.addAttribute("idJob", id);
		model.addAttribute("applyList", applyList);
		return "public.job.apply";
	}
	
	@PostMapping("/apply/checked")
	public @ResponseBody String check_apply(@RequestParam("idJob") int id) {
		System.out.println("id job:"+id);
		int updateCheckStatus = jobApplyService.updateCheckStatus(id);
		if(updateCheckStatus>0) {
			return "Cập nhật thành công!";
		} else {
			return null;
		}
		
	}
	
	@GetMapping("/apply-me")
	public String applyOfMe(Model model,HttpSession session) {
		if (isUserLogin(session) == null) {
			return "redirect:/login";
		}
		Member member = isUserLogin(session);
		List<JobApply> jobApply = jobApplyService.findJobApply(member.getId());
		model.addAttribute("jobApply", jobApply);
		return "public.job.ungtuyen";
		
	}


	
}
