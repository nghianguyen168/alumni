package dtu.captone.alumni.controller.alumni;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import dtu.captone.alumni.domain.Member;
import dtu.captone.alumni.domain.Network;
import dtu.captone.alumni.security.UserInfoHandler;
import dtu.captone.alumni.service.MemberService;
import dtu.captone.alumni.service.NetworkService;

@Controller
@RequestMapping("/network")
public class PublicNetworkController extends UserInfoHandler{
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private NetworkService networkService;
	
	@ModelAttribute
	public void network_new(Model model,HttpSession session) {
		List<Network> newRequestFriendList = networkService.getNewRequestFriendList(isUserLogin(session).getId());
		model.addAttribute("newRequestFriendList", newRequestFriendList);
		
	}
	
	@PostMapping("/add-friend")
	public @ResponseBody String confirmFriend(@RequestParam("id") int id,HttpSession session) {
		
		Member friend = memberService.findById(id);
		System.out.println(friend);
		Member member = isUserLogin(session);
		
		Network network = new Network(null, member, new Member(id), 0,Timestamp.valueOf(LocalDateTime.now()));
		Network networkAdd = networkService.save(network);
		if(networkAdd!=null) {
			return "ok";
		} else {
			return null;
		}
	}

}
