package dtu.captone.alumni.controller.alumni;

import java.security.Principal;
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
import org.springframework.web.bind.annotation.RequestMapping;

import dtu.captone.alumni.auth.service.UserService;
import dtu.captone.alumni.domain.Event;
import dtu.captone.alumni.domain.Member;
import dtu.captone.alumni.domain.Network;
import dtu.captone.alumni.domain.News;
import dtu.captone.alumni.security.UserInfoHandler;
import dtu.captone.alumni.service.EventService;
import dtu.captone.alumni.service.NetworkService;
import dtu.captone.alumni.service.NewsService;

@Controller
@RequestMapping("/news")
public class PublicNewsController extends UserInfoHandler {

	@Autowired
	private NewsService newsService;

	
	@GetMapping("/index")
	public String newsIndex(Model model, HttpSession session) {
		List<News> newsList = newsService.findAll(Sort.by("id").descending());
		model.addAttribute("newsList", newsList);
		return "public.news.index";
	}
	
	@GetMapping("/detail/{id}")
	public String detailNews(@PathVariable int id,Model model) {
		News news = newsService.findById(id);
		List<News> newsListRelated = newsService.findNewsNew(id);
		model.addAttribute("newsListRelated", newsListRelated);
		model.addAttribute("news", news);
		return "public.news.detail";
		
	}

}
