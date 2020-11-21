package dtu.captone.alumni.respository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import dtu.captone.alumni.domain.ChatMessage;

@Transactional
@Repository
public interface ChatMessageRepository extends JpaRepository<ChatMessage, String> {
    @Query(" FROM"
        + "    ChatMessage m"
        + "  WHERE"
        + "    m.authorUser.id IN (:userIdOne, :userIdTwo)"
        + "  AND"
        + "    m.recipientUser.id IN (:userIdOne, :userIdTwo)"
        + "  ORDER BY"
        + "    m.timeSent"
        + "  DESC")
    public List<ChatMessage> getExistingChatMessages(
        @Param("userIdOne") long userIdOne, @Param("userIdTwo") long userIdTwo, Pageable pageable);
}
