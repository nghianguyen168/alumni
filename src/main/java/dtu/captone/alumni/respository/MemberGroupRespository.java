package dtu.captone.alumni.respository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import dtu.captone.alumni.domain.MemberGroup;

@Repository
public interface MemberGroupRespository extends JpaRepository<MemberGroup, Integer> {
	
	MemberGroup findById(int id);
	
	@Query(value = "SELECT * FROM member_group where member_id=? AND group_id=?",nativeQuery = true)
	MemberGroup findByAuthorIdAndGroupId(int member_id,int group_id);
	
	@Query(value = "SELECT * FROM member_group where group_id=?",nativeQuery = true)
	List<MemberGroup> findByGroup(int group_id);
	

}
