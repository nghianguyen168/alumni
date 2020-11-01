package dtu.captone.alumni.respository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import dtu.captone.alumni.domain.Group_Post;

@Repository
public interface GroupPostRespository extends JpaRepository<Group_Post, Integer> {
	
	
	Page<Group_Post> findAll(Pageable pageable);
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