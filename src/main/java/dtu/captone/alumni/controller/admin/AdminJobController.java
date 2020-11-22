package dtu.captone.alumni.controller.admin;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dtu.captone.alumni.constant.CommonConstants;
import dtu.captone.alumni.domain.Job;
import dtu.captone.alumni.export.JobPostExport;
import dtu.captone.alumni.service.JobService;
import javassist.expr.NewArray;


@Controller
@RequestMapping("/admin/job")
public class AdminJobController {
	
	@Autowired
	private JobService jobService;
	
	@Autowired
	MessageSource messageSource;
	
	@GetMapping("/index")
	public String index(Model model,HttpSession session) {
		if(session.getAttribute("userInfo")==null) {
			return "redirect:/auth/login";
		} else {
		
		List<Job> listJob = jobService.findAll(Sort.by("id").descending());
		model.addAttribute("listJob", listJob);
		return "admin.job.index";
		
		}
	}
	
	@PostMapping("/active") 
	public @ResponseBody String active(@RequestParam("img") String img,@RequestParam("idjob") int id) {
	  int active_event=0;
	  System.out.println(img);
	  if(img.equals("/resources/uploads/off.png")) { 
		  active_event = jobService.active(1, id);
		  return img; 
		  } else {
			  active_event = jobService.active(0, id);
			  return img; 
	  }
	}
	
	@GetMapping("/del/{id}")
	public String del(@PathVariable int id,RedirectAttributes rd) {
		jobService.deleteById(id);
		rd.addFlashAttribute(CommonConstants.MSG, messageSource.getMessage("del_success", null, Locale.getDefault()));
		return "redirect:/admin/job/index";
	}
	
	@GetMapping("/export")
	public void expoxtRepostJob(HttpServletResponse response) throws IOException {
        response.setContentType("application/octet-stream");
        DateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd_HH:mm:ss");
        String currentDateTime = dateFormatter.format(new Date());
         
        String headerKey = "Content-Disposition";
        String headerValue = "attachment; filename=job_" + currentDateTime + ".xlsx";
        response.setHeader(headerKey, headerValue);
       
        List<Job> jobListPost = jobService.findAll(Sort.by("id").descending());
         
        JobPostExport excelExporter = new JobPostExport(jobListPost);
         
        excelExporter.export(response);    
    }  
	
}
