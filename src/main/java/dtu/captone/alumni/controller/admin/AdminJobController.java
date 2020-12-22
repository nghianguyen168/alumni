package dtu.captone.alumni.controller.admin;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dtu.captone.alumni.domain.JobApply;
import dtu.captone.alumni.domain.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dtu.captone.alumni.DTOs.JobChart;
import dtu.captone.alumni.constant.CommonConstants;
import dtu.captone.alumni.domain.Job;
import dtu.captone.alumni.export.JobPostExport;
import dtu.captone.alumni.service.JobApplyService;
import dtu.captone.alumni.service.JobService;
import javassist.expr.NewArray;


@Controller
@RequestMapping("/admin/job")
public class AdminJobController {
	
	@Autowired
	private JobService jobService;
	
	@Autowired
	MessageSource messageSource;
	
	@Autowired
	private JobApplyService jobApplyService;
	
	@ModelAttribute
	public void add_Atribute(Model model) {
		model.addAttribute("jobApplyService", jobApplyService);
		
	}
	
	@GetMapping("/index")
	public String index(Model model,HttpSession session) {
		if(session.getAttribute("userInfo")==null ) {
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
	
	@PostMapping("/export")
	public void expoxtRepostJob(HttpServletResponse response,@RequestParam("thang") int thang) throws IOException {
        response.setContentType("application/octet-stream");
        DateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd_HH:mm:ss");
        String currentDateTime = dateFormatter.format(new Date());
         
        String headerKey = "Content-Disposition";
        String headerValue = "attachment; filename=job_" + currentDateTime + ".xlsx";
        response.setHeader(headerKey, headerValue);
       
        List<Job> jobListPost = jobService.getListByMonth(thang);
        List<JobApply> jobApplyList = jobApplyService.findJobApplyByMonth(thang);
         
        JobPostExport excelExporter = new JobPostExport(jobListPost,jobApplyList);
         
        excelExporter.export(response);    
    }  
	
	@GetMapping("/chart")
	public String viewChart(Model model) {
		   List<Job> jobListPost = jobService.findAll(Sort.by("id").descending());
		 Map<Object,Object> map = null;
		 List<List<Map<Object,Object>>> list = new ArrayList<List<Map<Object,Object>>>();
		 List<Map<Object,Object>> dataPoints1 = new ArrayList<Map<Object,Object>>();
		 for(Job job:jobListPost) {
			 map = new HashMap<Object,Object>(); map.put("label", "18 yrs and Under"); map.put("y", 7);dataPoints1.add(map);
		 }
			
			map = new HashMap<Object,Object>(); map.put("x", 1485887400000L); map.put("y", 6);dataPoints1.add(map);
			map = new HashMap<Object,Object>(); map.put("x", 1488306600000L); map.put("y", 6);dataPoints1.add(map);
			map = new HashMap<Object,Object>(); map.put("x", 1490985000000L); map.put("y", 9);dataPoints1.add(map);
			map = new HashMap<Object,Object>(); map.put("x", 1493577000000L); map.put("y", 11);dataPoints1.add(map);
			map = new HashMap<Object,Object>(); map.put("x", 1496255400000L); map.put("y", 14);dataPoints1.add(map);
			map = new HashMap<Object,Object>(); map.put("x", 1498847400000L); map.put("y", 17);dataPoints1.add(map);
			map = new HashMap<Object,Object>(); map.put("x", 1501525800000L); map.put("y", 18);dataPoints1.add(map);
			map = new HashMap<Object,Object>(); map.put("x", 1504204200000L); map.put("y", 17);dataPoints1.add(map);
			map = new HashMap<Object,Object>(); map.put("x", 1506796200000L); map.put("y", 15);dataPoints1.add(map);
			map = new HashMap<Object,Object>(); map.put("x", 1509474600000L); map.put("y", 12);dataPoints1.add(map);
			map = new HashMap<Object,Object>(); map.put("x", 1512066600000L); map.put("y", 9);dataPoints1.add(map);
	 
			list.add(dataPoints1);
			model.addAttribute("dataPointsList", list);
	 
			List<JobChart> listhihi = jobService.getJobForChart();
			System.out.println(listhihi.size());
		return "admin.job.chart";
	}
	
}
