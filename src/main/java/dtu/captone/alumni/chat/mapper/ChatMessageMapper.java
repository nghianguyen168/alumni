package dtu.captone.alumni.chat.mapper;

import java.util.ArrayList;
import java.util.List;

import dtu.captone.alumni.chat.DTOs.ChatMessageDTO;
import dtu.captone.alumni.domain.ChatMessage;
import dtu.captone.alumni.domain.Member;


public class ChatMessageMapper {
  public static List<ChatMessageDTO> mapMessagesToChatDTOs(List<ChatMessage> chatMessages) {
    List<ChatMessageDTO> dtos = new ArrayList<ChatMessageDTO>();

    for(ChatMessage chatMessage : chatMessages) { 
      dtos.add(
        new ChatMessageDTO(
          chatMessage.getContents(),
          chatMessage.getAuthorUser().getId(),
          chatMessage.getRecipientUser().getId()
        )
      );
    }

    return dtos;
  }

  public static ChatMessage mapChatDTOtoMessage(ChatMessageDTO dto) {
    return new ChatMessage(

      // only need the id for mapping
      new Member((int)dto.getFromUserId()),
      new Member((int)dto.getToUserId()),

      dto.getContents()
    );
  }
}
