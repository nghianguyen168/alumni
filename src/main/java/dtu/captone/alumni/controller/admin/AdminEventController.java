package dtu.captone.alumni.controller.admin;

import java.util.Date;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.MessageSource;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dtu.captone.alumni.base.AbstractController;
import dtu.captone.alumni.constant.CommonConstants;

import dtu.captone.alumni.domain.Event;
import dtu.captone.alumni.domain.Member;
import dtu.captone.alumni.security.UserInfoHandler;
import dtu.captone.alumni.service.EventService;
import dtu.captone.alumni.utils.FileUtil;
import dtu.captone.alumni.utils.PaginationUtils;

@Controller
@RequestMapping("/admin/event")
public class AdminEventController extends AbstractController {

	@Autowired
	MessageSource messageSource;

	@Autowired
	private EventService eventService;
	
	@Autowired
	@Qualifier("userInfoHandler")
	private UserInfoHandler userInfoHandler;
	
	@ModelAttribute
	public void userinfo(HttpSession session,Model model) {
		Member member = (Member)session.getAttribute("userInfo");
		model.addAttribute("userLogin", member);
	}
	

	@GetMapping({ "/index", "/index/{page}" })
	public String index(ModelMap model, @PathVariable(required = false, name = "page") Integer page,HttpSession session,@RequestHeader(value = "Authorization", required = false, defaultValue = "") String authorization) {
		if(session.getAttribute("userInfo")==null ) {
			return "redirect:/auth/login";
		}else {
			if (page == null) {
				page = 1;
			}
			
			
			System.out.println("user:"+session.getAttribute("userInfo"));
			
			
			int offset = PaginationUtils.getOffset(page);
			List<Event> eventList = eventService.findAll(Sort.by("id").descending());
			model.addAttribute("eventList", eventList);
			return "admin.event.index";
		}
		
	}

	@GetMapping("/add")
	public String addGet(HttpSession session) {
		if(session.getAttribute("userInfo")==null ) {
			return "redirect:/auth/login";
		}else {
			return "admin.event.add";
		}
	}

	@PostMapping("add")
	public String addevent(@RequestParam("hinhanh") MultipartFile hinhanh,@ModelAttribute("event") Event event, RedirectAttributes rd,HttpServletRequest request) throws ParseException, IllegalStateException, IOException {
		String picture = FileUtil.upload(hinhanh, request);
		SimpleDateFormat format = new SimpleDateFormat("yyyy-dd-MM HH:mm:ss");
		event.setImage(picture);
		Event eventSave = eventService.save(event);
		if (eventSave != null) {
			rd.addFlashAttribute(CommonConstants.MSG,
					messageSource.getMessage("add_success", null, Locale.getDefault()));
			return "redirect:/admin/event/index";
		} else {
			rd.addFlashAttribute(CommonConstants.MSG, messageSource.getMessage("add_error", null, Locale.getDefault()));
			return "admin.event.add";
		}

	}

	@GetMapping({ "/edit", "/edit/{id}" })
	public String editGet(@PathVariable int id, Model model,HttpSession session) {
		if(session.getAttribute("userInfo")==null ) {
			return "redirect:/auth/login";
		}else {
			Event event = eventService.findById(id);
			String time_start = event.getTimeStart().replaceAll("\\s+", "T");
			String time_end = event.getTimeEnd().replaceAll("\\s+", "T");
			event.setTimeStart(time_start);
			event.setTimeEnd(time_end);
			model.addAttribute("event", event);
			return "admin.event.edit";
		}
	}

	@PostMapping("/edit/{id}")
	public String editEvent(@RequestParam("hinhanh") MultipartFile hinhanh,@PathVariable int id, @ModelAttribute("new") Event event, RedirectAttributes rd,HttpServletRequest request) throws IllegalStateException, IOException {
		String picture="";
		System.out.println("hinh anh:"+hinhanh.getOriginalFilename());
		String image_old = eventService.findById(id).getImage();
		int enable = eventService.findById(id).getEnable();
		if("".equals(hinhanh.getOriginalFilename())) {
			picture=image_old;
		} else {
			FileUtil.delete(image_old, request);
			picture =FileUtil.upload(hinhanh, request);
		}
		event.setId(id);
		event.setEnable(enable);
		event.setImage(picture);
		Event updateEvent = eventService.save(event);
		if (updateEvent != null) {
			rd.addFlashAttribute(CommonConstants.MSG,
					messageSource.getMessage("edit_success", null, Locale.getDefault()));
			return "redirect:/admin/event/index";
		} else {
			rd.addFlashAttribute(CommonConstants.MSG,
					messageSource.getMessage("edit_error", null, Locale.getDefault()));
			return "redirect:/admin/event/edit/" + id;
		}

	}

	@GetMapping("/del/{id}")
	public String delEvent(@PathVariable int id, RedirectAttributes rd,HttpSession session) {
		if(session.getAttribute("userInfo")==null ) {
			return "redirect:/auth/login";
		}else {
			eventService.deleteById(id);
			rd.addFlashAttribute(CommonConstants.MSG, messageSource.getMessage("del_success", null, Locale.getDefault()));
			return "redirect:/admin/event/index";
		}
	}

	@PostMapping("/active") 
	public @ResponseBody String active(@RequestParam("img") String img,@RequestParam("idevent") int id) {
	 
	  int active_event=0;
	  if(img.equals("/resources/uploads/off.png")) { 
		  active_event = eventService.active(1, id); 
		  return img; 
		  } else {
			  active_event =
		  
					  eventService.active(0, id);
			  return img; 
	  }
	}

}
