package dtu.captone.alumni.respository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import dtu.captone.alumni.domain.Comment;
import dtu.captone.alumni.domain.Kname;
import dtu.captone.alumni.domain.Major;

@Repository
public interface CommentRespository extends JpaRepository<Comment, Integer>,JpaSpecificationExecutor<Major> {
	List<Comment> findAll();
	
	@Query(value = "SELECT * FROM comment WHERE post_id=? AND parent_id =0", nativeQuery = true)
    @Transactional
	List<Comment> findByPostId(int postId);
	
	@Query(value = "SELECT * FROM comment WHERE post_id=?", nativeQuery = true)
    @Transactional
	List<Comment> findByPostIdSum(int postId);
	
	List<Comment> findByParentId(int parentId);
	
}
