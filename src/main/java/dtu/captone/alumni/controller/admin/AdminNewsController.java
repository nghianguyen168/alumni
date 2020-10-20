package dtu.captone.alumni.controller.admin;

import java.io.IOException;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.MessageSource;
import org.springframework.data.domain.Sort;
import org.springframework.security.access.prepost.PreAuthorize;
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
import dtu.captone.alumni.auth.service.UserService;
import dtu.captone.alumni.constant.CommonConstants;
import dtu.captone.alumni.domain.Member;
import dtu.captone.alumni.domain.News;
import dtu.captone.alumni.security.UserInfoHandler;
import dtu.captone.alumni.service.NewsService;
import dtu.captone.alumni.utils.FileUtil;
import dtu.captone.alumni.utils.PaginationUtils;

@Controller
@RequestMapping("/admin/news")
public class AdminNewsController extends AbstractController{
	
	@Autowired
	MessageSource messageSource;
	
	@Autowired
	private NewsService newsService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	@Qualifier("userInfoHandler")
	private UserInfoHandler userInfoHandler;
	
	@GetMapping({"/index","/index/{page}"})
	public String index(ModelMap model,@PathVariable(required = false, name = "page") Integer page,@RequestHeader(value = "Authorization", required = false, defaultValue = "") String authorization,HttpServletRequest request) {
		if (page == null) {
			page = 1;
		}
		
		Member member = currentUser(authorization);
		System.out.println(member);
		
		int offset = PaginationUtils.getOffset(page);
		List<News> newsList = newsService.findAll(Sort.by("id").descending());
		model.addAttribute("newsList", newsList);
		return "admin.news.index";
	}
	
	@GetMapping("/add")
	public String add() {
		return "admin.news.add";
	}
	
	@PostMapping("add")
	public String addNews(@ModelAttribute("news") News news,@RequestParam("hinhanh") MultipartFile hinhanh,RedirectAttributes rd,HttpServletRequest request) throws IllegalStateException, IOException {
		String picture = FileUtil.upload(hinhanh, request);
		news.setPicture(picture);
		 System.out.println(news.getNewsName());
		 News newsadd = newsService.save(news);
		 if(newsadd!=null) {
			 rd.addFlashAttribute(CommonConstants.MSG,
						messageSource.getMessage("add_success", null, Locale.getDefault()));
				return "redirect:/admin/news/index";
		 } else {
			 rd.addFlashAttribute(CommonConstants.MSG, messageSource.getMessage("add_error", null, Locale.getDefault()));
				return "admin.sanpham.add";
		 }
		
		
	}
	
	@GetMapping({"/edit","/edit/{id}"})
	public String editGet(@PathVariable int id,Model model) {
		News news = newsService.findById(id);
		model.addAttribute("news", news);
		return "admin.news.edit";
	}
	
	@PostMapping("/edit/{id}")
	public String editPost(@PathVariable int id,@ModelAttribute("new") News news,@RequestParam("hinhanh") MultipartFile hinhanh,HttpServletRequest request,RedirectAttributes rd) throws IllegalStateException, IOException {
		String picture="";
		System.out.println("hinh anh:"+hinhanh.getOriginalFilename());
		String image_old = newsService.findById(id).getPicture();
		int enable = newsService.findById(id).getEnable();
		System.out.println(news.getDetail());
		if("".equals(hinhanh.getOriginalFilename())) {
			picture=image_old;
		} else {
			FileUtil.delete(image_old, request);
			picture =FileUtil.upload(hinhanh, request);
		}
		news.setId(id);
		news.setEnable(enable);
		news.setPicture(picture);
		News updateNews = newsService.save(news);
		if(updateNews!=null) {
			rd.addFlashAttribute(CommonConstants.MSG,
					messageSource.getMessage("edit_success", null, Locale.getDefault()));
			return "redirect:/admin/news/index";
		} else {
			 rd.addFlashAttribute(CommonConstants.MSG, messageSource.getMessage("edit_error", null, Locale.getDefault()));
			 return "redirect:/admin/news/index/"+id;
		 }
		
	}
	
	
	@GetMapping("/del/{id}")
	public String delNews(@PathVariable int id,RedirectAttributes rd) {
		newsService.deleteById(id);
		rd.addFlashAttribute(CommonConstants.MSG,
				messageSource.getMessage("del_success", null, Locale.getDefault()));
		return "redirect:/admin/news/index";
		
	}
	
	@PostMapping("/active")
	public @ResponseBody String active(@RequestParam("img") String img,@RequestParam("idnews") int id) {
		System.out.println(img);
		System.out.println("uid"+id);
		int active_news=0;
		if(img.equals("/resources/uploads/off.png")) {
			active_news = newsService.active(1, id);
			return img;
		} else {
			active_news = newsService.active(0, id);
			return img;
		}
		
		
		
	}

	
}
