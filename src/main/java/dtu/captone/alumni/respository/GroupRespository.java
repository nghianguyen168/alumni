package dtu.captone.alumni.respository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import dtu.captone.alumni.domain.AlumniGroup;

@Repository
public interface GroupRespository extends JpaRepository<AlumniGroup, Integer> {
	
	AlumniGroup findById(int id);
	
	@Query(value = "SELECT a.*,(SELECT COUNT(*) FROM group_member AS g WHERE g.group_id = a.id) AS sumMember FROM alumni_group as a WHERE id <>0 ",nativeQuery = true)
	List<AlumniGroup> findAll();
	

}
