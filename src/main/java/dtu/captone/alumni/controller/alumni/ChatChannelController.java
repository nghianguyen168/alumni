package dtu.captone.alumni.controller.alumni;

import java.util.List;

import org.springframework.beans.BeansException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import dtu.captone.alumni.auth.service.UserService;
import dtu.captone.alumni.chat.DTOs.ChatChannelInitializationDTO;
import dtu.captone.alumni.chat.DTOs.ChatMessageDTO;
import dtu.captone.alumni.chat.DTOs.EstablishedChatChannelDTO;
import dtu.captone.alumni.chat.inteface.IChatChannelController;
import dtu.captone.alumni.domain.ChatChannel;
import dtu.captone.alumni.domain.Member;
import dtu.captone.alumni.exception.IsSameUserException;
import dtu.captone.alumni.exception.UserNotFoundException;
import dtu.captone.alumni.http.JSONResponseHelper;
import dtu.captone.alumni.service.ChatService;

@Controller
public class ChatChannelController implements IChatChannelController {
	
	@Autowired
	private ChatService chatService;

  	@Autowired
    private UserService userService;
  
  	@GetMapping("/chat/index")
  	public String chat(Model model) {
  		List<ChatChannel> listChanel = chatService.findAll();
  		System.out.println("số cuộc trò chuyện"+ listChanel.size());
  		return "public.community.chat";
  		
  	}

    @MessageMapping("/private.chat.{channelId}")
    @SendTo("/topic/private.chat.{channelId}")
    public ChatMessageDTO chatMessage(@DestinationVariable String channelId, ChatMessageDTO message)
        throws BeansException, UserNotFoundException {
      chatService.submitMessage(message);
      return message;
    }

    @RequestMapping(value="/api/private-chat/channel", method=RequestMethod.PUT, produces="application/json", consumes="application/json")
    public ResponseEntity<String> establishChatChannel(@RequestBody ChatChannelInitializationDTO chatChannelInitialization) 
        throws IsSameUserException, UserNotFoundException { 
      String channelUuid = chatService.establishChatSession(chatChannelInitialization);
      Member userOne = userService.findById((int)chatChannelInitialization.getUserIdOne());
      Member userTwo = userService.findById((int)chatChannelInitialization.getUserIdTwo());

      EstablishedChatChannelDTO establishedChatChannel = new EstablishedChatChannelDTO(
        channelUuid,
        userOne.getFirstName()+" "+userOne.getLastName(),
        userTwo.getFirstName()+" "+userOne.getLastName()
      );
    
      return JSONResponseHelper.createResponse(establishedChatChannel, HttpStatus.OK);
    }
    
    @RequestMapping(value="/api/private-chat/channel/{channelUuid}", method=RequestMethod.GET, produces="application/json")
    public ResponseEntity<String> getExistingChatMessages(@PathVariable("channelUuid") String channelUuid) {
      List<ChatMessageDTO> messages = chatService.getExistingChatMessages(channelUuid);

      return JSONResponseHelper.createResponse(messages, HttpStatus.OK);
    }
}