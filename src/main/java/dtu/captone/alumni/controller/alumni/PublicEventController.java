package dtu.captone.alumni.controller.alumni;

import java.util.List;

import dtu.captone.alumni.domain.Network;
import dtu.captone.alumni.security.UserInfoHandler;
import dtu.captone.alumni.service.NetworkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.rabbitmq.client.AMQP.Basic.Get;

import dtu.captone.alumni.domain.Event;
import dtu.captone.alumni.service.EventService;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/event")
public class PublicEventController extends UserInfoHandler {

	@Autowired
	private EventService eventService;

	@Autowired
	private NetworkService networkService;
	
	@GetMapping("/detail/{id}")
	public String detail(Model model,@PathVariable int id) {
		Event event = eventService.findById(id);
		List<Event> comingSoonList = eventService.findCommingSoon(id);
		model.addAttribute("event", event);
		model.addAttribute("comingSoonList", comingSoonList);
		return "public.event.detail";
	}

	@GetMapping("/index")
	public String eventIndex(Model model){
		List<Event> eventList = eventService.FindAllActie();
		model.addAttribute("eventList",eventList);
		return "public.event.index";
	}
	@ModelAttribute
	public void network_new(Model model, HttpSession session) {
		if (isUserLogin(session) != null) {
			List<Network> newRequestFriendList = networkService.getNewRequestFriendList(isUserLogin(session).getId());
			model.addAttribute("newRequestFriendList", newRequestFriendList);
			model.addAttribute("eventService",eventService);
		}

	}
}
