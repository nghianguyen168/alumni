package dtu.captone.alumni.respository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import dtu.captone.alumni.domain.Alumni_group;

@Repository
public interface GroupRespository extends JpaRepository<Alumni_group, Integer> {
	
	Alumni_group findById(int id);
	
	@Query(value = "SELECT a.*,(SELECT COUNT(*) FROM group_member AS g WHERE g.group_id = a.id) AS sum_member FROM alumni_group as a",nativeQuery = true)
	List<Alumni_group> findAll();
	

}
