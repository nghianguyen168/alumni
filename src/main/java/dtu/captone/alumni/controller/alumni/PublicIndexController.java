package dtu.captone.alumni.controller.alumni;

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

import dtu.captone.alumni.domain.Event;
import dtu.captone.alumni.domain.Member;
import dtu.captone.alumni.domain.Network;
import dtu.captone.alumni.domain.News;
import dtu.captone.alumni.security.UserInfoHandler;
import dtu.captone.alumni.service.EventService;
import dtu.captone.alumni.service.NetworkService;
import dtu.captone.alumni.service.NewsService;

@Controller
public class PublicIndexController extends UserInfoHandler{

	@Autowired
	private NewsService newsService;
	
	@Autowired
	private EventService eventService;
	
	@Autowired
	private NetworkService networkService;
	

	@GetMapping("/home")
	public String home(Model model,HttpSession session) {
		Page<News> newsPage = newsService.getNewsListEnable(PageRequest.of(0, 3, Sort.by("id").descending()));
		List<News> newsList = newsPage.getContent();
		
		Page<Event> eventPage = eventService.getNewsListEnable(PageRequest.of(0, 3, Sort.by("id").descending()));
		List<Event> eventList = eventPage.getContent();
		Member member = (Member)session.getAttribute("userInfo");
		System.out.println(member);
		System.out.println(newsList.size());
		model.addAttribute("newsList", newsList);
		model.addAttribute("eventList", eventList);
		return "public.index";
	}
	
	@ModelAttribute
	public void network_new(Model model,HttpSession session) {
		if(isUserLogin(session)!=null) {
			List<Network> newRequestFriendList = networkService.getNewRequestFriendList(isUserLogin(session).getId());
			model.addAttribute("newRequestFriendList", newRequestFriendList);
		}
		
		
	}
}
