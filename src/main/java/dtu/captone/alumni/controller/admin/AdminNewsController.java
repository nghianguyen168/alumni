package dtu.captone.alumni.controller.admin;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.apache.http.HttpRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import dtu.captone.alumni.domain.News;
import dtu.captone.alumni.service.NewsService;
import dtu.captone.alumni.utils.FileUploadUtil;
import dtu.captone.alumni.utils.FileUtil;

@Controller
@RequestMapping("/admin/news")
public class AdminNewsController {
	
	@Autowired
	private NewsService newsService;
	
	
	@GetMapping("/index")
	public String index() {
		return "admin.news.index";
	}
	
	@GetMapping("/add")
	public String add() {
		return "admin.news.add";
	}
	
	@PostMapping("add")
	public String addNews(@ModelAttribute("news") News news,@RequestParam("hinhanh") MultipartFile hinhanh,HttpServletRequest request) throws IllegalStateException, IOException {
		String picture = FileUtil.upload(hinhanh, request);
		news.setPicture(picture);
		 System.out.println(news.getNews_name());
		 newsService.save(news);
		return "admin.news.add";
		
	}

}
