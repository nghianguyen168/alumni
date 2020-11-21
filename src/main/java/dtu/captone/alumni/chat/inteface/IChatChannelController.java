package dtu.captone.alumni.chat.inteface;


import org.springframework.beans.BeansException;
import org.springframework.http.ResponseEntity;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;

import dtu.captone.alumni.chat.DTOs.ChatChannelInitializationDTO;
import dtu.captone.alumni.chat.DTOs.ChatMessageDTO;
import dtu.captone.alumni.exception.IsSameUserException;
import dtu.captone.alumni.exception.UserNotFoundException;

public interface IChatChannelController {
    ChatMessageDTO chatMessage(@DestinationVariable String channelId, ChatMessageDTO message)
        throws BeansException,UserNotFoundException;

    ResponseEntity<String> establishChatChannel(@RequestBody ChatChannelInitializationDTO chatChannelInitialization)
        throws IsSameUserException, UserNotFoundException; 

    ResponseEntity<String> getExistingChatMessages(@PathVariable("channelUuid") String channelUuid);
}
