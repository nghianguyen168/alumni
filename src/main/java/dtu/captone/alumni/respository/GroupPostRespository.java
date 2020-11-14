package dtu.captone.alumni.respository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import dtu.captone.alumni.domain.GroupPost;

@Repository
public interface GroupPostRespository extends JpaRepository<GroupPost, Integer> {
	
	@Query(value = "SELECT * FROM group_post where group_id=? ORDER BY id DESC",nativeQuery = true)
	Page<GroupPost> findAll(Pageable pageable);
	
	@Query(value = "SELECT * FROM group_post where group_id=? ORDER BY id DESC",nativeQuery = true)
	List<GroupPost> findByGroup(int group_id);
	/*
	 * @Modifying
	 * 
	 * @Transactional
	 * 
	 * @Query(value = "UPDATE news SET enable = ? WHERE id = ?", nativeQuery = true)
	 * int active(int active, int id);
	 * 
	 * @Query(value = "SELECT * FROM news WHERE enable = 1", nativeQuery = true)
	 * Page<News> getNewsListEnable(Pageable pageable);
	 */

}
