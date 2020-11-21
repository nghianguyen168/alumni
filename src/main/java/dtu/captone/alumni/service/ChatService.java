package dtu.captone.alumni.service;

import java.util.List;

import org.springframework.beans.BeansException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.google.common.collect.Lists;

import dtu.captone.alumni.auth.service.UserService;
import dtu.captone.alumni.chat.DTOs.ChatChannelInitializationDTO;
import dtu.captone.alumni.chat.DTOs.ChatMessageDTO;
import dtu.captone.alumni.chat.DTOs.NotificationDTO;
import dtu.captone.alumni.chat.inteface.IChatService;
import dtu.captone.alumni.chat.mapper.ChatMessageMapper;
import dtu.captone.alumni.domain.ChatChannel;
import dtu.captone.alumni.domain.ChatMessage;
import dtu.captone.alumni.domain.Member;
import dtu.captone.alumni.exception.IsSameUserException;
import dtu.captone.alumni.exception.UserNotFoundException;
import dtu.captone.alumni.respository.ChatChannelRepository;
import dtu.captone.alumni.respository.ChatMessageRepository;

@Service
public class ChatService implements IChatService {
	@Autowired
  private ChatChannelRepository chatChannelRepository;
	
	@Autowired
  private ChatMessageRepository chatMessageRepository;
	
  @Autowired
  private UserService userService;
 
  
  
  private final int MAX_PAGABLE_CHAT_MESSAGES = 100;



  private String getExistingChannel(ChatChannelInitializationDTO chatChannelInitializationDTO) {
    List<ChatChannel> channel = chatChannelRepository
      .findExistingChannel(
        chatChannelInitializationDTO.getUserIdOne(),
        chatChannelInitializationDTO.getUserIdTwo()
      );
    
    return (channel != null && !channel.isEmpty()) ? channel.get(0).getUuid() : null;
  }

  private String newChatSession(ChatChannelInitializationDTO chatChannelInitializationDTO)
      throws BeansException, UserNotFoundException {
    ChatChannel channel = new ChatChannel(
      userService.findById((int)chatChannelInitializationDTO.getUserIdOne()),
      userService.findById((int)chatChannelInitializationDTO.getUserIdTwo())
    );
    
    chatChannelRepository.save(channel);

    return channel.getUuid();
  }

  public String establishChatSession(ChatChannelInitializationDTO chatChannelInitializationDTO)
      throws IsSameUserException, BeansException, UserNotFoundException {
    if (chatChannelInitializationDTO.getUserIdOne() == chatChannelInitializationDTO.getUserIdTwo()) {
      throw new IsSameUserException();
    }

    String uuid = getExistingChannel(chatChannelInitializationDTO);

    // If channel doesn't already exist, create a new one
    return (uuid != null) ? uuid : newChatSession(chatChannelInitializationDTO);
  }
  
  public void submitMessage(ChatMessageDTO chatMessageDTO)
      throws BeansException, UserNotFoundException {
    ChatMessage chatMessage = ChatMessageMapper.mapChatDTOtoMessage(chatMessageDTO);

    chatMessageRepository.save(chatMessage);

    Member fromUser = userService.findById(chatMessage.getAuthorUser().getId());
    Member recipientUser = userService.findById(chatMessage.getRecipientUser().getId());
      
    userService.notifyUser(recipientUser,
      new NotificationDTO(
        "ChatMessageNotification",
        fromUser.getFirstName()+fromUser.getLastName() + " has sent you a message",
        chatMessage.getAuthorUser().getId()
      )
    );
  }
 
  public List<ChatMessageDTO> getExistingChatMessages(String channelUuid) {
    ChatChannel channel = chatChannelRepository.getChannelDetails(channelUuid);

    List<ChatMessage> chatMessages = 
      chatMessageRepository.getExistingChatMessages(
        channel.getUserOne().getId(),
        channel.getUserTwo().getId(),
        new PageRequest(0, MAX_PAGABLE_CHAT_MESSAGES)
      );

    // TODO: fix this
    List<ChatMessage> messagesByLatest = Lists.reverse(chatMessages); 

    return ChatMessageMapper.mapMessagesToChatDTOs(messagesByLatest);
  }
  
  public List<ChatChannel> findAll(){
	  return chatChannelRepository.findAll();
  }
}