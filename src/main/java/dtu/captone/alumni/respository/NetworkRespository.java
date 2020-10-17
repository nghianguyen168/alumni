package dtu.captone.alumni.respository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import dtu.captone.alumni.domain.Network;

@Repository
public interface NetworkRespository extends JpaRepository<Network, Integer> {
	
	@Query(value = "UPDATE network set status = 1 where id=?",nativeQuery = true)
	@Modifying(clearAutomatically=true, flushAutomatically = true)
	@Transactional
	int confirmFriend(int id);
	
	@Query(value = "DELETE FROM network where id=?",nativeQuery = true)
	@Modifying(clearAutomatically=true, flushAutomatically = true)
	@Transactional
	int cancelRequest(int id);
	
	
	@Query(value = "SELECT * FROM network where friend_id = ? AND status =0 ORDER BY id DESC",nativeQuery = true)
	List<Network> getNewRequestFriendList(int id);
}
