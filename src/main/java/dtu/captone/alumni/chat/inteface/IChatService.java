package dtu.captone.alumni.chat.inteface;

import java.util.List;

import org.springframework.beans.BeansException;

import dtu.captone.alumni.chat.DTOs.ChatChannelInitializationDTO;
import dtu.captone.alumni.chat.DTOs.ChatMessageDTO;
import dtu.captone.alumni.exception.IsSameUserException;
import dtu.captone.alumni.exception.UserNotFoundException;

public interface IChatService {
  String establishChatSession(ChatChannelInitializationDTO chatChannelInitializationDTO)
      throws IsSameUserException, BeansException, UserNotFoundException;

  void submitMessage(ChatMessageDTO chatMessageDTO)
      throws BeansException, UserNotFoundException;
  
  List<ChatMessageDTO> getExistingChatMessages(String channelUuid);
}