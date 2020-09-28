package dtu.captone.alumni.controller.admin;

import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dtu.captone.alumni.constant.CommonConstants;
import dtu.captone.alumni.domain.Event;
import dtu.captone.alumni.service.EventService;
import dtu.captone.alumni.utils.PaginationUtils;

@Controller
@RequestMapping("/admin/event")
public class AdminEventController {

	@Autowired
	MessageSource messageSource;

	@Autowired
	private EventService eventService;

	@GetMapping({ "/index", "/index/{page}" })
	public String index(ModelMap model, @PathVariable(required = false, name = "page") Integer page) {
		if (page == null) {
			page = 1;
		}
		int offset = PaginationUtils.getOffset(page);
		List<Event> eventList = eventService.findAll(Sort.by("id").descending());
		System.out.println(eventList.get(0).getTime_end());
		model.addAttribute("eventList", eventList);
		return "admin.event.index";
	}

	@GetMapping("/add")
	public String addGet() {
		return "admin.event.add";
	}

	@PostMapping("add")
	public String addevent(@ModelAttribute("event") Event event, RedirectAttributes rd) {
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
	public String editGet(@PathVariable int id, Model model) {
		Event event = eventService.findById(id);
		String time_start = event.getTime_start().replaceAll("\\s+", "T");
		String time_end = event.getTime_end().replaceAll("\\s+", "T");
		event.setTime_start(time_start);
		event.setTime_end(time_end);
		model.addAttribute("event", event);
		return "admin.event.edit";
	}

	@PostMapping("/edit/{id}")
	public String editEvent(@PathVariable int id, @ModelAttribute("new") Event event, RedirectAttributes rd) {

		int enable = eventService.findById(id).getEnable();

		event.setId(id);
		event.setEnable(enable);

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
	public String delEvent(@PathVariable int id, RedirectAttributes rd) {
		eventService.deleteById(id);
		rd.addFlashAttribute(CommonConstants.MSG, messageSource.getMessage("del_success", null, Locale.getDefault()));
		return "redirect:/admin/event/index";
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

	/*
	 * @GetMapping("/add") public String add() { return "admin.event.add"; }
	 * 
	 * @PostMapping("add") public String addevent(@ModelAttribute("event") Event
	 * event,@RequestParam("hinhanh") MultipartFile hinhanh,RedirectAttributes
	 * rd,HttpServletRequest request) throws IllegalStateException, IOException {
	 * String picture = FileUtil.upload(hinhanh, request);
	 * event.setPicture(picture); System.out.println(event.getevent_name()); event
	 * eventadd = eventService.save(event); if(eventadd!=null) {
	 * rd.addFlashAttribute(CommonConstants.MSG,
	 * messageSource.getMessage("add_success", null, Locale.getDefault())); return
	 * "redirect:/admin/event/index"; } else {
	 * rd.addFlashAttribute(CommonConstants.MSG,
	 * messageSource.getMessage("add_error", null, Locale.getDefault())); return
	 * "admin.sanpham.add"; }
	 * 
	 * 
	 * }
	 * 
	 * @GetMapping({"/edit","/edit/{id}"}) public String editGet(@PathVariable int
	 * id,Model model) { Event event = eventService.findById(id);
	 * model.addAttribute("event", event); return "admin.event.edit"; }
	 * 
	 * @PostMapping("/edit/{id}") public String editPost(@PathVariable int
	 * id,@ModelAttribute("new") event event,@RequestParam("hinhanh") MultipartFile
	 * hinhanh,HttpServletRequest request,RedirectAttributes rd) throws
	 * IllegalStateException, IOException { String picture="";
	 * System.out.println("hinh anh:"+hinhanh.getOriginalFilename()); String
	 * image_old = eventService.findById(id).getPicture(); int enable =
	 * eventService.findById(id).getEnable(); System.out.println(event.getDetail());
	 * if("".equals(hinhanh.getOriginalFilename())) { picture=image_old; } else {
	 * FileUtil.delete(image_old, request); picture =FileUtil.upload(hinhanh,
	 * request); } event.setId(id); event.setEnable(enable);
	 * event.setPicture(picture); event updateevent = eventService.save(event);
	 * if(updateevent!=null) { rd.addFlashAttribute(CommonConstants.MSG,
	 * messageSource.getMessage("edit_success", null, Locale.getDefault())); return
	 * "redirect:/admin/event/index"; } else {
	 * rd.addFlashAttribute(CommonConstants.MSG,
	 * messageSource.getMessage("edit_error", null, Locale.getDefault())); return
	 * "redirect:/admin/event/index/"+id; }
	 * 
	 * }
	 * 
	 * 
	 * @GetMapping("/del/{id}") public String delevent(@PathVariable int
	 * id,RedirectAttributes rd) { eventService.deleteById(id);
	 * rd.addFlashAttribute(CommonConstants.MSG,
	 * messageSource.getMessage("del_success", null, Locale.getDefault())); return
	 * "redirect:/admin/event/index";
	 * 
	 * }
	 * 
	 * @PostMapping("/active") public @ResponseBody String
	 * active(@RequestParam("img") String img,@RequestParam("idevent") int id) {
	 * System.out.println(img); System.out.println("uid"+id); int active_event=0;
	 * if(img.equals("/resources/uploads/off.png")) { active_event =
	 * eventService.active(1, id); return img; } else { active_event =
	 * eventService.active(0, id); return img; }
	 * 
	 * 
	 * 
	 * }
	 */

}
