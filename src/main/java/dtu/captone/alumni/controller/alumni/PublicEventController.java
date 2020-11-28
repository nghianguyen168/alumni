package dtu.captone.alumni.controller.alumni;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.rabbitmq.client.AMQP.Basic.Get;

import dtu.captone.alumni.domain.Event;
import dtu.captone.alumni.service.EventService;

@Controller
@RequestMapping("/event")
public class PublicEventController {

	@Autowired
	private EventService eventService;
	
	@GetMapping("/detail/{id}")
	public String detail(Model model,@PathVariable int id) {
		Event event = eventService.findById(id);
		List<Event> comingSoonList = eventService.findCommingSoon(id);
		model.addAttribute("event", event);
		model.addAttribute("comingSoonList", comingSoonList);
		return "public.event.detail";
	}
}
