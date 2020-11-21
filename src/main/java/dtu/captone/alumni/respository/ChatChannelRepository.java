package dtu.captone.alumni.respository;


import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import dtu.captone.alumni.domain.ChatChannel;

@Transactional
@Repository
public interface ChatChannelRepository extends JpaRepository<ChatChannel, String> {
  @Query(" FROM"
      + "    ChatChannel c"
      + "  WHERE"
      + "    c.userOne.id IN (:userOneId, :userTwoId) "
      + "  AND"
      + "    c.userTwo.id IN (:userOneId, :userTwoId)")
  public List<ChatChannel> findExistingChannel(
      @Param("userOneId") long userOneId, @Param("userTwoId") long userTwoId);
  
  @Query(" SELECT"
      + "    uuid"
      + "  FROM"
      + "    ChatChannel c"
      + "  WHERE"
      + "    c.userOne.id IN (:userIdOne, :userIdTwo)"
      + "  AND"
      + "    c.userTwo.id IN (:userIdOne, :userIdTwo)")
  public String getChannelUuid(
      @Param("userIdOne") long userIdOne, @Param("userIdTwo") long userIdTwo);

  @Query(" FROM"
      + "    ChatChannel c"
      + "  WHERE"
      + "    c.uuid IS :uuid")
  public ChatChannel getChannelDetails(@Param("uuid") String uuid);
}