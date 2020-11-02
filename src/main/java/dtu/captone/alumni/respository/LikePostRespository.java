package dtu.captone.alumni.respository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import dtu.captone.alumni.domain.Group_Post;
import dtu.captone.alumni.domain.LikePost;
import dtu.captone.alumni.domain.Member;

@Repository
public interface LikePostRespository extends JpaRepository<LikePost, Integer> {
	
	
	Page<LikePost> findAll(Pageable pageable);
	
	
	@Query(value = "SELECT * FROM like_post WHERE author_id=? AND post_id =?", nativeQuery = true)
    @Transactional
	LikePost findUserLike(int authorId,int postId);

	List<LikePost> findByPostId(int postId);
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
